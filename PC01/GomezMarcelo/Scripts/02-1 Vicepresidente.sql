-- ================================= CREACIÓN DE ROL =================================

USE Northwind
GO

CREATE ROLE vicepresidente
GO


-- DAR PERMISOS AL ROL:

-- Permisos en la tabla Employees:

GRANT SELECT ON [dbo].[Employees] TO vicepresidente
GO

GRANT INSERT ON [dbo].[Employees] TO vicepresidente
GO

GRANT UPDATE ON [dbo].[Employees] TO vicepresidente
GO

GRANT DELETE ON [dbo].[Employees] TO vicepresidente
GO

-- Permisos en la tabla Orders:

GRANT SELECT ON [dbo].[Orders] TO vicepresidente
GO

-- Permisos en la tabla Order Details:

GRANT SELECT ON [dbo].[Order Details] TO vicepresidente
GO



-- ================================= CREACIÓN DEL USUARIO afuller =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN afuller WITH PASSWORD = '20afuller20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER afuller FOR LOGIN afuller
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE vicepresidente 
ADD MEMBER afuller
GO



