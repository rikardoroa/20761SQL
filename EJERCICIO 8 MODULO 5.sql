---------------------------------------------------------------------
-- LAB 05
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- 
-- Write a SELECT statement against
-- the Sales.Orders table and retrieve -
---the orderid and orderdate columns. 
-- Retrieve the 20 most recent orders, ordered by orderdate.
--
-- Execute the written statement and compare 
--the results that you got with the recommended --
--result shown in the file 72 - Lab Exercise 3 - Task 1 Result.txt.
---------------------------------------------------------------------
select top 20 orderid, orderdate from sales.orders
order by orderdate desc


---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement to retrieve 
--the same result as in task 1, but use the OFFSET-FETCH clause.
--
-- Execute the written statement and compare the results that you got with the results from task 1.
---------------------------------------------------------------------

select orderid, orderdate from sales.orders
order by orderdate desc
offset  0  rows fetch first 20 rows only

---------------------------------------------------------------------
-- Task 3
-- 
-- Write a SELECT statement to retrieve
-- the productname and unitprice columns 
--from the Production.Products table.
--
-- Execute the T-SQL statement and notice 
--the number of the rows returned.
-- 
-- Modify the SELECT statement to include only the 
--top 10 percent of products based on unitprice ordering.
--
-- Execute the written statement and compare the results that you got with the recommended result shown in the file 73 - Lab Exercise 3 - Task 2 Result.txt. Notice the number of rows returned.
--
-- Is it possible to implement this task with the OFFSET-FETCH clause?
---------------------------------------------------------------------

select top 10 percent productname, unitprice 
from Production.Products
order by unitprice desc

go
-----------CON FECTH----
select productname, unitprice * ( 100 / 100)
from Production.Products
order by unitprice desc
OFFSET 0 ROWS FETCH FIRST 8 ROWS ONLY

