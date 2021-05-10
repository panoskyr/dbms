--Shows the id of the listing where the guests allowed are 8 and the listing has more than 4 beds so
--everyone has a bed(if we suppose one bed can fit 2 people)
--Rows:20
SELECT price.listing_id,beds, guests_included
FROM room INNER JOIN price ON price.listing_id = room.listing_id
WHERE guests_included=8 and beds>4;


--Shows the names and the ids of the hosts with more than 10 listing
--Rows:95
SELECT host.id,host.name,COUNT(listing2.id) as number_of_listings
FROM listing2 INNER JOIN host ON host.id=listing2.host_id
GROUP BY host.id,host.name
HAVING  COUNT(listing2.id)>10

--Shows the hosts name and the names of their listings with the host id being in ascending order
--Rows: 11541
SELECT listing2.host_id,host.name,listing2.name
FROM listing2 FULL OUTER JOIN host ON host.id=listing2.host_id
ORDER BY listing2.host_id


--Shows the hosts_id and the listings_id of the listings which are available to book and if also
--the host is a superhost (so basically we are looking for an available listing by a superhost)
--Rows:4367
SELECT host.id as host_id ,listing2.id as listing_id,has_availability, is_superhost
FROM listing2 FULL OUTER JOIN host ON host.id=listing2.host_id
WHERE has_availability='true' AND is_superhost='true'


--Shows the neighbourhoods with geometry coordinates of 0_0_7_0
--Rows:45
SELECT neighbourhood,geometry_coordinates_0_0_7_0
FROM geolocation2 INNER JOIN neighbourhood2 on neighbourhood2.neighbourhood=geolocation2.properties_neighbourhood
GROUP BY neighbourhood,geometry_coordinates_0_0_7_0