-- ================================= CREACIÓN DE ROL =================================

USE Northwind
GO

CREATE ROLE administrador_interno
GO


-- DAR PERMISOS AL ROL:

-- Permisos en la tabla Orders:

GRANT SELECT ON [dbo].[Orders] TO administrador_interno
GO

GRANT INSERT ON [dbo].[Orders] TO administrador_interno
GO

GRANT UPDATE ON [dbo].[Orders] TO administrador_interno
GO

GRANT DELETE ON [dbo].[Orders] TO administrador_interno
GO

-- Permisos en la tabla Order Details:

GRANT SELECT ON [dbo].[Order Details] TO administrador_interno
GO

GRANT INSERT ON [dbo].[Order Details] TO administrador_interno
GO

GRANT UPDATE ON [dbo].[Order Details] TO administrador_interno
GO

GRANT DELETE ON [dbo].[Order Details] TO administrador_interno
GO

-- Permisos en la tabla Categories:

GRANT SELECT ON [dbo].[Categories] TO administrador_interno
GO

GRANT INSERT ON [dbo].[Categories] TO administrador_interno
GO

GRANT UPDATE ON [dbo].[Categories] TO administrador_interno
GO

GRANT DELETE ON [dbo].[Categories] TO administrador_interno
GO

-- Permisos en la tabla Products:

GRANT SELECT ON [dbo].[Products] TO administrador_interno
GO

GRANT INSERT ON [dbo].[Products] TO administrador_interno
GO

GRANT UPDATE ON [dbo].[Products] TO administrador_interno
GO

GRANT DELETE ON [dbo].[Products] TO administrador_interno
GO

-- Permisos en la tabla Shippers:

GRANT SELECT ON [dbo].[Shippers] TO administrador_interno
GO

GRANT INSERT ON [dbo].[Shippers] TO administrador_interno
GO

GRANT UPDATE ON [dbo].[Shippers] TO administrador_interno
GO

GRANT DELETE ON [dbo].[Shippers] TO administrador_interno
GO



-- ================================= CREACIÓN DEL USUARIO lcallahan =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN lcallahan WITH PASSWORD = '20lcallahan20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER lcallahan FOR LOGIN lcallahan
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE administrador_interno 
ADD MEMBER lcallahan
GO
