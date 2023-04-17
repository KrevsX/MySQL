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


