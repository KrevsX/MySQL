USE BIBLIOTECA
GO
SELECT*FROM DETALLE_PRESTAMO
SELECT*FROM LIBRO
SELECT*FROM PRESTAMO
SELECT*FROM LECTOR


/*5- Crear un Procedimiento Almacenado para mostrar los PRESTAMO de un LECTOR por medio del Nombre_Lector.*/
CREATE PROC SP_MostrarPrestamo
@Nombre_Lector  VARCHAR(200)
AS 
SELECT *FROM PRESTAMO
WHERE  Id_Lector=(SELECT Id_Lector FROM LECTOR WHERE Nombre_Lector =@Nombre_Lector)

EXEC SP_MostrarPrestamo 'MARIA ROSA POLANCO PARADA'

/*6- Crear un Procedimiento Almacenado para almacenar un LECTOR.*/
CREATE PROC SP_Almacenar
@Nombre AS VARCHAR (100),
@Ciudad AS VARCHAR (100),
@Telefono AS VARCHAR(9)
AS
INSERT INTO LECTOR( Nombre_Lector, Ciudad, Telefono) 
VALUES (@Nombre, @Ciudad, @Telefono)
EXEC SP_Almacenar 'JOSUE NUAM DOMINGUEZ', 'LA PAZ', '7895-6236'