
-- ================================= CREACIÓN DE ROL =================================

USE [Northwind]
GO

CREATE ROLE [gerente_ventas]
GO

-- DAR PERMISOS AL ROL:

use [Northwind]
GO


-- Permisos en la tabla Products:

GRANT DELETE ON [dbo].[Products] TO [gerente_ventas]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Products] TO [gerente_ventas]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Products] TO [gerente_ventas]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Products] TO [gerente_ventas]
GO


-- Permisos en la tabla Orders:
use [Northwind]
GO
GRANT DELETE ON [dbo].[Orders] TO [gerente_ventas]
GO
use [Northwind]
GO

GRANT SELECT ON [dbo].[Orders] TO [gerente_ventas]
GO



-- Permisos en la tabla Orders Details:
use [Northwind]
GO
GRANT DELETE ON [dbo].[Order Details] TO [gerente_ventas]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Order Details] TO [gerente_ventas]
GO
-- Permisos en la tabla Categories:

GRANT DELETE ON [dbo].[Categories] TO [gerente_ventas]
GO
use [Northwind]
GO
GRANT INSERT ON [dbo].[Categories] TO [gerente_ventas]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Categories] TO [gerente_ventas]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Categories] TO [gerente_ventas]
GO


-- ================================= CREACIÓN DEL SQL SERVER AUTHENTICATION (sbuchanan) =================================

-- CREAR EL LOGIN NAME:

USE [master]
GO
CREATE LOGIN [sbuchanan] WITH PASSWORD=N'20sbuchanan20', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

-- CREAR EL USER:

USE [Northwind]
GO
CREATE USER [sbuchanan] FOR LOGIN [sbuchanan]
GO

-- ASIGNAR EL ROL CORRESPONDIENTE:

USE [Northwind]
GO
ALTER ROLE [gerente_ventas] ADD MEMBER [sbuchanan]
GO




