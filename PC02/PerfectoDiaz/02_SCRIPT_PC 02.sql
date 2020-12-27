---------------------------------------------------------
-- Empresa        :  QhatuPERU SAC
-- Software       :  Sistema de Control de Inventarios
-- DBMS           :  MS SQL Server
-- Base de Datos  :  QhatuPERU
-- Script         :  BUCKUP y Restauración la base de datos QhatuPERU
---------------------------------------------------------

/*====================================================================
--PASO 1: PREPARAR EL AMBIENTE
====================================================================*/

USE MASTER

alter database QhatuPERU 
set recovery FULL 
go

select databasepropertyex( 'QhatuPERU','Recovery' )
go

/*====================================================================
--PASO 2: CREAR EL DISPOSITIVO
====================================================================*/

exec sp_addumpdevice 'disk', 'Qhatu', 'D:\BACKUP\QhatuDevice.bak' 
go
 
--verificación
select * from master.dbo.sysdevices 
go

/*====================================================================
--PASO 3: BACKUP FULL DEL DIA SABADO
====================================================================*/

backup database QhatuPERU
to Qhatu
with 
format,
name = 'BakBDQhatu',
description = 'Backup de la base de datos completa'
go

--verificación
restore headeronly from Qhatu
go

/*====================================================================
--PASO 4, DIA LUNES: SIMULACIÓN DE INSERTAR DATOS 
====================================================================*/

--MAÑANA
USE master
USE QhatuPERU
GO

select * from GUIA_ENVIO	--ANTES: 107 FILAS
select * from GUIA_DETALLE	--ANTES: 1177 FILAS
go

insert into GUIA_ENVIO values (108, 1, '21/12/2020', 2)
insert into GUIA_ENVIO values (109, 1, '21/12/2020', 2)
insert into GUIA_ENVIO values (110, 1, '21/12/2020', 2)
go

declare @k int, @l int --36 DATOS NUEVOS
set @l= 108
set @k = 1

while (@l<111)
begin
	while (@k < 13)
	begin 
		begin tran 
		insert into GUIA_DETALLE  
		values(@l, @k, @k/5, @k+2) 
		commit tran 
		set @k = @k + 1 
	end
	set @l= @l+1
	SET @k=1
end 
go

select * from GUIA_ENVIO	--despues: 110 FILAS
select * from GUIA_DETALLE	--despues: 1213 FILAS
go

/*====================================================================
--PASO 5: BACKUP LOG 01 DIA LUNES
====================================================================*/

backup log QhatuPERU 
to Qhatu 
with 
no_truncate, 
name = 'BakLog01', 
description = 'Backup del log LUNES 21-12-2020.' 
go

---VERIFICACIÓN
restore headeronly from Qhatu
go

/*====================================================================
--PASO 06: INSERTAR MÁS DATOS DEL LUNES LUEGO EL MEDIO DIA
====================================================================*/

USE master
USE QhatuPERU
GO

select * from GUIA_ENVIO	--ANTES: 110 FILAS
select * from GUIA_DETALLE	--ANTES: 1213 FILAS
go

insert into GUIA_ENVIO values (111, 1, '21/12/2020', 2)
go

declare @k int ---INSERTO 12 DATOS MÁS
set @k = 1
while (@k < 13)
begin 
	begin tran 
	insert into GUIA_DETALLE  
	values(111, @k, @k/5, @k+2) 
	commit tran 
	set @k = @k + 1 
end
go

select * from GUIA_ENVIO	--despues: 111 FILAS
select * from GUIA_DETALLE	--despues: 1225 FILAS
go

/*====================================================================
--PASO 07: DIFERENCIAL DEL LUNES
====================================================================*/

backup database QhatuPERU
to Qhatu
with 
differential,
name = 'BakDif01',
description = 'Primer backup diferencial de la DB'
go

---VERIFICACIÓN
restore headeronly from Qhatu
go


/*====================================================================
--PASO 08, DIA MARTES: SIMULACIÓN DE INSERTAR DATOS 
====================================================================*/

--MAÑANA

USE master
USE QhatuPERU
GO

select * from GUIA_ENVIO	--ANTES: 111 FILAS
select * from GUIA_DETALLE	--ANTES: 1225 FILAS
go

insert into GUIA_ENVIO values (112, 1, '22/12/2020', 2)
insert into GUIA_ENVIO values (113, 1, '22/12/2020', 2)
insert into GUIA_ENVIO values (114, 1, '22/12/2020', 2)
go

declare @k int, @l int --36 DATOS NUEVOS
set @l= 112
set @k = 1

while (@l<115)
begin
	while (@k < 13)
	begin 
		begin tran 
		insert into GUIA_DETALLE  
		values(@l, @k, @k/5, @k+2) 
		commit tran 
		set @k = @k + 1 
	end
	set @l= @l+1
SET @k=1
end 
go

select * from GUIA_ENVIO	--despues: 114 FILAS
select * from GUIA_DETALLE	--despues: 1261 FILAS
go

/*====================================================================
--PASO 09: BACKUP LOG 02 DIA MARTES
====================================================================*/

backup log QhatuPERU 
to Qhatu 
with 
no_truncate, 
name = 'BakLog02', 
description = 'Backup del log MARTES 22-12-2020.' 
go

---VERIFICACIÓN
restore headeronly from Qhatu
go

/*====================================================================
--PASO 10: INSERTAR MÁS DATOS DEL MARTES LUEGO EL MEDIO DIA 
HASTA ANTES DEL ERROR (A LAS 14 HORAS)
====================================================================*/

USE master
USE QhatuPERU
GO

select * from GUIA_ENVIO	--ANTES: 114 FILAS
select * from GUIA_DETALLE	--ANTES: 1261 FILAS
go

insert into GUIA_ENVIO values (115, 1, '22/12/2020', 2)
go

declare @k int ---INSERTO 12 DATOS MÁS
set @k = 1
while (@k < 13)
begin 
begin tran 
insert into GUIA_DETALLE  
values(115, @k, @k/5, @k+2) 
commit tran 
set @k = @k + 1 
end
go

select * from GUIA_ENVIO	--despues: 115 FILAS
select * from GUIA_DETALLE	--despues: 1273 FILAS
go

/*====================================================================
OCURRE EL ERROR: SE INTRODUJO DATOS ERRÓNEOS DESDE LAs 13 a 14 h
====================================================================*/

USE master;
go

drop database QhatuPERU;
go

/*====================================================================
RESTAURACIÓN
PASO 11: BACKUP FULL + DIF LUNES + BACKUP LOG 02
====================================================================*/

-- Restaura la base de datos
RESTORE DATABASE QhatuPERU 
FROM Qhatu 
WITH File = 1, NORECOVERY;
go

-- Restaurar el diferencial
RESTORE DATABASE QhatuPERU
FROM Qhatu 
WITH File = 3, NORECOVERY;
go

-- Restaurar el log
RESTORE LOG QhatuPERU
FROM Qhatu 
WITH FILE = 4, RECOVERY;
go


USE master
USE QhatuPERU
GO

select * from GUIA_ENVIO	-- # FILAS: 114
select * from GUIA_DETALLE	-- # FILAS: 1261
go