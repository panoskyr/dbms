
--- ta pedia price ta eixame typoy money kai ta metatrepoume se typo varchar kai epeita se numeric
/*PRICE*/
ALTER TABLE Calendar
alter column price TYPE varchar,
alter column adjusted_price TYPE varchar;

UPDATE  Calendar
SET 
price = REPLACE(price,'$',''),
adjusted_price = REPLACE(price,'$','');

UPDATE  Calendar
SET 
price = REPLACE(price,',',''),
adjusted_price = REPLACE(price,',','');

ALTER TABLE Calendar 
alter column price TYPE numeric(18,0) 
using price::numeric;

ALTER TABLE Calendar
ALTER COLUMN adjusted_price TYPE numeric(18,0) 
using adjusted_price::numeric;

