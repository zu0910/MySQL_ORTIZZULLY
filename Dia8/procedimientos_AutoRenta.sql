

-- 1. Tabla Sucursal 
DELIMITER //
CREATE PROCEDURE InsertarSucursal (
    IN id_sucursal INT,
    IN ubicacion VARCHAR(50),
    IN direccion VARCHAR(50),
    IN ciudad VARCHAR(50),
    IN telefono_fijo VARCHAR(50),
    IN celular VARCHAR(50),
    IN correo_electronico VARCHAR(255)
)
BEGIN
    INSERT INTO Sucursales (id_sucursal, ubicacion, direccion, ciudad, telefono_fijo, celular, correo_electronico)
    VALUES (id_sucursal, ubicacion, direccion, ciudad, telefono_fijo, celular, correo_electronico);
END //
DELIMITER ;

call InsertarSucursal(6, 'Norte', 'Medellín', 'Carrera 15 #85-24', '6047654321', '3159876543', 'norte@sucursal.com');

select * from sucursales;

-- 2. Tabla de empleados

DELIMITER //
CREATE PROCEDURE InsertarEmpleado (
	IN id_empleado INT,
    IN cedula VARCHAR(50),
    IN nombre1 VARCHAR(60),
    IN nombre2 VARCHAR(60),
    IN apellido1 VARCHAR(60),
    IN apellido2 VARCHAR(60),
    IN direccion VARCHAR(50),
    IN ciudad VARCHAR(50),
    IN celular VARCHAR(50),
    IN correo_electronico VARCHAR(50),
    IN id_sucursal INT
)
BEGIN
    INSERT INTO Empleados (id_empleado,cedula, nombre1, nombre2, apellido1, apellido2, direccion, ciudad, celular, correo_electronico, id_sucursal)
    VALUES (id_empleado, cedula, nombre1, nombre2, apellido1, apellido2, direccion, ciudad, celular, correo_electronico, id_sucursal);
END //
DELIMITER ;

call InsertarEmpleado (101, '1029876543', 'Zully', 'Fernanda', 'Ortíz', 'Avendaño', 'Carrera 50 #10-20', 'Medellín', '3147896541', 'zullyorti@gmail.com', 2);
select * from Empleados;

-- 3. Tabla vehiculo 

DELIMITER //
CREATE PROCEDURE InsertarVehiculo (
	IN id_vehiculo INT,
    IN placa VARCHAR(50),
    IN referencia INT,
    IN modelo VARCHAR(50),
    IN puertas INT,
    IN capacidad INT,
    IN sunroof VARCHAR(30),
    IN motor VARCHAR(50),
    IN color VARCHAR(40),
    IN id_tipoV INT
)
BEGIN
    INSERT INTO Vehiculos (id_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color, id_tipoV)
    VALUES (id_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color, id_tipoV);
END //
DELIMITER ;

call InsertarVehiculo (101, 'DEF456', 2022, 'Toyota Corolla', 4, 5, 'No', '1.8L', 'Blanco', 2);
select * from Vehiculos;

-- 4. Tabla tipo_vehiculo.

DELIMITER //
CREATE PROCEDURE InsertarTipoVehiculo(
    IN id_tipoV INT,
    IN valor_alquiler_semana INT,
    IN valor_alquiler_dia INT,
    IN tipo VARCHAR(55)
)
BEGIN
    INSERT INTO tipo_vehiculo (id_tipoV,valor_alquiler_semana, valor_alquiler_dia, tipo )
    VALUES (id_tipoV,valor_alquiler_semana, valor_alquiler_dia, tipo);
END //
DELIMITER ;

call InsertarTipoVehiculo(11, 300000, 18000,'Furgoneta');

select * from tipo_vehiculo;

-- 5. Tabla cliente 

DELIMITER //
CREATE PROCEDURE InsertarClientes (
	IN id_cliente INT,
	IN cedula VARCHAR(50),
	IN nombre1 VARCHAR(60),
	IN nombre2 VARCHAR(60),
	IN apellido1 VARCHAR(60),
	IN apellido2 VARCHAR(60),
	IN direccion VARCHAR(50),
	IN ciudad VARCHAR(50),
	IN celular VARCHAR(20),
	IN correo_electronico VARCHAR(50)
)
BEGIN
    INSERT INTO Clientes (id_cliente,cedula, nombre1, nombre2, apellido1, apellido2, direccion, ciudad, celular, correo_electronico)
    VALUES (id_cliente,cedula, nombre1, nombre2, apellido1, apellido2, direccion, ciudad, celular, correo_electronico);
END //
DELIMITER ;

call InsertarClientes (101, '10987654321', 'Yessica', 'Andrea', 'Machuca', 'Perez', 'Calle 10', 'Bogotá', 3001234033, 'yessica.Machuca@cliente.com');

select * from Clientes;

-- 6. Actualizar los datos de un cliente

 DELIMITER //
CREATE PROCEDURE ActualizarCliente (
    IN id_cliente1 INT,
    IN celular1 VARCHAR(20),
    IN direccion1 VARCHAR(50),
    IN correo_electronico1 VARCHAR(50)
)
BEGIN
    UPDATE Clientes
    SET celular = celular1,
        direccion = direccion1,
        correo_electronico = correo_electronico1
    WHERE id_cliente = id_cliente1;
END //
DELIMITER ;
-- drop procedure ActualizarCliente;

call ActualizarCliente (1, '10987654345', 'Tibu','freiler.ortega@cliente.com');

-- 7. Eliminar un registro por descuento 

DELIMITER //
CREATE PROCEDURE EliminarDescuento (
    IN id_descuento1 INT
)
BEGIN
    DELETE FROM Descuentos
    WHERE id_descuento = id_descuento1;
END //
DELIMITER ;

call EliminarDescuento (1);

select * from Descuentos;

-- 8. Listar empleados por sucursal 

DELIMITER //
CREATE PROCEDURE ListarSucursal (
    IN id_sucursal INT
)
BEGIN
    SELECT e.nombre1, e.apellido1, e.celular, e.correo_electronico
    FROM Empleados e
    WHERE e.id_sucursal = id_sucursal;
END //
DELIMITER ;

call ListarSucursal(2);

-- 9. Insertar un dato a la tabla de descuento

DELIMITER //
CREATE PROCEDURE descuento(
	IN id_descuento INT,
    IN fecha_inicio DATE,
    IN fecha_fin DATE,
    IN porcentaje_descuento INT,
    IN id_tipoV INT)
BEGIN
	INSERT INTO Descuentos(id_descuento, fecha_inicio, fecha_fin, porcentaje_descuento,id_tipoV) 
    VALUES (id_descuento, fecha_inicio, fecha_fin, porcentaje_descuento,id_tipoV);
END
// DELIMITER ;
-- drop procedure descuento;
CALL descuento(101,'2024-05-01', '2024-05-18', 15, 1);
select * from Descuentos; 
select * from Descuentos;

-- 10. Aplicar un descuento a un alquiler 

DELIMITER //
CREATE PROCEDURE AplicarDescuento (
    IN id_alquiler1 INT,
    IN porcentaje1 INT
)
BEGIN
    UPDATE Alquileres
    SET valor_pagado = valor_cotizado - (valor_cotizado * porcentaje1 / 100)
    WHERE id_alquiler = id_alquiler1;
END //
DELIMITER ;

-- drop procedure AplicarDescuento;
CALL AplicarDescuento(1, 10);
