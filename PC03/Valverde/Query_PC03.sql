--CONFIGURACIOND DEL CORREO DE BASE DE DATOS
--creacion del perfil
EXECUTE msdb.dbo.sysmail_add_profile_sp
@profile_name = 'jose',
@description = 'correo electronico para BD' ;
GO--creacion cuenta de correo de BD@account_name = 'Cuenta_01',
@description = 'Cuenta de correo de FPF.',
@email_address = 'jose.valverde.fl@gmail.com',
@replyto_address = 'jose.valverde.fl@gmail.com',
@port = 25,
@username ='jose.valverde.fl@gmail.com',
@password ='123456',
@use_default_credentials =0,
@enable_ssl = 1,
@display_name = 'JOSE VALVERDE',
@mailserver_name = 'smtp@gmail.com' ;
GO--Agregar cuenta al perfilEXECUTE msdb.dbo.sysmail_add_profileaccount_sp
@profile_name = 'Jose',
@account_name = 'Cuenta_01',
@sequence_number =1 ;
GO--Prueba de correo electronicoEXEC msdb.dbo.sp_send_dbmail
@profile_name = 'jose',
@recipients = 'jose.valverde.fl@gmail.com',
@body = 'Enviando de correo desde SQL Server',
@subject = 'Prueba 01';
GO--PROGRAMACION EN EL AGENTE DE SQL SERVER---Creación del OperadorUSE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'jose', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'jose.valverde.fl@gmail.com'
GO

--Configuracion del agente de sql server
USE [msdb]
GO
EXEC master.dbo.sp_MSsetalertinfo @failsafeoperator=N'jose'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_set_sqlagent_properties @email_save_in_sent_folder=1, 
		@databasemail_profile=N'jose', 
		@use_databasemail=1
GO

--PROGRAMACION DE LOS TRABAJOS

--Backup Full
USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'Backup_Full', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'Backup Full', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-CBI4HA5\Jose', 
		@notify_email_operator_name=N'jose', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'Backup_Full', @server_name = N'DESKTOP-CBI4HA5'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'Backup_Full', @step_name=N'Paso unico', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BACKUP DATABASE FPF
TO PDDEVICE_FPF
WITH
	FORMAT,
	NAME = ''BAKBD_FPF'',
	DESCRIPTION = ''Backup de la base de datos completa''
', 
		@database_name=N'master', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'Backup_Full', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'Backup Full', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-CBI4HA5\Jose', 
		@notify_email_operator_name=N'jose', 
		@notify_page_operator_name=N''
GO
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'Backup_Full', @name=N'Backup_Full', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20210103, 
		@active_end_date=99991231, 
		@active_start_time=190000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO

--Backup Log
USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'Backup_Log', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'Backup Log', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-CBI4HA5\Jose', 
		@notify_email_operator_name=N'jose', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'Backup_Log', @server_name = N'DESKTOP-CBI4HA5'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'Backup_Log', @step_name=N'Paso unico', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BACKUP LOG FPF
TO PDDEVICE_FPF
WITH
	NO_TRUNCATE,
	NAME=''BACKLOG'',
	DESCRIPTION=''BACKUP DEL LOG''', 
		@database_name=N'master', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'Backup_Log', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'Backup Log', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-CBI4HA5\Jose', 
		@notify_email_operator_name=N'jose', 
		@notify_page_operator_name=N''
GO
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'Backup_Log', @name=N'Backup_Log', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=126, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20210103, 
		@active_end_date=99991231, 
		@active_start_time=130000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO

--Backup Diferencial
USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'Backup_Diferencial', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'Backup Diferencial', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-CBI4HA5\Jose', 
		@notify_email_operator_name=N'jose', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'Backup_Diferencial', @server_name = N'DESKTOP-CBI4HA5'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'Backup_Diferencial', @step_name=N'Paso unico', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BACKUP DATABASE FPF
TO PDDEVICE_FPF
WITH	
	DIFFERENTIAL,
	NAME=''BACKDIF01'',
	DESCRIPTION = ''Backup diferencial''', 
		@database_name=N'master', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'Backup_Diferencial', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'Backup Diferencial', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'DESKTOP-CBI4HA5\Jose', 
		@notify_email_operator_name=N'jose', 
		@notify_page_operator_name=N''
GO
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'Backup_Diferencial', @name=N'Backup_Diferencial', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=126, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20210103, 
		@active_end_date=99991231, 
		@active_start_time=190000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO

