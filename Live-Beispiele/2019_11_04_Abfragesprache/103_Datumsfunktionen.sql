-- Datumsfunktionen

SELECT GETDATE() -- auf Millisekunden genau

SELECT DATEADD(hh, 10, '2019-11-04') -- wenn nicht genauer angegeben, wird von 0:00 Uhr ausgegangen
									 -- '04.11.2019' , '4.11.2019'

SELECT DATEADD(hh, 10, '4.11.2019')  -- Vorsicht mit Datumsformat!! --> er glaubt jetzt, es ist April!

SELECT DATEADD(hh, 10, '2019-11-04 09:57')
SELECT DATEADD(hh, 10, GETDATE()) -- aktuelles Datum inklusive Uhrzeit (inklusive Millisekunden)

SELECT DATEADD(dd, 38, GETDATE())

SELECT DATEADD(dd, -38, GETDATE())

-- Differenz zwischen zwei Daten
SELECT DATEDIFF(dd, '2019-11-04', '2019-12-24')
SELECT DATEDIFF(dd, '2019-12-24', '2019-11-04') -- mit negativem Vorzeichen, gleicher Wert

SELECT DATEDIFF(dd, GETDATE(), '2019-12-24')

SELECT DATEPART(dd, '2019-11-04')
SELECT DATEPART(mm, '2019-11-04')

-- In welchem Quartal liegt...?
SELECT DATEPART(qq, '2019-12-24')

SELECT DATENAME(dd, '2019-11-04') -- dd ist hier falsch!
SELECT DATENAME(dw, '2019-11-04') -- dw für day of the week (Wochentag)
SELECT DATENAME(month, '2019-11-04')

-- bei Datename machen eigentlich nur zwei Sinn: dw (Wochentag) und month (Monatsname)


-- Übungen
--1
SELECT DATEADD(dd, 38, GETDATE())

--3
SELECT DATEDIFF(yy, getdate(), '1977') -- Ergebnis: -42
SELECT DATEDIFF(yy, '1977', getdate()) -- Ergebnis: 42


-- gleiches Ergebnis wie mit DATEPART dd, MM, yy
SELECT DAY('2019-11-04')
SELECT MONTH('2019-11-04')
SELECT YEAR('2019-11-04')

-- SELECT FORMAT(was?, wie?)
SELECT FORMAT(GETDATE(), 'dd.MM.yyyy') -- AUSNAHMEFALL!!!! MM = Monat, mm = Minute!!

SELECT FORMAT(GETDATE(), 'dd.MM.yyyy') AS Datum

-- mit Culture 
SELECT FORMAT(GETDATE(), 'd', 'de-de')
SELECT FORMAT(GETDATE(), 'd', 'en-US')
SELECT FORMAT(GETDATE(), 'd', 'en-GB')



USE Northwind

SELECT YEAR(HireDate) AS Einstellungsjahr
FROM Employees

SELECT HireDate
FROM Employees










