

SELECT a.* 
FROM OPENROWSET('SQLNCLI', 'Server=192.168.1.9;userid=sa;password=sql', 
		'SELECT * FROM EDUTEC.dbo.curso') AS a;


SELECT a.* FROM OPENROWSET('SQLNCLI', 
'server=192.168.1.9;userid=sa;password=sql', 
'SELECT * FROM EDUTEC.dbo.curso') AS a;

SELECT a.*
FROM OPENROWSET('SQLOLEDB',
'Data Source=egcc2020; UID=sa; PWD=sql', 
'SELECT * FROM EDUTEC.dbo.curso') AS a
 

 SELECT a.* FROM OPENROWSET('SQLNCLI', 
 'Server=localhost;Trusted_Connection=yes;', 
 'SELECT * FROM EDUTEC.dbo.curso') AS a;