-- Wildcards nur beim LIKE
-- außer * beim SELECT (alle Spalten)

-- % steht für beliebig viele unbekannte Zeichen (0 - ?)


SELECT *
FROM Customers
WHERE CustomerID LIKE 'ALF%'

SELECT *
FROM Customers
WHERE CustomerID LIKE '%MI'

SELECT *
FROM Customers
WHERE CompanyName LIKE '%kist%'


-- alle, deren Firmenname mit D beginnt
SELECT *
FROM Customers
WHERE CompanyName LIKE 'D%'

-- alle, die mit D enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '%D'

-- alle, die ein D enthalten
SELECT *
FROM Customers
WHERE CompanyName LIKE '%D%'


-- Übung 10
SELECT *
FROM Products
WHERE SupplierID IN(5, 10, 15)
	AND UnitsInStock > 10
	AND UnitPrice < 100
ORDER BY UnitPrice DESC


-- alle, die ein d im Namen haben und mit e enden
SELECT *
FROM Customers
WHERE CompanyName LIKE('%d%e')

-- alle, die mit a beginnen, irgendwo ein f haben und aus Deutschland sind
SELECT *
FROM Customers
WHERE CompanyName LIKE('a%f%')
	AND Country = 'Germany'

-- Bestellungen: alle von Angestellten 1, 3, 5
-- von Kunde, die mit r beginnen
-- und deren Frachtkosten größer als 100 sind

SELECT *
FROM Orders
WHERE EmployeeID IN(1,3,5)
	AND CustomerID LIKE 'r%'
	AND Freight > 100

-- zählen! COUNT()
-- wieviele Kunden gibts?

SELECT COUNT(CustomerID) AS Kundenanzahl
FROM Customers

-- Übung 11: Wieviele Produkte bietet Anbieter Nr. 17 an?
SELECT COUNT(ProductID)
FROM [Products]
WHERE SupplierID = 17

-- SELECT * FROM Products ORDER BY SupplierID

-- Eckige Klammern z.B. bei [richtiger Name] wo Abstand dazwischen ist
--SELECT *
--FROM [Order Details]



-- Wertebereiche []
-- steht für genau 1 Zeichen in einem bestimmten Bereich
-- funktioniert auch mit Sonderzeichen
-- funktioniert für von-bis [a-c]


SELECT *
FROM Customers
WHERE CompanyName LIKE '%[%]%' -- irgendwo da drin muss ein %-Zeichen vorkommen


-- alle, die mit a, b oder c beginnen
SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%'

-- alle, die mit a oder c beginnen
-- entweder so:
SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%'
	OR CompanyName LIKE 'c%'
-- oder so:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%'


-- alle mit Hochkomma im Namen

SELECT *
FROM Customers
WHERE CompanyName LIKE '%''%'

-- Andere Schreibweise für Suche nach Sonderzeichen: ESCAPE

SELECT *
FROM Customers
WHERE CompanyName LIKE '%!%%' ESCAPE '!'  -- sucht nach % irgendwo im Namen

-- alle CompanyNames, die mit a oder c beginnen und mit einem m oder e enden

SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%[me]'


-- Übung 12
-- soll mit d-l beginnen, und mit a-d oder m-o enden

SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%' AND (ProductName LIKE '%[a-d]' OR ProductName LIKE '%[m-o]')


-- Oder:

SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%[a-d|m-o]' -- | steht für oder innerhalb der eckigen Klammern



-- unsere CustomerID besteht aus 5 Buchstaben
-- angenommen, es ist Fehler passiert
-- CMXY5... wie finde ich die falschen Einträge?


-- wie würde ich die richtigen Einträge finden?
SELECT *
FROM Customers
WHERE CustomerID LIKE '[a-z][a-z][a-z][a-z][a-z]'


-- wie finde ich die falschen Einträge?
SELECT *
FROM Customers
WHERE CustomerID NOT LIKE '[a-z][a-z][a-z][a-z][a-z]'

/*
SELECT *
FROM Tabelle
WHERE Pin NOT LIKE '[0-9][0-9][0-9][0-9]'
*/


-- nicht!
SELECT *
FROM Customers
WHERE CompanyName LIKE '[^a-c]%' -- ^steht für NICHT, also alle, die NICHT mit a, b oder c beginnen


SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-47[0-9]9'
-- oder:
SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-47_9' -- _ steht für genau 1 unbekanntes Zeichen


/*
	* beim SELECT = alle
	% beim LIKE - beliebig viele (0, 1, 2, ...)
	_ beim LIKE - genau 1 unbekanntes Zeichen
	[...] beim LIKE - 1 unbekanntes Zeichen aus einem bestimmten Wertebereich

*/


-- alle Kunden, die mit d-f beginnen, der letzte Buchstabe ist ein L und der drittletzte ein d

SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%d_l'


/*
	mögliche Ergebnisse z.B.

	ddxl
	edel
	Ernst Handel (in Kundendatenbank)
	fxxxxxxxxxdxl

*/




