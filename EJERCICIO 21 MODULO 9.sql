---------------------------------------------------------------------
-- LAB 09
--
-- Exercise 1
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement that will 
---return groups of customers 
--that made a purchase. 

--The SELECT clause should include the 
--custid column from the Sales.Orders table
 
--and the contactname column from the Sales.Customers
-- table. 

--Group by both columns and filter only the 
--orders from the sales employee whose empid equals five.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt.
---------------------------------------------------------------------

Select  sales.Orders.custid, sales.Customers.contactname 
from sales.Orders
 inner join  sales.Customers on
 sales.Customers.custid = sales.Orders.custid
 where sales.orders.empid = 5
 group by sales.Orders.custid, sales.Customers.contactname

---------------------------------------------------------------------
-- Task 3
-- 
-- Copy the T-SQL statement in task 2 
--and modify it to include the city 
--column from the Sales.Customers table in the SELECT clause. 
--
-- Execute the query. You will get an error.
-- What is the error message? Why?
--
-- Correct the query so that it will execute properly.
--
-- Execute the query and compare the results that you got with the desired results shown in the file 53 - Lab Exercise 1 - Task 2 Result.txt.
---------------------------------------------------------------------

-- error

Select  sales.Orders.custid, sales.Customers.contactname ,
sales.Customers.city
from sales.Orders
 inner join  sales.Customers on
 sales.Customers.custid = sales.Orders.custid
 where sales.orders.empid = 5
 group by sales.Orders.custid, sales.Customers.contactname,
 sales.Customers.city

---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement that will return groups of rows
-- based on the custid column and a 
--calculated column orderyear
--- representing the order 
--year based on the orderdate 
--column from the Sales.Orders table. 


--Filter the results to include only the orders 
--from the sales employee whose empid equal five.

-- Execute the written statement and compare the results that you got with the desired results shown in the file 54 - Lab Exercise 1 - Task 3 Result.txt.
---------------------------------------------------------------------

select  sales.orders.custid, year(sales.orders.orderdate) as orderyear
 from Sales.Orders
 where sales.Orders.empid = 5 
 group by sales.orders.custid,  year(sales.orders.orderdate)

---------------------------------------------------------------------
-- Task 5
-- 
-- Write a SELECT statement
--- to retrieve groups of rows 
--based on the categoryname
--- column in the Production.Categories table.
-- Filter the results to include only the product 
---categories that were ordered in the year 2008.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 55 - Lab Exercise 1 - Task 4 Result.txt. 
---------------------------------------------------------------------
Select Production.Categories.categoryname , year(sales.orders.orderdate)
from Production.Categories
inner join Production.Products on 
production.Products.categoryid =  Production.Categories.categoryid
inner join sales.OrderDetails on
sales.OrderDetails.productid = Production.Products.productid
inner join sales.Orders on
sales.OrderDetails.orderid = sales.Orders.orderid
where  year(sales.orders.orderdate)=2008
group by Production.Categories.categoryname , year(sales.orders.orderdate)