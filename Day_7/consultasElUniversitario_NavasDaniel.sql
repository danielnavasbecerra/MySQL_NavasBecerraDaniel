-- ###############################################
-- ##### consultasElUniversitario EXAMEN #1 ######
-- ###############################################


-- ##### DATA BASE #####
-- Uso de la BBDD "ElUniversitario"
USE ElUniversitario;

-- Ver Tablas de la DataBase
SHOW TABLES;
SELECT * FROM profesor;
SELECT * FROM departamento;


-- ##### CONSULTAS #####
-- //* Consultas a realizar *//

-- 1. Devuelve un listado con los nombres de todos los profesores y los
--    departamentos que tienen vinculados. El listado también debe mostrar
--    aquellos profesores que no tienen ningún departamento asociado.
--    El listado debe devolver cuatro columnas, nombre del departamento,
--    primer apellido, segundo apellido y nombre del profesor. El resultado
--    estará ordenado alfabéticamente de menor a mayor por el nombre del
--    departamento, apellidos y el nombre.
SELECT d.nombre AS NombreDepartamento, apellido1, apellido2, p.nombre AS NombreProfesor
FROM departamento d JOIN profesor p
ON p.id_departamento  = d.id
WHERE ORDER BY DESC d.nombre ;





-- Desarrollado por Daniel Navas - C.C: 1.***.***.797
