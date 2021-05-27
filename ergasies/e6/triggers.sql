create trigger listingsInsertTrigger
after insert on listings
FOR EACH ROW 
UPDATE host
	set host.listings_count=host.listings_count+1
	where newrow.host_id=host.id;

create trigger deleteTrigger
after delete on listings
referencing 
	old row as oldrow,
	new row as newrow
for each row
	update host
	set host.listings_count=host.listings_count-1
	where newrow.host_id=host.id;


create table "ex6_listings" as table listings;
create table "ex6_host" as table host;

select * from ex6_listings where id=10595;select * from ex6_host where id=37177;
delete from ex6_listings where id=10595;

	
 