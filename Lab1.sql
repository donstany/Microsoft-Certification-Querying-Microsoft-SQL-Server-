-- Challenge 1: Retrieve Customer Data

-- 1. Retrieve customer details
select *
from SalesLT.Customer;

-- 2. Retrieve customer name data
select sc.title, sc.FirstName, sc.MiddleName, sc.LastName, sc.Suffix
from SalesLT.Customer sc;

--3. Retrieve customer names and phone numbers

select sc.SalesPerson, 'Hello, '+sc.Title + sc.LastName as CustomerName, sc.Phone
from SalesLT.Customer sc;

-- Challenge 2: Retrieve Customer and Sales Data
-- 1. Retrieve a list of customer companies

select CAST(sc.CustomerID AS nvarchar(MAX))+': '  + sc.CompanyName 
from SalesLT.Customer sc
GO


-- 2. Retrieve a list of sales order revisions

select soh.SalesOrderNumber +'('+
	   CAST (soh.RevisionNumber AS nvarchar(MAX))+')', CONVERT(VARCHAR(10), soh.OrderDate, 102)
from SalesLT.SalesOrderHeader soh
GO

-- Challenge 3: Retrieve Customer Contact Details










 



