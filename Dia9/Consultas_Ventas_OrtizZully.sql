USE ventas;
-- 1. Obtener el total de pedidos realizados por un cliente 
-- drop function total_pedidos_Clientes;
DELIMITER //
CREATE FUNCTION total_pedidos_Clientes(id_cliente INT)
RETURNS DATE DETERMINISTIC 
BEGIN
	DECLARE total_pedidos DOUBLE;
    SELECT SUM(total)
    INTO total_pedidos FROM pedido p
    WHERE id_cliente = id_cliente;
    RETURN total_pedidos;
END //

DELIMITER ;

select total_pedidos_Clientes(1) as 'Total de pedidos'; 
-- 2. Calcular la comision total ganada por un comercial 

-- 3. Obtener el cliente con mayor total en pedido 

-- 4. Contar la cantidad de pedidos realiados en un año especifico 

-- 5. Obtener el promedio total de pedidos por cliente 

-- CORRECCION
-- 1. Obtener el total de pedidos realizados por un cliente. 

delimiter //
create function total_pedidos(cliente_id int) 
returns int deterministic
begin
    declare total int;
    select count(pedido.id_cliente) into total from pedido
    inner join cliente on pedido.id_cliente = cliente.id 
    where pedido.id_cliente = cliente_id;
    return total;
end //
delimiter ;
select total_pedidos(1) as total_pedidos;

-- 2. Calcular la comisión total ganada por un comercial. 

delimiter //
create function comision_total(comercial_id int) 
returns int deterministic
begin
    declare comision_total int;
    select sum(p.total * c.comision) into comision_total from pedido p 
    inner join comercial c on p.id_comercial = c.id 
    where p.id_comercial = comercial_id;
    return comision_total;
end //
delimiter ;
select comision_total(1) as comision_total_comercial;

-- 3. Obtener el cliente con mayor total en pedidos.

delimiter //
create function cliente_mayor_total()
returns varchar(50) deterministic
begin
    declare cliente_id varchar(50);
    select cliente.nombre into cliente_id from pedido 
    inner join cliente on cliente.id = pedido.id_cliente 
    order by pedido.total desc limit 1;
    return cliente_id;
end //
delimiter ;
select cliente_mayor_total() as cliente_mayor_total;

-- 4. Contar la cantidad de pedidos realizados en un año específico. 

describe pedido;
delimiter // 
create function pedidos_por_ano(fechas int) 
returns int deterministic
begin
    declare cantidad_pedidos int;
    select count(*) into cantidad_pedidos from pedido 
    where year(fecha) = fechas;
    return cantidad_pedidos;
end //
delimiter ;
select pedidos_por_ano(2024) as cantidad_pedidos;

-- 5. Obtener el promedio de total de pedidos por clientes.

DELIMITER //
CREATE FUNCTION promedio_pedidos_cliente1()
RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10, 2);
    SELECT AVG(total) INTO promedio
    FROM pedido;
    RETURN promedio;
END //
DELIMITER ;
SELECT promedio_pedidos_cliente1() AS PromedioTotalPedidos;
