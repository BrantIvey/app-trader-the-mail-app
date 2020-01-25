SELECT a.name AS app_name, size_bytes AS app_size, CAST (price AS TEXT) AS app_price, rating AS app_rating,
       primary_genre AS app_genres, a.content_rating AS app_content_rating, 
	   CAST (review_count AS INTEGER) AS app_review_count
/*
(cast(replace(p16.pa_value, '%','')  as decimal (10,2))) as discount
a.name AS name, b.name AS name 
a.price AS apple_price, b.price AS play_price, 
       a.review_count, b.review_count, 
        a.rating, b.rating, a.content_rating, b.content_rating, primary_genre, category, b.size, 
		install_count, b.type, genres*/
FROM app_store_apps as a
UNION 
-- Clean white space on price column (string) with trim
SELECT b.name AS app_name, b.size AS app_size, price AS app_price, rating AS app_rating, 
       genres AS app_genres, b.content_rating AS app_content_rating, review_count AS app_review_count

FROM play_store_apps as b
ORDER BY app_price
-- WHERE a.app_name = b.app_name
