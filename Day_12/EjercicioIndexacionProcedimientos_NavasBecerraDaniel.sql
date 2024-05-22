-- ##############################
-- ###### EJERCICIO DIA 12 ######
-- ##############################

-- Optimización de consultas , Programación de Tareas y Triggers

-- Consultar y usar BBDD
use world;
-- drop database world;
show tables;

-- Revisar datos
select * from city;
select count(*) from city;
select * from city where CountryCode = 'GBR';
select count(*) from city where CountryCode = 'GBR';
select * from country;
select count(*) from country;
select * from countrylanguage;
select count(*) from countrylanguage;

-- Creemos un query complejo
select * from city where Name='Peking';
select * from city where CountryCode='CHN';
select * from city where CountryCode='CHN' and Population > 2243000;

-- Creación de una indexación
create index idx_cityName on city(Name);
create index idx_cityCountry on city(CountryCode);

-- Revisar indexaciones creadas
show keys from city; -- Forma 1
show index from city; -- Forma 2

-- Hacer estudio de rendimiento de un index
explain analyze select * from city where Name = 'Bogota';

-- Buscar tamaño de index
select database_name, table_name, index_name, ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
from mysql.innodb_index_stats where stat_name='size' and index_name = "idx_cityName" ;
select *
from mysql.innodb_index_stats;
