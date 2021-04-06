create table Listings_Summary(
   id int,
   name varchar(100),
   host_id int,
   host_name varchar(60),
   neighbourhood_group varchar(100),
   neighbourhood varchar(400),
   latitude varchar(20),
   longitude varchar(20),
   room_type varchar(20),
   price money,
   minimum_nights int,
   number_of_reviews int,
   last_review date,
   reviews_per_month NUMERIC(6,2),
   calculated_host_listings_count int,
   availability_365 int,
   PRIMARY KEY(id)
);
