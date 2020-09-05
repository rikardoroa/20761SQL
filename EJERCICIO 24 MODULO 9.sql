---------------------------------------------------------------------
-- LAB 09
--
-- Exercise 4
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Write a
-- SELECT statement
-- to retrieve the top 
--10 customers by total --
--sales amount that spent
--more than $10,000 in terms of sales amount.
---Display the custid column from the Orders 
--table and a calculated column that contains 
---the total sales amount based on the qty and unitprice 
--columns from the Sales.OrderDetails table. 
--Use the alias totalsalesamount for the calculated column.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 82 - Lab Exercise 4 - Task 1 Result.txt. 
---------------------------------------------------------------------

SELECT TOP 10 SALES.Orders.custid,
SUM(SALES.OrderDetails.qty * SALES.OrderDetails.unitprice) as totalsalesamount
FROM SALES.Orders
INNER JOIN SALES.Customers
ON SALES.Orders.custid = SALES.Customers.custid
INNER JOIN SALES.OrderDetails
ON SALES.OrderDetails.orderid = SALES.Orders.orderid
GROUP BY SALES.Orders.custid
having SUM(SALES.OrderDetails.qty * SALES.OrderDetails.unitprice)>10000
order by totalsalesamount desc
---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement against the Sales.Orders and Sales.OrderDetails tables and display the empid column and a calculated column representing the total sales amount. Filter the result to group only the rows with an order year 2008.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 83 - Lab Exercise 4 - Task 2 Result.txt. 
---------------------------------------------------------------------
select sales.Orders.orderid, sales.Orders.empid as empid,
SUM(SALES.OrderDetails.qty * SALES.OrderDetails.unitprice) as totalsalesamount
FROM SALES.Orders
INNER JOIN SALES.OrderDetails
ON SALES.OrderDetails.orderid = SALES.Orders.orderid
group by sales.Orders.empid ,sales.orders.orderdate, sales.Orders.orderid
having year (sales.orders.orderdate)='2008' 

---------------------------------------------------------------------
-- Task 3
-- 
-- Copy the T-SQL statement in task 2 and modify it to apply an additional filter to retrieve only the rows that have a sales amount higher than $10,000.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 84 - Lab Exercise 4 - Task 3_1 Result.txt.
--
-- Apply an additional filter to show only employees with empid equal number 3.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 85 - Lab Exercise 4 - Task 3_2 Result.txt.
--
-- Did you apply the predicate logic in the WHERE or in the HAVING clause? Which do you think is better? Why?
---------------------------------------------------------------------

select sales.Orders.orderid, sales.Orders.empid as empid,
SUM(SALES.OrderDetails.qty * SALES.OrderDetails.unitprice) as totalsalesamount
FROM SALES.Orders
INNER JOIN SALES.OrderDetails
ON SALES.OrderDetails.orderid = SALES.Orders.orderid
group by sales.Orders.empid ,sales.orders.orderdate, sales.Orders.orderid
having year (sales.orders.orderdate)='2008' and 
SUM(SALES.OrderDetails.qty * SALES.OrderDetails.unitprice) >=10000

---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement to retrieve all customers who placed more than 25 orders and add information about the date of the last order and the total sales amount. Display the custid column from the Sales.Orders table and two calculated columns: lastorderdate based on the orderdate column and totalsalesamount based on the qty and unitprice columns in the Sales.OrderDetails table.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 86 - Lab Exercise 4 - Task 4 Result.txt.
---------------------------------------------------------------------

Select sales.Orders.custid as custid,
MAX(SALES.Orders.orderdate) AS lastorderdate,
sum(SALES.OrderDetails.qty * SALES.OrderDetails.unitprice) as totalsalesamount
FROM SALES.Orders
INNER JOIN SALES.OrderDetails
ON SALES.OrderDetails.orderid = SALES.Orders.orderid
group by SALES.Orders.custid
having count(distinct sales.orders.orderid)>25

