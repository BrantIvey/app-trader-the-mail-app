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
-- Clean white space on price column (string)
UPDATE
    play_store_apps
SET
    price = LTRIM(RTRIM(price));
SELECT DISTINCT price
FROM play_store_apps
ORDER BY price