-- #####################################
-- ##### consultasJardineria DIA 4 #####
-- #####################################


-- ##### DATA BASE #####
-- Uso de la BBDD "Jardineria"
USE Jardineria;
SELECT * FROM oficina o 

-- ##### CONSULTAS #####
-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas. ### OK ###
SELECT id_codigo_oficina, ciudad
FROM oficina o;

-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad, telefono
FROM oficina o;



-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega
-- de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

-- *Utilizando la función ADDDATE de MySQL.*


-- *Utilizando la función DATEDIFF de MySQL.* ### OK ###
SELECT id_codigo_pedido, id_codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido p
WHERE DATEDIFF(fecha_entrega, fecha_esperada) >= 2;

-- *¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?*



-- Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año. ### ??? ###
SELECT * FROM pedido p WHERE MONTH(fecha_pedido) = "01";

-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente. ###  ###
SELECT DISTINCT  g.gama from cliente as c join pedido as p ON c.id_codigo_cliente
= p.id_codigo_cliente JOIN detalle_pedido as dp
on p.id_codigo_pedido = dp.id_codigo_pedido JOIN producto as p2
on p2.id_codigo_producto = dp.id_codigo_producto JOIN gama_producto as gp on gp.gama = p2.id_gama  



-- Desarrollado por Daniel Navas - C.C: 1.***.***.797