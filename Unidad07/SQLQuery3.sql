

SELECT * FROM DBO.VENTAS;
GO

TRUNCATE TABLE DBO.VENTAS;
GO

SELECT 
	YEAR(O.OrderDate) Anio, MONTH(O.OrderDate) Mes,
	C.CustomerID, C.CompanyName, O.OrderID, 
	CONVERT(varchar,O.OrderDate,103) OrderDate,
	P.ProductName, D.UnitPrice, D.Quantity
FROM Northwind.dbo.Customers AS C
JOIN Northwind.dbo.Orders AS O ON C.CustomerID = O.CustomerID
JOIN Northwind.dbo.[Order Details] AS D ON O.OrderID = D.OrderID
JOIN Northwind.dbo.Products AS P ON D.ProductID = P.ProductID;



TRUNCATE TABLE DEMO_VENTAS.DBO.VENTAS;
GO

INSERT INTO DEMO_VENTAS.DBO.VENTAS(CustomerID,CompanyName,OrderID,OrderDate,ProductName,UnitPrice,Quantity)
SELECT 
	C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate,
	P.ProductName, D.UnitPrice, D.Quantity
FROM Northwind.dbo.Customers AS C
JOIN Northwind.dbo.Orders AS O ON C.CustomerID = O.CustomerID
JOIN Northwind.dbo.[Order Details] AS D ON O.OrderID = D.OrderID
JOIN Northwind.dbo.Products AS P ON D.ProductID = P.ProductID;
GO




SELECT DISTINCT YEAR(ORDERDATE) Anio 
FROM Northwind.dbo.Orders
ORDER BY 1;

SELECT 
	DISTINCT MONTH(ORDERDATE) MES,
	DATENAME ( mm, OrderDate )  NOMMES
FROM Northwind.dbo.Orders
ORDER BY 1;