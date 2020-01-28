-- initial details of the app store data from app store
-- Count rows 7197
SELECT COUNT (*)
FROM app_store_apps;
-- initial columns
SELECT *
FROM app_store_apps;
-- Review column contents
SELECT DISTINCT content_rating
FROM app_store_apps;