-- ================================= PRUEBAS =================================

/*

	Es NECESARIO iniciar sesi�n con mgomez

*/

-- Pruebas SELECT (Err�nea):

SELECT * FROM Employees
GO

SELECT * FROM Orders
GO


-- Prueba INSERT (Err�nea):

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
