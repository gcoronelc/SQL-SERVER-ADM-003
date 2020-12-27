--1.Usted es el administrador de la base de datos Northwind. Su cuenta Windows
--est� formada por la inicial de su nombre y su apellido. Como administrador de
--Northwind solo tiene acceso a la metadata, pudiendo crear objetos en la base de
--datos seg�n las indicaciones del dise�ador de la aplicaci�n.
--ADMINISTRADOR DE BASE DE DATOS "rdea"

CREATE LOGIN [rdea] WITH PASSWORD= 'rdea',
DEFAULT_DATABASE=[NORTHWIND], DEFAULT_LANGUAGE=[ESPA�OL],
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [Northwind]
GO

CREATE USER [reda] FOR LOGIN [rdea]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [rdea]
GO

--2. "AFULLER" es el Vicepresidente, y adem�s administra directamente
--las ventas corporativas, por lo que puede efectuar tareas de mantenimiento de
--empleados. Tambi�n necesita obtener informaci�n acerca de los pedidos, pero �l
--no se encarga de ingresar los pedidos al sistema.

CREATE LOGIN [AFULLER] WITH PASSWORD= 'AFULLER',
DEFAULT_DATABASE=[NORTHWIND], DEFAULT_LANGUAGE=[ESPA�OL],
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [NORTHWIND]
GO

CREATE USER [AFULLER] FOR LOGIN [AFULLER]
GO

GRANT SELECT ON EMPLOYEES TO AFULLER
GO

GRANT UPDATE ON EMPLOYEES TO AFULLER
GO

GRANT INSERT ON EMPLOYEES TO AFULLER
GO

GRANT DELETE ON EMPLOYEES TO AFULLER
GO

GRANT SELECT ON ORDERS TO AFULLER
GO

--3. "JLEVERLING" Y "MPEACOCK"
 --SON VENDEDORES CORPORATIVOS, reportan a Andrew Fuller, y deben registrar sus pedidos en el
--sistema; tambi�n pueden eventualmente eliminar pedidos o corregir alg�n dato de los mismos.

 CREATE LOGIN [JLEVERLING] WITH PASSWORD='JLEVERLING',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [NORTHWIND]
GO
CREATE USER [JLEVERLING] FOR LOGIN [JLEVERLING]
GO


CREATE LOGIN MPEACOCK WITH PASSWORD='MPEACOCK',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [NORTHWIND]
GO
CREATE USER MPEACOCK FOR LOGIN MPEACOCK
GO


GRANT INSERT ON ORDERS TO MPEACOCK
GO
GRANT DELETE ON ORDERS TO MPEACOCK
GO
GRANT UPDATE ON ORDERS TO MPEACOCK
GO

GRANT INSERT ON ORDERS TO JLEVERLING
GO
GRANT DELETE ON ORDERS TO JLEVERLING
GO
GRANT UPDATE ON ORDERS TO JLEVERLING
GO

--4. "SBUCHANAN" ES EL GERENTE DE VENTAs, y como tal se encarga de
--darle mantenimiento al cat�logo de productos de la empresa.

CREATE LOGIN SBUCHANAN WITH PASSWORD='SBUCHANAN',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [NORTHWIND]
GO
CREATE USER SBUCHANAN FOR LOGIN SBUCHANAN
GO

GRANT SELECT ON PRODUCTS TO SBUCHANAN
GO
GRANT UPDATE ON PRODUCTS TO SBUCHANAN

GO
GRANT INSERT ON PRODUCTS TO SBUCHANAN
GO
GRANT DELETE ON PRODUCTS TO SBUCHANAN
GO

--5. "MSUYAMA", "RKING",
--Y "ADODSWORTH" SON VENDEDORES LOCALES , reportan a Steve Buchanan, y deben
--registrar sus pedidos en el sistema. Una vez que han ingresado un pedido,
--pueden corregir alg�n dato, pero no pueden eliminarlo. Quien se encarga de 
--eliminar alg�n pedido de los Vendedores Locales es el Gerente de Ventas. Los
--Vendedores Locales pueden registrar a sus clientes nuevos, y modificar los datos
--de alg�n cliente, pero no pueden eliminarlos del sistema.

CREATE LOGIN MSUYAMA WITH PASSWORD='MSUYAMA',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER MSUYAMA FOR LOGIN MSUYAMA
GO

CREATE LOGIN RKING WITH PASSWORD='RKING',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL]
GO

CREATE USER RKING FOR LOGIN RKING
GO

CREATE LOGIN ADODSWORTH WITH PASSWORD='ADODSWORTH',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER ADODSWORTH FOR LOGIN ADODSWORTH
GO

GRANT UPDATE ON ORDERS TO MSUYAMA
GRANT UPDATE ON ORDERS TO ADODSWORTH
GRANT UPDATE ON ORDERS TO RKING
GO

GRANT DELETE ON ORDERS TO SBUCHANAN
GO

GRANT INSERT ON CUSTOMERS TO MSUYAMA
GRANT INSERT ON CUSTOMERS TO ADODSWORTH
GRANT INSERT ON CUSTOMERS TO RKING
GO

GRANT UPDATE ON CUSTOMERS TO MSUYAMA
GRANT UPDATE ON CUSTOMERS TO ADODSWORTH
GRANT UPDATE ON CUSTOMERS TO RKING
GO

--6. "LCALLAHAN" ES LA ADMINISTRADORA INTERNA Y
-- SE ENCARGA DE LA GESTI�N DE LAS VENTAS EN LA TIENDA.
--Ella tambi�n le da mantenimiento al cat�logo
--de productos de la empresa. Tambi�n es responsable del mantenimiento del registro de transportistas.

CREATE LOGIN LCALLAHAN WITH PASSWORD='LCALLAHAN',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER LCALLAHAN FOR LOGIN LCALLAHAN
GO


GRANT SELECT ON SHIPPERS TO LCALLAHAN
GO
GRANT UPDATE ON SHIPPERS TO LCALLAHAN

GO
GRANT INSERT ON SHIPPERS TO LCALLAHAN
GO
GRANT DELETE ON SHIPPERS TO LCALLAHAN
GO

--7.  "UPEREZ", "GSMITH",
--"PVANNELS", Y "PMARTINEZ"
--SON VENDEDORES DE TIENDA. 
--Ellos necesitan registrar sus pedidos en el sistema. 
--Tambi�n pueden eliminar pedidos o corregir datos del pedido.

CREATE LOGIN UPEREZ WITH PASSWORD='UPEREZ',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER UPEREZ FOR LOGIN UPEREZ
GO


GRANT UPDATE ON ORDERS TO UPEREZ
GRANT INSERT ON ORDERS TO UPEREZ
GRANT DELETE ON ORDERS TO UPEREZ
GO


CREATE LOGIN GSMITH WITH PASSWORD='GSMITH',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER GSMITH FOR LOGIN GSMITH
GO


GRANT UPDATE ON ORDERS TO GSMITH
GRANT INSERT ON ORDERS TO GSMITH
GRANT DELETE ON ORDERS TO GSMITH
GO


CREATE LOGIN PVANNELS WITH PASSWORD='PVANNELS',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER PVANNELS FOR LOGIN PVANNELS
GO

GRANT UPDATE ON ORDERS TO PVANNELS
GRANT INSERT ON ORDERS TO PVANNELS
GRANT DELETE ON ORDERS TO PVANNELS
GO

CREATE LOGIN PMARTINEZ WITH PASSWORD='PMARTINEZ',
DEFAULT_DATABASE=[NORTHWIND],
DEFAULT_LANGUAGE=[ESPA�OL],
 CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER PMARTINEZ FOR LOGIN PMARTINEZ
GO

GRANT UPDATE ON ORDERS TO PMARTINEZ
GRANT INSERT ON ORDERS TO PMARTINEZ
GRANT DELETE ON ORDERS TO PMARTINEZ
GO
