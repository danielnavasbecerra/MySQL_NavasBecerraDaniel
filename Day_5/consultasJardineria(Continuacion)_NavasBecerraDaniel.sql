-- ####################################################
-- ##### consultasJardineria(CONTINUACION) DIA 5 ######
-- ####################################################


-- ##### DATA BASE #####
-- Uso de la BBDD "Jardineria"
USE Jardineria;

SHOW TABLES;
SELECT * FROM empleado;


-- ##### CONSULTAS #####
-- //* Consultas sobre una tabla *//
-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT id_codigo_oficina, ciudad
FROM oficina;

-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad, telefono, pais
FROM oficina as o
WHERE o.pais = 'España';

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT nombre, apellido1, apellido2, email, id_codigo_jefe 
FROM empleado as e
WHERE e.id_codigo_jefe = 7;

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT puesto, nombre, apellido1, apellido2, email 
FROM empleado as e
WHERE e.id_codigo_jefe <=> NULL;

-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT nombre, apellido1, apellido2, puesto 
FROM empleado as e
WHERE e.puesto != 'Representante Ventas';

-- Devuelve un listado con el nombre de los todos los clientes españoles.

-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- (1*Utilizando la función YEAR de MySQL.)
-- (2*Utilizando la función DATE_FORMAT de MySQL.)
-- (3*Sin utilizar ninguna de las funciones anteriores.)

-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- (1*Utilizando la función ADDDATE de MySQL.)
-- (2*Utilizando la función DATEDIFF de MySQL.)
-- (3*¿Sería posible resolver esta consulta utilizando el operador de suma '+' o resta '-'?)

-- Devuelve un listado de todos los pedidos que fueron en 2009.

-- Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.

-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.





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
