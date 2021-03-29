BEGIN;

ALTER TABLE Listings
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods(neighbourhood);

ALTER TABLE Listings_Summary
ADD FOREIGN KEY (id) REFERENCES Listings(id);

ALTER TABLE Calendar
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Reviews
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Reviews_Summary 
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Neighbourhoods
ADD FOREIGN KEY (neighbourhood) REFERENCES Geolocation(properties_neighbourhood);

--den perilambanoume kleidi gia to groups kathos ola einai null

ALTER TABLE Calendar
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

COMMIT;
