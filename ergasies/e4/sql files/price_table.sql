
-- dhmiourgia pinaka Price
CREATE TABLE Price
AS (SELECT DISTINCT id AS listing_id, 
price, 
weekly_price,
monthly_price,
security_deposit,
cleaning_fee,
guests_included,
extra_people,
minimum_nights,
maximum_nights,
minimum_minimum_nights,
maximum_minimum_nights,
minimum_maximum_nights,
maximum_maximum_nights, 
minimum_nights_avg_ntm,
maximum_nights_avg_ntm
	FROM listings);

-- diagrafh pedion apo ton Listing
ALTER TABLE Listings
DROP COLUMN price,
DROP COLUMN weekly_price,
DROP COLUMN monthly_price,
DROP COLUMN security_deposit,
DROP COLUMN cleaning_fee,
DROP COLUMN guests_included,
DROP COLUMN extra_people,
DROP COLUMN minimum_nights,
DROP COLUMN maximum_nights,
DROP COLUMN minimum_minimum_nights,
DROP COLUMN maximum_minimum_nights,
DROP COLUMN minimum_maximum_nights,
DROP COLUMN maximum_maximum_nights,
DROP COLUMN minimum_nights_avg_ntm,
DROP COLUMN maximum_nights_avg_ntm;

-- dhlosh FK
ALTER TABLE Price
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

/*
because there are no decimal values 
select price from Listings where price::numeric::float8<>FLOOR(price::numeric::float8);
returns 0 rows
*/

/*
metatrepoume ta pedia price-->varchar--> numeric
*/
ALTER TABLE Price
alter column price TYPE varchar,
alter column weekly_price TYPE varchar,
alter column monthly_price TYPE varchar,
alter column security_deposit TYPE varchar,
alter column cleaning_fee TYPE varchar,
alter column extra_people TYPE varchar;

-- Remove the "$" from the VARCHAR columns 
UPDATE "Price" SET price = REPLACE(price,'$','') WHERE price IS NOT NULL;
UPDATE "Price" SET weekly_price = REPLACE(weekly_price,'$','') WHERE weekly_price IS NOT NULL;
UPDATE "Price" SET monthly_price = REPLACE(monthly_price,'$','') WHERE monthly_price IS NOT NULL;
UPDATE "Price" SET security_deposit = REPLACE(security_deposit,'$','') WHERE security_deposit IS NOT NULL;
UPDATE "Price" SET cleaning_fee = REPLACE(cleaning_fee,'$','') WHERE cleaning_fee IS NOT NULL;
UPDATE "Price" SET extra_people = REPLACE(extra_people,'$','') WHERE extra_people IS NOT NULL;

UPDATE  Price
SET 
price = REPLACE(price,',',''),
weekly_price = REPLACE(weekly_price,',',''),
monthly_price = REPLACE(monthly_price,',',''),
security_deposit = REPLACE(security_deposit,',',''),
cleaning_fee = REPLACE(cleaning_fee,',',''),
extra_people = REPLACE(cleaning_fee,',','');


ALTER TABLE Price
alter column price TYPE numeric(10,2) using price::numeric(10,2),
alter column weekly_price TYPE numeric(10,2) using weekly_price::numeric(10,2),
alter column monthly_price TYPE numeric(10,2) using monthly_price::numeric(10,2),
alter column security_deposit TYPE numeric(10,2) using security_deposit::numeric(10,2),
alter column cleaning_fee TYPE numeric(10,2) using cleaning_fee::numeric(10,2),
alter column extra_people TYPE numeric(10,2) using extra_people::numeric(10,2);
