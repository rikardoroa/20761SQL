---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Write a SELECT statement to
 --retrieve distinct values 
 ---for the custid column from 
 ---the Sales.Orders table. 
 --Filter the results to include 
 ---only orders placed in February 2008.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 62 - Lab Exercise 2 - Task 1 Result.txt.
---------------------------------------------------------------------

SELECT DISTINCT CUSTID FROM SALES.Orders
WHERE SALES.ORDERS.orderdate >= '2008-02-01'
 AND SALES.ORDERS.orderdate <'2008-03-01'
---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement with these columns:
--  Current date and time
--  First date of the current month
--  Last date of the current month
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 63 - Lab Exercise 2 - Task 2 Result.txt. The results will differ because they rely on the current date.
---------------------------------------------------------------------

SELECT 
CURRENT_TIMESTAMP AS CURRENTDATE,
DATEADD ( DAY ,1 ,EOMONTH (CURRENT_TIMESTAMP, -1))  AS FIRSTDATE,
EOMONTH (CURRENT_TIMESTAMP)  AS LASTDATE



---------------------------------------------------------------------
-- Task 3
-- 
-- Write a SELECT statement 

--against the Sales.Orders
--- table and retrieve the orderid, custid, and orderdate columns.
--- Filter the results to include--
-- only orders placed in the last five days of the order month.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 64 - Lab Exercise 2 - Task 3 Result.txt.
---------------------------------------------------------------------




SELECT orderid, CUSTID, orderdate FROM SALES.Orders
where datediff (day,orderdate,EOMONTH(orderdate))<5


---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement against 
--the Sales.Orders and Sales.OrderDetails 
--tables and retrieve all the
-- distinct values for the 
--productid column. Filter--
 --the results to include only 
 --orders placed in the first 10 weeks of the year 2007.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 65 - Lab Exercise 2 - Task 4 Result.txt.
---------------------------------------------------------------------
Select distinct productid from sales.Orders
inner join sales.OrderDetails on
sales.Orders.orderid = sales.OrderDetails.orderid
where DATepart(week, sales.orders.orderdate)<= 10
and  datepart (year, sales.orders.orderdate)='2007'


