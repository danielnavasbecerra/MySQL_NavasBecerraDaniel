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
(10, 4, 1),
(4, 5, 1),
(5, 10, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1);


-- Desarrollado por Daniel Navas - C.C: 1.***.***.797