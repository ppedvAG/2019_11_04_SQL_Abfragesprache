-- Variablen

-- lokale Variablen
	-- @var1
	-- Lebenszeit: nur solange der Batch l‰uft
	-- Zugriff nur in der Session, wo sie erstellt wurde


-- globale Variablen
	-- @@var1
	-- Lebenszeit: nur solange der Batch l‰uft
	-- Zugriff auch von auﬂerhalb der Session

-- Variable deklarieren
-- welchen Datentyp soll diese Variable bekommen

-- Syntax:
-- DECLARE @varname AS Datentyp

-- Bsp.: 
DECLARE @var1 AS int


-- Wert zuweisen

SET @var1 = 100

SELECT @var1 


DECLARE @fracht AS money = 50

SELECT *
FROM Orders
WHERE Freight < @fracht


