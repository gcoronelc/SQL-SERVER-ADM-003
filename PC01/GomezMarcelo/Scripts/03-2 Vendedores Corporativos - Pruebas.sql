-- ================================= PRUEBAS =================================

/*

	Es NECESARIO iniciar sesión con jleverling o mpeacock 

*/


-- Prueba SELECT (Errónea):

SELECT * FROM Employees 
GO


-- Prueba SELECT (Exitosa):

SELECT * FROM Orders
GO


-- Prueba INSERT:

INSERT INTO Orders(CustomerID, EmployeeID, ShipVia)
			VALUES('VINET', 2, 3)
GO


-- Prueba UPDATE:

SELECT * FROM [Order Details]
GO

UPDATE [Order Details]
SET Quantity = 50
WHERE OrderID = 10248 AND ProductID = 11
GO

SELECT * FROM [Order Details]
GO


-- Prueba DELETE:

DELETE Orders
WHERE CustomerID = 'VINET' AND EmployeeID = 2 AND ShipVia = 3
GO


