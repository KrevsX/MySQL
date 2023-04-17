CREATE DATABASE PRACTICA7DBDR
USE PRACTICA7DBDR

/**----------------------------------------------------------------------------------------**/
/*Tablas para Practica*/
CREATE TABLE CLIENTE
(
id_Cliente INT not null,
nombre_Cliente VARCHAR(50) not null,
ciudad VARCHAR (20) not null,
telefono VARCHAR (9) not null,
)

/*Instruciones Cliente*/
SELECT * FROM CLIENTE 
INSERT INTO CLIENTE (id_Cliente, nombre_Cliente,ciudad,telefono)
VALUES ('18118', 'Stevan Gonzalez','San Vicente','7988-7777')

DELETE FROM CLIENTE
WHERE id_Cliente = 28181



/*Instruciones Pedido*/
CREATE TABLE PEDIDO
(
id_Pedido INT not null,
fecha_Pedido DATE not null,
id_Cliente INT not null,
total_Importe DECIMAL(5,2) not null,
)
SELECT * FROM PEDIDO
INSERT INTO PEDIDO (id_Pedido, fecha_Pedido, id_Cliente, total_Importe)
VALUES('231', '10-10-2022', '45464','550.00'),
('23', '10-10-2022', '1778','250.00')
UPDATE PEDIDO
SET total_Importe = '900.00', fecha_Pedido = '05-01-2023'
WHERE id_Pedido = 228

/*Actualizacion de Columnas enteras*/

/*SET total_Importe = '600.00', fecha_Pedido = '10-10-2022'*/


/**----------------------------------------------------------------------------------------**/

