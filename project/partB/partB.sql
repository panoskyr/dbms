--Allazoyme thn sthlh genres gia na borei na xrhsimopoieithei katallhla

UPDATE 
   project.movies_metadata
SET 
   genres = REPLACE(genres,E'''', '"');

alter table movies_metadata
alter column genres type jsonb USING genres::jsonb;

--Allazoyme th sthlh vote_average se numeric oste na doylepsei h synarthsh AVG

ALTER TABLE project.movies_metadata
ALTER COLUMN vote_average TYPE numeric USING vote_average::numeric;

--Αριθμός ταινιών ανά χρόνο

select extract(year from release_date) as year, count(*) as number_of_movies
from project.movies_metadata
group by year
order by year;

--Αριθμός ταινιών ανά είδος(genre)

select genre ->>'name' "name", count(*)
from project.movies_metadata
cross join jsonb_array_elements(genres) genre
GROUP BY genre;

--Αριθμός ταινιών ανά είδος(genre) και ανά χρόνο

select extract(year from release_date) as year, genre ->>'name' "name" , count(genre)
from project.movies_metadata
cross join jsonb_array_elements(genres) genre
where extract(year from release_date) is not NULL
group by genre, year
order by year desc, count(distinct genre);

--Μέση βαθμολογία (rating) ανά είδος (ταινίας)

select genre ->> 'name' "name", round(avg(vote_average), 2) "average"
from project.movies_metadata
cross join jsonb_array_elements(genres) genre
group by genre
order by genre;

--Αριθμός από ratings ανά χρήστη

select distinct userid , count(rating)
from project.ratings
group by userid
order by userid;

--Μέση βαθμολογία (rating) ανά χρήστη

select distinct userid, round(avg(rating),2)
from project.ratings
group by userid
order by userid;

--Dhmiourgia view_table

create view project.view_table as 
select userid, count(rating), round(avg(rating),2) as average
from project.ratings
group by userid
order by userid;