/*========================================================
	CREAR LOGIN Y USUARIO DE Vicepresidente
=========================================================*/

USE [master]
GO
----------------------------------------------------------------------------------------
--CREATE LOGINS

CREATE LOGIN [afuller] WITH PASSWORD='afuller', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [adodsworth] WITH PASSWORD='adodsworth', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [gsmith] WITH PASSWORD='gsmith', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [jleverling] WITH PASSWORD='jleverling', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [lcallahan] WITH PASSWORD='lcallahan', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [mpeacock] WITH PASSWORD='mpeacock', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [msuyama] WITH PASSWORD='msuyama', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [pmartinez] WITH PASSWORD='pmartinez', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [pvannels] WITH PASSWORD='pvannels', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [rking] WITH PASSWORD='rking', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [sbuchanan] WITH PASSWORD='sbuchanan', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [uperez] WITH PASSWORD='uperez', DEFAULT_DATABASE=[Northwind], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

----------------------------------------------------------------------------------------
--CREATE USERS

CREATE USER [afuller] FOR LOGIN [afuller]
	ALTER USER [afuller] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [adodsworth] FOR LOGIN [adodsworth]
	ALTER USER [adodsworth] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [gsmith] FOR LOGIN [gsmith]
	ALTER USER [gsmith] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [jleverling] FOR LOGIN [jleverling]
	ALTER USER [jleverling] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [lcallahan] FOR LOGIN [lcallahan]
	ALTER USER [lcallahan] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [mpeacock] FOR LOGIN [mpeacock]
	ALTER USER [mpeacock] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [msuyama] FOR LOGIN [msuyama]
	ALTER USER [msuyama] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [pmartinez] FOR LOGIN [pmartinez]
	ALTER USER [pmartinez] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [pvannels] FOR LOGIN [pvannels]
	ALTER USER [pvannels] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [rking] FOR LOGIN [rking]
	ALTER USER [rking] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [sbuchanan] FOR LOGIN [sbuchanan]
	ALTER USER [sbuchanan] WITH DEFAULT_SCHEMA=[dbo]
CREATE USER [uperez] FOR LOGIN [uperez]
	ALTER USER [uperez] WITH DEFAULT_SCHEMA=[dbo]
GO









/*========================================================
	1. ASIGNAR ROLES DE LA DB NORTHWIND (ADMINISTRADORES)
=========================================================*/

USE [Northwind]
GO

ALTER ROLE [db_datareader] ADD MEMBER [afuller]
ALTER ROLE [db_datareader] ADD MEMBER [sbuchanan]
ALTER ROLE [db_datareader] ADD MEMBER [lcallahan]
GO

/*========================================================
	2. CONCEDER Y DENEGAR PERMISOS A ADMINISTRADORES
=========================================================*/
---------------------------------------------------------------------------------------
--afuller VICEPRESIDENTE
use [Northwind]
GO

GRANT UPDATE ON [dbo].[Employees] TO [afuller]
GRANT INSERT ON [dbo].[Employees] TO [afuller]
GRANT SELECT ON [dbo].[Employees] TO [afuller]
GRANT DELETE ON [dbo].[Employees] TO [afuller]

GRANT SELECT ON [dbo].[Orders] TO [afuller]
GRANT SELECT ON [dbo].[ORder Details] TO [afuller]

DENY SELECT ON [dbo].[Customers] TO [afuller]
DENY SELECT ON [dbo].[Products] TO [afuller]
DENY SELECT ON [dbo].[Suppliers] TO [afuller]
DENY SELECT ON [dbo].[Shippers] TO [afuller]
DENY SELECT ON [dbo].[Categories] TO [afuller]
GO

---------------------------------------------------------------------------------------
--3. jleverling (VENDEDORES CORPORATIVOS) FUNCION GENERAR PEDIDOS

use [Northwind]
GO

GRANT UPDATE ON [dbo].[ORder Details] TO [jleverling]
GRANT INSERT ON [dbo].[ORder Details] TO [jleverling]
GRANT SELECT ON [dbo].[ORder Details] TO [jleverling]
GRANT DELETE ON [dbo].[ORder Details] TO [jleverling]

GRANT UPDATE ON [dbo].[Orders] TO [jleverling]
GRANT INSERT ON [dbo].[Orders] TO [jleverling]
GRANT SELECT ON [dbo].[Orders] TO [jleverling]
GRANT DELETE ON [dbo].[Orders] TO [jleverling]

---------------------------------------------------------------------------------------
--4. mpeacock (VENDEDORES CORPORATIVOS) FUNCION GENERAR PEDIDOS

use [Northwind]
GO

GRANT UPDATE ON [dbo].[ORder Details] TO [mpeacock]
GRANT INSERT ON [dbo].[ORder Details] TO [mpeacock]
GRANT SELECT ON [dbo].[ORder Details] TO [mpeacock]
GRANT DELETE ON [dbo].[ORder Details] TO [mpeacock]

GRANT UPDATE ON [dbo].[Orders] TO [mpeacock]
GRANT INSERT ON [dbo].[Orders] TO [mpeacock]
GRANT SELECT ON [dbo].[Orders] TO [mpeacock]
GRANT DELETE ON [dbo].[Orders] TO [mpeacock]
GO

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--5. sbuchanan (GERENTE DE VENTA) 

use [Northwind]
GO

GRANT UPDATE ON [dbo].[Products] TO [sbuchanan]
GRANT DELETE ON [dbo].[Products] TO [sbuchanan]
GRANT INSERT ON [dbo].[Products] TO [sbuchanan]

GRANT UPDATE ON [dbo].[Suppliers] TO [sbuchanan]
GRANT DELETE ON [dbo].[Suppliers] TO [sbuchanan]
GRANT INSERT ON [dbo].[Suppliers] TO [sbuchanan]

GRANT UPDATE ON [dbo].[Categories] TO [sbuchanan]
GRANT DELETE ON [dbo].[Categories] TO [sbuchanan]
GRANT INSERT ON [dbo].[Categories] TO [sbuchanan]

GRANT DELETE ON [dbo].[Orders] TO [sbuchanan]
GRANT DELETE ON [dbo].[Order Details] TO [sbuchanan]

GO

DENY SELECT ON [dbo].[Employees] TO [sbuchanan]
DENY SELECT ON [dbo].[Customers] TO [sbuchanan]
DENY SELECT ON [dbo].[Shippers] TO [sbuchanan]
GO


---------------------------------------------------------------------------------------
--6. msuyama (VENDEDORES LOCALES)

use [Northwind]
GO

GRANT UPDATE ON [dbo].[Order Details] TO [msuyama]
GRANT INSERT ON [dbo].[Order Details] TO [msuyama]
GRANT SELECT ON [dbo].[Order Details] TO [msuyama]

GRANT UPDATE ON [dbo].[Orders] TO [msuyama]
GRANT INSERT ON [dbo].[Orders] TO [msuyama]
GRANT SELECT ON [dbo].[Orders] TO [msuyama]

GRANT UPDATE ON [dbo].[Customers] TO [msuyama]
GRANT INSERT ON [dbo].[Customers] TO [msuyama]
GRANT SELECT ON [dbo].[Customers] TO [msuyama]
GO

---------------------------------------------------------------------------------------
--7. rking (VENDEDORES LOCALES)

use [Northwind]
GO

GRANT UPDATE ON [dbo].[Order Details] TO [rking]
GRANT INSERT ON [dbo].[Order Details] TO [rking]
GRANT SELECT ON [dbo].[Order Details] TO [rking]

GRANT UPDATE ON [dbo].[Orders] TO [rking]
GRANT INSERT ON [dbo].[Orders] TO [rking]
GRANT SELECT ON [dbo].[Orders] TO [rking]

GRANT UPDATE ON [dbo].[Customers] TO [rking]
GRANT INSERT ON [dbo].[Customers] TO [rking]
GRANT SELECT ON [dbo].[Customers] TO [rking]
GO

---------------------------------------------------------------------------------------
--8. adodsworth (VENDEDORES LOCALES)

use [Northwind]
GO

GRANT UPDATE ON [dbo].[Order Details] TO [adodsworth]
GRANT INSERT ON [dbo].[Order Details] TO [adodsworth]
GRANT SELECT ON [dbo].[Order Details] TO [adodsworth]

GRANT UPDATE ON [dbo].[Orders] TO [adodsworth]
GRANT INSERT ON [dbo].[Orders] TO [adodsworth]
GRANT SELECT ON [dbo].[Orders] TO [adodsworth]

GRANT UPDATE ON [dbo].[Customers] TO [adodsworth]
GRANT INSERT ON [dbo].[Customers] TO [adodsworth]
GRANT SELECT ON [dbo].[Customers] TO [adodsworth]
GO



---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--9. lcallahan (ADMINISTRADORA INTERNA)

use [Northwind]
GO

GRANT SELECT ON [dbo].[Orders] TO [lcallahan]
GRANT SELECT ON [dbo].[Order Details] TO [lcallahan]

GRANT UPDATE ON [dbo].[Products] TO [lcallahan]
GRANT DELETE ON [dbo].[Products] TO [lcallahan]
GRANT INSERT ON [dbo].[Products] TO [lcallahan]

GRANT UPDATE ON [dbo].[Suppliers] TO [lcallahan]
GRANT DELETE ON [dbo].[Suppliers] TO [lcallahan]
GRANT INSERT ON [dbo].[Suppliers] TO [lcallahan]

GRANT UPDATE ON [dbo].[Categories] TO [lcallahan]
GRANT DELETE ON [dbo].[Categories] TO [lcallahan]
GRANT INSERT ON [dbo].[Categories] TO [lcallahan]

GO

DENY SELECT ON [dbo].[Employees] TO [lcallahan]
DENY SELECT ON [dbo].[Customers] TO [lcallahan]
DENY SELECT ON [dbo].[Shippers] TO [lcallahan]
GO

---------------------------------------------------------------------------------------
--10. uperez (VENDEDOR DE TIENDA)

use [Northwind]
GO

GRANT UPDATE ON [dbo].[ORder Details] TO [uperez]
GRANT INSERT ON [dbo].[ORder Details] TO [uperez]
GRANT SELECT ON [dbo].[ORder Details] TO [uperez]
GRANT DELETE ON [dbo].[ORder Details] TO [uperez]

GRANT UPDATE ON [dbo].[Orders] TO [uperez]
GRANT INSERT ON [dbo].[Orders] TO [uperez]
GRANT SELECT ON [dbo].[Orders] TO [uperez]
GRANT DELETE ON [dbo].[Orders] TO [uperez]
GO

---------------------------------------------------------------------------------------
--11. gsmith (VENDEDOR DE TIENDA)

use [Northwind]
GO

GRANT UPDATE ON [dbo].[ORder Details] TO [gsmith]
GRANT INSERT ON [dbo].[ORder Details] TO [gsmith]
GRANT SELECT ON [dbo].[ORder Details] TO [gsmith]
GRANT DELETE ON [dbo].[ORder Details] TO [gsmith]

GRANT UPDATE ON [dbo].[Orders] TO [gsmith]
GRANT INSERT ON [dbo].[Orders] TO [gsmith]
GRANT SELECT ON [dbo].[Orders] TO [gsmith]
GRANT DELETE ON [dbo].[Orders] TO [gsmith]
GO

---------------------------------------------------------------------------------------
--12. pvannels (VENDEDOR DE TIENDA)

use [Northwind]
GO

GRANT UPDATE ON [dbo].[ORder Details] TO [pvannels]
GRANT INSERT ON [dbo].[ORder Details] TO [pvannels]
GRANT SELECT ON [dbo].[ORder Details] TO [pvannels]
GRANT DELETE ON [dbo].[ORder Details] TO [pvannels]

GRANT UPDATE ON [dbo].[Orders] TO [pvannels]
GRANT INSERT ON [dbo].[Orders] TO [pvannels]
GRANT SELECT ON [dbo].[Orders] TO [pvannels]
GRANT DELETE ON [dbo].[Orders] TO [pvannels]
GO
---------------------------------------------------------------------------------------
--13. pmartinez (VENDEDOR DE TIENDA)

use [Northwind]
GO

GRANT UPDATE ON [dbo].[ORder Details] TO [pmartinez]
GRANT INSERT ON [dbo].[ORder Details] TO [pmartinez]
GRANT SELECT ON [dbo].[ORder Details] TO [pmartinez]
GRANT DELETE ON [dbo].[ORder Details] TO [pmartinez]

GRANT UPDATE ON [dbo].[Orders] TO [pmartinez]
GRANT INSERT ON [dbo].[Orders] TO [pmartinez]
GRANT SELECT ON [dbo].[Orders] TO [pmartinez]
GRANT DELETE ON [dbo].[Orders] TO [pmartinez]
GO






---------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

/*=============================================================
---EJEMPLO DE GERENTE DE VENTAS (sbuchanan)
=============================================================*/

/* El GERENTE DE VENTAS cuyo LOGIN y USUARIO es sbuchanan
puede acceder a la DB NORTHWIND*/

USE Northwind
go


/*AHORA VEAMOS SI PUEDE ACCEDER (SELECT) A LA TABLA DE:
---> PRODUCTOS, Suppliers, Categories, Order,[Order Details]
las cuales si tiene acceso solo de lectura DB_DATAREADER */

select*from Products
select*from Suppliers
select*from Categories
SELECT*from Orders
select*from [Order Details]
go


/*AHORA VEAMOS SI PUEDE ACTUALIZAR, INSERTAR, ELIMINAR EN LA TABLA DE:
---> PRODUCTOS, Suppliers, Categories
las cuales si tiene acceso solo de lectura DB_DATAREADER 

		PRODUCT ID		NAME		UNIT PRICE
ANTES:		1			CHAI			18
DESPUES:	1			INKA COLA		6

*/

UPDATE Products 
SET ProductName= 'INKA COLA', UnitPrice= 6
WHERE ProductID= 1
GO

INSERT INTO Products 
(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock) 
VALUES
('COCA COLA', 15, 4, 5, 20)
GO

SELECT*FROM Products
GO

DELETE FROM Products
WHERE ProductID= 78
GO

SELECT*FROM Products
GO

/*AHORA VEAMOS SI PUEDE ELIMINAR EN LA TABLA DE:
---> ODER, [ORDER DETAILS]*/ 

select*from [Order Details]
go

DELETE FROM [Order Details]
WHERE OrderID= 11077 AND ProductID= 75
GO


/*AHORA VEAMOS SI PUEDE ACCEDER (SELECT) y modificar (UPDATE, INSERT, DELETE)
A LA TABLA DE:
---> EMPLOYEES, CUSTOMERS, SHIPPERS
las cuales NO tiene acceso */
select*from Employees
SELECT*from Customers
select*from Shippers
go

UPDATE Employees
SET LastName= 'Perfecto'
where EmployeeID= 1
go




/*=============================================================
	--EJEMPLO PARA LOS VENDEDORES LOCALES (msuyama)
	--VERIFICAR SI SE CONECTA A LA DB NORTHWIND
================================================================*/

USE Northwind
GO

--VERIFICAR SI PUEDEN ACCEDER (SELECT) A LAS TABLAS
--> ORDERS, [ORDER DETAILS], CUSTOMERS

SELECT*FROM Orders
SELECT*FROM [Order Details]
SELECT*FROM Customers
GO

--VERIFICAR SI SE PUEDE ACTUALIZAR (UPDATE) A LAS TABLAS
--> ORDERS, [ORDER DETAILS], CUSTOMERS
EXEC sp_columns CUSTOMERS
go

UPDATE Customers
SET CompanyName= 'ABInv Backus'
where CustomerID='WOLZA' --ultima fila
go

SELECT*FROM Customers
GO

--VERIFICAR SI SE PUEDE INSERTAR (insert into) A LAS TABLAS
--> ORDERS, [ORDER DETAILS], CUSTOMERS

exec sp_columns ORDERS
GO

insert into Orders (CustomerID, EmployeeID, OrderDate) 
			values ('WOLZA',5, SYSDATETIME())
go

SELECT*FROM Orders
GO


-------------------------------/----------























--======================================================================
--DELETE LOGIN

DROP LOGIN [afuller]; 
DROP LOGIN [adodsworth];  
DROP LOGIN [gsmith]; 
DROP LOGIN [jleverling]; 
DROP LOGIN [lcallahan]; 
DROP LOGIN [mpeacock]; 
DROP LOGIN [msuyama]; 
DROP LOGIN [pmartinez]; 
DROP LOGIN [pvannels]; 
DROP LOGIN [rking]; 
DROP LOGIN [sbuchanan]; 
DROP LOGIN [uperez];
GO


---------------------------------------------------------------------------------------
--DELETE USERS

DROP USER [afuller]; 
DROP USER [adodsworth];  
DROP USER [gsmith]; 
DROP USER [jleverling]; 
DROP USER [lcallahan]; 
DROP USER [mpeacock]; 
DROP USER [msuyama]; 
DROP USER [pmartinez]; 
DROP USER [pvannels]; 
DROP USER [rking]; 
DROP USER [sbuchanan]; 
DROP USER [uperez];
GO

---------------------------------------------------------------------------------------