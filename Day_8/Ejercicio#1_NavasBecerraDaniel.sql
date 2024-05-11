-- #######################################################
-- ##### consultasElUniversitario EXAMEN #1 (Day_8) ######
-- #######################################################


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
FROM profesor p
LEFT JOIN departamento d  ON p.id_departamento  = d.id
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;


-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT * FROM profesor p WHERE  id_departamento IS NULL;


-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT * FROM departamento d;
SELECT * FROM profesor p;
SELECT * FROM profesor p WHERE id NOT IN (SELECT DISTINCT id_departamento FROM profesor p2); 


-- 4. Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT * FROM profesor p WHERE id NOT IN (SELECT DISTINCT id FROM asignatura a);


-- 5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT a.nombre FROM profesor p 
RIGHT JOIN asignatura a ON p.id = a.id_profesor
WHERE a.id_profesor IS NULL;


-- 6. Devuelve un listado con todos los departamentos que tienen alguna
--    asignatura que no se haya impartido en ningún curso escolar. El
--    resultado debe mostrar el nombre del departamento y el nombre de
--    la asignatura que no se haya impartido nunca.
SELECT d.nombre, a.nombre
FROM departamento d
INNER JOIN profesor p ON d.id = p.id_departamento
INNER JOIN asignatura a ON a.id_profesor = p.id 
LEFT JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura
WHERE asma.id_asignatura IS NULL;


-- 7. Devuelve el número total de alumnas que hay.
SELECT * FROM alumno a WHERE sexo = 'M';
SELECT COUNT(nombre) as cantidadMujeres FROM alumno a WHERE sexo = 'M';


-- 8. Calcula cuántos alumnos nacieron en 1999.
SELECT * FROM alumno a WHERE YEAR(fecha_nacimiento) = 1999;
SELECT COUNT(nombre) as cantidadAumnos FROM alumno a WHERE YEAR(fecha_nacimiento) = 1999;


-- 9. Calcula cuántos profesores hay en cada departamento. El resultado
--    sólo debe mostrar dos columnas, una con el nombre del departamento
--    y otra con el número de profesores que hay en ese departamento. El
--    resultado sólo debe incluir los departamentos que tienen profesores
--    asociados y deberá estar ordenado de mayor a menor por el número de
--    profesores.






-- Desarrollado por Daniel Navas - C.C: 1.***.***.797

