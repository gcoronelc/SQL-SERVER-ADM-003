USE [master]

GO

ALTER SERVER AUDIT [Auditoria-Server]
TO FILE 
(		MAXSIZE = 2 GB
)

GO

select * from northwind..Customers;
go

select * from northwind..employees;
go

select * from sysobjects;


DECLARE @PATH VARCHAR(1024) 
SELECT @PATH = LOG_FILE_PATH + '*.*' 
FROM sys.server_file_audits 
WHERE name = 'Auditoria-Database' 

SELECT A.NAME, A.class_desc, A.parent_class_desc, A.covering_parent_action_name, F.* 
FROM sys.fn_get_audit_file (@PATH,default,default) as F left join sys.dm_audit_actions A 
on F.action_id = A.action_id 
ORDER BY EVENT_TIME DESC; 
GO

