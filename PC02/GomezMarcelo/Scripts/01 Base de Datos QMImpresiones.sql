-- ================================ CREACIÓN DE BASE DE DATOS ================================

USE master
GO

CREATE DATABASE QMImpresiones
GO



-- ================================ CREACIÓN DE TABLAS ================================

USE QMImpresiones
GO


CREATE TABLE CLIENTES
(
	idCliente		INTEGER			PRIMARY KEY,
	nomCliente		VARCHAR(50)		NOT NULL,
	rucDni			CHAR(12)		NOT NULL
)
GO


CREATE TABLE PEDIDOS
(
	idPedido		INTEGER			PRIMARY KEY,
	fecha			DATE			NOT NULL,
	precioMillar	MONEY			NOT NULL,
	canPedida		INTEGER			NOT NULL,
	totalFactura	MONEY			NOT NULL,
	idCliente		INTEGER			NOT NULL
)
GO


CREATE TABLE TIPO_TRABAJO
(
	idTrabajo		INTEGER			PRIMARY KEY,
	nomTrab			VARCHAR(50)		NOT NULL
)
GO


CREATE TABLE DETALLE_PEDIDO
(
	idPedido		INTEGER			NOT NULL,
	idTrabajo		INTEGER			NOT NULL
)
GO


CREATE TABLE DETALLE_TRABAJO
(
	idPedido		INTEGER			NOT NULL,
	idTrabajo		INTEGER			NOT NULL,
	idColor			INTEGER			NOT NULL
)
GO


CREATE TABLE COLOR_BARNIZ
(
	idColor			INTEGER			PRIMARY KEY,
	nomColBar		VARCHAR(50)		NOT NULL
)
GO


-- ================================ CREACIÓN DE CLAVES PRIMARIAS ================================

ALTER TABLE DETALLE_PEDIDO
ADD CONSTRAINT pk_detalle_pedido
PRIMARY KEY (idPedido, idTrabajo)
GO

ALTER TABLE DETALLE_TRABAJO
ADD CONSTRAINT	pk_detalle_trabajo
PRIMARY KEY (idPedido, idTrabajo, idColor)
GO


-- ================================ CREACIÓN DE CLAVES FORÁNEAS ================================

ALTER TABLE	PEDIDOS
ADD CONSTRAINT fk_clientes
FOREIGN KEY (idCliente)
REFERENCES CLIENTES
GO

ALTER TABLE DETALLE_PEDIDO
ADD CONSTRAINT fk_pedidos
FOREIGN KEY (idPedido)
REFERENCES PEDIDOS
GO

ALTER TABLE DETALLE_PEDIDO
ADD CONSTRAINT fk_tipo_trabajo
FOREIGN KEY (idTrabajo)
REFERENCES TIPO_TRABAJO
GO

ALTER TABLE DETALLE_TRABAJO
ADD CONSTRAINT fk_detalle_pedido
FOREIGN KEY (idPedido, idTrabajo)
REFERENCES DETALLE_PEDIDO
GO

ALTER TABLE DETALLE_TRABAJO
ADD CONSTRAINT fk_color_barniz
FOREIGN KEY (idColor)
REFERENCES COLOR_BARNIZ
GO


-- ================================ INGRESO DE REGISTROS ================================

INSERT INTO CLIENTES(idCliente, nomCliente, rucDni) VALUES(1, 'FUKUDA', '387463897473')
INSERT INTO CLIENTES(idCliente, nomCliente, rucDni) VALUES(2, 'WILSON', '372983746323')
INSERT INTO CLIENTES(idCliente, nomCliente, rucDni) VALUES(3, 'SCARAMUTTI', '387483947362')
INSERT INTO CLIENTES(idCliente, nomCliente, rucDni) VALUES(4, 'ALARCON', '847362837463')
INSERT INTO CLIENTES(idCliente, nomCliente, rucDni) VALUES(5, 'RAMIREZ', '837463849382')
GO


INSERT INTO TIPO_TRABAJO(idTrabajo, nomTrab) VALUES(1, 'FIGURA')
INSERT INTO TIPO_TRABAJO(idTrabajo, nomTrab) VALUES(2, 'FONDO')
INSERT INTO TIPO_TRABAJO(idTrabajo, nomTrab) VALUES(3, 'BARNIZ')
INSERT INTO TIPO_TRABAJO(idTrabajo, nomTrab) VALUES(4, 'BARNIZ ACRILICO')
GO


INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(1, 'NEGRO')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(2, 'AMARILLO')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(3, 'CYAN')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(4, 'MAGENTA')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(5, 'BRILLO')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(6, 'MATE')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(7, 'VERDE')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(8, 'MORADO')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(9, 'NARANJA')
INSERT INTO COLOR_BARNIZ(idColor, nomColBar) VALUES(10, 'AZUL')
GO


INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(1, '06/01/2020', 80, 800, 80, 4)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(2, '06/08/2020', 80, 800, 80, 4)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(3, '06/08/2020', 70, 300, 70, 5)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(4, '06/08/2020', 20, 1270, 20, 5)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(5, '06/08/2020', 50, 1400, 50, 4)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(6, '07/08/2020', 25, 600, 25, 1)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(7, '07/08/2020', 85, 200, 85, 1)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(8, '07/08/2020', 110, 1100, 110, 2)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(9, '07/08/2020', 80, 4200, 320, 2)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(10, '07/08/2020', 70, 640, 70, 5)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(11, '08/08/2020', 100, 1200, 100, 3)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(12, '08/08/2020', 100, 2200, 200, 3)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(13, '08/08/2020', 70, 200, 70, 2)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(14, '08/08/2020', 20, 200, 20, 4)
INSERT INTO PEDIDOS(idPedido, fecha, precioMillar, canPedida, totalFactura, idCliente) VALUES(15, '08/08/2020', 70, 1100, 70, 5)
GO


INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 1, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 2, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 3, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 4, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 5, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 6, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 7, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 8, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 9, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 10, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 11, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 12, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 13, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 14, 1)
INSERT INTO DETALLE_PEDIDO(idPedido, idTrabajo) VALUES( 15, 1)
GO


INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 1, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 1, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 1, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 1, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 2, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 2, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 2, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 2, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 3, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 3, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 3, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 3, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 4, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 5, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 5, 1, 7)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 6, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 7, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 7, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 7, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 7, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 8, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 8, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 8, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 8, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 8, 1, 8)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 9, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 9, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 9, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 9, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 10, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 10, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 10, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 10, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 11, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 11, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 11, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 11, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 11, 1, 9)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 12, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 12, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 12, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 12, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 12, 1, 10)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 13, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 13, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 13, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 13, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 14, 1, 4)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 15, 1, 1)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 15, 1, 2)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 15, 1, 3)
INSERT INTO DETALLE_TRABAJO(idPedido, idTrabajo, idColor) VALUES( 15, 1, 4)
GO



-- ================================ ESTABLECIMIENTO DEL MODELO DE RECUPERACIÓN  ================================

USE master
GO

ALTER DATABASE QMImpresiones
SET RECOVERY FULL
GO

-- Comprobamos el modelo de recuperación:

SELECT DATABASEPROPERTYEX('QMImpresiones', 'Recovery')
GO



-- ================================ CREACIÓN DEL BACKUP COMPLETO ================================

-- Creamos el dispositivo de backup:

EXEC sp_addumpdevice 'disk', 'BackupQMImpresiones', 'D:\midata\Backup\BackupQMImpresiones.bak' -- Asegurarse de que la dirección exista en su ordenador
GO

-- Verificamos la creación del dispositivo:

SELECT * FROM master.dbo.sysdevices
GO

-- Creación del primer backup completo:

BACKUP DATABASE QMImpresiones
TO BackupQMImpresiones
WITH
	FORMAT,
	NAME = 'BackupBD1',
	DESCRIPTION = 'Backup completo del sábado 8 de agosto.'
GO

-- Verificamos la creación del backup:

RESTORE HEADERONLY FROM BackupQMImpresiones
GO

