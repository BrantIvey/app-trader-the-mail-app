-- Review table contents for column matches and type matches with OUTER JOIN
--Line up matching fields to compare row contents side by side
SELECT a.name AS a_name, p.name AS p_name, 
       a.price AS a_price, p.price AS p_price, 
       a.review_count AS a_review_count, p.review_count AS p_review_count, 
       a.rating AS a_rating, p.rating AS p_rating, a.content_rating AS a_content_rating, 
	   p.content_rating AS p_content_rating, a.primary_genre AS a_primary_genre, 
	   p.genres AS p_genres, category AS p_category, p.size as p_size, 
	   install_count AS p_install_count, p.type AS p_type  
	   FROM app_store_apps AS a
FULL OUTER JOIN play_store_apps AS p
	   ON a.name = p.name;
	   
--INFORMATION app_store_apps
SELECT table_name, column_name, column_default, data_type, ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'app_store_apps'
ORDER BY ORDINAL_POSITION

--INFORMATION play_store_apps
SELECT table_name, column_name, column_default, data_type, ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'play_store_apps'
ORDER BY ORDINAL_POSITION
	  

	  
	  
	  