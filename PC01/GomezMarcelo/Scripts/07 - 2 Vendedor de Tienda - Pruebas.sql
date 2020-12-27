-- ================================= PRUEBAS =================================

/*

	Es NECESARIO iniciar sesión con uperez, gsmith, pvannels o pmartinez 

*/


-- Prueba SELECT (Errónea):

SELECT * FROM Products 
GO


-- Prueba SELECT (Exitosa):

SELECT * FROM Orders
SELECT * FROM [Order Details]
GO

sp_help orders
go

-- Prueba INSERT:

INSERT INTO Orders(CustomerID, EmployeeID, ShipVia)
			VALUES('CHOPS', 3, 1)
GO


-- Prueba UPDATE:

SELECT * FROM [Order Details]
GO

UPDATE [Order Details]
SET Quantity = 30
WHERE OrderID = 10248 AND ProductID = 11
GO

SELECT * FROM [Order Details]
GO


-- Prueba DELETE:

DELETE Orders
WHERE CustomerID = 'CHOPS' AND EmployeeID = 3 AND ShipVia = 1
GO
