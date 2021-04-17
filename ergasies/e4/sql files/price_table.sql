-- dhmiourgia pinaka Price
CREATE TABLE Price
AS (SELECT listing_id, price, weekly_price, monthly_price, security_deposit, cleaning_fee,
	guests_included, extra_people, minimum_nights, maximum_nights,
	minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
	maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm
	FROM listings);

-- diagrafh pedion apo ton Listing
ALTER TABLE Listings
DROP COLUMN price,
DROP COLUMN weekly_price,
DROP COLUMN monthly_price,
DROP COLUMN security_deposit,
DROP COLUMN cleaning_fee;
DROP COLUMN guests_included,
DROP COLUMN extra_people,
DROP COLUMN minimum_nights,
DROP COLUMN maximum_nights,
DROP COLUMN minimum_minimum_nights;
DROP COLUMN maximum_minimum_nights,
DROP COLUMN minimum_maximum_nights,
DROP COLUMN maximum_maximum_nights,
DROP COLUMN minimum_nights_avg_ntm,
DROP COLUMN maximum_nights_avg_ntm;

-- dhlosh FK
ALTER TABLE Price
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

-- ta pedia price ta eixame typoy money kai ta metatrepoume se typo varchar kai epeita se numeric
ALTER TABLE Price
alter column price TYPE varchar,
alter column weekly_price TYPE varchar,
alter column monthly_price TYPE varchar,
alter column security_deposit TYPE varchar,
alter column cleaning_fee TYPE varchar,
alter column extra_people TYPE varchar;


UPDATE  Price
SET 
price = REPLACE(price,'$',''),
weekly_price = REPLACE(weekly_price,'$',''),
monthly_price = REPLACE(monthly_price,'$',''),
security_deposit = REPLACE(security_deposit,'$',''),
cleaning_fee = REPLACE(cleaning_fee,'$',''),
extra_people = REPLACE(cleaning_fee,'$','');

UPDATE  Price
SET 
price = REPLACE(price,',',''),
weekly_price = REPLACE(weekly_price,',',''),
monthly_price = REPLACE(monthly_price,',',''),
security_deposit = REPLACE(security_deposit,',',''),
cleaning_fee = REPLACE(cleaning_fee,',',''),
extra_people = REPLACE(cleaning_fee,',','');


ALTER TABLE Price
alter column price TYPE numeric(18,0) using price::numeric,
alter column weekly_price TYPE numeric(18,0) using weekly_price::numeric,
alter column monthly_price TYPE numeric(18,0) using monthly_price::numeric,
alter column security_deposit TYPE numeric(18,0) using security_deposit::numeric,
alter column cleaning_fee TYPE numeric(18,0) using cleaning_fee::numeric,
alter column extra_people TYPE numeric(18,0) using extra_people::numeric;