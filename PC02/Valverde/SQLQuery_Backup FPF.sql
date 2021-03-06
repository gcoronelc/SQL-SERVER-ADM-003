USE MASTER

CREATE DATABASE FPF

ALTER DATABASE FPF
SET RECOVERY FULL
GO

SELECT DATABASEPROPERTYEX('FPF','RECOVERY')

EXEC SP_ADDUMPDEVICE 'DISK','PDDEVICE_FPF','D:\BACKUP\PDDEVICE_FPF.BAK'

SELECT*FROM MASTER.DBO.SYSDEVICES
GO

----
CREATE TABLE SCOUTING(id int identity primary key, dato varchar(30))
GO

DECLARE @K iNT
SET @K = 0
WHILE (@K<100)
BEGIN
BEGIN TRAN
INSERT INTO SCOUTING (dato) 
VALUES ('Backup de Base de Datos')
COMMIT TRAN
SET @K = @K+1
END
GO

SELECT*FROM SCOUTING
GO


-----1)CREACION DEL BACKUP FULL - DIA DOMINGO

BACKUP DATABASE FPF
TO PDDEVICE_FPF
WITH
	FORMAT,
	NAME = 'BAKBD_FPF',
	DESCRIPTION = 'Backup de la base de datos completa'
GO

RESTORE HEADERONLY FROM PDDEVICE_FPF
GO

-----2) DIA LUNES

DECLARE @K iNT
SET @K = 0
WHILE (@K<100)
BEGIN
BEGIN TRAN
INSERT INTO SCOUTING (dato) 
VALUES ('Datos del Lunes')
COMMIT TRAN
SET @K = @K+1
END
GO

BACKUP LOG FPF
TO PDDEVICE_FPF
WITH
	NO_TRUNCATE,
	NAME='BACKLOG',
	DESCRIPTION='BACKUP DEL LOG'
GO

BACKUP DATABASE FPF
TO PDDEVICE_FPF
WITH	
	DIFFERENTIAL,
	NAME='BACKDIF01',
	DESCRIPTION = 'Backup diferencial del Lunes'
GO

RESTORE HEADERONLY FROM PDDEVICE_FPF

-----3) DIA MARTES

DECLARE @K iNT
SET @K = 0
WHILE (@K<100)
BEGIN
BEGIN TRAN
INSERT INTO SCOUTING (dato) 
VALUES ('Datos del Martes')
COMMIT TRAN
SET @K = @K+1
END
GO

BACKUP LOG FPF
TO PDDEVICE_FPF
WITH
	NO_TRUNCATE,
	NAME='BACKLOG',
	DESCRIPTION='BACKUP DEL LOG'
GO

BACKUP DATABASE FPF
TO PDDEVICE_FPF
WITH	
	DIFFERENTIAL,
	NAME='BACKDIF01',
	DESCRIPTION = 'Backup diferencial del Martes'
GO

RESTORE HEADERONLY FROM PDDEVICE_FPF

------4) DIA MIERCOLES

DECLARE @K iNT
SET @K = 0
WHILE (@K<100)
BEGIN
BEGIN TRAN
INSERT INTO SCOUTING (dato) 
VALUES ('Datos del Miercoles')
COMMIT TRAN
SET @K = @K+1
END
GO

SELECT*FROM SCOUTING

BACKUP LOG FPF
TO PDDEVICE_FPF
WITH
	NO_TRUNCATE,
	NAME='BACKLOG',
	DESCRIPTION='BACKUP DEL LOG'
GO

RESTORE HEADERONLY FROM PDDEVICE_FPF

--ERROR EN LA BD
DROP DATABASE FPF

------5) RESTAURACION DE LA BD

RESTORE DATABASE FPF 
FROM PDDEVICE_FPF
WITH FILE = 1, NORECOVERY;
GO

RESTORE DATABASE FPF 
FROM PDDEVICE_FPF
WITH FILE = 5, NORECOVERY;
GO

RESTORE LOG FPF
FROM PDDEVICE_FPF
WITH FILE = 6, RECOVERY;
GO

select*from scouting
go