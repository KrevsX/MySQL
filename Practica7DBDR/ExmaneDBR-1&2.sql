/*1. Mostrar los LECTOR con cada uno de sus PRESTAMO realizados.*/
SELECT * FROM LECTOR
SELECT * FROM PRESTAMO

SELECT P.Id_Prestamo,  L.Nombre_Lector,  P.Total_Importe, L.Id_Lector, P.Fecha_Prestamo
FROM LECTOR L
INNER JOIN PRESTAMO P ON P.Id_Lector = L.Id_Lector
GROUP BY P.Id_Prestamo, L.Id_Lector, L.Nombre_Lector, P.Total_Importe, P.Fecha_Prestamo

/*2. Mostrar los PRESTAMO que pertenezcan al LECTOR con nombre 'MARIA ROSA POLANCO PARADA'.*/

SELECT * 
FROM PRESTAMO P
INNER JOIN LECTOR L ON L.Id_Lector = P.Id_Prestamo
WHERE L.Nombre_Lector = 'MARIA ROSA POLANCO PARADA'

/* 6- Crear un Procedimiento Almacenado para almacenar un LECTOR.*/
CREATE PROCEDURE sp_AlmacenarLector(@nom VARCHAR(200), @dire VARCHAR(25), @tel VARCHAR(9))
AS
BEGIN
	INSERT INTO LECTOR VALUES(@nom, @dire, @tel)
END

EXEC sp_AlmacenarLector 'Karina Elizabeth Rivera Mejia', 'SAN SALVADOR', '78965412'

SELECT * FROM LECTOR

/*10- Crear un Trigger que al eliminar un DETALLE_PRESTAMO
me agregue la existencia del LIBRO (para tener actualizada la existencia del libro).*/

SELECT * FROM DETALLE_PRESTAMO
SELECT * FROM LIBRO
SELECT * FROM PRESTAMO

CREATE TRIGGER  trg_DescontarValorDP
ON DETALLE_PRESTAMO
FOR DELETE
AS
	DECLARE @id_DP VARCHAR(20) = (SELECT ISBN FROM DELETED)
	DECLARE @cant tinyint
	SELECT @cant = COUNT(ISBN) FROM DELETED

	UPDATE LIBRO SET Existencia = 
		((SELECT Existencia FROM LIBRO WHERE ISBN = @id_DP) + @cant) 
		WHERE ISBN = @id_DP

DELETE FROM DETALLE_PRESTAMO WHERE Id_DetallePrestamo = 7

