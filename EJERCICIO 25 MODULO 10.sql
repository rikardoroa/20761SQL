---------------------------------------------------------------------
-- LAB 10
--
-- Exercise 1
---------------------------------------------------------------------

---------------------------------------------------------------------
-- LAB 10
--
-- Exercise 1
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Write a SELECT statement to return the maximum order data from the table Sales.Orders.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt.
---------------------------------------------------------------------
     SELECT SALES.ORDERS.orderdate FROM SALES.Orders
     WHERE SALES.ORDERS.orderdate = (
	 SELECT MAX(SALES.Orders.orderdate) 
	 from sales.orders)
	 group by SALES.Orders.orderdate

	  ----solucion 2---

	  select  max(SALES.ORDERS.orderdate) FROM SALES.Orders
---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement to return the orderid, orderdate, empid, and custid columns from the Sales.Orders table. Filter the results to include only orders where the date order equals the last order date. (Hint: Use the query in task 1 as a self-contained subquery.)
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 53 - Lab Exercise 1 - Task 2 Result.txt.
---------------------------------------------------------------------


Select  orderid, orderdate, empid, custid
from sales.orders
where orderdate = (
	 SELECT MAX(SALES.Orders.orderdate) 
	 from sales.orders)



---------------------------------------------------------------------
-- Task 3
-- 
-- The IT department has written a T-SQL statement that retrieves the orders for all customers whose contact name starts with a letter I: 
--
-- Execute the query and observe the result.
--
-- Modify the query to filter customers whose contact name starts with a letter B.
--
-- Execute the query. What happened? What is the error message? Why did the query fail?
--
-- Apply the needed changes to the T-SQL statement so that it will run without an error.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 54 - Lab Exercise 1 - Task 3 Result.txt.
---------------------------------------------------------------------

SELECT
orderid, orderdate, empid, custid
FROM Sales.Orders
WHERE custid
	in
	(
		SELECT custid
		FROM Sales.Customers
		WHERE contactname LIKE N'[b]%'
	);


---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement to retrieve the orderid column from the Sales.Orders table and the following calculated columns: 
--  totalsalesamount (based on the qty and unitprice columns in the Sales.OrderDetails table) 
--  salespctoftotal (percentage of the total sales amount for each order divided by the total sales amount for all orders in specific period) 
--
-- Filter the results to include only orders placed in May 2008.
--
-- Execute the written statement and compare the results that you got with the desired results shown in the file 55 - Lab Exercise 1 - Task 4 Result.txt. 
---------------------------------------------------------------------
Declare @div as int;
set @div =(SELECT Sum(Sales.OrderDetails.qty * sales.OrderDetails.unitprice) from sales.OrderDetails
            inner join sales.Orders
             on sales.OrderDetails.orderid = sales.Orders.orderid
			 where sales.Orders.orderdate >='20080501' and sales.Orders.orderdate <='20080530')
SELECT
Sales.Orders.orderid,
Sum(Sales.OrderDetails.qty * sales.OrderDetails.unitprice) as totalsalesamount,
Sum(Sales.OrderDetails.qty * sales.OrderDetails.unitprice) / @div * 100 as salespctoftotal
FROM Sales.Orders 
inner join sales.OrderDetails
on sales.OrderDetails.orderid = sales.Orders.orderid
where sales.Orders.orderdate in
(
Select s.orderdate
from sales.Orders s
where s.orderdate >='20080501' and s.orderdate <='20080530'
)
group by sales.orders.orderid