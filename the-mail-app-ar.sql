-- Ann Rumsey presenting for the-mail-app-team
-- Lessons Learned: 
-- Best practice to end a script with ; (not absolutely necessary when one script)
-- However when stacking scripts, must end each script with ; to proceed to the next script 

-- STEPS to begin - unfamiliar table investigation prior to joining / combining 
-- Review table contents for column matches and type matches with OUTER JOIN
-- Line up matching fields to compare row contents side by side and review type and contents
SELECT a.name AS a_name, p.name AS p_name, 

       a.price AS a_price, p.price AS p_price, 
	   
       a.review_count AS a_review_count, p.review_count AS p_review_count, 
	   
       a.rating AS a_rating, p.rating AS p_rating, 
	   
	   a.content_rating AS a_content_rating, p.content_rating AS p_content_rating, 
	   
	   a.primary_genre AS a_primary_genre,   p.genres AS p_genres, 
	   
	   a.size_bytes AS a_size_bytes, p.size as p_size, 
	   
-- The unique fields do not require table.field prefixes, however for readability to know the sources
-- Best practice would be to label tables.fields correctly for consumers be assured of the right table   
	   a.currency AS a_currency,
	   
	   p.type AS p_type,  
-- Note two fields found only on the p table were also renamed for consistency without the p. prefix
-- This method works though doesn't conform to readability best practice
	   category AS p_category, 
	   
	   install_count AS p_install_count
	  	   
	   FROM app_store_apps AS a
FULL OUTER JOIN play_store_apps AS p
	   ON a.name = p.name
	   LIMIT 10 ;

--SEPARATE scripts to query column names, content defaults, types and ordinal position
--INFORMATION_SCHEMA for table 'app_store_apps'
SELECT table_name, column_name, column_default, data_type, ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'app_store_apps'
ORDER BY column_name;

--INFORMATION_SCHEMA for table 'play_store_apps'
SELECT table_name, column_name, column_default, data_type, ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'play_store_apps'
ORDER BY column_name;
	  

	  
	  
	  