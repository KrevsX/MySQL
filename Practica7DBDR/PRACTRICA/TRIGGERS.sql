USE PEDIDOS

/*TRIGGER*/
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
/*--------------------------------------------------------------------------------------*/

/*crear un trigger que al ELIMINAR un detalle_pedido me actualice la cantidad del articulo*/
CREATE TRIGGER TR_ActCantidad2
ON Detalle_Pedido
FOR DELETE
AS
	DECLARE @vendido INT, @idArticulo INT
	SELECT @vendido = Cantidad FROM deleted
	SELECT @idArticulo = Id_Articulo FROM deleted
	UPDATE ARTICULO 
	SET Existencia = Existencia + @vendido
	WHERE Id_Articulo = @idArticulo

	DELETE FROM DETALLE_PEDIDO WHERE Id_DetallePedido = 30
/*--------------------------------------------------------------------------------------*/