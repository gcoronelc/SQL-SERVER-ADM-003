--CREANDO LA TAREA PARA EL OPERADOR DE LA BASE DE DATOS


--TAREA DE BACKUP DE LOG DE LUNES A SABADO A LAS 2 DE LA TARDE.

USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'BACKUP DEL LOG', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'BACKUP DEL LOG DE LUNES A SABADOS A LAS 2PM', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP1\usuario', 
		@notify_email_operator_name=N'Operador de Base de Datos', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'BACKUP DEL LOG', @server_name = N'LAPTOP1'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'BACKUP DEL LOG', @step_name=N'BACKUP_LOG_UNICO', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'backup log QMImpresiones
to BackupQMImpresiones
with
no_truncate,
name = ''BakLog'',
description = ''Backup del log a las 2 de la tarde''
go
', 
		@database_name=N'master', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'BACKUP DEL LOG', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'BACKUP DEL LOG DE LUNES A SABADOS A LAS 2PM', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP1\usuario', 
		@notify_email_operator_name=N'Operador de Base de Datos', 
		@notify_netsend_operator_name=N'', 
		@notify_page_operator_name=N''
GO
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'BACKUP DEL LOG', @name=N'BACKUP_LOG_CONFIGURACION', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=126, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=8, 
		@active_start_date=20210103, 
		@active_end_date=99991231, 
		@active_start_time=140000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO





--TAREA DE BACKUP DE DIFERENCIAL LOS DIAS MIERCOLES


USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'BACKUP DIFERENCIAL', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'BACKUP DIFERENCIAL DE LOS DIAS MIERCOLES', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP1\usuario', 
		@notify_email_operator_name=N'Operador de Base de Datos', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'BACKUP DIFERENCIAL', @server_name = N'LAPTOP1'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'BACKUP DIFERENCIAL', @step_name=N'BACKUP_DIFERENCIAL_UNICO', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'backup database QMImpresiones
to BackupQMImpresiones
with
differential,
name = ''BakDif'',
description = ''Backup diferencial de los dias miercoles''
go
', 
		@database_name=N'master', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'BACKUP DIFERENCIAL', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'BACKUP DIFERENCIAL DE LOS DIAS MIERCOLES', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP1\usuario', 
		@notify_email_operator_name=N'Operador de Base de Datos', 
		@notify_netsend_operator_name=N'', 
		@notify_page_operator_name=N''
GO
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'BACKUP DIFERENCIAL', @name=N'BACKUP_DIFERENCIAL_CONFIGURACION', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=16, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=8, 
		@active_start_date=20210103, 
		@active_end_date=99991231, 
		@active_start_time=200000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO


 drop database



