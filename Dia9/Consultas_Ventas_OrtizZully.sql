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