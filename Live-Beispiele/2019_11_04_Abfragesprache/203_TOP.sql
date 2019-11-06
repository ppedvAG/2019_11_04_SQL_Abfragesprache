-- TOP Abfragen
-- ORDER BY zwingend notwendig!



SELECT *
FROM Customers


SELECT TOP 1 *
FROM Customers
ORDER BY CustomerID


-- SYNTAX:
-- SELECT TOP # [percent] * | [Spaltenname, Spaltenname,...] FROM Tabelle [WHERE Bedingung] ORDER BY Spalte


SELECT TOP 10 PERCENT *
FROM Customers
ORDER BY CustomerID


SELECT TOP 5 PERCENT 
		  CustomerID
		  , CompanyName
		  , ContactName
		  , Phone
FROM Customers
ORDER BY City


SELECT TOP 10 PERCENT *
FROM Orders
ORDER BY Freight


SELECT TOP 7 *
FROM Customers
ORDER BY CustomerID

SELECT TOP 3 *
FROM Customers
ORDER BY CustomerID DESC


SELECT TOP 1 PERCENT WITH TIES *
FROM [Order Details]
ORDER BY UnitPrice DESC


-- Übungen
-- Gib das teuerste Produkt aus. 

SELECT TOP 1 *
FROM Products
ORDER BY UnitPrice DESC

-- überprüfen:

SELECT *
FROM Products
ORDER BY UnitPrice DESC

/*
Suche die Top 10% der Produkte mit den größten Einkaufsmengen (ProductName, Quantity). 
	a. Optional: Einschließlich Produkte mit der gleichen Einkaufsmenge wie das letzte in der ursprünglichen Ausgabe. 
*/


SELECT TOP 10 PERCENT WITH TIES ProductName, Quantity
FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
ORDER BY Quantity DESC


-- Gib die drei Mitarbeiter, die als erste eingestellt wurden, aus (die schon am längsten beim Unternehmen sind). 

SELECT TOP 3 *
FROM Employees
ORDER BY HireDate -- ASC (kann ich hinschreiben, kann ich aber auch weglassen, weil ASC = default)


-- 13 Kunden mit den geringsten Frachtkosten bekommen Bonus (Annahme)
-- wer sind die Glücklichen?

SELECT TOP 13 WITH TIES
		  OrderID
		, c.CustomerID
		, Freight
		, CompanyName
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY Freight