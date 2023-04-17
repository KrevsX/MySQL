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

SELECT * FROM PRESTAMO
SELECT * FROM DETALLE_PRESTAMO
SELECT * FROM LIBRO
USE BIBLIOTECA


CREATE PROC NuevosDatos
@existencia AS INT
AS
BEGIN TRY
INSERT INTO PRESTAMO VALUES ('6', '2022-11-13', '15.00', '3')
INSERT INTO DETALLE_PRESTAMO VALUES ('8','2023-01-01', '6', 'ASDF123456')
UPDATE LIBRO SET Existencia = @existencia(SELECT @existencia FROM LIBRO WHERE Existencia = @existencia)
BEGIN TRANSACTION
COMMIT TRANSACTION
PRINT 'LOS DATOS HAN SIDO GUARDADOS EXITOSAMENTE.'
END TRY
BEGIN CATCH
ROLLBACK
PRINT ERROR_MESSAGE() + ' ERROR INESPERADO, INTENTELO NUEVAMENTE'
END CATCH

EXEC NuevosDatos 1



