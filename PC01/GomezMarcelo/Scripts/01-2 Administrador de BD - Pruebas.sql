-- ================================= PRUEBAS =================================

/*

	Es NECESARIO iniciar sesión con mgomez

*/

-- Pruebas SELECT (Errónea):

SELECT * FROM Employees
GO

SELECT * FROM Orders
GO


-- Prueba INSERT (Errónea):

INSERT INTO Orders(CustomerID, EmployeeID, ShipVia)
			VALUES('VINET', 2, 3)
GO


-- Prueba CREATE TABLE (Exitosa):

CREATE TABLE Territories
(
	TerritorieID		INT				PRIMARY KEY,
	TerritotieName		VARCHAR(50)		NOT NULL,
	PostalCode			INT				NULL
)
GO
