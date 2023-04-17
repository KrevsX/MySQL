--7-Utilizando Estructuras de control, tomar un número y determinar 
--si es un numero negativo, cero o positivo


--NUMERO NEGATIVO
DECLARE @numeroNeg INT  /*Declarar Variables*/
SET @numeroNeg = -5625; /*Asignar el dato Variable*/

SELECT @numeroNeg AS 'Es Negativo' /*Mostrar Dato Variable*/

--NUMERO 0
DECLARE @numeroZe INT /*Declarar Variables*/
SET @numeroZe = 0 /*Asignar el dato Variable*/

SELECT @numeroZe AS 'EL NUMERO ES 0' /*Mostrar Dato Variable*/

--NUMERO POSITIVO
DECLARE @numeroPos INT, @resultado INT /*Declarar Variables*/
SET @numeroPos = 10000 /*Asignar el dato Variable*/
SET @resultado = @numeroPos /*Asignar el dato Variable*/

IF @numeroPos > 0 
SELECT @resultado AS 'EL NUMERO ES POSITIVO' /*Mostrar Dato Variable Dato Positivo*/
ELSE 
SELECT @resultado AS 'EL NUMERO ES NEGATIVO' /*Mostrar Dato Variable Negativo*/



--8- Crear una Transacción en la cual pueda ingresar un PRESTAMO,
--un DETALLE_PRESTAMO y me actualice la existencia de libro.
USE BIBLIOTECA
SELECT * FROM PRESTAMO
SELECT * FROM DETALLE_PRESTAMO
SELECT * FROM LIBRO
SELECT * FROM LECTOR


CREATE PROC IngresoDatos_Actualizacion
-------VARIABLES-------

@fechaPrest AS DATE,
@totalImp AS FLOAT,
@idlector AS INT,
@idprestamo AS INT,
@fechaDevo AS DATE,
@isbn AS VARCHAR(50),
@cantAlqui AS INT
-----------------------
AS
BEGIN TRY
	BEGIN TRANSACTION
	/*Agregar nuevos datos a Tabla Prestamo*/
	INSERT INTO PRESTAMO (Fecha_Prestamo, Total_Importe, Id_Lector)
	VALUES (@fechaPrest, @totalImp, @idlector*(SELECT Id_Lector FROM LECTOR WHERE Id_Lector=@idlector))

	/*Agregar nuevos datos a Tabla Detalle Prestamo*/
	INSERT INTO DETALLE_PRESTAMO (Id_Prestamo,Fecha_Devolucion, ISBN)
	VALUES (@idprestamo*(SELECT Id_Prestamo FROM PRESTAMO WHERE Id_Prestamo = @idprestamo),@fechaDevo, @isbn)

	/*Actualizar Existencia Tabla Libro*/
	UPDATE LIBRO SET Existencia = Existencia - @cantAlqui 

	COMMIT TRANSACTION
	PRINT 'LOS DATOS HAN SIDO GUARDADOS EXITOSAMENTE.'
END TRY
	BEGIN CATCH
	ROLLBACK
	PRINT ERROR_MESSAGE() + ' ERROR INESPERADO, INTENTELO NUEVAMENTE'
END CATCH

/*Ingreso de Nuevos Registros*/
EXEC IngresoDatos_Actualizacion 
/*FECHA PRESTAMO:*/			'2022-10-10',
/*TOTAL IMPORTE:*/			 55.55,
/*ID LECTOR:*/				1,
/*ID DETALLEPRESTAMO:*/		1,
/*FECHA DEVOLUCION:*/		'2023-01-01',
/*ISBN:*/					'ASDF123456',
/*CANTIDAD DE ALQUILER:*/	1  
