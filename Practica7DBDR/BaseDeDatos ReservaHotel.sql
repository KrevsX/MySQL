/*
SERVER NAME : daesqlserver-test01.database.windows.net
LOGIN : daesqlserver-test01
PASSWORD : Josue123
*/
/*CREACION DE BASE DE DATOS*/
CREATE DATABASE DAE_Resreva
/*INDICAMOS QUE UTILIZAREMOS LA BASE DE DATOS PEDIDO*/
USE DAE_Resreva
GO
/*CREACION DE TABLAS*/
CREATE TABLE Rol
(
	idRol INTEGER PRIMARY KEY IDENTITY(1,1),/*DENOTAMOS QUE SERA LLAVE PRIMARIA AUTOINCREMENTAL EN 1*/
	tipoRol VARCHAR (50) NOT NULL,
);
CREATE TABLE Usuario
(
	idUsuario INTEGER PRIMARY KEY IDENTITY(1,1),/*DENOTAMOS QUE SERA LLAVE PRIMARIA AUTOINCREMENTAL EN 1*/
	idRol INTEGER NOT NULL,
	nombre VARCHAR (150) NOT NULL,
	apellido VARCHAR (150) NOT NULL,
	direccion TEXT NOT NULL,
	fechaNacimiento DATETIME NOT NULL,
	correo  VARCHAR (100) NOT NULL,
	passwordUs VARCHAR (100) NOT NULL,
	CONSTRAINT fk_usuario_rol FOREIGN KEY (idRol) REFERENCES Rol(idRol)/*RELACIONAMOS CON TABLAS*/	
);
CREATE TABLE Hotel
(
	idHotel INTEGER PRIMARY KEY IDENTITY(1,1),/*DENOTAMOS QUE SERA LLAVE PRIMARIA AUTOINCREMENTAL EN 1*/
	nombreHotel VARCHAR (100) NOT NULL,
	ciudad VARCHAR (100) NOT NULL,
);


CREATE TABLE Habitacion
(
	idHabitacion INTEGER PRIMARY KEY IDENTITY(1,1),/*DENOTAMOS QUE SERA LLAVE PRIMARIA AUTOINCREMENTAL EN 1*/
	idHotel INTEGER NOT NULL,
	numHabitacion INTEGER NOT NULL,
	numPiso INTEGER NOT NULL,
	tipoHabitacion VARCHAR (50) NOT NULL,
	caracteristica TEXT NOT NULL,
	precio DECIMAL (4,2) NOT NULL,
	CONSTRAINT fk_habitacion_hotel FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)/*RELACIONAMOS CON TABLAS*/
);
CREATE TABLE Reservacion
(
	idReservacion INTEGER PRIMARY KEY IDENTITY(1,1),/*DENOTAMOS QUE SERA LLAVE PRIMARIA AUTOINCREMENTAL EN 1*/
	idUsuario INTEGER NOT NULL,
	idHabitacion INTEGER NOT NULL,
	cantidadPersonas INTEGER NOT NULL,
	fechaIngreso DATETIME NOT NULL,
	fechaSalida DATETIME NOT NULL,
	CONSTRAINT fk_reservacion_habitacion FOREIGN KEY (idHabitacion) REFERENCES Habitacion(idHabitacion),/*RELACIONAMOS CON TABLAS*/
	CONSTRAINT fk_reservacion_usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)/*RELACIONAMOS CON TABLAS*/
);

CREATE TABLE Pago
(
	idPago INTEGER PRIMARY KEY IDENTITY(1,1),/*DENOTAMOS QUE SERA LLAVE PRIMARIA AUTOINCREMENTAL EN 1*/
	idReservacion INTEGER NOT NULL,
	descuento DECIMAL (4,2) NOT NULL,
	concepto DECIMAL (4,2) NOT NULL,
	metodoPago  VARCHAR (50) NOT NULL,
	CONSTRAINT fk_pago_reservacion FOREIGN KEY (idReservacion) REFERENCES Reservacion(idReservacion)/*RELACIONAMOS CON TABLAS*/
);
CREATE TABLE RegistroHuespedes
(
	idRegistroHuespedes INTEGER PRIMARY KEY IDENTITY(1,1),/*DENOTAMOS QUE SERA LLAVE PRIMARIA AUTOINCREMENTAL EN 1*/
	idPago INTEGER NOT NULL,
	fechaRegistro DATETIME NOT NULL,
	CONSTRAINT fk_registrohuespedes_pago FOREIGN KEY (idPago) REFERENCES Pago(idPago)/*RELACIONAMOS CON TABLAS*/
);
CREATE TABLE Factura
(
	idFactura INTEGER PRIMARY KEY IDENTITY(1,1),/*DENOTAMOS QUE SERA LLAVE PRIMARIA AUTOINCREMENTAL EN 1*/
	idPago INTEGER NOT NULL,
	fechaRegistro DATETIME NOT NULL,
	nombreFactura VARCHAR (100) NOT NULL,
	CONSTRAINT fk_factura_pago FOREIGN KEY (idPago) REFERENCES Pago(idPago)/*RELACIONAMOS CON TABLAS*/
);
/*INGRESAR DATOS*/
SELECT*FROM Factura
SELECT*FROM Pago
SELECT*FROM RegistroHuespedes
SELECT*FROM Habitacion
SELECT*FROM Hotel
SELECT*FROM Reservacion
SELECT*FROM Rol
SELECT*FROM Usuario

SELECT*FROM Hotel
INSERT INTO Hotel VALUES
('Intercontinental','San Salvador'),
('Sheraton Presidente','San Salvador'),
('Mirador Plaza','San Salvador')

SELECT*FROM Habitacion
INSERT INTO Habitacion VALUES
(1,1,1,'Doble','Con Jacuzzi',99),
(1,2,2,'Sencilla','Con Jacuzzi',50),
(1,3,3,'Triple','Con Jacuzzi',20),
(2,1,1,'Doble','Con Jacuzzi',99),
(2,2,1,'Doble','Con Jacuzzi',50),
(2,3,1,'Triple','Con Jacuzzi',60),
(3,1,5,'Premiun','Con Jacuzzi',70),
(3,2,5,'Sencilla','Con Jacuzzi',25),
(3,3,5,'Premiun','Con Jacuzzi',99),
(3,4,5,'Premiun','Con Jacuzzi',99)

SELECT*FROM Rol
INSERT INTO Rol VALUES
('Gerente'),
('Administrador'),
('Cliente')

SELECT*FROM Usuario
INSERT INTO Usuario VALUES
(1,'Mercedes Acosta','Carranza', 'Escalón','1998-09-10','Mercedes@gmail.com','1234'),
(2,'Maria Lourdes','Mejia', 'San Salvador','1998-09-10','Maria@gmail.com','1234'),
(1,'Mario José','Menjivar', 'Santa Tecla','1998-09-10','Mario@gmail.com','1234'),
(2,'Jenifer Karina','Morales', 'Ciudad Merliot', '1998-09-10','Jenifer@gmail.com','1234'),
(1,'Marcelo Alejandro','Mendoza', 'Santa Tecla','1998-09-10','Marcelo@gmail.com','1234'),
(2,'Jorge Antonio','Ramírez', 'San Salvador', '1998-09-10','Jorge@gmail.com','1234'),
(3,'Mercedes Acosta','Carranza', 'Escalón','1998-09-10','Mercedes@gmail.com','1234'),
(3,'Maria Lourdes','Mejia', 'San Salvador','1998-09-10','Maria@gmail.com','1234'),
(3,'Mario José','Menjivar', 'Santa Tecla','1998-09-10','Mario@gmail.com','1234'),
(3,'Jenifer Karina','Morales', 'Ciudad Merliot', '1998-09-10','Jenifer@gmail.com','1234'),
(3,'Marcelo Alejandro','Mendoza', 'Santa Tecla','1998-09-10','Marcelo@gmail.com','1234'),
(3,'Jorge Antonio','Ramírez', 'San Salvador', '1998-09-10','Jorge@gmail.com','1234')

SELECT*FROM Reservacion
INSERT INTO Reservacion VALUES
(3,8,2,'2009-03-03','2009-03-05'),
(2,9,2,'2009-03-03','2009-03-05'),
(4,12,2,'2009-03-03','2009-03-05'),
(5,11,4,'2009-03-03','2009-03-05'),
(9,8,3,'2009-03-03','2009-03-05'),
(6,15,1,'2009-03-03','2009-03-05'),
(7,13,2,'2009-03-03','2009-03-05'),
(8,16,2,'2009-03-03','2009-03-05'),
(9,14,4,'2009-03-03','2009-03-05'),
(8,9,2,'2009-03-03','2009-03-05')


SELECT*FROM RegistroHuespedes
INSERT INTO RegistroHuespedes VALUES
(1,'2009-03-04'),
(4,'2009-03-03'),
(5,'2009-03-05'),
(6,'2009-03-06'),
(7,'2009-03-03'),
(8,'2009-03-07'),
(9,'2009-03-08'),
(10,'2009-03-09'),
(11,'2009-03-05'),
(12,'2009-03-03')
SELECT*FROM Pago
INSERT INTO Pago VALUES
(11,0,50,'Tarjeta'),
(9,20,50,'Efectivo'),
(10,15,50,'Tarjeta'),
(31,10,50,'Efectivo'),
(25,5,50,'Tarjeta'),
(26,25,50,'Efectivo'),
(27,10,50,'Tarjeta'),
(28,20,50,'Efectivo'),
(29,0,50,'Tarjeta'),
(30,20,50,'Efectivo'),
(31,0,50,'Tarjeta')


SELECT*FROM Factura
INSERT INTO Factura VALUES
(1,'2009-03-05','Factura-Intercontinental'),
(4,'2009-03-05','Factura-Sheraton'),
(5,'2009-03-04','Factura-Mirador'),
(6,'2009-03-04','Factura-Intercontinental'),
(7,'2009-03-04','Factura-Mirador'),
(8,'2009-03-05','Factura-Sheraton'),
(9,'2009-03-05','Factura-Intercontinental'),
(10,'2009-03-05','Factura-Sheraton'),
(11,'2009-03-04','Factura-Mirador'),
(12,'2009-03-04','Factura-Intercontinental'),
(13,'2009-03-04','Factura-Mirador'),
(14,'2009-03-05','Factura-Sheraton')


USE DAE_Resreva

/*INDICES PRIMARY KEY*/
SELECT name FROM sysindexes
WHERE name LIKE '%PK%'

/*INDICES CREADOS*/
SELECT name FROM sysindexes
WHERE name LIKE '%Indx_%'

/*INDICE PARA ROL*/
SELECT * FROM Rol
EXEC sp_helpindex 'Rol'
CREATE NONCLUSTERED INDEX Indx_Rol
ON Rol (idRol, tipoRol)

/*INDICE PARA USUARIO*/
SELECT * FROM Usuario
EXEC sp_helpindex 'Usuario'
CREATE UNIQUE INDEX Indx_Usuario
ON Usuario(idUsuario, idRol DESC, nombre , apellido, correo)

/*INDICE PARA RESERVACION*/
SELECT * FROM Reservacion
EXEC sp_helpindex 'Reservacion'
CREATE UNIQUE INDEX Indx_Reservacion
ON Reservacion (idReservacion, idUsuario, idHabitacion ASC, cantidadPersonas, fechaIngreso, fechaSalida)

/*INDICE PARA FACTURA*/
SELECT * FROM Factura
EXEC sp_helpindex 'Factura'
CREATE UNIQUE INDEX Indx_Factura
ON Factura (idFactura, idPago, fechaRegistro, nombreFactura)

/*INDICE PARA PAGO*/
SELECT * FROM Pago
EXEC sp_helpindex 'Factura'
CREATE UNIQUE INDEX Indx_Pago
ON Pago (idPago, idReservacion, concepto, metodoPago)

/*INDICE PARA REGISTRO DE HUESPEDES*/
SELECT * FROM RegistroHuespedes
EXEC sp_helpindex 'RegistroHuespedes'
CREATE UNIQUE INDEX Indx_RegistroHuespedes
ON RegistroHuespedes (idRegistroHuespedes, idPago, fechaRegistro)

/*INDICE PARA HABITACION*/
SELECT * FROM Habitacion
EXEC sp_helpindex 'Habitacion'
CREATE UNIQUE INDEX Indx_Habitacion
ON Habitacion (idHotel, numPiso, numHabitacion, tipoHabitacion, precio, idHabitacion)	

/*INDICE PARA HOTEL*/
SELECT * FROM Hotel
EXEC sp_helpindex 'Hotel'
CREATE UNIQUE INDEX Indx_Hotel
ON Hotel (idHotel, ciudad, nombreHotel)

create view vst_usuario as
SELECT        dbo.Usuario.idUsuario, dbo.Rol.tipoRol,  dbo.Usuario.nombre + ' ' + dbo.Usuario.apellido AS nombre_completo, dbo.Usuario.direccion, dbo.Usuario.fechaNacimiento, dbo.Usuario.correo, dbo.Usuario.passwordUs
FROM            dbo.Rol INNER JOIN
                         dbo.Usuario ON dbo.Rol.idRol = dbo.Usuario.idRol;
GO

create view vst_hotel_habitaciones as
SELECT        dbo.Hotel.idHotel, dbo.Hotel.nombreHotel, dbo.Hotel.ciudad, dbo.Habitacion.numHabitacion, dbo.Habitacion.numPiso, dbo.Habitacion.tipoHabitacion, dbo.Habitacion.caracteristica, dbo.Habitacion.precio
FROM            dbo.Habitacion INNER JOIN
                         dbo.Hotel ON dbo.Habitacion.idHotel = dbo.Hotel.idHotel;
GO

create view vst_reservacion_completa as 
SELECT        dbo.Usuario.idUsuario, dbo.Usuario.nombre + ' ' + dbo.Usuario.apellido AS nombre_completo, dbo.Usuario.direccion, dbo.Usuario.correo, dbo.Hotel.idHotel, dbo.Hotel.nombreHotel, dbo.Hotel.ciudad, 
                         dbo.Habitacion.idHabitacion, dbo.Habitacion.numHabitacion, dbo.Habitacion.numPiso, dbo.Habitacion.tipoHabitacion, dbo.Habitacion.precio
FROM            dbo.Habitacion INNER JOIN
                         dbo.Reservacion ON dbo.Habitacion.idHabitacion = dbo.Reservacion.idHabitacion INNER JOIN
                         dbo.Usuario ON dbo.Reservacion.idUsuario = dbo.Usuario.idUsuario INNER JOIN
                         dbo.Hotel ON dbo.Habitacion.idHotel = dbo.Hotel.idHotel;
GO


create view vst_registro_huespedes_pago as 
SELECT        dbo.RegistroHuespedes.idRegistroHuespedes, dbo.RegistroHuespedes.fechaRegistro, dbo.Pago.idPago, dbo.Pago.idReservacion, dbo.Pago.descuento, dbo.Pago.concepto, dbo.Pago.metodoPago
FROM            dbo.Pago INNER JOIN
                         dbo.RegistroHuespedes ON dbo.Pago.idPago = dbo.RegistroHuespedes.idPago;
GO

SELECT*FROM vst_usuario
SELECT*FROM vst_hotel_habitaciones
SELECT*FROM vst_reservacion_completa
SELECT*FROM vst_registro_huespedes_pago