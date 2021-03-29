create table Calendar(
   listing_id int,
   date date,
   available boolean,
   price money,
   adjusted_price money,
   minimum_nights smallint,
   maximum_nights smallint,
   PRIMARY KEY(listing_id,date)
);