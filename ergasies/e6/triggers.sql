CREATE OR REPLACE FUNCTION addlistings()
	RETURNS TRIGGER AS
	$$
	BEGIN
		UPDATE host
		SET listings_count=listings_count+1
		WHERE id=NEW.host_id;
		UPDATE host
		SET total_listings_count=total_listings_count+1
		WHERE id=NEW.host_id;
		return null;

		
	END;
	$$ LANGUAGE plpgsql;


CREATE TRIGGER addListingsTrigger
AFTER INSERT ON listings
FOR EACH ROW
EXECUTE PROCEDURE addlistings();

CREATE OR REPLACE FUNCTION removelistings()
	RETURNS TRIGGER AS
	$$
	BEGIN
		UPDATE host
		SET listings_count=listings_count-1
		WHERE id=OLD.host_id;
		SET total_listings_count=total_listings_count-1
		WHERE id=OLD.host_id;
		return null;

	END;
	$$ LANGUAGE plpgsql;


CREATE TRIGGER removeListingsTrigger
AFTER INSERT ON listings
FOR EACH ROW
EXECUTE PROCEDURE removelistings();





/*
select * from listings where id=10595;select * from host where id=37177;

update the constraint
ALTER TABLE listings_summary drop constraint listings_summary_id_fkey;

ALTER TABLE listings_summary 
add constraint listings_summary_id_fkey 
foreign key(id) 
references listings (id)
ON UPDATE CASCADE 
ON DELETE CASCADE;

ALTER TABLE calendar drop constraint calendar_listing_id_fkey;
ALTER TABLE calendar 
ADD  CONSTRAINT calendar_listing_id_fkey
FOREIGN KEY (listing_id)
REFERENCES listings (id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ERROR:  update or delete on table "listings" violates foreign key constraint "reviews_listing_id_fkey" on table "reviews"
DETAIL:  Key (id)=(10595) is still referenced from table "reviews".
SQL state: 23503

ALTER TABLE reviews drop constraint reviews_listing_id_fkey;
ALTER TABLE reviews 
add constraint reviews_listing_id_fkey
foreign key(listing_id)
references listings(id)
on update cascade
on delete cascade;

ERROR:  update or delete on table "listings" violates foreign key constraint "reviews_summary_listing_id_fkey" on table "reviews_summary"
DETAIL:  Key (id)=(10595) is still referenced from table "reviews_summary".
SQL state: 23503

ALTER TABLE reviews_summary drop constraint reviews_summary_listing_id_fkey;
ALTER TABLE reviews_summary
add constraint reviews_summary_listing_id_fkey
foreign key(listing_id)
references listings(id)
on update cascade
on delete cascade;

delete from listings where id=10595;


*/




	
 