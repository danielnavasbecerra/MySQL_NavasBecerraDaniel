-- ###########################
-- ##### EJERCICIO DIA 6 #####
-- ###########################


-- TITULO : NORMALIZACION DE BASE DE DATOS
-- ¿Que es Normalizar?: Reducir las posibles redundancias de datos y
-- con ello mejorar la integridad de los datos.

-- Pasos principales para la normalizacion
-- Primera Forma Normal (1NF)
-- Segunda Forma Normal (2NF)
-- Tercera Forma Normal (3NF)


-- ########## Primera Forma Normal (1NF) ##########
-- En la 1NF se busca eliminar las repeticiones de datos y asegurar con ello que cada columna
-- contenga un solo valor atómico (Dato que no se puede dividir, sea por conveniencia o por
-- especificación del lenguaje)

-- Ej: nombreCompleto= PEDRO FELIPE GOMEZ BONILLA --> ¿Es atómico?
-- RTA: No, por que se puede dividir en nombres y apellidos

-- Ej2: nombre= PEDRO FELIPE, apellido= GOMEZ BONILLA --> ¿Es atómico?
-- RTA: Depende del diseñador de base de datos, pues es un criterio muy subjetivo

-- EX1: ¿El siguiente query que está normalizado de acuerdo al 1NF?
CREATE DATABASE dia_6;
USE dia_6;

CREATE TABLE Estudiante(
	ID INT,
	Nombre VARCHAR(100),
	Telefono VARCHAR(15)
);

-- RTA: No, por que el usuario esta ingresando el nombre completo. Aun asi, si el diseñador lo
--      ve pertinente por los requisitos empresariales, lo puede dejar asi.

-- ¿Cómo podemos normalizarla, ya habiendo creado la tabla anteriormente?
ALTER TABLE Estudiante ADD Apellido VARCHAR(100);

-- Prueba de agregación de datos
SHOW TABLES;
sHOW  curso;

-- Revidar columnas creadas con su tipologia de dato
SHOW COLUMNS FROM Estudiante;

-- Manera #2 de mostrar informacion de la tabla
DESCRIBE Estudiante;
INSERT INTO Estudiante(Edad) VALUES(1, 'Pedro', 'Gomez', '3023019865');

-- Alterar la tabla existente
ALTER TABLE Estudiante ADD Edad VARCHAR(2) NOT NULL;
DROP TABLE Estudiante;

-- Ejercicio Clase
CREATE TABLE curso(
	ID_Curso INT,
	Nombre_Curso VARCHAR(50),
	Estudiantes_Inscritos VARCHAR(50)
);

INSERT INTO curso VALUES
	(101,'Matemáticas','Ana, Juan, Maria'),
	(102,'Historia','Pedro, Luis, Ana, Carmen'),
	(103,'Física','Juan, Carmen, Beatriz');

-- Eliminar datos de la tabla
TRUNCATE curso; 
-- Cambiar nombre de una columna en uno tabla
ALTER TABLE curso
RENAME COLUMN Estudiantes_Inscritos to Estudiante;

INSERT INTO curso VALUES
	(101,'Matemáticas','Ana'),
	(101,'Matemáticas','Juan'),
	(101,'Matemáticas','Maria'),
	(102,'Historia','Pedro'),
	(102,'Historia','Luis'),
	(102,'Historia','Ana'),
	(102,'Historia','Carmen'),
	(103,'Física','Juan'),
	(103,'Física','Carmen'),
	(103,'Física','Beatriz');
	



CREATE TABLE estudiante(
	ID_Estudiante VARCHAR(100),
	Nombre_Estudiante VARCHAR(50)
);

CREATE TABLE estudiante_has_curso(
	ID_Estudiante VARCHAR(100),
	ID_Curso VARCHAR(100)
);




-- Desarrollado por Daniel Navas - C.C: 1.***.***.797
