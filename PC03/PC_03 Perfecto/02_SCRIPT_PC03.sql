--BACKUP FULL DE QHATU PERU
USE QhatuPERU
GO
DECLARE @fecha varchar(max)
declare @name varchar(max) 

set @fecha= convert(varchar(max), getdate(),105)
set @name= 'BK_FULL_'+@fecha

backup database QhatuPERU
to Qhatu
with 
format,
name = @name,
description = 'Backup de la base de datos completa'
go


---BACKUP DIFERENCIAL
USE QhatuPERU
GO
DECLARE @fecha varchar(max)
declare @name varchar(max) 

set @fecha= convert(varchar(max), getdate(),105)
set @name= 'BK_DIF_'+@fecha

backup database QhatuPERU
to Qhatu
with 
differential,
name = @name,
description = 'Backup diferencial de la DB'
go

----BACKUP LOG
USE QhatuPERU
GO
DECLARE @fecha varchar(max)
declare @name varchar(max) 

set @fecha= convert(varchar(max), getdate(),105)
set @name= 'BK_LOG_'+@fecha

backup log QhatuPERU 
to Qhatu 
with 
no_truncate, 
name = @name, 
description = 'Backup del log' 
go


restore headeronly from Qhatu
go