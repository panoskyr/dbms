-- dhmiourgia pinaka Location
CREATE TABLE Location
AS (SELECT DISTINCT id as listing_id, street, neighbourhood, neighbourhood_cleansed, city, state,
	zipcode, market, smart_location, country_code, country, latitude, longitude,
	is_location_exact
	FROM listings);


/*running \d+ <tablename> on psql we get the fkey*/
-- prosthesh FK ston Location me to Listing
ALTER TABLE Location 
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

-- diagrafh FK tou Listing me ton neighbourhood
ALTER TABLE Listings
DROP CONSTRAINT Listings_neighbourhood_cleansed_fkey;

-- prosthesh FK ston Location me ton neighbourhood
ALTER TABLE Location
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods(neighbourhood);





-- diagrafh ton pedion apo ton Listing
ALTER TABLE Listings
DROP COLUMN street,
DROP COLUMN neighbourhood,
DROP COLUMN neighbourhood_cleansed,
DROP COLUMN city,
DROP COLUMN state,
DROP COLUMN zipcode,
DROP COLUMN market,
DROP COLUMN smart_location,
DROP COLUMN country,
DROP COLUMN country_code,
DROP COLUMN latitude,
DROP COLUMN longitude,
DROP COLUMN is_location_exact;