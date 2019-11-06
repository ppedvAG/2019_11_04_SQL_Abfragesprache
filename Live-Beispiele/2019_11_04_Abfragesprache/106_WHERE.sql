-- WHERE clause, WHERE-Klausel, WHERE-Bedingung
-- wenn man nur bestimmte Ergebnisse ausgeben möchte


/*
Syntax:

SELECT Spalten,...
FROM Tabelle
WHERE Bedingung
ORDER BY Spalte ASC|DESC


*/

/*

WHERE Bedingung =, <, >, <=, >=
				!=, <>  -- darf NICHT diesem Wert entsprechen
				LIKE, IN, BETWEEN


		-- nicht so gut für Performance:
				NOT IN
				NOT LIKE
				NOT BETWEEN

		AND, OR


*/


-- alle, die in Deutschland wohnen
SELECT *
FROM Customers
WHERE Country = 'Germany'


-- alle, die in Deutschland in Berlin wohnen
SELECT *
FROM Customers
WHERE Country = 'Germany'
	AND City = 'Berlin'

-- alle in Frankreich
SELECT *
FROM Customers
WHERE Country = 'France'

-- Buenos Aires, Argentinien
SELECT *
FROM Customers
WHERE Country = 'Argentina'
	AND City = 'Buenos Aires'

-- deutsche und österreichische Kunden
SELECT *
FROM Customers
WHERE Country = 'Germany'
	OR
	  Country = 'Austria'

-- alle Produkte, wo mehr als 100 vorhanden sind
SELECT *
FROM Products
WHERE UnitsInStock > 100


SELECT Freight
FROM Orders
WHERE Freight > 76


SELECT Freight
FROM Orders
WHERE Freight != 148.33  -- alle, die NICHT diesen Wert haben


SELECT Freight
FROM Orders
WHERE Freight > 76
ORDER BY Freight DESC -- (vom größten zum kleinsten Wert)


SELECT Freight
FROM Orders
WHERE Freight >= 100 AND Freight <= 200

-- ODER SO:
SELECT Freight
FROM Orders
WHERE Freight BETWEEN 100 AND 200  -- wie oben, 100 und 200 inklusive

-- alle Bestellungen, die vom Employee 3, 4 und 7 bearbeitet worden sind
SELECT *
FROM Orders
WHERE EmployeeID = 3
		OR EmployeeID = 4
		OR EmployeeID = 7

-- ODER SO:
SELECT *
FROM Orders
WHERE EmployeeID IN(3, 4, 7)

-- Produkte zwischen ID 10 und 15
SELECT *
FROM Products
WHERE ProductID BETWEEN 10 AND 15

-- Anbieter ID 2, 7, 15
SELECT *
FROM Products
WHERE SupplierID IN(2, 7, 15)



	




