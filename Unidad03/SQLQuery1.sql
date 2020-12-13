
SELECT * FROM DBO.CLIENTE;
GO

select * from [Order Details];
go

begin tran;
go

delete from [Order Details];
go

select * from [Order Details];
go

select @@TRANCOUNT;
go



