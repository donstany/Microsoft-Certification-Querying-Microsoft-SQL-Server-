-- Challenge I: Retrieve Customer Data

-- 1. Retrieve customer details
-- Familiarize yourself with the Customer table by writing a Transact-SQL query that retrieves all columns for all customers.
select *
from SalesLT.Customer;

-- 2. Retrieve customer name data
-- Create a list of all customer contact names that includes the title, first name, middle name (if any), last name, and suffix (if any) of all customers.
select sc.title, sc.FirstName, sc.MiddleName, sc.LastName, sc.Suffix
from SalesLT.Customer sc;

-- 3. Retrieve customer names and phone numbers
-- Each customer has an assigned salesperson. You must write a query to create a call sheet that lists:
--  The salesperson
--  A column named CustomerName that displays how the customer contact should be greeted (for example, “Mr Smith”)
--  The customer’s phone number.

select sc.SalesPerson, sc.Title + sc.LastName as CustomerName, sc.Phone
from SalesLT.Customer sc;

-- Challenge II: Retrieve Customer and Sales Data

-- 1. Retrieve a list of customer companies
-- You have been asked to provide a list of all customer companies in the format <Customer ID> : <Company Name> - for example, 78: Preferred Bikes.
select CAST(sc.CustomerID AS nvarchar(MAX)) + ': '  + sc.CompanyName 
from SalesLT.Customer sc
GO


-- 2. Retrieve a list of sales order revisions
-- You have been asked to provide a list of all customer companies in the format <Customer ID> : <Company Name> - for example, 78: Preferred Bikes.
select soh.SalesOrderNumber +'('+
	   CAST (soh.RevisionNumber AS nvarchar(MAX))+')', CONVERT(VARCHAR(10), soh.OrderDate, 102)
from SalesLT.SalesOrderHeader soh
GO

-- Challenge III: Retrieve Customer Contact Details

-- 1. Retrieve customer contact names with middle names if known
-- You have been asked to write a query that returns a list of customer names. 
-- The list must consist of a single field in the format <first name> <last name> (for example Keith Harris) if the middle name is unknown,
-- or <first name> <middle name> <last name> (for example Jane M. Gates) if a middle name is stored in the database.

SELECT sc.FirstName + ' '
       + ISNULL(sc.MiddleName, '') + ' '
	   + ISNULL(sc.LastName, '') 
FROM SalesLT.Customer AS sc;

-- 2. Retrieve primary contact details
-- Customers may provide adventure Works with an email address, a phone number, or both. 
-- If an email address is available, then it should be used as the primary contact method; 
-- if not, then the phone number should be used. 
-- You must write a query that returns a list of customer IDs in one column, 
-- and a second column named PrimaryContact that contains the email address if known, and otherwise the phone number.
Execute first:
UPDATE SalesLT.Customer SET EmailAddress = NULL WHERE CustomerID % 7 = 1;

SELECT sc.CustomerID,
	   ISNULL(sc.EmailAddress,sc.Phone) as PrimaryContact
FROM SalesLT.Customer AS sc;

-- 3. Retrieve shipping status
-- You have been asked to create a query that returns a list of sales order IDs and order dates with a column named ShippingStatus
-- that contains the text “Shipped” for orders with a known ship date, and “Awaiting Shipment” for orders with no ship date.

Execute first: UPDATE SalesLT.SalesOrderHeader SET ShipDate = NULL WHERE SalesOrderID > 71899;

SELECT soh.SalesOrderID,
	  CASE 
	      WHEN soh.ShipDate IS NULL THEN 'Awaiting Shipment' 
	      ELSE 'Shipped' 
	  END AS ShippingStatus
FROM SalesLT.SalesOrderHeader AS soh;







 



