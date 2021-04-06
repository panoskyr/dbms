BEGIN;
SHOW client_encoding;
set client_encoding to 'utf8';
SHOW client_encoding;

\copy Calendar FROM 'C:/Users/pchrk/OneDrive/Desktop/cs/2nd year/d examino/vaseis/vaseis 2021/airbnb dataset/calendar.csv' DELIMITER ',' CSV HEADER;
\copy Geolocation FROM 'C:/Users/pchrk/OneDrive/Desktop/cs/2nd year/d examino/vaseis/vaseis 2021/airbnb dataset/geolocation.csv' DELIMITER ',' CSV HEADER;
\copy Neighbourhoods FROM 'C:/Users/pchrk/OneDrive/Desktop/cs/2nd year/d examino/vaseis/vaseis 2021/airbnb dataset/neighbourhoods.csv' DELIMITER ',' CSV HEADER;
\copy Listings FROM 'C:/Users/pchrk/OneDrive/Desktop/cs/2nd year/d examino/vaseis/vaseis 2021/airbnb dataset/listings.csv' DELIMITER ',' CSV HEADER;
\copy Listings_Summary FROM 'C:/Users/pchrk/OneDrive/Desktop/cs/2nd year/d examino/vaseis/vaseis 2021/airbnb dataset/listings-summary.csv' DELIMITER ',' CSV HEADER;
\copy Reviews_Summary FROM 'C:/Users/pchrk/OneDrive/Desktop/cs/2nd year/d examino/vaseis/vaseis 2021/airbnb dataset/reviews-summary.csv' DELIMITER ',' CSV HEADER;
\copy Reviews FROM 'C:/Users/pchrk/OneDrive/Desktop/cs/2nd year/d examino/vaseis/vaseis 2021/airbnb dataset/reviews.csv' DELIMITER ',' CSV HEADER;

COMMIT;
