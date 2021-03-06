
-- ================================= CREACIÓN DE ROL =================================

USE [Northwind]
GO

CREATE ROLE [vendedor_local]
GO


-- DAR PERMISOS AL ROL:

-- Permisos en la tabla Orders:


use [Northwind]
GO
GRANT INSERT ON [dbo].[Orders] TO [vendedor_local]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Orders] TO [vendedor_local]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Orders] TO [vendedor_local]
GO
use [Northwind]
GO
-- Permisos en la tabla Orders Details:


GRANT INSERT ON [dbo].[Order Details] TO [vendedor_local]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Order Details] TO [vendedor_local]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Order Details] TO [vendedor_local]
GO

-- Permisos en la tabla Customers:


GRANT INSERT ON [dbo].[Customers] TO [vendedor_local]
GO
use [Northwind]
GO
GRANT SELECT ON [dbo].[Customers] TO [vendedor_local]
GO
use [Northwind]
GO
GRANT UPDATE ON [dbo].[Customers] TO [vendedor_local]
GO
use [Northwind]
GO



-- ================================= CREACIÓN DEL SQL SERVER AUTHENTICATION  msuyama =================================

-- CREAR EL LOGIN:

USE [master]
GO
CREATE LOGIN [msuyama] WITH PASSWORD=N'20msuyama20', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

-- CREAR EL USER:

USE [Northwind]
GO
CREATE USER [msuyama] FOR LOGIN [msuyama]
GO

-- ASIGNAR EL ROL CORRESPONDIENTE:

USE [Northwind]
GO
ALTER ROLE [vendedor_local] ADD MEMBER [msuyama]
GO


-- ================================= CREACIÓN DEL SQL SERVER AUTHENTICATION  (rking) =================================

-- CREAR EL LOGIN NAME:

USE [master]
GO
CREATE LOGIN [rking] WITH PASSWORD=N'20rking20', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

-- CREAR EL USER:

USE [Northwind]
GO
CREATE USER [rking] FOR LOGIN [rking]
GO

-- ASIGNAR EL ROL CORRESPONDIENTE:

USE [Northwind]
GO
ALTER ROLE [vendedor_local] ADD MEMBER [rking]
GO


-- ================================= CREACIÓN DEL SQL SERVER AUTHENTICATION adodsworth =================================

-- CREAR EL LOGIN:

USE [master]
GO
CREATE LOGIN [adodsworth] WITH PASSWORD=N'20adodsworth20', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

-- CREAR EL USER:

USE [Northwind]
GO
CREATE USER [adodsworth] FOR LOGIN [adodsworth]
GO

-- ASIGNAR EL ROL CORRESPONDIENTE:

USE [Northwind]
GO
ALTER ROLE [vendedor_local] ADD MEMBER [adodsworth]
GO
