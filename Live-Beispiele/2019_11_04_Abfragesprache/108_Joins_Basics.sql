-- Tabellen miteinander verkn�pfen: JOINS

-- INNER JOIN

-- LEFT JOIN
				-- OUTER JOINS
-- RIGHT JOIN


-- INNER JOIN (sind die, die am h�ufigsten verwendet werden)

SELECT *
FROM Orders INNER JOIN Customers
	ON Orders.CustomerID = Customers.CustomerID

-- wenn der Name in mehreren Tabellen vorkommt, muss ich dazusagen, wo er herkommt

SELECT	  OrderID
		, Customers.CustomerID -- in diesem Fall egal, es k�nnte auch Orders.CustomerID hier stehen
		, CompanyName
		, ShippedDate
FROM Orders INNER JOIN Customers
	ON Orders.CustomerID = Customers.CustomerID

-- k�rzere Schreibweise
SELECT	  OrderID
		, c.CustomerID
		, CompanyName
		, ShippedDate
FROM Orders o INNER JOIN Customers c
	ON o.CustomerID = c.CustomerID
