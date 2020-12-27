-- ================================= CREACIÓN DEL USUARIO mgomez =================================

-- CREAR EL LOGIN:

USE master
GO

CREATE LOGIN mgomez WITH PASSWORD = '20mgomez20', DEFAULT_DATABASE = Northwind, CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO


-- CREAR EL USER:

USE Northwind
GO

CREATE USER mgomez FOR LOGIN mgomez
GO


-- ASIGNAR EL ROL CORRESPONDIENTE AL USER:

ALTER ROLE db_ddladmin 
ADD MEMBER mgomez
GO

