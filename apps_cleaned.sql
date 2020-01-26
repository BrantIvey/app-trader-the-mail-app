-- initial details of the app store data from play store
-- Count rows 10840
SELECT COUNT (*)
FROM play_store_apps;
-- initial columns
SELECT *
FROM play_store_apps;
-- Review column contents
SELECT DISTINCT price
FROM play_store_apps
ORDER BY price
-- Clean the text to numeric
-- Clean white space on price column (string)
/*UPDATE
    play_store_apps
SET
    price = LTRIM(RTRIM(price));
SELECT DISTINCT price
FROM play_store_apps
ORDER BY price;
--KG clean
/*select name, p.rating, p.review_count as play_store_review_count, install_count, 
replace(p.price, '$', '') as price, cast (a.review_count as int)as app_store_review_count
from play_store_apps as p
inner join app_store_apps as a using (name)
order by name, p.review_count desc;*/
--Extend Price * 10,000 by cleaning data and making Play Store price numeric

replace(p.price, '$','')::numeric
SELECT Replace(p.price, '$', '') as price
FROM play_store_apps
FROM ()

Cast (p.price AS NUMERIC) AS price_num, 

UPDATE play_store_apps
SET price = LTRIM(RTRIM(price));


FROM play_store_apps as p
INNER JOIN app_store_apps AS a USING (name)*/


select name, p.rating,
	p.review_count as play_store_review_count,
	install_count,
	replace(p.price, '$','')::numeric as price,
	cast(a.review_count as int) as app_store_review_count,
	CASE WHEN p.rating <= .24 THEN '1'
	WHEN p.rating >= .25 AND p.rating <=.74 THEN '2'
	WHEN p.rating >= .75 AND p.rating <=1.24 THEN '3'
	WHEN p.rating >= 1.25 AND p.rating <=1.74 THEN '4'
	WHEN p.rating >= 1.75 AND p.rating <=2.24 THEN '5'
	WHEN p.rating >= 2.25 AND p.rating <2.74 THEN '6'
	WHEN p.rating >= 2.75 AND p.rating <=3.24 THEN '7'
	WHEN p.rating >= 3.25 AND p.rating <=3.74 THEN '8'
	WHEN p.rating >= 3.75 AND p.rating <=4.24 THEN '9'
	WHEN p.rating >= 4.25 AND p.rating <=4.74 THEN '10'
	WHEN p.rating >= 4.75 THEN '11'
	ELSE p.rating :: int END AS lifespan
from play_store_apps as p
inner join app_store_apps as a using (name)
order by name, p.review_count desc




