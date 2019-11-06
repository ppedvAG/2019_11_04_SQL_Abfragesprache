-- Übung

-- Employees:
-- EmployeeID, LastName, EmployeeID vom Chef (ReportsTo), Lastname vom Chef


-- SELECT * FROM Employees

SELECT	  e1.EmployeeID
		, e1.LastName AS Employee
		, e1.ReportsTo
		, e2.LastName AS Chef
		, e2.FirstName
		, e2.HomePhone
		, e2.Title
FROM Employees e1 LEFT JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
