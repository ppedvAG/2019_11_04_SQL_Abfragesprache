


SELECT	  OrderID
		, Customers.CustomerID
		, CompanyName
		, Freight
		, ShipCountry
FROM Orders INNER JOIN Customers
		ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'UK'


SELECT	  OrderID
		, c.CustomerID
		, CompanyName
		, Freight
		, ShipCountry
FROM Orders o INNER JOIN Customers c
		ON o.CustomerID = c.CustomerID
WHERE Country = 'UK'


-- ich DARF, muss aber nicht, bei allen angeben, aus welcher Tabelle sie kommen
-- wenn Name in mehreren Tabellen vorkommt, also nicht eindeutig ist, MUSS ich Tabelle angeben

SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry
FROM Orders o INNER JOIN Customers c
		ON o.CustomerID = c.CustomerID
WHERE c.Country = 'UK'


-- alle Kunden, die noch nichts bestellt haben?


SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Orders o RIGHT JOIN Customers c
		ON o.CustomerID = c.CustomerID 
WHERE OrderID IS NULL


-- INNER JOIN: da stehen nur die Kunden drin, die auch etwas bestellt haben
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Orders o INNER JOIN Customers c
		ON o.CustomerID = c.CustomerID
ORDER BY c.CustomerID


-- LEFT JOIN 
-- nur die, die auch etwas bestellt haben (in diesem Fall wie oben)
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Orders o LEFT JOIN Customers c
		ON o.CustomerID = c.CustomerID
ORDER BY c.CustomerID


-- RIGHT JOIN (hier: auch die, die noch nichts bestellt haben)
SELECT	  o.OrderID
		, c.CustomerID
		, c.CompanyName
		, o.Freight
		, o.ShipCountry 
FROM Orders o RIGHT JOIN Customers c
		ON o.CustomerID = c.CustomerID
ORDER BY c.CustomerID


-- alle Kunden aus den USA und aus den UK und ihre Frachtkosten
-- CustomerID, CompanyName, Country, Freight
-- geordnet nach Land

SELECT	  c.CustomerID
		, CompanyName
		, Country
		, Freight
FROM Customers c INNER JOIN Orders o
		ON c.CustomerID = o.CustomerID
WHERE Country = 'UK' OR Country = 'USA'
ORDER BY Country, c.CustomerID -- mehrere möglich; aufsteigend/absteigend unterschiedlich möglich



-- Employee Name

SELECT	  OrderID
		, LastName
		, c.CustomerID
		, CompanyName
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
			  INNER JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE e.EmployeeID IN(3, 4, 7)


-- Gib den Namen des Anbieters, der Chai Tee verkauft, aus. (CompanyName, ProductName; optional: Ansprechperson, Telefonnummer) 

SELECT	 CompanyName
		, ProductName
		, ContactName
		, Phone
FROM Suppliers s INNER JOIN Products p ON s.SupplierID = p.SupplierID
WHERE ProductName LIKE '%chai%'


SELECT *
FROM Products

-- wer hat Chai Tee gekauft?
SELECT	  CompanyName
		, o.OrderID
		, Quantity
		, ProductName
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
				 INNER JOIN Products p ON p.ProductID = od.ProductID
WHERE ProductName LIKE '%chai%'


-- Gib alle Kunden aus den USA und deren Frachtkosten aus.

SELECT	  CompanyName
		, Country
		, Freight
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE Country = 'USA'
ORDER BY CompanyName, Freight


/*
Suche alle Bestellungen, bei denen Bier verkauft wurde. Welcher Kunde? Wieviel? Welches Bier? (Der 
Produktname kann „Bier“ oder „Lager“ enthalten oder mit „Ale“ enden.)  
a. Optional: Nach Menge und Kundenname geordnet. 
b. Optional: Menge absteigend (größte zuerst), Kundenname aufsteigend (A-Z) 
*/

SELECT	  CompanyName
		, Quantity
		, ProductName
		, c.ContactName
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
				 INNER JOIN Products p ON p.ProductID = od.ProductID
WHERE ProductName LIKE '%bier%'
		OR ProductName LIKE '%lager%'
		OR ProductName LIKE '%ale'
ORDER BY Quantity DESC, CompanyName



/*
Syntax für das Joinen von mehreren Tabellen

SELECT Spalte, Spalte,...
FROM
	tab1 INNER JOIN tab2 ON tab1.spalteX = tab2.spalteX
		 INNER JOIN tab3 ON tab3.spalteY = tab2.spalteY (oder tab1.spalteY - womit verknüpft werden soll)
		 ...
		 ...
WHERE Bedingung
ORDER BY Spalte...


*/
