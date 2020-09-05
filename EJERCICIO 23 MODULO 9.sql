---------------------------------------------------------------------
-- LAB 09
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- A junior 
--analyst prepared a T-SQL statement to 
--retrieve the number of orders and the 
--number of customers for each order year.
--Observe the provided T-SQL statement and execute it:
--
-- Observe the result and notice that 
--the number of orders is the same as the number of customers. Why?
--
-- Correct the T-SQL statement 
---to show the correct number of customers that placed an order
--for each year.

-- Execute the written statement and compare the results that you got with the recommended result shown in the file 72 - Lab Exercise 3 - Task 1 Result.txt. 
---------------------------------------------------------------------

SELECT
	YEAR(sales.orders.orderdate) AS orderyear, 
	COUNT(sales.orders.orderid) AS nooforders, 
	count(distinct sales.Customers.custid)
FROM Sales.Orders left JOIN sales.Customers on
sales.Orders.custid = sales.Customers.custid
GROUP BY YEAR(orderdate)
order by [orderyear]


---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement-
-- to retrieve the number of customers--
--based on the first letter of the values
--in the contactname column from the Sales.Customers table. 


--Add an additional column to show 
--the total number of orders placed by each group of customers. 

--Use the aliases firstletter, noofcustomers and nooforders.
--Order the result by the firstletter column.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 73 - Lab Exercise 3 - Task 2 Result.txt.
---------------------------------------------------------------------

Select LEFT (sales.Customers.contactname,1) as firstletter,
count(  DISTINCT sales.Customers.custid) as noofcustomers,
count ( DISTINCT sales.orders.orderid) as nooforders
from sales.Orders
INNER JOIN sales.OrderDetails on
sales.OrderDetails.orderid = sales.Orders.orderid
INNER JOIN  SALES.Customers ON
SALES.Orders.custid = SALES.Customers.custid
GROUP BY  LEFT (sales.Customers.contactname,1)

---------------------------------------------------------------------
-- Task 3
-- 
-- Copy the T-SQL statement in exercise 1, task 4, 
--and modify to include the following 
--information about for each product 
--category: total sales amount, number of orders, 
--and average sales amount per order. Use the aliases
-- totalsalesamount, nooforders, and avgsalesamountperorder, respectively.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 74 - Lab Exercise 3 - Task 3 Result.txt. 
---------------------------------------------------------------------
Select 
production.Categories.categoryid,
production.Categories.categoryname,
sum (Sales.OrderDetails.qty * sales.OrderDetails.unitprice) as totalsalesamount,
count ( DISTINCT sales.Orders.orderid) as nooforders,
sum(Sales.OrderDetails.qty * sales.OrderDetails.unitprice)  
/ count (distinct sales.Orders.orderid) avgsalesamountperorders
from sales.Orders
INNER JOIN sales.OrderDetails on
sales.OrderDetails.orderid = sales.Orders.orderid
INNER JOIN  Production.Products ON
SALES.OrderDetails.productid = Production.Products.productid
inner join Production.Categories on
Production.Products.categoryid = Production.Categories.categoryid
WHERE orderdate >= '20080101' AND orderdate < '20090101'
GROUP BY  production.Categories.categoryname,production.Categories.categoryid
order by production.Categories.categoryname asc

