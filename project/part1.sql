--dhmiourgia arxikwn pinakwn 

--credit
create table project.Credits(
   cast_data text,
   crew text,
   id int
);

--keywords
CREATE TABLE project.KEYWORDS(
   id INTEGER,
   keywords text );
   
--links
create table project.Links(
   movieId int,
   imdbId int,
   tmdbId int
);

--ratings
create table project.Ratings_Small(
   userId int,
   movieId int,
   rating varchar(10),
   timestamp int
);

--movies_metadata
create table project.Movies_Metadata(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue varchar(255),
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);


--dhmiourgia pinakwn xwris ta diplotupa

--pinakas credit unique

create table project.Credit_unique(
   cast_data text,
   crew text,
   id int
); 

INSERT INTO project.credit_unique(id)
SELECT DISTINCT A.id
FROM project.credits A
LEFT JOIN project.credit_unique B
ON A.id = B.id
WHERE B.id IS NULL --xwris diplotypa

UPDATE project.credit_unique
SET crew = project.credits.crew,
    cast_data = project.credits.cast_data
FROM project.credits
WHERE project.credit_unique.id = project.credits.id; --eisagwgh ypoloipwn dedomenwn

ALTER TABLE credit_unique
ADD PRIMARY KEY (id); --primary key

--pinakas keyword unique

CREATE TABLE project.KEYWORDS_UNIQUE(
   id INTEGER,
   keywords text );
   
INSERT INTO project.keywords_unique(id)
SELECT DISTINCT A.id
FROM project.keywords A
LEFT JOIN project.keywords_unique B
ON A.id = B.id
WHERE B.id IS NULL --xwris diplotypa

UPDATE project.keywords_unique
SET keywords = project.keywords.keywords
FROM project.keywords
WHERE project.keywords_unique.id = project.keywords.id; --eisagwgh teleutaiou column

ALTER TABLE project.keywords_unique
ADD PRIMARY KEY (id);  --primary key

--pinakas metadata unique

create table project.Movies_Metadata(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue varchar(255),
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);

INSERT INTO project.movies_metadata_unique(id)
SELECT DISTINCT A.id
FROM project.movies_metadata A
LEFT JOIN project.movies_metadata_unique B
ON A.id = B.id
WHERE B.id IS NULL -- xwris diplotupa




UPDATE project.movies_metadata_unique
SET adult = project.movies_metadata.adult,
    belongs_to_collection = project.movies_metadata.belongs_to_collection,
	budget = project.movies_metadata.budget,
	genres = project.movies_metadata.genres,
	homepage = project.movies_metadata.homepage,
	imdb_id = project.movies_metadata.imdb_id,
	original_language = project.movies_metadata.original_language,
	original_title = project.movies_metadata.original_title,
	overview = project.movies_metadata.overview,
	popularity = project.movies_metadata.popularity,
	poster_path = project.movies_metadata.poster_path,
	production_companies = project.movies_metadata.production_companies,
	production_countries = project.movies_metadata.production_countries,
	release_date = project.movies_metadata.release_date,
	revenue = project.movies_metadata.revenue,
	runtime = project.movies_metadata.runtime,
	spoken_languages = project.movies_metadata.spoken_languages,
	status = project.movies_metadata.status,
	tagline = project.movies_metadata.tagline,
	title = project.movies_metadata.title,
	video = project.movies_metadata.video,
	vote_average = project.movies_metadata.vote_average,
	vote_count = project.movies_metadata.vote_count
FROM project.movies_metadata
WHERE project.movies_metadata_unique.id = project.movies_metadata.id; --eidagwgh ypoloipwn columns


ALTER TABLE project.movies_metadata_unique
ADD PRIMARY KEY (id); --primary key


--pinakas links
ALTER TABLE project.links_unique
ADD PRIMARY KEY (movieid); --primary

create table project.Links_unique(
   movieId int,
   imdbId int,
   tmdbId int
);

INSERT INTO project.links_unique(movieid)
SELECT DISTINCT A.movieid
FROM project.links A
LEFT JOIN project.links_unique B
ON A.movieid = B.movieid
WHERE B.movieid IS NULL --xwris diplotupa

UPDATE project.links_unique
SET imdbid = project.links.imdbid,
    tmdbid = project.links.tmdbid
FROM project.links
WHERE project.links_unique.movieid = project.links.movieid --eisagwgh ypoloipwn



--foreign keys
ALTER TABLE project.credit_unique
ADD FOREIGN KEY (id)
REFERENCES project.movies_metadata_unique(id);

ALTER TABLE project.keywords_unique
ADD FOREIGN KEY (id)
REFERENCES project.movies_metadata_unique(id)

ALTER TABLE project.ratings_small
ADD FOREIGN KEY (movieid)
REFERENCES project.movies_metadata_unique(id)

ALTER TABLE project.links
ADD FOREIGN KEY (tmdbid)
REFERENCES project.movies_metadata_unique(id)


--query for delete
Delete from project.ratings_small 
where movieid in 
(select movieid 
from project.ratings_small 
a left outer join project.movies_metadata_unique 
on project.ratings_small.movieid = project.movies_metadata_unique.id where project.movies_metadata_unique.id is NULL)

Delete from project.links 
where tmdbid in 
(select tmdbid 
from project.links 
a left outer join project.movies_metadata_unique 
on project.links.tmdbid = project.movies_metadata_unique.id 
where project.movies_metadata_unique.id is NULL)








   
   