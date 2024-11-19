-- 1. Consultar todos los clientes:

SELECT * FROM Clientes;

-- 2. Consultar vehículos disponibles de un tipo específico:

SELECT * FROM Vehiculos WHERE id_tipoV = 3;

-- 3. Listar vehiculos por su numeros de puertas.

SELECT * FROM Vehiculos order by puertas asc;

-- 4. Buscar cliente por cédula.

SELECT * FROM Clientes WHERE cedula = '10987654321';

-- 5. Listar todos los vehículos con sunroof.

SELECT * FROM Vehiculos WHERE sunroof = 'Sí';

-- 6. Contar cuántos vehículos hay por cada tipo.

SELECT id_tipoV, COUNT(*) AS cantidad FROM Vehiculos GROUP BY id_tipoV;

-- 7. Listar empleados de una sucursal

SELECT * FROM  empleados where id_sucursal = 1;

-- 8. Listar los descuentos activos en una fecha dada.

SELECT * FROM Descuentos WHERE '2024-11-18' BETWEEN fecha_inicio AND fecha_fin;

-- 9. Listar vehículos alquilados en los últimos 30 días.

SELECT * FROM Alquileres WHERE fecha_esperada >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 10. Listar vehículos por color.

SELECT * FROM Vehiculos WHERE color = 'Rojo';

-- 11. Listar todos los alquileres y sus respectivos clientes.

SELECT a.id_alquiler, c.nombre1, c.apellido1, a.fecha_salida, a.fecha_llegada
FROM Alquileres a 
JOIN Clientes c ON a.id_cliente = c.id_cliente;

-- 12. Clientes que no han realizado alquileres.

SELECT * FROM Clientes WHERE id_cliente NOT IN (SELECT id_cliente FROM Alquileres);

-- 13. Vehículos con motor V8.

SELECT * FROM Vehiculos WHERE motor = 'V8';

-- 14. Total de ingresos por alquileres:

SELECT SUM(valor_pagado) AS ingresos_totales FROM Alquileres;

-- 15. Listar vehiculos de un tipo.

select * from Vehiculos v inner join Tipo_vehiculo t on v.id_tipoV = t.id_tipoV where v.id_tipoV = 3;

-- 16. Vehículos más alquilados:

SELECT id_vehiculo, COUNT(*) AS veces_alquilado 
FROM Alquileres 
GROUP BY id_vehiculo 
ORDER BY veces_alquilado DESC;

-- 17. Listar todos los descuentos que superen el 15%.

SELECT * FROM Descuentos WHERE porcentaje_descuento > 15;

-- 18. Listar clientes de una ciudad específica.

SELECT * FROM Clientes WHERE ciudad = 'Bogotá';

-- 19. Cantidad de vehículos disponibles por modelo.

SELECT referencia, COUNT(*) AS cantidad FROM Vehiculos GROUP BY referencia;

-- 20. Alquileres ordenados por fecha de inicio:

SELECT * FROM Alquileres ORDER BY fecha_salida DESC;

-- 21. Clientes cuyo nombre comienza con 'A':

SELECT * FROM Clientes WHERE nombre1 LIKE 'A%';

-- 22. Alquileres con costo total mayor a $500:

SELECT * FROM Alquileres WHERE valor_pagado > 500;

-- 23. Descuentos vigentes para un tipo de vehículo específico:

SELECT * FROM Descuentos WHERE id_tipoV = 2 AND '2024-11-18' BETWEEN fecha_inicio AND fecha_fin;

-- 1 funcion 

delimiter //
create function  semanas_dias(fecha_inicio date,fecha_cierre date)
returns varchar(150) deterministic
begin
	declare cant_dias_semanas varchar(150);
    declare cant_dias int;
    declare cant_semanas int;
    declare diferencia_dias int;
    
    set diferencia_dias=TIMESTAMPDIFF(day,fecha_inicio,fecha_cierre);
    
    set cant_semanas = floor(diferencia_dias/7);
    
    set cant_dias= diferencia_dias%7;
    
    set cant_dias_semanas=concat('cantidad de semanas: ',cant_semanas,' cantidad de dias: ',cant_dias);
    
    return cant_dias_semanas;
    
end // delimiter ;

select id_alquiler,semanas_dias(fecha_salida,fecha_llegada) from alquileres;

-- 2 funcion
-- Calcular la cantidad de días de retraso en la entrega de un alquiler

DELIMITER //

CREATE FUNCTION total_ingresos_por_vehiculo(vehiculo_id INT)
RETURNS INT deterministic 
BEGIN
    DECLARE total_ingresos INT;
    
    SELECT SUM(valor_pagado)
    INTO total_ingresos
    FROM Alquileres
    WHERE id_vehiculo = vehiculo_id;

    RETURN IFNULL(total_ingresos, 0);
END //

DELIMITER ;

SELECT total_ingresos_por_vehiculo(1) AS ingresos;

-- Calcular la cantidad de días de retraso en la entrega de un alquiler

DELIMITER //


-- 3 funcion 
-- Calcular el total de ingresos por un vehículo específico

DELIMITER //

CREATE FUNCTION total_ingresos_por_vehiculo(vehiculo_id INT)
RETURNS INT
BEGIN
    DECLARE total_ingresos INT;
    
    SELECT SUM(valor_pagado)
    INTO total_ingresos
    FROM Alquileres
    WHERE id_vehiculo = vehiculo_id;

    RETURN IFNULL(total_ingresos, 0);
END //

DELIMITER ;

SELECT total_ingresos_por_vehiculo(1) AS ingresos;

-- 4 funcion 
-- Obtener el nombre completo de un cliente basado en su ID

DELIMITER //

CREATE FUNCTION nombre_completo_cliente(id_cliente INT)
RETURNS VARCHAR(200) deterministic
BEGIN
    DECLARE nombre_completo VARCHAR(200);
    
    SELECT CONCAT(nombre1, ' ', nombre2, ' ', apellido1, ' ', apellido2)
    INTO nombre_completo
    FROM Clientes
    WHERE id_cliente = id_cliente;

    RETURN nombre_completo;
END //

DELIMITER ;

SELECT nombre_completo_cliente(1) AS nombre;


-- 5 funcion 
DELIMITER //

CREATE FUNCTION contar_vehiculos_por_tipo(tipo_vehiculo_id INT)
RETURNS INT deterministic
BEGIN
    DECLARE cantidad INT;
    
    SELECT COUNT(*)
    INTO cantidad
    FROM Vehiculos
    WHERE id_tipoV = tipo_vehiculo_id;

    RETURN IFNULL(cantidad, 0);
END //

DELIMITER ;

SELECT contar_vehiculos_por_tipo(2) AS vehiculos_disponibles;

