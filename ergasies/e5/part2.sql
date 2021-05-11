/* Ypothetoume oti doulevoume stous kanonikous pinakes kai oxi sta antigrafa toys p.x anti gia "room2" (opoy einai o pinakas poy doylepsame kai kaname tis allages sthn ergasia 5)
valame "room", anti gia "listing2" (opoy einai o pinakas poy doylepsame kai kaname tis allages sthn ergasia 4) valame "listing"...*/


--Shows the id of the listing where the guests allowed are 8 and the listing has more than 4 beds so
--everyone has a bed(if we suppose one bed can fit 2 people)
--Rows:20
SELECT price.listing_id,beds, guests_included
FROM room INNER JOIN price ON price.listing_id = room.listing_id
WHERE guests_included=8 and beds>4;


--Shows the names and the ids of the hosts with more than 10 listing
--Rows:95
SELECT host.id,host.name,COUNT(listing.id) as number_of_listings
FROM listing INNER JOIN host ON host.id=listing.host_id
GROUP BY host.id,host.name
HAVING  COUNT(listing.id)>10

--Shows the hosts name and the names of their listings with the host id being in ascending order
--Rows: 11541
SELECT listing.host_id,host.name,listing.name
FROM listing FULL OUTER JOIN host ON host.id=listing.host_id
ORDER BY listing.host_id


--Shows the hosts_id and the listings_id of the listings which are available to book and if also
--the host is a superhost (so basically we are looking for an available listing by a superhost)
--Rows:4367
SELECT host.id as host_id ,listing.id as listing_id,has_availability, is_superhost
FROM listing FULL OUTER JOIN host ON host.id=listing.host_id
WHERE has_availability='true' AND is_superhost='true'


--Shows the neighbourhoods with geometry coordinates of 0_0_7_0
--Rows:45
SELECT neighbourhood,geometry_coordinates_0_0_7_0
FROM geolocation INNER JOIN neighbourhood on neighbourhood.neighbourhood=geolocation.properties_neighbourhood
GROUP BY neighbourhood,geometry_coordinates_0_0_7_0
