USE master

CREATE DATABASE Pruebas

CREATE TABLE [CLIENTES]
([cod_cli] int PRIMARY KEY NOT NULL,
[nombre] char(30) NOT NULL,
[ciudad] varchar (15) NOT NULL,
[telefono] varchar (8) NULL) 
GO

USE Pruebas
GO

SELECT*FROM CLIENTES
GO

ALTER DATABASE PRUEBAS
SET RECOVERY FULL 
GO

Select databasepropertyex( 'pruebas','Recovery' ) 
Go

EXEC sp_addumpdevice 'disk', 'PRUEBAS', 'C:\Backup\Pruebas.bak' 
GO

Select * from master.dbo.sysdevices 
Go
-- 1. REALIZANDO BACK UP COMPLETO EN LA BASE DE DATOS "Pruebas"
-- Insertamos datos
INSERT INTO Clientes(cod_cli,nombre,ciudad,telefono)
VALUES
('51','ANALIA','LIMA','1239742'),
('52','LUZMILA','LIMA','8788575'),
('53','CASEMIRO','LIMA','9878575'),
('54','JEFERSON','LIMA','1123575'),
('55','DANIXA','LIMA','5862225')

-- REALIZAR EL BACKUP DE LA BASE DE BATOS COMPLETA (DOMINGO POR LA NOCHE)

Backup Database Pruebas
To PRUEBAS 
With 
	Format, 
	Name = 'BackUpPRUEBAS', 
	Description = 'Backup de la base de datos completa' 
Go

Restore Headeronly from PRUEBAS 
go


-- 2. REALIZANDO UN PRIMER BACKUP DIFERENCIAL

-- Ingresando datos del LUNES
INSERT INTO Clientes(cod_cli,nombre,ciudad,telefono)
VALUES
('56','CARLA','LIMA','1239742'),
('57','LUZ','LIMA','8788575'),
('58','ANGELICA','LIMA','9878575'),
('59','JEFERSON','LIMA','1123575'),
('60','ARRROYO','LIMA','5862225')

--Ahora realizaremos el primer Backup diferencial del LUNES

Backup Database PRUEBAS
To PRUEBAS
With 
	Differential, 
	Name = 'BackUpDifLunes', 
	Description = 'Backup diferencial del lunes' 
Go

Restore Headeronly from PRUEBAS 
Go


-- 3. REALIZAR UN SEGUNDO BACKUP DIFERENCIAL

-- Ingresando Datos del MARTES

INSERT INTO Clientes(cod_cli,nombre,ciudad,telefono)
VALUES
('61','CARLA','LIMA','1239742'),
('62','LUZ','LIMA','8788575'),
('63','ANGELICA','LIMA','9878575'),
('64','JEFERSON','LIMA','1123575'),
('65','ARRROYO','LIMA','5862225')

-- Backup diferencial del MARTES

Backup Database Pruebas
To PRUEBAS
With 
	Differential, 
	Name = 'BackUpDifMartes', 
	Description = 'Backup diferencial del Martes' 
Go

Restore Headeronly from PRUEBAS
Go

--4. REALIZAR UN TERCER BACKUP DIFERENCIAL

-- Ingresando Datos del MIERCOLES

INSERT INTO Clientes(cod_cli,nombre,ciudad,telefono)
VALUES
('66','CANDY','LIMA','1239742'),
('67','MARIA','LIMA','8788575'),
('68','PILAR','LIMA','9878575'),
('69','JEFREN','LIMA','1123575'),
('70','PAUL','LIMA','5862225')

-- Backup diferencial del MIERCOLES

Backup Database Pruebas
To PRUEBAS
With 
	Differential, 
	Name = 'BackUpDifMiercoles', 
	Description = 'Backup diferencial del Miercoles' 
Go

Restore Headeronly from PRUEBAS
Go

-- 5. ERROR EN LA BASE DE DATOS

-- Ingresando datos del JUEVES al medio dia

INSERT INTO Clientes(cod_cli,nombre,ciudad,telefono)
VALUES
('71','ISABEL','LIMA','1239742'),
('72','JUAN','LIMA','8788575'),
('73','STEFANY','LIMA','9878575'),
('74','MIRIAM','LIMA','1123575'),
('75','JESSY','LIMA','5862213')

SELECT * FROM Clientes
GO

-- BACK UP DEL LOG

BACKUP LOG Pruebas
TO PRUEBAS
WITH
	NO_TRUNCATE, 
	NAME = 'BackupLog', 
	DESCRIPTION = 'Backup del log. JUEVES' 
GO

Restore Headeronly from PRUEBAS
GO

--6. REALIZAR UN CUARTO BACKUP DIFERENCIAL

-- Ingresando Datos del VIERNES

INSERT INTO Clientes(cod_cli,nombre,ciudad,telefono)
VALUES
('76','ALEXA','LIMA','1239742'),
('77','ALEJANDRA','LIMA','8788575'),
('78','SOLEDAD','LIMA','9878575'),
('79','MARYORI','LIMA','1123575'),
('80','NATALIA','LIMA','5862213')

-- Backup diferencial del VIERNES

Backup Database Pruebas 
To PRUEBAS
With 
	Differential, 
	Name = 'BackUpDifViernes', 
	Description = 'Backup diferencial del Viernes' 
Go

Restore Headeronly from PRUEBAS 
Go

--7. REALIZAR UN QUINTO BACKUP DIFERENCIAL

-- Ingresando Datos del SÁBADO

INSERT INTO Clientes(cod_cli,nombre,ciudad,telefono)
VALUES
('81','JAVIER','LIMA','1239742'),
('82','CRISTIAN','LIMA','8788575'),
('83','JOSUE','LIMA','9878575'),
('84','STEVEN','LIMA','1123575'),
('85','EDSON','LIMA','5862213')


-- Backup diferencial del SÁBADO

Backup Database Pruebas
To PRUEBAS
With 
	Differential, 
	Name = 'BackUpDifSábado', 
	Description = 'Backup diferencial del Sábado' 
Go

Restore Headeronly from PRUEBAS
GO


--RESTAURANDO BASES DE DATOS:
--RESTAURANDO SOLO EL BACKUP DE BASE DE DATOS DEL DIA DOMINGO
USE master
GO

DROP DATABASE Pruebas
GO

RESTORE HEADERONLY FROM PRUEBAS
GO

RESTORE DATABASE Pruebas
FROM PRUEBAS 
WITH File = 1, RECOVERY;
GO
USE Pruebas
GO

SELECT * FROM CLIENTES
GO


--Restaurar solo el backup de base de datos del día domingo
--y el diferencial del lunes.

USE master
GO

DROP DATABASE Pruebas
GO

RESTORE HEADERONLY FROM PRUEBAS
GO

-- Restaurando la base de datos
RESTORE DATABASE Pruebas
FROM PRUEBAS
WITH File = 1, NORECOVERY;
GO

-- Restaurar el diferencial
RESTORE DATABASE Pruebas
FROM PRUEBAS
WITH File = 2, RECOVERY;
GO
USE Pruebas
GO

SELECT * FROM CLIENTES
GO

--Restaurar solo el backup de base de datos del día domingo
--y el diferencial del martes.

USE master
GO

DROP DATABASE Pruebas
GO

RESTORE HEADERONLY FROM PRUEBAS
GO

-- Restaura la base de datos
RESTORE DATABASE Pruebas 
FROM PRUEBAS
WITH File = 1, NORECOVERY;
GO

-- Restaurar el diferencial del martes
RESTORE DATABASE Pruebas
FROM PRUEBAS
WITH File = 3, RECOVERY;
GO

USE Pruebas
GO
SELECT * FROM CLIENTES
GO


--Restaurar solo el backup de base de datos del día domingo
--y el diferencial del Miercoles.

USE master
GO

DROP DATABASE Pruebas
GO

RESTORE HEADERONLY FROM PRUEBAS
GO

-- Restaura la base de datos
RESTORE DATABASE Pruebas 
FROM PRUEBAS
WITH File = 1, NORECOVERY;
GO

-- Restaurar el diferencial del Miercoles
RESTORE DATABASE Pruebas
FROM PRUEBAS
WITH File = 4, RECOVERY;
GO

USE Pruebas
GO
SELECT * FROM CLIENTES
GO


--Restaurar solo el backup de base de datos del día domingo,
--el defirencial del miercoles y el log del jueves.

USE master
GO

DROP DATABASE Pruebas
GO

RESTORE HEADERONLY FROM PRUEBAS
GO

-- Restaura la base de datos
RESTORE DATABASE Pruebas 
FROM PRUEBAS 
WITH File = 1, NORECOVERY;
GO

-- Restaurar el diferencial del MIERCOLES
RESTORE DATABASE Pruebas
FROM PRUEBAS
WITH File = 4, NORECOVERY;
GO

-- Restaurar el log del JUEVES
RESTORE LOG Pruebas
FROM PRUEBAS
WITH FILE = 5, RECOVERY;
GO

USE Pruebas
GO
SELECT * FROM CLIENTES
GO

--Restaurar solo el backup de base de datos del día domingo
--y el diferencial del VIERNES.

USE master
GO

DROP DATABASE Pruebas
GO

RESTORE HEADERONLY FROM PRUEBAS
GO

-- Restaura la base de datos
RESTORE DATABASE Pruebas 
FROM PRUEBAS
WITH File = 1, NORECOVERY;
GO

-- Restaurar el diferencial del VIERNES
RESTORE DATABASE Pruebas
FROM PRUEBAS
WITH File = 6, RECOVERY;
GO
USE Pruebas
GO
SELECT * FROM CLIENTES
GO

--Restaurar solo el backup de base de datos del día domingo
--y el diferencial del SÁBADO.

USE master
GO

DROP DATABASE Pruebas
GO

RESTORE HEADERONLY FROM PRUEBAS
GO

-- Restaura la base de datos
RESTORE DATABASE Pruebas 
FROM PRUEBAS
WITH File = 1, NORECOVERY;
GO

-- Restaurar el diferencial del SÁBADO
RESTORE DATABASE Pruebas
FROM PRUEBAS
WITH File = 7, RECOVERY;
GO

USE Pruebas
GO
SELECT * FROM CLIENTES
GO
