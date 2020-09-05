---INNER JOIN--
Select  HumanResources.Employee.BusinessEntityID, 
JobTitle,BirthDate, MaritalStatus, HireDate
from HumanResources.Employee
INNER JOIN Person.Person on
Person.person.BusinessEntityID = HumanResources.Employee.BusinessEntityID


---LEFT JOIN---

SELECT PP.BusinessEntityID, PP.FirstName, PP.LastName ,
PC.BusinessEntityID, PC.CreditCardID, PC.ModifiedDate
FROM Person.Person AS PP
LEFT JOIN SALES.PersonCreditCard AS PC
ON PC.BusinessEntityID = PP.BusinessEntityID


