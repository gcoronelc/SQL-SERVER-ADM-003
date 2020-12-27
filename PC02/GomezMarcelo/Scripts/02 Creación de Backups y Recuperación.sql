--==============================================================
-- DIA LUNES 10 DE AGOSTO
--==============================================================

-- Ingresan transacciones:

USE QMImpresiones
GO

INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(16, '10/08/2020', 25, 525, 25, 2)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(17, '10/08/2020', 25, 350, 25, 2)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(18, '10/08/2020', 25, 1200, 25, 2)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(19, '10/08/2020', 70, 5150, 350, 3)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(20, '10/08/2020', 70, 1120, 70, 4)
GO

INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 16, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 17, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 18, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 19, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 20, 1)
GO

INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 16, 1, 8)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 17, 1, 9)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 18, 1, 10)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 19, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 19, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 19, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 19, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 20, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 20, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 20, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 20, 1, 4)
GO

--===========================================================================
-- A las 2:00 pm empieza el backup del log del dia lunes 10 de Agosto:                    
--===========================================================================

backup log QMImpresiones
to BackupQMImpresiones
with
no_truncate,
name = 'BakLog',
description = 'Backup del log del lunes 10 de agosto.'
go

-- Verificar el backup del log :

restore headeronly from BackupQMImpresiones
go


-- Fallo del servidor:

-- A las 4 de la tarde se produce un error en la base de datos por mal manejo del personal.

use master 
go

drop database QMImpresiones
go


-- Utilizaremos la restauración del backup completo del día sábado.

RESTORE DATABASE QMImpresiones
FROM BackupQMImpresiones
WITH File = 1, NORECOVERY;
go

-- Restaurando el log del lunes:

RESTORE LOG QMImpresiones
FROM BackupQMImpresiones
WITH File = 2, RECOVERY;
go



--==============================================================
-- DIA MARTES 11 DE AGOSTO
--==============================================================

-- Ingresan transacciones:

USE QMImpresiones
GO

INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(21, '11/08/2020', 70, 1000, 70, 3)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(22, '11/08/2020', 70, 300, 70, 5)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(23, '11/08/2020', 70, 300, 70, 5)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(24, '11/08/2020', 105, 1100, 105, 1)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(25, '11/08/2020', 70, 2000, 140, 1)
GO

INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 21, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 22, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 23, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 24, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 24, 3)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 25, 1)
GO

INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 21, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 21, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 21, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 21, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 22, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 22, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 22, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 22, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 23, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 23, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 23, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 23, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 24, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 24, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 24, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 24, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 24, 3, 5)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 25, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 25, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 25, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 25, 1, 4)
GO

--=============================================================================================
-- A las 2:00 pm empieza el backup del log del dia martes 11 de Agosto:
--==============================================================================================

backup log QMImpresiones
to BackupQMImpresiones
with
no_truncate,
name = 'BakLog',
description = 'Backup del log del martes 11 de Agosto.'
go

-- Verficar el backup del log:

restore headeronly from BackupQMImpresiones
go




--=============================================================================
-- DIA MIERCOLES 12 DE AGOSTO
--=============================================================================

-- Ingresan transacciones:

USE QMImpresiones
GO

INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(26, '12/08/2020', 85, 1100, 85, 1)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(27, '12/08/2020', 85, 600, 85, 1)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(28, '12/08/2020', 70, 700, 70, 2)


INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 26, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 27, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 28, 1)


INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 26, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 26, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 26, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 26, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 27, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 27, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 27, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 27, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 28, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 28, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 28, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 28, 1, 4)

--=============================================================================
-- A las 2:00 pm empieza el backup del log del dia miercoles 12 de Agosto:
--=============================================================================

backup log QMImpresiones
to BackupQMImpresiones
with
no_truncate,
name = 'BakLog',
description = 'Backup del log del miercoles 12 de Agosto.'
go

-- Verificación del log:

restore headeronly from BackupQMImpresiones
go

--==========================================================
-- Nuevas Transacciones del dia miercoles 12 de Agosto
--==========================================================
USE QMImpresiones
GO

INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(29, '12/08/2020', 70, 700, 70, 2)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(30, '12/08/2020', 70, 1000, 70, 5)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(31, '12/08/2020', 70, 2000, 140, 5)
GO

INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 29, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 30, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 31, 1)
GO

INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 29, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 29, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 29, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 29, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 30, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 30, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 30, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 30, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 31, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 31, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 31, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 31, 1, 4)
GO


--=============================================================================
-- BACKUP diferencial del dia miercoles 12 de Agosto
--==============================================================================


backup database QMImpresiones
to BackupQMImpresiones
with
differential,
name = 'BakDif01',
description = 'Backup diferencial del miercoles 12 de Agosto.'
go

-- Verificacion del log:

restore headeronly from BackupQMImpresiones
go



--=========================================================================
--DIA JUEVES 13 DE Agosto
--=========================================================================

-- ERROR EN LA BASE DE DATOS:
-- Se produce un error en la base de datos al realizar la apertura del negocio.
-- Fallo del servidor:

use QMImpresiones

drop table DETALLE_TRABAJO

use master
go

drop database QMImpresiones
go


-- Para la recuperación de la base de datos utilizaremos la restauración del backup completo del dia sábado y la diferencial del día miércoles.

RESTORE DATABASE QMImpresiones
FROM BackupQMImpresiones
WITH File = 1, NORECOVERY;
go

-- Restaurando el diferencial del miercoles en la noche:

RESTORE DATABASE QMImpresiones
FROM BackupQMImpresiones
WITH File = 5, RECOVERY;
go

use  QMImpresiones
go



