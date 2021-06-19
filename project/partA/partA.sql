--Arxika ftiaxnoyme temp pinakes
create table project.CreditsTemp(
   "cast" text,
   crew text,
   id int
);

create table project.KeywordsTemp(
   id int,
   keywords text
);

create table project.LinksTemp(
   movieId int,
   imdbId int,
   tmdbId int
);

create table project.Movies_MetadataTemp(
   adult boolean,
   belongs_to_collection varchar(5000),
   budget int,
   genres varchar(500),
   homepage varchar(5000),
   id int,--in the links table it is called tmbdId
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(5000),
   overview varchar(5000),
   popularity float,
   poster_path varchar(100),
   production_companies varchar(5000),
   production_countries varchar(5000),
   release_date date,
   revenue bigint,
   runtime float,
   spoken_languages varchar(5000),
   status varchar(100),
   tagline varchar(300),
   title varchar(110),
   video boolean,
   vote_average float,
   vote_count int
);

create table project.RatingsTemp(
   userId int,
   movieId int, 
   rating numeric,
   timestamp int
);

--Meta kanoyme import ta csv kai ta eisagoyme stoys temp pinakes apo to pgadmin
--encoding utf8 ,fromat csv,header yes,delimiter
--Tora ftiaxnoyme ta kanonika tables xoris ta duplicates me thn entolh distinct

CREATE TABLE project.Credits AS SELECT DISTINCT * FROM project.CreditsTemp;
CREATE TABLE project.Keywords AS SELECT DISTINCT * FROM project.KeywordsTemp;
CREATE TABLE project.Links AS SELECT DISTINCT * FROM project.LinksTemp;
CREATE TABLE project.Movies_Metadata AS SELECT DISTINCT * FROM project.Movies_MetadataTemp;
CREATE TABLE project.Ratings AS SELECT * FROM project.RatingsTemp;

--Tora diagrafoyme ta dedomena tainion opoy den yparxoyn ston pinaka “movies_metadata”
/*0,0,161,55015*/
DELETE FROM project.Credits WHERE id NOT IN (SELECT m.id FROM project.Movies_Metadata m);
DELETE FROM project.Keywords WHERE id NOT IN (SELECT m.id FROM project.Movies_Metadata m);
DELETE FROM project.Links WHERE tmdbId NOT IN (SELECT m.id FROM project.Movies_Metadata m);
DELETE FROM project.Ratings WHERE movieId NOT IN (SELECT m.id FROM project.Movies_Metadata m);

--Yparxoyn rows poy exoyn ta idia akrivos ids alla diaforetika stoixia se alla columns opote me ayto to querie ftiaxnoyme ayto to provlhma
/*13,7*/
DELETE FROM project.Movies_Metadata M1 USING project.Movies_Metadata M2 WHERE  M1.popularity < M2.popularity AND M1.id=M2.id;
DELETE FROM project.Credits C1 USING project.Credits C2 WHERE C1.crew < C2.crew AND C1.id=C2.id;

--Dhlosh Primary keys

ALTER TABLE project.Credits ADD PRIMARY KEY (id);
ALTER TABLE project.Keywords ADD PRIMARY KEY (id);
ALTER TABLE project.Links ADD PRIMARY KEY (movieId);
ALTER TABLE project.Movies_Metadata ADD PRIMARY KEY (id);
ALTER TABLE project.Ratings ADD PRIMARY KEY (userId,movieId);

--Dhlosh Foreign keys

ALTER TABLE project.Credits ADD FOREIGN KEY (id) REFERENCES project.Movies_Metadata(id);
ALTER TABLE project.Keywords ADD FOREIGN KEY (id) REFERENCES project.Movies_Metadata(id);
ALTER TABLE project.Links ADD FOREIGN KEY (tmdbId) REFERENCES project.Movies_Metadata(id);
ALTER TABLE project.Ratings ADD FOREIGN KEY (movieId) REFERENCES  project.Movies_Metadata(id);

--Diagrafh temp pinakon
DROP TABLE project.CreditsTemp;
DROP TABLE project.KeywordsTemp;
DROP TABLE project.LinksTemp;
DROP TABLE project.Movies_MetadataTemp;
DROP TABLE project.RatingsTemp;