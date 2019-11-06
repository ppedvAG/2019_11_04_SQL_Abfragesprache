-- Datenbank erstellen
-- CREATE DATABASE DBName



-- Bsp.:


CREATE DATABASE MyFirstDB2

-- NEEEEEEEEEEIIIIIIIIIIIIIIIIIIIIIIINNNNN!!!!!
DROP DATABASE MyFirstDB2
-- ganze Datenbank ist unwiederruflich WEG!


-- ev f�r �bungsdatenbank, sonst nicht!
DROP DATABASE MyFirstDB
CREATE DATABASE MyFirstDB


-- Tabelle erstellen mit CREATE TABLE Name

-- Bsp.:

CREATE TABLE Produkte
	(
		ProduktID int identity,
		Bezeichnung varchar(50),
		Preis money
	
	)

-- DROP TABLE Produkte


-- Tabelle ver�ndern ALTER
-- hinzuf�gen ADD


-- ALTER TABLE Name

-- Bsp.:

ALTER TABLE Produkte
ADD CompanyName varchar(30)


-- wegl�schen mit DROP (wieder ganze Spalte weg!)

ALTER TABLE Produkte
DROP COLUMN CompanyName
 


SELECT * FROM Produkte


-- manuell Datens�tze einf�gen: INSERT INTO

-- INSERT INTO Produkte (Preis, Bezeichnung)
-- VALUES (1.99, 'Spaghetti')
-- wenn ich beim insert into (Preis, Bezeichnung) angebe, f�ge ich in den VALUES in dieser Reihenfolge ein
-- sicherheitshalber immer dazuschreiben
-- weil sonst in Reihenfolge wie in Tabelle (Fehlergefahr!)


INSERT INTO Produkte (Bezeichnung, Preis)
VALUES ('Spaghetti', 1.99)

INSERT INTO Produkte (Bezeichnung, Preis)
VALUES ('Parmesan', 6.50)


SELECT * FROM Produkte

SELECT Bezeichnung FROM Produkte


-- k�rzere Schreibweise f�r mehrere Inserts:

INSERT INTO Produkte (Bezeichnung, Preis)
VALUES	  ('Spaghetti Sauce', 2.50)
		, ('Tiramisu', 5.50)
		, ('Tartufo', 5.20)



-- Tabelle Kunden
-- KundenID, VName, NName, GebDat, TelNr
CREATE TABLE Kunden
	(
		  KundenID int identity
		, Vorname varchar(50)
		, Nachname varchar(50)
		, GebDat date
		, TelNr varchar(30)
	)

INSERT INTO Kunden (Vorname, Nachname, GebDat, TelNr)
VALUES
	  ('James', 'Bond', '1940-08-07', '1234567890')
	, ('Bruce', 'Wayne', '1968-10-02', '0987654321')
	, ('Peter', 'Parker', '1974-03-19', '9861234509')

SELECT * FROM Kunden


-- Werte ver�ndern mit UPDATE

UPDATE Produkte
SET Preis = 3.20

SELECT * FROM Produkte
-- hat ALLE Preise ver�ndert!

-- bei UPDATE unbedingt mit WHERE eingrenzen, welche Werte ver�ndert werden sollen!

UPDATE Produkte
SET Preis = 6.50
WHERE ProduktID = 2


-- rausl�schen mit DELETE
DELETE FROM Produkte
WHERE ProduktID = 6

SELECT * FROM Produkte

-- etwas an der Tabelle (Spalte) �ndern

ALTER TABLE Produkte
ALTER COLUMN Bezeichnung varchar(55)



sp_help 'Produkte'




-- Keys

CREATE TABLE Testtable(
	ID int NOT NULL PRIMARY KEY,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50)
)


-- wenn PK �ber mehrere Spalten geht wie z.B. bei den Order Details (OrderID und Product ID)
CREATE TABLE Testtable2(
	ID int NOT NULL,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50),
	CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
)

ALTER TABLE Orders
ADD
CONSTRAINT FK_CustomersOrders FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
