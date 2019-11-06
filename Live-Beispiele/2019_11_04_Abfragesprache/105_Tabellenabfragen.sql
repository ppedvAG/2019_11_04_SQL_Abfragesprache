-- Tabellenabfragen
-- SELECT auf Tabellen
-- Immer überprüfen, welche Datenbank verwendet wird!

USE Northwind;
GO


-- Syntax:
-- SELECT Spalte1, Spalte2, Spalte3, 'Text', Funktion(), Zahl
-- FROM Tabelle


-- Wildcard * (alles auswählen)

SELECT *
FROM Customers

SELECT CompanyName
FROM Customers

SELECT	  CompanyName
		, ContactName
		, Phone
FROM Customers


SELECT	  CompanyName AS Firmenname
		, ContactName AS Kontaktperson
		, Phone AS Telefonnummer
FROM Customers

-- von Bestellungen Bestellnummer, welcher Kunde (CustomerID), welcher Angestellte (EmployeeID), welches Land ist geliefert worden?

SELECT	  OrderID
		, CustomerID
		, EmployeeID
		, ShipCountry
FROM Orders


-- Übungen
-- 1

SELECT	  CustomerID AS KundenID
		, CompanyName AS Firmenname
		, ContactName AS Kontaktperson
		, Phone AS Telefonnummer
	FROM Customers


-- 2

SELECT DATEDIFF(dd, RequiredDate, ShippedDate)
FROM Orders

-- 3

SELECT	  OrderID
		, RequiredDate
		, ShippedDate
		, DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders
ORDER BY Lieferverzögerung ASC -- ascending, in aufsteigender Reihenfolge = Defaultwert


SELECT	  OrderID
		, RequiredDate
		, ShippedDate
		, DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders
ORDER BY Lieferverzögerung DESC -- descending, in absteigender Reihenfolge (vom größten zum kleinsten Wert)


SELECT	  Freight AS Nettofrachtkosten
		, Freight*1.16 AS Bruttofrachtkosten
		, Freight*0.16 AS MwSt
FROM Orders