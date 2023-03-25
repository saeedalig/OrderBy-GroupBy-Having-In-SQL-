select * from smartphones;

-- FIND TOP 5 SAMSUNG PHONES WITH BIGGEST SCREEN SIZE
SELECT model, screen_size
FROM smartphoneS 
WHERE brand_name = 'samsung'
ORDER BY screen_size LIMIT 5;

-- FIND THE PHONES HAVING THE MOST NUMBER OF CAMERAS BOTH FRONT AND REAR
SELECT model, (num_front_cameras + num_rear_cameras) as total_camera
FROM smartphones
ORDER BY total_camera DESC ;

-- SORT DATA ON THE BASIS OF PPI IN DECREASING ORDER
SELECT 	model, ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_width)/screen_size) AS ppi
FROM smartphones
ORDER BY ppi DESC;

-- FIND THE PHONE HAVING THE 2nd HIGHEST BATTERY CAPACITY 
SELECT model, battery_capacity
FROM smartphones
ORDER BY battery_capacity DESC LIMIT 1 , 1;

-- FIND THE PHONE HAVING THE 2nd LOWEST BATTERY CAPACITY 
SELECT model, battery_capacity
FROM smartphones
ORDER BY battery_capacity ASC LIMIT 1 , 1;

-- FIND THE PHONE HAVING THE 10th HIGHEST BATTERY CAPACITY  fist 9 ignored and then 10th one is returned
SELECT model, battery_capacity 
FROM smartphones 
ORDER BY battery_capacity DESC LIMIT 9,1;


-- FIND THE 3 PHONES HAVING THE BATTERY CAPACITY JUST BELOW THAN 1st PHONE
SELECT model, battery_capacity 
FROM smartphones 
ORDER BY battery_capacity DESC LIMIT 1,3;

-- WORST RATING OF THE APPLE PHONE 
SELECT model, rating 
FROM smartphones 
WHERE brand_name = 'apple'
ORDER BY rating asc LIMIT 1 ;

-- FIND THE  PHONES THAT STARTS WITH A WHICH ARE CHEAPER (sorting 2 col)
SELECT model , price
FROM smartphones
ORDER BY brand_name ASC, price ASC;

-- GIVE THE LIST OF 10 MAPPLE PHONES WHICH HAVE THE HIEGHEST RATING
SELECT model, rating
FROM smartphones
WHERE brand_name = "apple"
ORDER BY rating DESC LIMIT 10;

-- GROUP SMARTPHONES BY BRAND AND GET THE COUNT, AVG PRICE, MAX RATING, AVG SCREEN_SIZE, AND AVG BATTERY CAPACITY
SELECT 
	brand_name, 
    count(*) as total_phones,
    ROUND(AVG(price)) AS avg_price,
    MAX(rating) AS max_rating,
    ROUND(AVG(screen_size), 1) AS avg_screen_size,
    ROUND(AVG(battery_capacity), 1) AS avg_battery_capacity
FROM smartphones
GROUP BY brand_name
ORDER BY total_phones DESC LIMIT 15;

-- FIND THE AVG PRICE, MAX RATING PHONES
SELECT brand_name, AVG(price) as avg_price, MAX(rating) as max_rating
FROM smartphones
GROUP BY brand_name;

-- FIND THE AVG PRICE AND AVG RATING OF THE PHONES THAT HAVE NFC
SELECT 
	has_nfc,
    ROUND(AVG(price),2) AS AVG_PRICE,
    ROUND(AVG(rating),2) AS AVG_RATING
FROM smartphones
GROUP BY has_nfc;

-- FIND THE AVG PRICE AND AVG RATING OF THE PHONES THAT HAVE 5G
SELECT 
	has_5g,
    ROUND(AVG(price),2) AS AVG_PRICE,
    ROUND(AVG(rating),2) AS AVG_RATING
FROM smartphones
GROUP BY has_5g;

-- FIND THE AVG PRICE AND AVG RATING OF THE PHONES THAT HAVE FAST CHARGING OPTION
SELECT 
	fast_charging_available,
    ROUND(AVG(price),2) AS AVG_PRICE,
    ROUND(AVG(rating),2) AS AVG_RATING
FROM smartphones
GROUP BY fast_charging_available;

-- FIND THE AVG PRICE OF THE PHONES THAT HAVE EXTENDED MEMORY AVAILABE FEATURE
SELECT 
	extended_memory_available,
    ROUND(AVG(price),2) AS AVG_PRICE
FROM smartphones
GROUP BY extended_memory_available;

SELECT 
	processor_brand,
    ROUND(AVG(price),2) AS AVG_PRICE
FROM smartphones
GROUP BY processor_brand
ORDER BY  AVG_PRICE DESC;

SELECT * FROM smartphones ;
SELECT count(*) FROM smartphones ;