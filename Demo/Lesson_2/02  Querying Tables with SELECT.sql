-- SELECT ALL
-- - Default behavior includes duplicates

SELECT Color
FROM SalesLT.Product;

-- SELECT DISTINCT
-- -Removes duplicates

SELECT DISTINCT Color
FROM SalesLT.Product;

-- Sorting Results

SELECT sp.ProductNumber, sp.Name, sp.Color, sp.ListPrice
FROM SalesLT.Product AS sp
ORDER BY sp.Color, sp.ListPrice DESC;

-- Limiting Sorted Results

SELECT TOP 10 sp.ProductNumber, sp.Name, sp.Color, sp.ListPrice
FROM SalesLT.Product AS sp
ORDER BY sp.Color, sp.ListPrice DESC;

-- DEMO
SELECT Color FROM SalesLT.Product;
SELECT DISTINCT ISNULL(Color, 'None') AS Color FROM SalesLT.Product;
SELECT DISTINCT ISNULL(Color, 'None') AS Color FROM SalesLT.Product ORDER BY Color;
SELECT DISTINCT ISNULL(Color, 'None') AS Color, ISNULL(Size, '-') AS Size FROM SalesLT.Product ORDER BY Color, Size DESC;
SELECT TOP 100 Name, ListPrice FROM SalesLT.Product ORDER BY ListPrice DESC;
SELECT Name, ListPrice FROM SalesLT.Product ORDER BY ProductNumber OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 
SELECT Name, ListPrice FROM SalesLT.Product ORDER BY ProductNumber OFFSET 10 ROWS FETCH FIRST 10 ROW ONLY;









