USE PEDIDOS

SELECT * FROM DETALLE_PEDIDO

ALTER TABLE ARTICULO ADD Existencia INT;


SELECT * FROM ARTICULO 
CREATE PROC SP_AgregarExistencia
/*variables*/
@IdArticulo AS INT,
@stock AS FLOAT
AS
/*ACTUALIZAMOS EXISTENCIA*/
UPDATE ARTICULO 
SET Existencia = @stock
WHERE Id_Articulo = @IdArticulo

/*ejecutamos*/
EXEC SP_AgregarExistencia 1, 130
EXEC SP_AgregarExistencia 2, 430
EXEC SP_AgregarExistencia 3, 31
EXEC SP_AgregarExistencia 4, 56
EXEC SP_AgregarExistencia 5, 78
EXEC SP_AgregarExistencia 6, 23
EXEC SP_AgregarExistencia 7, 54
EXEC SP_AgregarExistencia 8, 81
EXEC SP_AgregarExistencia 9, 30
/*mostrar*/
SELECT * FROM ARTICULO
SELECT * FROM DETALLE_PEDIDO

/*AGREGAR REGISTRO*/
CREATE PROC SP_AgregarRegistro
@Cantidad AS INT,
@IdPedido AS INT,
@IdArticulo AS INT
AS
INSERT INTO DETALLE_PEDIDO (Cantidad,Id_Pedido,Id_Articulo) VALUES (@Cantidad,@IdPedido,@IdArticulo)
UPDATE ARTICULO
SET Existencia = Existencia-@Cantidad
WHERE Id_Articulo = @IdArticulo

EXEC SP_AgregarRegistro 50,1,1


/*ELIMINAR REGISTRO*/
CREATE PROC SP_EliminarRegistro
@IdDetallePedido AS INT
AS
UPDATE ARTICULO 
SET Existencia = Existencia + (SELECT Cantidad FROM DETALLE_PEDIDO WHERE Id_DetallePedido = @IdDetallePedido)
WHERE Id_Articulo =(SELECT Id_Articulo FROM DETALLE_PEDIDO WHERE Id_DetallePedido = @IdDetallePedido)
DELETE DETALLE_PEDIDO
WHERE Id_DetallePedido = @IdDetallePedido

DROP PROC SP_EliminarRegistro
EXEC SP_EliminarRegistro 16
SELECT * FROM ARTICULO
SELECT * FROM DETALLE_PEDIDO

/*CALCULAR*/
CREATE PROC SP_Calcular
@IdPedido AS INT
AS
UPDATE PEDIDO 
SET Total_Importe = (SELECT Precio_UNI FROM ARTICULO WHERE Id_Articulo=(SELECT Id_Articulo FROM DETALLE_PEDIDO WHERE Id_Pedido = @IdPedido))
WHERE Id_Pedido = @IdPedido

EXEC SP_Calcular 2

DROP PROC SP_Calcular

SELECT * FROM PEDIDO
SELECT * FROM ARTICULO
SELECT * FROM DETALLE_PEDIDO
