-- Stringfunktionen

SELECT 'Test'

SELECT 'Test                '

SELECT RTRIM('Test                ') -- Right-Trim  (oder LTRIM left-trim)

SELECT LEN('Test') -- Length (wieviele Zeichen hat das?)

SELECT LEN('Test                ') -- zählt Leerzeichen nicht mit!

SELECT DATALENGTH('Test                ') -- zählt Leerzeichen mit

SELECT DATALENGTH(RTRIM('Test                ')) -- viele Zeichen, nachdem ich Leerzeichen weggeschnitten habe?

-- ltrim: Leerzeichen links weg, rtrim: Leerzeichen rechts weg

SELECT LTRIM('    Test')

-- links und rechts Leerzeichen weg: TRIM()

SELECT TRIM('     Text     ')

SELECT DATALENGTH('     Text     ')
SELECT DATALENGTH(TRIM('     Text     '))


SELECT REVERSE('REITTIER')
SELECT REVERSE ('Trug Tim eine so helle Hose nie mit Gurt?')



-- Zeichen "ausschneiden":

-- schneidet die ersten vier Zeichen aus (Test)
SELECT LEFT('Testtext', 4)

--schneidet die letzten vier Zeichen aus (text)
SELECT RIGHT('Testtext', 4)

-- Textausschnitt erstellen mit Substring
SELECT SUBSTRING('Testtext', 4, 2) -- ab welcher Stelle (4) möchte man wieviele Zeichen (2) ausschneiden
-- Ergebnis: tt


-- Text einfügen mit STUFF
SELECT STUFF('Testtext', 5, 0, '_Hallo_')
-- wo soll etwas eingefügt werden?
-- beginnend bei welcher Stelle? (5)
-- wieviel soll weggelöscht werden (0)
-- was soll eingefügt werden


-- Übungen:
-- 1
-- Möglichkeit 1
SELECT LEFT('1234567890', 7)+ 'xxx' -- geht nur für Telefonnummern mit gleicher Länge!

-- Möglichkeit 2
SELECT LEFT('1234567890', DATALENGTH('1234567890')-3)+ 'xxx'

-- Möglichkeit 3
SELECT STUFF('+49 86779889123', 13, 3, 'xxx') -- geht nur für Telefonnummern mit gleicher Länge!

-- Möglichkeit 4
SELECT REVERSE(STUFF(REVERSE('+49 86779889123'), 1, 3, 'xxx'))



-- 2
-- Leerzeichen weg und Länge ausgeben

SELECT TRIM('     Test     ')

SELECT	  DATALENGTH('     Test     ') AS Vorher
		, DATALENGTH(TRIM('     Test     ')) AS Nachher


-- Strings zusammenfügen mit CONCAT()

SELECT CONCAT('abc', 'def', 'ghi', 'jkl', 'mno', 'pqr', 'stu', 'vwx', 'yz')

SELECT CONCAT('Ich weiß, ', 'dass ich', ' nichts weiß.') AS Zitat

SELECT CONCAT('James', ' ', 'Bond') AS FullName


--SELECT CONCAT(FirstName, ' ', LastName) AS FullName
--FROM Tabelle


SELECT CONCAT(TRIM('James'), ' ', TRIM('Bond')) AS FullName


-- SELECT CONCAT(TRIM(FirstName), ' ', TRIM(LastName)) AS FullName
-- FROM Tabellenname


-- Wilham Shakesbeer korrigieren:
SELECT	  CONCAT(
		      SUBSTRING((STUFF('Wilham Shakesbeer', 4, 1, 'li')), 1, 14)
		    , SUBSTRING((STUFF('Wilham Shakesbeer', 14, 4, 'peare')), 14, 5)
		  ) AS [richtiger Name]
