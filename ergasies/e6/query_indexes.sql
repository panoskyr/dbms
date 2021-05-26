--QUERY 1
CREATE INDEX host_id_index_for_listing ON Listing(host_id);
DROP INDEX host_id_index_for_listing;
--to host_id(id) einai PK ston host ara den xreiazetai index


--------------------------------------------------------------
--QUERY 2
CREATE INDEX guests_included_index_for_listing ON Listing(guests_included);
DROP INDEX guests_included_index_for_listing;

CREATE INDEX price_index_for_price ON Price(price);
DROP INDEX price_index_for_price;

--------------------------------------------------------------
--QUERY 3
CREATE INDEX beds_index_for_room ON Room(beds);
DROP INDEX beds_index_for_room;

CREATE INDEX guests_included_index_for_price ON Price(guests_included);
DROP INDEX guests_included_index_for_price;

--------------------------------------------------------------
--QUERY 4
CREATE INDEX listing_id_index_for_listing ON Listing(id);
DROP INDEX listing_id_index_for_listing;
--einai hdh PK


--------------------------------------------------------------
--QUERY 5
CREATE INDEX host_id_index_for_listing ON Listing(host_id);
DROP INDEX host_id_index_for_listing;
--Isos den xreiazetai index epeidh den yparxei Where/Having??


--------------------------------------------------------------
--QUERY 6
CREATE INDEX has_availability_index_for_listing ON Listing(has_availability);
DROP INDEX has_availability_index_for_listing;

CREATE INDEX is_superhost_index_for_host ON Host(is_superhost);
DROP INDEX is_superhost_index_for_host;


--------------------------------------------------------------
--QUERY 7
--Isos den xreiazetai index epeidh den yparxei Where/Having??