/*

Dhmiourgia pinaka amenity me prvth sthlh pk amenity id kai deyterh amenity_name
*/

CREATE TABLE Amenity AS(
	SELECT DISTINCT UNNEST(amenities::text[]) AS amenity_name FROM Room);

ALTER TABLE Amenity
ADD COLUMN amenity_id SERIAL PRIMARY KEY;

/*

Endiamesos pinakas gia na syndesoume to room me to amenities xrhsimopoivntas to room id 
kai to amenity id
*/

CREATE TABLE "Room_Amenity_Connection" AS(
	SELECT DISTINCT    t.room_id,     "Amenity".amenity_id   AS   amenity_id    FROM "Amenity",
		(SELECT Room.listing_id AS room_id ,unnest(amenities::text[]) as amenity_name from Room ) AS t
	WHERE t.amenity_name = "Amenity".amenity_name);

ALTER TABLE Room
ADD PRIMARY KEY (listing_id);
	
ALTER TABLE "Room_Amenity_Connection"
ADD PRIMARY KEY(room_id,amenity_id);

ALTER TABLE "Room_Amenity_Connection"
ADD FOREIGN KEY (room_id) REFERENCES Room(listing_id),
ADD FOREIGN KEY (amenity_id) REFERENCES Amenity(amenity_id);

ALTER TABLE Room
DROP COLUMN amenities;