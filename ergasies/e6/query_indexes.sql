--QUERY 1
CREATE INDEX host_id_index_for_listing ON Listing2(host_id);
DROP INDEX host_id_index_for_listing;


--------------------------------------------------------------
--QUERY 2
CREATE INDEX guests_included_price_index_for_price ON Price(price,guests_included);
DROP INDEX guests_included_price_index_for_price;

--------------------------------------------------------------
--QUERY 3
CREATE INDEX beds_index_for_room ON Room2(beds);
DROP INDEX beds_index_for_room;

CREATE INDEX guests_included_index_for_price ON Price(guests_included);
DROP INDEX guests_included_index_for_price;

--------------------------------------------------------------
--QUERY 4
CREATE INDEX listing_id_index_for_listing ON Listing2(id);
DROP INDEX listing_id_index_for_listing;
--einai hdh PK


--------------------------------------------------------------
--QUERY 5
CREATE INDEX host_id_index_for_listing ON Listing2(host_id);
DROP INDEX host_id_index_for_listing;


--------------------------------------------------------------
--QUERY 6
CREATE INDEX has_availability_index_for_listing ON Listing2(has_availability);
DROP INDEX has_availability_index_for_listing;

CREATE INDEX is_superhost_index_for_host ON Host(is_superhost);
DROP INDEX is_superhost_index_for_host;


--------------------------------------------------------------
--QUERY 7
CREATE INDEX geometry_coordinates_index_for_geolocation ON Geolocation2(geometry_coordinates_0_0_7_0);
DROP INDEX geometry_coordinates_index_for_geolocation;
