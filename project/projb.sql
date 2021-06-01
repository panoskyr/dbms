
--a) number of movies per year
select EXTRACT(YEAR FROM (release_date)) as year, count(*)
FROM project.movies_metadata_unique
GROUP BY  (EXTRACT(YEAR FROM release_date))
ORDER BY EXTRACT(YEAR FROM (release_date));

--b) number of movies per genre
select genres as genre, count(*)
FROM project.movies_metadata_unique
GROUP BY  genres;
--c)number of movies by genre and year
select EXTRACT(YEAR FROM (release_date)) as year,genres, count(*)
FROM project.movies_metadata_unique
GROUP BY  (EXTRACT(YEAR FROM release_date)),genres
ORDER BY EXTRACT(YEAR FROM (release_date));

--e)number of ratings per user
select userid,count(*)
FROM project.ratings_small
GROUP BY userid
ORDER BY userid;


--*******change from varchar type to numeric so we can use the avg function
ALTER TABLE project.ratings_small
ALTER COLUMN rating TYPE NUMERIC(2,1)
USING rating::NUMERIC;

---f)average user rating, order by id (only 2 demical spaces shown)

select userid, ROUND(avg(rating),2)
from project.ratings_small
group by userid
ORDER BY userid;


