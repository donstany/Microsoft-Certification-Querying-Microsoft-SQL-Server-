-- Overview
-- In this lab, you will use SELECT queries to retrieve, sort, and filter data from the AdventureWorksLT database.

-- Challenge 1: Retrieve Data for Transportation Reports.
 1. Retrieve a list of cities
-- Initially, you need to produce a list of all of you customers' locations.
-- Write a Transact-SQL query that queries the Address table and retrieves all values for City 
-- and StateProvince, removing duplicates.

SELECT DISTINCT adr.City, adr.StateProvince 
FROM SalesLT.Address AS adr;

2. Retrieve the heaviest products
-- Transportation costs are increasing and you need to identify the heaviest products. 
-- Retrieve the names of the top ten percent of products by weight.

SELECT TOP 10 PERCENT  Name, Weight 
FROM SalesLT.Product
ORDER BY Weight DESC;

3. Retrieve the heaviest 100 products not including the heaviest ten
-- The heaviest ten products are transported by a specialist carrier, 
-- therefore you need to modify the previous query to list the heaviest 100 products 
-- not including the heaviest ten.

SELECT Name, Weight
FROM SalesLT.Product
ORDER BY Weight DESC
         OFFSET     10 ROWS
         FETCH NEXT 100 ROWS ONLY;


Challenge 2: Retrieve Product Data
-- The Production Manager at Adventure Works would like you to create 
-- some reports listing details of the products that you sell.

1. Retrieve product details for product model 1
-- Initially, you need to find the names, colors, and sizes of the products 
-- with a product model ID 1.

SELECT ProductID, ProductModelID, Name, Color, Size 
FROM SalesLT.Product
WHERE ProductModelID=1; 

2. Filter products by color and size
-- Retrieve the product number and name of the products that have a color of 'black', 'red', or 'white' 
-- and a size of 'S' or 'M'.

SELECT ProductNumber
FROM SalesLT.Product
WHERE Color IN('Black', 'Red', 'White') 
AND   Size IN ('S', 'M');

3. Filter products by product number
-- Retrieve the product number, name, and list price of products whose product number begins 'BK-'.

SELECT ProductNumber, Name, ListPrice 
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

4. Retrieve specific products by product number
-- Modify your previous query to retrieve the product number, name, and list price of products
-- whose product number begins 'BK-' followed by any character other than 'R’, 
-- and ends with a '-' followed by any two numerals.

SELECT ProductNumber, Name, ListPrice 
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%' 
  AND ProductNumber NOT LIKE 'BK-R%'
  AND ProductNumber LIKE '%-__';

  --------------------

 -- Retrieve Specific Products by Product Number

  FROM ProductNumber, Name, ListPrice
  FROM SalesLT.Product
  WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';

