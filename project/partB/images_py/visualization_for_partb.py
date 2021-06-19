# To add a new cell, type '# %%'
# To add a new markdown cell, type '# %% [markdown]'
# %%
import psycopg2
import psycopg2.extras
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
DB_HOST='adb21.postgres.database.azure.com'
DB_USER='con1@adb21'
DB_PASSWORD='con1'
DB_NAME='postgres'

connection=psycopg2.connect(
    host=DB_HOST,
    database=DB_NAME,
    user=DB_USER,
    password=DB_PASSWORD)

def postgresToDf(connection,query,column_names):
    cursor=connection.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cursor.execute(query)
    rows=cursor.fetchall()
    print("***fetched rows")
    cursor.close()

    df=pd.DataFrame(np.array(rows),columns=column_names)
    print(df.head())
    return df

col_names=["year","number_of_movies"]
query="""
   select extract(year from release_date) as year, count(*) as number_of_movies
   from project.movies_metadata
   group by year
   order by year;
    """
df=postgresToDf(connection,query,col_names)
ax=df.plot.bar(x='year')
plt.xticks([0, 15, 30, 45,60,75,90,105,120,135],
           ['1870', '1885','1910','1925','1940','1955','1970','1985','2000','2020'])
plt.show()





# %%
#Second Plot

col_names=["genre","number_of_movies"]
query="""
   select genre ->>'name' "name", count(*)
from project.movies_metadata
cross join jsonb_array_elements(genres) genre
GROUP BY genre;
    """
df=postgresToDf(connection,query,col_names)
df['number_of_movies'] = df['number_of_movies'].astype(str).astype(int)
#ax=df.plot.bar(x='genre', y='number_of_movies')
plt.figure(figsize=(15,10))
sns.barplot( data = df,x='genre', y='number_of_movies')


# %%
##Third 

import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


col_names=["year","genre","count"]
query="""
   select extract(year from release_date) as year, genre ->>'name' "name" , count(genre)
from project.movies_metadata
cross join jsonb_array_elements(genres) genre
where extract(year from release_date) is not NULL
group by genre, year
order by year desc, count(distinct genre);
    """
df=postgresToDf(connection,query,col_names)
#df['count'].value_counts()
#df['count'][371]
#df.iloc[50:54]
df['decade'] =((df['year'].astype(str).astype(float))/10).apply(np.floor)
df['count'] = df['count'].astype(str).astype(float)
Grouped = df.groupby(['genre','decade']).size().reset_index().rename(columns={0:'Sum of Releases'})
data = df.groupby(['decade','genre'], as_index=False)['count'].sum()
plt.figure(figsize=(20,10))
sns.barplot( data = data, x = "genre", y = "count", hue= "decade")


# %%
#fourthplot avg rating per genre
col_names=["genre","avg_rating"]
query="""
   select genre ->> 'name' "name", round(avg(vote_average), 2) "average"
from project.movies_metadata
cross join jsonb_array_elements(genres) genre
group by genre
order by genre;
    """
df=postgresToDf(connection,query,col_names)
plt.figure(figsize=(20,10))
sns.barplot(data=df,x='genre',y='avg_rating',label="Average rating per genre")


# %%
#fifth plot number of ratings per user
col_names=["userid","number_of_ratings"]
query="""
   select distinct userid , count(rating)
from project.ratings
group by userid
order by userid;
    """
df=postgresToDf(connection,query,col_names)
ratings_per_user=df
df.head
plt.figure(figsize=(20,10))
sns.scatterplot(data=df,x='userid', y='number_of_ratings')


# %%
#sixth plot avg rating per user
col_names=["userid","avg_rating"]
query="""
   select distinct userid, round(avg(rating),2)
from project.ratings
group by userid
order by userid;
    """
avg_rating_per_user=postgresToDf(connection,query,col_names)
plt.figure(figsize=(15,10))
sns.scatterplot(data=avg_rating_per_user,x='userid', y='avg_rating')


# %%
number_of_ratings=ratings_per_user["number_of_ratings"]
rating_combined=avg_rating_per_user.join(number_of_ratings)
rating_combined['avg_rating']=rating_combined['avg_rating'].astype(str).astype(float)
rating_combined['number_of_ratings']=rating_combined['number_of_ratings'].astype(str).astype(float)
rating_combined.head()

#sns.set_theme(style="dark")
#sns.scatterplot(data=rating_combined,y='avg_rating',x='number_of_ratings')
plt.figure(figsize=(20,10))
sns.regplot(data=rating_combined,x='number_of_ratings',y='avg_rating')


