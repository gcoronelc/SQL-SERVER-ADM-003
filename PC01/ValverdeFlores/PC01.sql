*/*
CREACION DE LOS INICIOS DE SESION
*/*

CREATE LOGIN afuller WITH PASSWORD ='afuller'
CREATE LOGIN jeverling WITH PASSWORD ='jeverling'
CREATE LOGIN mpeacock WITH PASSWORD = 'mpeacock'
CREATE LOGIN sbuchanan WITH PASSWORD = 'sbuchanan'
CREATE LOGIN msuyama WITH PASSWORD = 'msuyama'
CREATE LOGIN rking WITH PASSWORD = 'rking'
CREATE LOGIN adodsworth WITH PASSWORD = 'adodsworth'
CREATE LOGIN lcallahan WITH PASSWORD = 'lcallahan'
CREATE LOGIN uperez WITH PASSWORD = 'uperez'
CREATE LOGIN gsmith WITH PASSWORD = 'gsmith'
CREATE LOGIN pvannels WITH PASSWORD = 'pvannels'
CREATE LOGIN pmartinez WITH PASSWORD = 'pmartinez'

*/* CREACION DE USUARIOS
*/*

USE Northwind
CREATE USER afuller FOR LOGIN afuller
CREATE USER jeverling FOR LOGIN jeverling
CREATE USER mpeacock FOR LOGIN mpeacock
CREATE USER sbuchanan FOR LOGIN sbuchanan
CREATE USER msuyama FOR LOGIN msuyama
CREATE USER rking FOR LOGIN rking
CREATE USER adodsworth FOR LOGIN adodsworth
CREATE USER lcallahan FOR LOGIN lcallahan
CREATE USER uperez FOR LOGIN uperez
CREATE USER gsmith FOR LOGIN gsmith
CREATE USER pvannels FOR LOGIN pvannels
CREATE USER pmartinez FOR LOGIN pmartinez

*/* CREACION DE ROLES
*/*
--VICEPRESIDENTE
USE [Northwind]
CREATE ROLE [db_vicepresidente]
GRANT UPDATE ON [dbo].[Employees] TO [db_vicepresidente]
GRANT DELETE ON [dbo].[Employees] TO [db_vicepresidente]
GRANT INSERT ON [dbo].[Employees] TO [db_vicepresidente]
GRANT SELECT ON [dbo].[Order Details] TO [db_vicepresidente]
GRANT SELECT ON [dbo].[Orders] TO [db_vicepresidente]
GO
--VENDEDOR CORPORATIVO
USE [Northwind]
CREATE ROLE [db_vendedorcorporativo]
GRANT UPDATE ON [dbo].[Order Details] TO [db_vendedorcorporativo]
GRANT DELETE ON [dbo].[Order Details] TO [db_vendedorcorporativo]
GRANT INSERT ON [dbo].[Order Details] TO [db_vendedorcorporativo]
GRANT UPDATE ON [dbo].[Orders] TO [db_vendedorcorporativo]
GRANT DELETE ON [dbo].[Orders] TO [db_vendedorcorporativo]
GRANT INSERT ON [dbo].[Orders] TO [db_vendedorcorporativo]
GO
--GERENTE DE VENTAS
USE [Northwind]
CREATE ROLE [db_gerentedeventas]
GRANT DELETE ON [dbo].[Order Details] TO [db_gerentedeventas]
GRANT UPDATE ON [dbo].[Categories] TO [db_gerentedeventas]
GRANT DELETE ON [dbo].[Categories] TO [db_gerentedeventas]
GRANT INSERT ON [dbo].[Categories] TO [db_gerentedeventas]
GRANT DELETE ON [dbo].[Orders] TO [db_gerentedeventas]
GRANT UPDATE ON [dbo].[Products] TO [db_gerentedeventas]
GRANT DELETE ON [dbo].[Products] TO [db_gerentedeventas]
GRANT INSERT ON [dbo].[Products] TO [db_gerentedeventas]
GRANT UPDATE ON [dbo].[Suppliers] TO [db_gerentedeventas]
GRANT DELETE ON [dbo].[Suppliers] TO [db_gerentedeventas]
GRANT INSERT ON [dbo].[Suppliers] TO [db_gerentedeventas]
GO
--VENDEDOR LOCAL
USE [Northwind]
CREATE ROLE [db_vendedorlocal]
GRANT UPDATE ON [dbo].[Order Details] TO [db_vendedorlocal]
GRANT INSERT ON [dbo].[Order Details] TO [db_vendedorlocal]
DENY DELETE ON [dbo].[Order Details] TO [db_vendedorlocal]
GRANT UPDATE ON [dbo].[Customers] TO [db_vendedorlocal]
GRANT INSERT ON [dbo].[Customers] TO [db_vendedorlocal]
DENY DELETE ON [dbo].[Customers] TO [db_vendedorlocal]
GRANT UPDATE ON [dbo].[Orders] TO [db_vendedorlocal]
GRANT INSERT ON [dbo].[Orders] TO [db_vendedorlocal]
DENY DELETE ON [dbo].[Orders] TO [db_vendedorlocal]
GO
--ADMINISTRADOR INTERNO
USE [Northwind]
CREATE ROLE [db_administradorinterno]
GRANT UPDATE ON [dbo].[Categories] TO [db_administradorinterno]
GRANT INSERT ON [dbo].[Categories] TO [db_administradorinterno]
GRANT UPDATE ON [dbo].[Shippers] TO [db_administradorinterno]
GRANT INSERT ON [dbo].[Shippers] TO [db_administradorinterno]
GRANT UPDATE ON [dbo].[Products] TO [db_administradorinterno]
GRANT INSERT ON [dbo].[Products] TO [db_administradorinterno]
GRANT UPDATE ON [dbo].[Suppliers] TO [db_administradorinterno]
GRANT INSERT ON [dbo].[Suppliers] TO [db_administradorinterno]
GO
--VENDEDOR DE TIENDA
USE [Northwind]
CREATE ROLE [db_vendedortienda]
GRANT UPDATE ON [dbo].[Orders] TO [db_vendedortienda]
GRANT DELETE ON [dbo].[Orders] TO [db_vendedortienda]
GRANT INSERT ON [dbo].[Orders] TO [db_vendedortienda]
GRANT UPDATE ON [dbo].[Order Details] TO [db_vendedortienda]
GRANT DELETE ON [dbo].[Order Details] TO [db_vendedortienda]
GRANT INSERT ON [dbo].[Order Details] TO [db_vendedortienda]
GO

*/* ASIGNACION DE ROLES A USUARIOS
*/*
--VICEPRESIDENTE AFULLER
USE [Northwind]
ALTER ROLE [db_vicepresidente] ADD MEMBER [afuller]
GO
--VENDEDOR CORPORATIVO
USE [Northwind]
ALTER ROLE [db_vendedorcorporativo] ADD MEMBER [jeverling]
ALTER ROLE [db_vendedorcorporativo] ADD MEMBER [mpeacock]
GO
--GERENTE DE VENTAS
USE [Northwind]
ALTER ROLE [db_gerentedeventas] ADD MEMBER [sbuchanan]
GO
--VENDEDOR LOCAL
USE [Northwind]
ALTER ROLE [db_vendedorlocal] ADD MEMBER [adodsworth]
ALTER ROLE [db_vendedorlocal] ADD MEMBER [msuyama]
ALTER ROLE [db_vendedorlocal] ADD MEMBER [rking]
GO
--ADMINISTRADOR INTERNO
USE [Northwind]
GO
ALTER ROLE [db_administradorinterno] ADD MEMBER [lcallahan]
GO
--VENDEDOR DE TIENDA
USE [Northwind]
ALTER ROLE [db_vendedortienda] ADD MEMBER [gsmith]
ALTER ROLE [db_vendedortienda] ADD MEMBER [pmartinez]
ALTER ROLE [db_vendedortienda] ADD MEMBER [pvannels]
ALTER ROLE [db_vendedortienda] ADD MEMBER [uperez]
GO
