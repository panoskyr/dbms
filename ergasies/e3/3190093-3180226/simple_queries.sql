/*

 Shows the available date with one minimum night allowed and the price from loewest to highest, it is used to find
 the 10 cheapest avaible rooms for a one night sstay.
output:ROWS=10
*/

SELECT Calendar.date AS date , Calendar.adjusted_price As price , Calendar.minimum_nights as minimum_nights
FROM CALENDAR
WHERE Calendar.minimum_nights=1 AND Calendar.available=TRUE
ORDER BY Calendar.adjusted_price ASC
LIMIT 10;

------------------------------------------------

/*
All listings where the host's name is 'Nikos' and the reviwer_name is not 'Karen' 
output:ROWS=1918

*/

SELECT Reviews.listing_id AS listing_id, Listings.host_name AS host_name, Reviews.reviewer_name AS reviewer_name
FROM Reviews INNER JOIN Listings ON Listings.id = Reviews.listing_id
WHERE Listings.host_name='Nikos' and Reviews.reviewer_name<>'Karen'
GROUP BY Reviews.listing_id,Listings.host_name, Reviews.reviewer_name;

---------------------------------------------------
/*avg price of listings per neighbourhood ascending
output :ROWS=45
*/
select neighbourhood_cleansed, avg(price::numeric)::numeric(5,2) as p
from Listings
join Neighbourhoods
on Neighbourhoods.neighbourhood=Listings.neighbourhood_cleansed
group by neighbourhood_cleansed
order by p;

--------------------------------------------------------
/*
show listings per price range asc
output :ROWS=1
 */


select count(price::numeric between 0 and 25 or null) as s1,
count(price::numeric  between 25.01 and 50 or null) as s2,
count(price::numeric  between 50.01 and 75 or null) as s3,
count(price::numeric  between 75.01 and 100 or null) as s4,
count(price::numeric  between 100.01 and 250 or null) as s5,
count(price::numeric between 250.01 and 500 or null) as s6,
count(price::numeric  between 500.01 and 7001 or null) as s7
from Listings;




-----------------------------------------------------------------
/*
10 hosts with most listings
output :ROWS=10
*/
select host_id, count(host_id) as c
from Listings
group by host_id
order by c desc
limit 10;


-----------------------------------------------------------------

/*
finding vacant entries during christmas time and displaying the url so i can make reservations
output 55015 rows
*/
select Listings.id, Listings.listing_url from Listings
join Calendar 
on Calendar.listing_id=Listings.id
where (Calendar.date between '2020-12-20' and '2020-12-27')
and Calendar.available=True;



---------------------------------------------------------------------
/*
Finding available listings on 17-02-2021
which provide wifi,brekfast and allow smoking
output 120 rows
*/


select id,host_name, amenities from Listings
join Calendar
on Listings.id =Calendar.listing_id
where Calendar.date = '2021-02-17' and Calendar.available=True
and amenities like ('%Wifi%' )
and amenities like('%Breakfast%') 
and amenities like('%Smoking allowed%');
---------------------------------------------

-- Finds the size of the biggest listing by square feet where the the property is in the neighbourhood KOLONAKI
-- ROWS=1
SELECT MAX(CAST (L.square_feet AS int)) AS biggest_listing_where_neighbourhood_is_KOLONAKI
FROM neighbourhoods N JOIN Listings L ON N.neighbourhood = L.neighbourhood_cleansed
WHERE L.square_feet IS NOT NULL AND N.neighbourhood='ΚΟΛΩΝΑΚΙ';


-----------------------------------------------------
/*
ME OUTER JOIN
-- Shows the host_id of the listing, the neighbourhood and the adjusted_price where the price is between 180-200$ from most to least expensive  
-- (if the host_neighbourhood is null it's ok, we still display the host_id and the price)
-- Output: 25995 rows
*/


SELECT L.host_id as host_id,C.adjusted_price as adjusted_price ,L.host_neighbourhood as host_neighbourhood
FROM calendar C LEFT OUTER JOIN listings L ON C.listing_id=L.id
WHERE C.adjusted_price<CAST(200 as money) AND C.adjusted_price>CAST(180 as money)
ORDER BY C.adjusted_price DESC;

-----------------------------------------------------
/*

find the appartments that have not been reviewed yet

OUTPUT:2559 rows
*/

select * from Listings
left outer join Reviews 
on Listings.id=Reviews.listing_id
where Reviews.id is null;
----------------------------------------------------------
/*
find all hosts that are superhosts and have more than 3 places listed
output:327
*/
select  distinct host_id, host_url 
from Listings
where host_listings_count>3 and host_is_superhost is True
order by host_id asc;


-----------------------------------------------------

/*Show the the minimum amount of maximum nights avaible for any listing which host name is Emmanouil
 Output: 1 rows
*/
SELECT DISTINCT L.host_name as host_name,MIN(L.maximum_nights)as the_smallest_amount_of_the_max_nights
FROM calendar C LEFT OUTER JOIN listings L ON C.listing_id=L.id
WHERE c.available='true' AND host_name='Emmanouil'
GROUP BY L.host_name;