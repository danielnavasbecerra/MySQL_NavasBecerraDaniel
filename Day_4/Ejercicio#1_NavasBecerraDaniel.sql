-- ###########################
-- ##### EJERCICIO DIA 4 #####
-- ###########################


-- ##### DATA BASE #####
-- Creación y uso de la BBDD "day_4"
CREATE DATABASE day_4;
USE day_4;


-- ##### TABLAS #####
-- Creacion de la tabla 'pais'
CREATE TABLE pais(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20),
	continente VARCHAR(50),
	poblacion INT
);

-- Creacion de la tabla 'idioma'
CREATE TABLE idioma(
	id INT PRIMARY KEY AUTO_INCREMENT,
	idioma VARCHAR(50)
);

-- Creacion de la tabla 'ciudad'
CREATE TABLE ciudad(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20),
	id_pais INT,
	FOREIGN KEY (id_pais) REFERENCES pais(id)
);

-- Creacion de la tabla 'idioma_pais'
CREATE TABLE idioma_pais(
	id_idioma INT,
	id_pais INT,
	es_oficial TINYINT(1),
	FOREIGN KEY (id_idioma) REFERENCES idioma(id),
	FOREIGN KEY (id_pais) REFERENCES pais(id)
);


-- ##### INCERSIONES #####
-- Inserción de datos en la tabla 'pais'
INSERT INTO pais (nombre, continente, poblacion) VALUES
('Estados Unidos', 'América del Norte', 331449281),
('China', 'Asia', 1444216107),
('India', 'Asia', 1393409038),
('Brasil', 'América del Sur', 213993437),
('México', 'América del Norte', 130262216),
('Indonesia', 'Asia', 276361783),
('Japón', 'Asia', 125584838),
('Alemania', 'Europa', 83900473),
('Francia', 'Europa', 65273511),
('Reino Unido', 'Europa', 67886011);

-- Inserción de datos en la tabla 'idioma'
INSERT INTO idioma (idioma) VALUES
('Inglés'),
('Mandarín'),
('Hindi'),
('Espaniol'),
('Portugués'),
('Indonesio'),
('Japonés'),
('Alemán'),
('Francés'),
('Italiano');

-- Inserción de datos en la tabla 'ciudad'
INSERT INTO ciudad (nombre, id_pais) VALUES
('Nueva York', 1),
('Pekín', 2),
('Bombay', 3),
('Sao Paulo', 4),
('Ciudad de México', 5),
('Yakarta', 6),
('Tokio', 7),
('Berlín', 8),
('París', 9),
('Londres', 10);

-- Inserción de datos en la tabla 'idioma_pais'
INSERT INTO idioma_pais (id_idioma, id_pais, es_oficial) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(10, 4, 0),
(4, 5, 1),
(5, 10, 0),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1);


show tables;


##### CONSULTAS #####
-- Consulta general a ciudad
select * from ciudad;

-- Consulta general a paises
select * from pais;

-- Consulta de tipo # INNER JOIN # para obtener las ciudades
-- que están específicamente asignadas a un país
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais inner join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.id = ciudad.id_pais  -- 3. Seleccionar de qué llave primaria o dato principal relacionarse

-- Consulta de tipo # LEFT JOIN # para obtener todas las ciudades
-- junto con su país, incluso si alguna ciudad no está asignada a esta misma
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais left join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.id = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse

-- Consulta de tipo # RIGHT JOIN # para obtener todas las ciudades y países
-- asociadas , donde se incluye también los países que no tienen ciudad
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais right join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.id = ciudad.id_pais  -- 3. Seleccionar de qué llave primaria o dato principal relacionarse

-- Consulta de tipo # FULL OUTER JOIN # para obtener todas las ciudades y países
-- asociadas , independientemente si tienen correspondencia de una tabla u otra
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais left join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.id = ciudad.id_pais -- 3. Seleccionar de qué llave primaria o dato principal relacionarse
union
select pais.nombre as NombrePais, ciudad.nombre as NombreCiudad -- 1. Seleccionar tabla1.columna1 as variable1, tabla2.columna2 as variable2
From pais right join ciudad -- 2. Seleccionar de que tabla a que tabla hacer x tipo de relación
on pais.id  = ciudad.id_pais; -- 3. Seleccionar de qué llave primaria o dato principal relacionarse



-- Desarrollado por Daniel Navas - C.C: 1.***.***.797