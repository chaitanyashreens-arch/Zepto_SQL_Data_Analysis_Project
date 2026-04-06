drop table if exists zepto;

create table zepto(
sku_id SERIAL  PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent Numeric(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);


--Data exploration

--count of rows
SELECT COUNT(*) FROM zepto;

--sample of data 
SELECT  * FROM zepto
LIMIT 10;

--Null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
availablequantity IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR
outofstock IS NULL
OR
quantity IS NULL;

--differnt product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock and out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present_multiple times
SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) desc;

--data cleaning
--products with zero
SELECT * FROM zepto
WHERE mrp = 0 or discountedSellingPrice = 0;

--deleting the row where mrp is 0
DELETE FROM zepto
WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto 
SET mrp =mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedSellingPrice FROM zepto

--Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name , mrp, discountpercent
FROM zepto 
ORDER BY discountPercent DESC
LIMIT 10;


--Q2. What are the products with high MRP but out of stock?
SELECT DISTINCT name ,mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC ;

--Q3. Calculate the estimated revenue for each category
SELECT category, 
SUM(discountedSellingPrice * availableQuantity) as total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--Q4. Find all the products where the MRP is greater than 500 and the discount is less tahn 10% 
SELECT DISTINCT name, mrp, discountpercent
FROM zepto
Where mrp > 500 and discountpercent < 10
Order BY mrp DESC, discountPercent DESC; 


--Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
Round(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

--Q6 . Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100 
ORDER BY price_per_gram;

--Q7. Group the products into categories like low, medium, and bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'LOW'
     WHEN weightInGms < 5000 THEN 'MEDIUM'
	 ELSE 'BULK'
	 END AS weight_category
FROM zepto;
--Q8. What is the total  inventory weight per category
SELECT category,
sum(weightInGms * availableQuantity) as total_weight
From zepto
GROUP by category
Order by total_weight