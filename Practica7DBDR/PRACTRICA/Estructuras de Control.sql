USE PEDIDOS
SELECT * FROM CLIENTE
/*ESTRUCTURAS DE CONTROL*/
/*-----------------------IF-ELSE------------------------*/
/*-----------------------------------------------*/
/*Buscar cliente mediante id y enviar mensaje segun corresponda tomando en cuenta si tiene telefono registrado*/
DECLARE @id as int
SET @id = 4
IF (SELECT Telefono FROM CLIENTE WHERE Id_Cliente = @id) != ''
BEGIN
	PRINT 'Sus datos estan completos'
END
ELSE
BEGIN
	PRINT 'Necesita ingresar su numero de telefono'
END
/*-----------------------------------------------*/

/*-----------------------------------------------*/
/*validad si una persona es un menor, adulto o persona mayor a partir de su edad*/
DECLARE @edad INT;
SET @edad = -123

IF (@edad>0 AND @edad <18)
BEGIN
	PRINT 'Menor'
END
ELSE
BEGIN
	IF (@edad>=18 AND @edad <60)
	BEGIN
		PRINT 'Adulto'
	END
	ELSE
	BEGIN
		IF (@edad>=60 AND @edad <120)
		BEGIN
			PRINT 'Adulto Mayor'
		END
		ELSE
		BEGIN
			PRINT 'Verifique la edad ingresada'
		END
	END
END
/*-----------------------------------------------*/

/*-----------------------CASE WHEN------------------------*/
/*-----------------------------------------------*/
/*MODIFICACIONES PERTINENTES*/
ALTER TABLE CLIENTE ADD Tipo_Cliente VARCHAR(20)
UPDATE CLIENTE SET Tipo_Cliente = '2'
UPDATE CLIENTE SET Tipo_Cliente = '1' WHERE Id_Cliente = 1
SELECT * FROM CLIENTE

/*1-ADMINISTRADOR*/
/*2-USUARIO*/

/*crear una consulta que tome el nombre del cliente y muestre el tipo de cliente completo*/
SELECT Nombre_Cliente, Tipo=(CASE Tipo_Cliente
WHEN '1' THEN 'ADMINISTRADOR'
WHEN '2' THEN 'USUARIO'
ELSE NULL
END)
FROM CLIENTE
/*---------------------------------------------------------*/

/*actualizar el tipo de cliente y que lo muestre completo*/
UPDATE CLIENTE 
SET Tipo_Cliente = CASE Tipo_Cliente
WHEN '1' THEN 'ADMINISTRADOR'
WHEN '2' THEN 'USUARIO'
ELSE NULL
END
/*-----------------------------------------------------------------*/

