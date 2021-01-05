--===================================== AUTOMATIZACIÓN DE LA CREACIÓN DEL BACKUP COMPLETO SEMANAL =====================================

/*

Se usó el siguiente script para programar la creación del backup completo de la base de datos QMImpresiones todos los sábados a las 20 horas.

*/


USE [msdb]
GO

DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name = 'Backup Completo de QMImpresiones', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description = 'Esta backup se realizará una vez a la semana los días sábados.', 
		@category_name = '[Uncategorized (Local)]', 
		@owner_login_name = 'DESKTOP-27MO13J\Marcelo', 
		@notify_email_operator_name = 'Operador de Base de Datos', @job_id = @jobId OUTPUT
SELECT @jobId
GO

EXEC msdb.dbo.sp_add_jobserver @job_name = 'Backup Completo de QMImpresiones', @server_name = 'DESKTOP-27MO13J'
GO

USE [msdb]
GO

EXEC msdb.dbo.sp_add_jobstep @job_name = 'Backup Completo de QMImpresiones', @step_name = 'Backup Completo', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem = 'TSQL', 
		@command = 'BACKUP DATABASE QMImpresiones
					TO BackupQMImpresiones
					WITH
						FORMAT,
						NAME = ''BackupBD1'',
						DESCRIPTION = ''Backup completo del sábado.''
					GO', 
		@database_name = 'master', 
		@flags=0
GO

USE [msdb]
GO

EXEC msdb.dbo.sp_update_job @job_name = 'Backup Completo de QMImpresiones', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description = 'Esta backup se realizará una vez a la semana los días sábados.', 
		@category_name = '[Uncategorized (Local)]', 
		@owner_login_name = 'DESKTOP-27MO13J\Marcelo', 
		@notify_email_operator_name = 'Operador de Base de Datos', 
		@notify_page_operator_name = ''
GO

USE [msdb]
GO

DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name = 'Backup Completo de QMImpresiones', @name = 'Horario Backup Completo QMImpresiones', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=64, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20210103, 
		@active_end_date=99991231, 
		@active_start_time=200000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
SELECT @schedule_id
GO
