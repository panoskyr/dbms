-- dhmiourgia pinaka Location
CREATE TABLE Location
AS (SELECT listing_id, street, neighbourhood, neighbourhood_cleansed, city, state,
	zipcode, market, smart_location, country_code, country, latitude, longitude,
	is_location_exac
	FROM listings);

-- diagrafh ton pedion apo ton Listing
ALTER TABLE Location
DROP COLUMN street,
DROP COLUMN neighbourhood,
DROP COLUMN neighbourhood_cleansed,
DROP COLUMN city,
DROP COLUMN state;
DROP COLUMN zipcode,
DROP COLUMN market,
DROP COLUMN smart_location,
DROP COLUMN country,
DROP COLUMN latitude,
DROP COLUMN longitude,
DROP COLUMN is_location_exac;

-- prosthesh FK ston Location me to Listing
ALTER TABLE Location 
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

-- diagrafh FK tou Listing me ton neighbourhood
ALTER TABLE Listings
DROP FOREIGN KEY neighbourhood_cleansed;

-- prosthesh FK ston Location me ton neighbourhood
ALTER TABLE Location
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods(neighbourhood);