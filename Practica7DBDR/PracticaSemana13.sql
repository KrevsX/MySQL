--1. Utilizando la base de datos CONTROL_PEDIDOS crear un
--trigger que al insertar un registro nuevo en la tabla
--DETALLE_PEDDIDO descuente el valor del campo cantidad al
--campo existencia.

--2. Crear un trigger que al insertar un registro nuevo en la tabla
--DETALLE_PEDIDO, verifique si hay existencia suficiente. Si no,
--eliminar el registro insertado y enviar un mensaje.

--3. Crear un trigger que cuando elimine un registro en la tabla
--DETALLE_PEDIDO descuente el campo cantidad del campo
--existencia.
USE PEDIDOS
SELECT * FROM DETALLE_PEDIDO
ALTER TABLE DETALLE_PEDIDO
ADD Existencia INT NULL

CREATE TRIGGER Tr_IngRegNuevo_Act
ON DETALLE_PEDIDO
FOR INSERT
AS
PRINT 'LOS DATOS HAN SIDO INGRESADOS CORRECTAMENTE'

INSERT INTO DETALLE_PEDIDO VALUES (
'0001', '100', '11111', '22222','1500')

  DECLARE @cantidad INT, @existencia INT
  SELECT @cantidad = @cantidad FROM inserted
  SELECT @existencia = @existencia FROM inserted
  UPDATE DETALLE_PEDIDO
  SET Existencia = Existencia - @cantidad
  WHERE Existencia = @existencia
INSERT INTO DETALLE_PEDIDO
VALUES(15,10)

/*-----------------------------------------------------------*/
/*trigger simple*/
/*mostrar un mensaje luego de almacenar un cliente*/
CREATE TRIGGER TR_Trigger1
ON CLIENTE
FOR INSERT
AS
PRINT 'UN NUEVO CLIENTE FUE INGRESADO'

INSERT INTO CLIENTE VALUES 
('Maria Rosa Lopez', 'La Union', '2589-9632', 'CLIENTE')
/*-----------------------------------------------------------*/

/*crear un trigger que al CREAR un detalle_pedido me actualice la cantidad del articulo*/
CREATE TRIGGER TR_ActCantidad
ON Detalle_Pedido
FOR INSERT
AS
	DECLARE @vendido INT, @idArticulo INT
	SELECT @vendido = Cantidad FROM inserted
	SELECT @idArticulo = Id_Articulo FROM inserted
	UPDATE ARTICULO 
	SET Existencia = Existencia - @vendido
	WHERE Id_Articulo = @idArticulo

INSERT INTO DETALLE_PEDIDO 
VALUES (1,1,1)