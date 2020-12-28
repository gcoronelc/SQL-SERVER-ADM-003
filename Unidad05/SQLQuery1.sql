USE EduTec; 
GO 

SELECT * INTO dbo.Curso2 
FROM dbo.Curso WHERE 1=2; 
GO 

SELECT * FROM dbo.Curso2;
GO



SELECT * INTO dbo.Curso3 FROM dbo.Curso WHERE 1=2; 
GO


SELECT * FROM Curso3;
GO




USE EduTec; 
go 

SELECT * INTO dbo.Curso4 FROM dbo.Curso WHERE 1=2; 
GO 

select * from dbo.Curso4; 
go


bulk insert EduTec.dbo.Curso4 
from 'D:\bcp\Curso_A.dat' 
with (formatfile='D:\bcp\Curso.xml'); 

select * from dbo.Curso4; 
go


sp_configure 'show advanced options', 1; 

RECONFIGURE; 
go 

sp_configure; 
GO 

sp_configure 'Ad Hoc Distributed Queries', 1; 

RECONFIGURE; 
GO


SELECT a.* FROM OPENROWSET('SQLNCLI', 'Server=localhost;Trusted_Connection=yes;', 'SELECT * FROM EDUTEC.dbo.curso') AS a;


SELECT a.* 
FROM OPENROWSET('SQLNCLI', 'Server=localhost;userid=sa;password=sql', 
		'SELECT * FROM EDUTEC.dbo.curso') AS a;


