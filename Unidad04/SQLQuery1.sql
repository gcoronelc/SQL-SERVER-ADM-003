-- 01 Enviando un mensaje sencillo.
EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL-01', 
@recipients = 'gcoronel@uni.edu.pe', 
@body = 'Enviando de correo desde SQL Server', 
@subject = 'Prueba 01'; 
GO


-- 02 Se envía el resultado de una consulta 
EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL-01', 
@recipients = 'gcoronel@uni.edu.pe', 
@query = 'SELECT * FROM Northwind.dbo.Customers', 
@subject = 'Listado Clientes', 
@attach_query_result_as_file = 1; 
GO


