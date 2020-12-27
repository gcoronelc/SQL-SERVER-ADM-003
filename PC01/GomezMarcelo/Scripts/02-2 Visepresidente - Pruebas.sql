-- ================================= PRUEBAS =================================

/*

	Es NECESARIO iniciar sesión con afuller 

*/

-- Prueba SELECT (Errónea):

SELECT * FROM Customers 
GO


-- Pruebas SELECT (Exitosas):

SELECT * FROM Employees
SELECT * FROM Orders 
SELECT * FROM [Order Details]
GO


-- Prueba INSERT:

INSERT INTO Employees(LastName, FirstName)
			VALUES('Roncagliolo', 'Santiago')
GO


-- Prueba UPDATE:

SELECT * FROM Employees
GO

UPDATE Employees
SET City = 'New York'
WHERE EmployeeID = 2
GO

SELECT * FROM Employees
GO


-- Prueba DELETE:

DELETE Employees
WHERE LastName = 'Roncagliolo' AND FirstName = 'Santiago'
GO
