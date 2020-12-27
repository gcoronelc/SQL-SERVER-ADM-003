-- ================================= PRUEBAS =================================

/*

	Es NECESARIO iniciar sesión con lcallahan 

*/


-- Prueba SELECT (Errónea):

SELECT * FROM Employees 
GO


-- Prueba SELECT (Exitosa):

SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Products
SELECT * FROM Categories
SELECT * FROM Shippers
GO


-- Prueba INSERT:

INSERT INTO Shippers(CompanyName, Phone)
			VALUES('Entragas S.A.', '(503) 555-1111')
GO


-- Prueba UPDATE:

SELECT * FROM Products
GO

UPDATE Products
SET Discontinued = 1
WHERE ProductID = 2
GO

SELECT * FROM [Order Details]
GO


-- Prueba DELETE:

DELETE Shippers
WHERE CompanyName = 'Entragas S.A.'
GO
