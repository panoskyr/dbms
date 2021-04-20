--- to available einai hdh boolean, pos na to metatrepso se boolean???
--- ta pedia price ta eixame typoy money kai ta metatrepoume se typo varchar kai epeita se numeric
ALTER TABLE Calendar
alter column price TYPE varchar,
alter column adjustable_price TYPE varchar;

UPDATE  Calendar
SET 
price = REPLACE(price,'$',''),
adjustable_price = REPLACE(price,'$','');

UPDATE  Calendar
SET 
price = REPLACE(price,',',''),
adjustable_price = REPLACE(price,',','');

ALTER TABLE Calendar 
alter column price TYPE numeric(18,0) using price::numeric,
alter column adjustable_price TYPE numeric(18,0) using adjustable_price::numeric;

