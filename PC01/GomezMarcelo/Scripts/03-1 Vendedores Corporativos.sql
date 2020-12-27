-- ================================= CREACIÓN DE ROL =================================

USE Northwind
GO

CREATE ROLE vendedor_corporativo
GO


-- DAR PERMISOS AL ROL:

-- Permisos en la tabla Orders:

GRANT SELECT ON [dbo].[Orders] TO vendedor_corporativo
GO

GRANT INSERT ON [dbo].[Orders] TO vendedor_corporativo
GO

GRANT UPDATE ON [dbo].[Orders] TO vendedor_corporativo
GO

GRANT DELETE ON [dbo].[Orders] TO vendedor_corporativo
GO

-- Permisos en la tabla Orders Details:

GRANT SELECT ON [dbo].[Order Details] TO vendedor_corporativo
GO

GRANT INSERT ON [dbo].[Order Details] TO vendedor_corporativo
GO

GRANT UPDATE ON [dbo].[Order Details] TO vendedor_corporativo
GO

GRANT DELETE ON [dbo].[Order Details] TO vendedor_corporativo
GO



-- ================================= CREACIÓN DEL USUARIO jleverling =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN jleverling WITH PASSWORD = '20jleverling20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER jleverling FOR LOGIN jleverling
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE vendedor_corporativo 
ADD MEMBER jleverling
GO



-- ================================= CREACIÓN DEL USUARIO mpeacock =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN mpeacock WITH PASSWORD = '20mpeacock20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER mpeacock FOR LOGIN mpeacock
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE vendedor_corporativo 
ADD MEMBER mpeacock
GO
