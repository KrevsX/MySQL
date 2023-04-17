USE PEDIDOS

/*TRANSACCIONES*/
/*-----------------------------------------------------------*/
/*Modificaciones Pertinentes*/
/*agregamos campo*/
ALTER TABLE ARTICULO ADD Existencia TINYINT
/*modificamos stock*/
UPDATE ARTICULO SET Existencia = 5
UPDATE ARTICULO SET Existencia = 2 WHERE Id_Articulo = 2
/*------------------------------------------------------------*/

/*-----------------------TRANSACCIONES IMPLICITAS-----------------------*/
UPDATE ARTICULO SET Existencia = Existencia - 3
/*------------------------------------------------------------*/

SELECT * FROM ARTICULO
SELECT * FROM DETALLE_PEDIDO
SELECT * FROM PEDIDO

/*-----------------------TRANSACCIONES EXPLICITAS-----------------------*/
/*creamos procedimiento almacenado para crear un pedido y inserte el detalle del pedio y a su vez actualice la exitencia de articulo*/
ALTER PROC SP_Venta
/*creacion de variables*/
@IdCliente AS INT,
@IdArticulo AS INT,
@Cantidad AS FLOAT,
@Fecha AS DATE
AS
	/*abrimos el TRY*/
	BEGIN TRY
		/*abrimos la transaccion*/
		BEGIN TRANSACTION
			/*insertamos en tabla pedido*/
			INSERT INTO PEDIDO VALUES (@Fecha, (SELECT Precio_UNI FROM ARTICULO WHERE Id_Articulo = @IdArticulo) * @Cantidad , @IdCliente);

			/*SCOPE_IDENTITY() --Devuelve el último valor de identidad insertado*/

			/*insertamos en tabla detalle pedido*/
			INSERT INTO DETALLE_PEDIDO VALUES (@Cantidad, (SELECT SCOPE_IDENTITY()), @IdArticulo);

			/*actualizamos el Stock de Articulo*/
			UPDATE ARTICULO SET Existencia = Existencia - @Cantidad WHERE Id_Articulo = @IdArticulo;
		
		/*cerramos la ejecucion*/
		COMMIT TRANSACTION
		PRINT 'TODO BIEN'
	/*cerramos el TRY*/
	END TRY

	/*abrimos el CATCH*/
	BEGIN CATCH
	/*en caso de error deja todo como estaba inicialmente*/
	ROLLBACK
	/*muestra nuestro error*/
	PRINT ERROR_MESSAGE() + ' TODO MAL'
	/*cerramos el CATCH*/
	END CATCH


/*ERROR*/
DECLARE @fecha DATE
SET @fecha = convert(datetime, '30/10/2022', 103)
EXEC SP_Venta 2, 2, 3, @fecha

/*SUCCESS*/
DECLARE @fecha DATE
SET @fecha = convert(datetime, '30/10/2022', 103)
EXEC SP_Venta 1, 3, 2, @fecha


/*TRANSACCION SINTAXIS*/
	/*abrimos el TRY*/
	BEGIN TRY
		/*abrimos la transaccion*/
		BEGIN TRANSACTION
		
		/*cerramos la ejecucion*/
		COMMIT TRANSACTION
		PRINT 'TODO NITIDO'
	/*cerramos el TRY*/
	END TRY
	/*abrimos el CATCH*/
	BEGIN CATCH
	/*en caso de error deja todo como estaba inicialmente*/
	ROLLBACK
	/*muestra nuestro error*/
	PRINT ERROR_MESSAGE() + ' CASI NOS PASEAMOS EN LA OLLA DE LECHE'
	/*cerramos el CATCH*/
	END CATCH