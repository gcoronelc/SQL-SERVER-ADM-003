-- ================================= CREACIÓN DE ROL =================================

USE Northwind
GO

CREATE ROLE vendedor_tienda
GO


-- DAR PERMISOS AL ROL:

-- Permisos en la tabla Orders:

GRANT SELECT ON [dbo].[Orders] TO vendedor_tienda
GO

GRANT INSERT ON [dbo].[Orders] TO vendedor_tienda
GO

GRANT UPDATE ON [dbo].[Orders] TO vendedor_tienda
GO

GRANT DELETE ON [dbo].[Orders] TO vendedor_tienda
GO

-- Permisos en la tabla Order Details:

GRANT SELECT ON [dbo].[Order Details] TO vendedor_tienda
GO

GRANT INSERT ON [dbo].[Order Details] TO vendedor_tienda
GO

GRANT UPDATE ON [dbo].[Order Details] TO vendedor_tienda
GO

GRANT DELETE ON [dbo].[Order Details] TO vendedor_tienda
GO



-- ================================= CREACIÓN DEL USUARIO uperez =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN uperez WITH PASSWORD = '20uperez20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER uperez FOR LOGIN uperez
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE vendedor_tienda 
ADD MEMBER uperez
GO


-- ================================= CREACIÓN DEL USUARIO gsmith =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN gsmith WITH PASSWORD = '20gsmith20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER gsmith FOR LOGIN gsmith
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE vendedor_tienda 
ADD MEMBER gsmith
GO



-- ================================= CREACIÓN DEL USUARIO pvannels =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN pvannels WITH PASSWORD = '20pvannels20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER pvannels FOR LOGIN pvannels
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE vendedor_tienda 
ADD MEMBER pvannels
GO



-- ================================= CREACIÓN DEL USUARIO pmartinez =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN pmartinez WITH PASSWORD = '20pmartinez20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER pmartinez FOR LOGIN pmartinez
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE vendedor_tienda 
ADD MEMBER pmartinez
GO