-- ####################################
-- ##### diagramaJardineria DIA 4 #####
-- ####################################


-- ##### DATA BASE #####
-- Creación y uso de la BBDD "Jardineria"
CREATE DATABASE Jardineria;
USE Jardineria;


-- ##### TABLAS #####
-- Creacion de la tabla 'oficina'
CREATE TABLE oficina(
	id_codigo_oficina VARCHAR(10) PRIMARY KEY NOT NULL,
	ciudad VARCHAR(30) NOT NULL,
	pais VARCHAR(50) NOT NULL,
	region VARCHAR(50),
	codigo_postal VARCHAR(10) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	linea_direccion1 VARCHAR(50) NOT NULL,
	linea_direccion2 VARCHAR(50)
);

-- Creacion de la tabla 'empleado'
CREATE TABLE empleado(
	id_codigo_empleado INT(11) PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50),
	extension VARCHAR(10) NOT NULL,
	email VARCHAR(100) NOT NULL,
	id_codigo_oficina VARCHAR(10) NOT NULL,
	id_codigo_jefe INT(11),
	puesto VARCHAR(50),
	FOREIGN KEY (id_codigo_oficina) REFERENCES oficina(id_codigo_oficina),
	FOREIGN KEY (id_codigo_jefe) REFERENCES empleado(id_codigo_empleado)
);

-- Creacion de la tabla 'gama_producto'
CREATE TABLE gama_producto(
	id_gama VARCHAR(50) PRIMARY KEY NOT NULL,
	descripcion_texto TEXT,
	descripcion_html TEXT,
	imagen VARCHAR(256)
);

-- Creacion de la tabla 'cliente'
CREATE TABLE cliente(
	id_codigo_cliente INT(11) PRIMARY KEY NOT NULL,
	nombre_cliente VARCHAR(30) NOT NULL,
	nombre_contacto VARCHAR(30),
	apellido_contacto VARCHAR(30),
	telefono VARCHAR(15) NOT NULL,
	fax VARCHAR(15) NOT NULL,
	linea_direccion1 VARCHAR(50) NOT NULL,
	linea_direccion2 VARCHAR(50),
	ciudad VARCHAR(50) NOT NULL,
	region VARCHAR(50),
	pais VARCHAR(50),
	codigo_postal VARCHAR(10),
	id_codigo_empleado_rep_ventas INT(11),
	limite_credito DECIMAL(15,2),
	FOREIGN KEY (id_codigo_empleado_rep_ventas) REFERENCES empleado(id_codigo_empleado)
);

-- Creacion de la tabla 'pedido'
CREATE TABLE pedido(
	id_codigo_pedido INT(11) PRIMARY KEY NOT NULL,
	fecha_pedido DATE NOT NULL,
	fecha_esperada DATE NOT NULL,
	fecha_entrega DATE,
	estado VARCHAR(15) NOT NULL,
	comentarios TEXT,
	id_codigo_cliente INT(11) NOT NULL,
	FOREIGN KEY (id_codigo_cliente) REFERENCES cliente(id_codigo_cliente)
);

-- Creacion de la tabla 'producto'
CREATE TABLE producto(
	id_codigo_producto VARCHAR(15) PRIMARY KEY NOT NULL,
	nombre VARCHAR(70) NOT NULL,
	id_gama VARCHAR(50) NOT NULL,
	dimensiones VARCHAR(25),
	preoveedor VARCHAR(50),
	descripcion TEXT,
	cantidad_en_stok SMALLINT(6) NOT NULL,
	precio_venta DECIMAL(15,2) NOT NULL,
	precio_proveedor DECIMAL(15,2),
	FOREIGN KEY (id_gama) REFERENCES gama_producto(id_gama)
);

-- Creacion de la tabla 'detalle_pedido'
CREATE TABLE detalle_pedido(
	id_codigo_pedido INT(11),
	id_codigo_producto VARCHAR(15),
	cantidad INT(11) NOT NULL,
	precio_unidad DECIMAL(15,2) NOT NULL,
	numero_linea SMALLINT(6) NOT NULL,
	FOREIGN KEY (id_codigo_pedido) REFERENCES pedido(id_codigo_pedido),
	FOREIGN KEY (id_codigo_producto) REFERENCES producto(id_codigo_producto)
);

-- Creacion de la tabla 'pago'
CREATE TABLE pago(
	id_codigo_cliente INT(11),
	forma_pago VARCHAR(40) NOT NULL,
	id_transaccion VARCHAR(50) PRIMARY KEY NOT NULL,
	fecha_pago DATE NOT NULL,
	total DECIMAL(15,2) NOT NULL,
	FOREIGN KEY (id_codigo_cliente) REFERENCES cliente(id_codigo_cliente)
);


-- ##### INSERTS #####
-- Insercion tabla oficina
INSERT INTO oficina VALUES ('BCN-ES','Barcelona','España','Barcelona','08019','+34 93 3561182','Avenida Diagonal, 38','3A escalera Derecha');
INSERT INTO oficina VALUES ('BOS-USA','Boston','EEUU','MA','02108','+1 215 837 0825','1550 Court Place','Suite 102');
INSERT INTO oficina VALUES ('LON-UK','Londres','Inglaterra','EMEA','EC2N 1HN','+44 20 78772041','52 Old Broad Street','Ground Floor');
INSERT INTO oficina VALUES ('MAD-ES','Madrid','España','Madrid','28032','+34 91 7514487','Bulevar Indalecio Prieto, 32','');
INSERT INTO oficina VALUES ('PAR-FR','Paris','Francia','EMEA','75017','+33 14 723 4404','29 Rue Jouffroy d''abbans','');
INSERT INTO oficina VALUES ('SFC-USA','San Francisco','EEUU','CA','94080','+1 650 219 4782','100 Market Street','Suite 300');
INSERT INTO oficina VALUES ('SYD-AU','Sydney','Australia','APAC','NSW 2010','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2');
INSERT INTO oficina VALUES ('TAL-ES','Talavera de la Reina','España','Castilla-LaMancha','45632','+34 925 867231','Francisco Aguirre, 32','5º piso (exterior)');
INSERT INTO oficina VALUES ('TOK-JP','Tokyo','Japón','Chiyoda-Ku','102-8578','+81 33 224 5000','4-1 Kioicho','');

-- Insercion tabla empleado
INSERT INTO empleado VALUES (1,'Marcos','Magaña','Perez','3897','marcos@jardineria.es','TAL-ES',NULL,'Director General');
INSERT INTO empleado VALUES (2,'Ruben','López','Martinez','2899','rlopez@jardineria.es','TAL-ES',1,'Subdirector Marketing');
INSERT INTO empleado VALUES (3,'Alberto','Soria','Carrasco','2837','asoria@jardineria.es','TAL-ES',2,'Subdirector Ventas');
INSERT INTO empleado VALUES (4,'Maria','Solís','Jerez','2847','msolis@jardineria.es','TAL-ES',2,'Secretaria');
INSERT INTO empleado VALUES (5,'Felipe','Rosas','Marquez','2844','frosas@jardineria.es','TAL-ES',3,'Representante Ventas');
INSERT INTO empleado VALUES (6,'Juan Carlos','Ortiz','Serrano','2845','cortiz@jardineria.es','TAL-ES',3,'Representante Ventas');
INSERT INTO empleado VALUES (7,'Carlos','Soria','Jimenez','2444','csoria@jardineria.es','MAD-ES',3,'Director Oficina');
INSERT INTO empleado VALUES (8,'Mariano','López','Murcia','2442','mlopez@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO empleado VALUES (9,'Lucio','Campoamor','Martín','2442','lcampoamor@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO empleado VALUES (10,'Hilario','Rodriguez','Huertas','2444','hrodriguez@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO empleado VALUES (11,'Emmanuel','Magaña','Perez','2518','manu@jardineria.es','BCN-ES',3,'Director Oficina');
INSERT INTO empleado VALUES (12,'José Manuel','Martinez','De la Osa','2519','jmmart@hotmail.es','BCN-ES',11,'Representante Ventas');
INSERT INTO empleado VALUES (13,'David','Palma','Aceituno','2519','dpalma@jardineria.es','BCN-ES',11,'Representante Ventas');
INSERT INTO empleado VALUES (14,'Oscar','Palma','Aceituno','2519','opalma@jardineria.es','BCN-ES',11,'Representante Ventas');
INSERT INTO empleado VALUES (15,'Francois','Fignon','','9981','ffignon@gardening.com','PAR-FR',3,'Director Oficina');
INSERT INTO empleado VALUES (16,'Lionel','Narvaez','','9982','lnarvaez@gardening.com','PAR-FR',15,'Representante Ventas');
INSERT INTO empleado VALUES (17,'Laurent','Serra','','9982','lserra@gardening.com','PAR-FR',15,'Representante Ventas');
INSERT INTO empleado VALUES (18,'Michael','Bolton','','7454','mbolton@gardening.com','SFC-USA',3,'Director Oficina');
INSERT INTO empleado VALUES (19,'Walter Santiago','Sanchez','Lopez','7454','wssanchez@gardening.com','SFC-USA',18,'Representante Ventas');
INSERT INTO empleado VALUES (20,'Hilary','Washington','','7565','hwashington@gardening.com','BOS-USA',3,'Director Oficina');
INSERT INTO empleado VALUES (21,'Marcus','Paxton','','7565','mpaxton@gardening.com','BOS-USA',20,'Representante Ventas');
INSERT INTO empleado VALUES (22,'Lorena','Paxton','','7665','lpaxton@gardening.com','BOS-USA',20,'Representante Ventas');
INSERT INTO empleado VALUES (23,'Nei','Nishikori','','8734','nnishikori@gardening.com','TOK-JP',3,'Director Oficina');
INSERT INTO empleado VALUES (24,'Narumi','Riko','','8734','nriko@gardening.com','TOK-JP',23,'Representante Ventas');
INSERT INTO empleado VALUES (25,'Takuma','Nomura','','8735','tnomura@gardening.com','TOK-JP',23,'Representante Ventas');
INSERT INTO empleado VALUES (26,'Amy','Johnson','','3321','ajohnson@gardening.com','LON-UK',3,'Director Oficina');
INSERT INTO empleado VALUES (27,'Larry','Westfalls','','3322','lwestfalls@gardening.com','LON-UK',26,'Representante Ventas');
INSERT INTO empleado VALUES (28,'John','Walton','','3322','jwalton@gardening.com','LON-UK',26,'Representante Ventas');
INSERT INTO empleado VALUES (29,'Kevin','Fallmer','','3210','kfalmer@gardening.com','SYD-AU',3,'Director Oficina');
INSERT INTO empleado VALUES (30,'Julian','Bellinelli','','3211','jbellinelli@gardening.com','SYD-AU',29,'Representante Ventas');
INSERT INTO empleado VALUES (31,'Mariko','Kishi','','3211','mkishi@gardening.com','SYD-AU',29,'Representante Ventas');

-- Insercion tabla gama_producto
INSERT INTO gama_producto VALUES ('Herbaceas','Plantas para jardin decorativas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Herramientas','Herramientas para todo tipo de acción',NULL,NULL);
INSERT INTO gama_producto VALUES ('Aromáticas','Plantas aromáticas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Frutales','Árboles pequeños de producción frutal',NULL,NULL);
INSERT INTO gama_producto VALUES ('Ornamentales','Plantas vistosas para la decoración del jardín',NULL,NULL);

-- Insercion tabla cliente
INSERT INTO cliente VALUES (1,'GoldFish Garden','Daniel G','GoldFish','5556901745','5556901746','False Street 52 2 A',NULL,'San Francisco',NULL,'USA','24006',19,3000);
INSERT INTO cliente VALUES (3,'Gardening Associates','Anne','Wright','5557410345','5557410346','Wall-e Avenue',NULL,'Miami','Miami','USA','24010',19,6000);
INSERT INTO cliente VALUES (4,'Gerudo Valley','Link','Flaute','5552323129','5552323128','Oaks Avenue nº22',NULL,'New York',NULL,'USA','85495',22,12000);
INSERT INTO cliente VALUES (5,'Tendo Garden','Akane','Tendo','55591233210','55591233211','Null Street nº69',NULL,'Miami',NULL,'USA','696969',22,600000);
INSERT INTO cliente VALUES (6,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);
INSERT INTO cliente VALUES (7,'Beragua','Jose','Bermejo','654987321','916549872','C/pintor segundo','Getafe','Madrid','Madrid','Spain','28942',11,20000);
INSERT INTO cliente VALUES (8,'Club Golf Puerta del hierro','Paco','Lopez','62456810','919535678','C/sinesio delgado','Madrid','Madrid','Madrid','Spain','28930',11,40000);
INSERT INTO cliente VALUES (9,'Naturagua','Guillermo','Rengifo','689234750','916428956','C/majadahonda','Boadilla','Madrid','Madrid','Spain','28947',11,32000);
INSERT INTO cliente VALUES (10,'DaraDistribuciones','David','Serrano','675598001','916421756','C/azores','Fuenlabrada','Madrid','Madrid','Spain','28946',11,50000);
INSERT INTO cliente VALUES (11,'Madrileña de riegos','Jose','Tacaño','655983045','916689215','C/Lagañas','Fuenlabrada','Madrid','Madrid','Spain','28943',11,20000);
INSERT INTO cliente VALUES (12,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);
INSERT INTO cliente VALUES (13,'Camunas Jardines S.L.','Pedro','Camunas','34914873241','34914871541','C/Virgenes 45','C/Princesas 2 1ºB','San Lorenzo del Escorial','Madrid','Spain','28145',8,16481);
INSERT INTO cliente VALUES (14,'Dardena S.A.','Juan','Rodriguez','34912453217','34912484764','C/Nueva York 74',NULL,'Madrid','Madrid','Spain','28003',8,321000);
INSERT INTO cliente VALUES (15,'Jardin de Flores','Javier','Villar','654865643','914538776','C/ Oña 34',NULL,'Madrid','Madrid','Spain','28950',30,40000);
INSERT INTO cliente VALUES (16,'Flores Marivi','Maria','Rodriguez','666555444','912458657','C/Leganes24',NULL,'Fuenlabrada','Madrid','Spain','28945',5,1500);
INSERT INTO cliente VALUES (17,'Flowers, S.A','Beatriz','Fernandez','698754159','978453216','C/Luis Salquillo4',NULL,'Montornes del valles','Barcelona','Spain','24586',5,3500);
INSERT INTO cliente VALUES (18,'Naturajardin','Victoria','Cruz','612343529','916548735','Plaza Magallón 15',NULL,'Madrid','Madrid','Spain','28011',30,5050);
INSERT INTO cliente VALUES (19,'Golf S.A.','Luis','Martinez','916458762','912354475','C/Estancado',NULL,'Santa cruz de Tenerife','Islas Canarias','Spain','38297',12,30000);
INSERT INTO cliente VALUES (20,'Americh Golf Management SL','Mario','Suarez','964493072','964493063','C/Letardo',NULL,'Barcelona','Cataluña','Spain','12320',12,20000);
INSERT INTO cliente VALUES (21,'Aloha','Cristian','Rodrigez','916485852','914489898','C/Roman 3',NULL,'Canarias','Canarias','Spain','35488',12,50000);
INSERT INTO cliente VALUES (22,'El Prat','Francisco','Camacho','916882323','916493211','Avenida Tibidabo',NULL,'Barcelona','Cataluña','Spain','12320',12,30000);
INSERT INTO cliente VALUES (23,'Sotogrande','Maria','Santillana','915576622','914825645','C/Paseo del Parque',NULL,'Sotogrande','Cadiz','Spain','11310',12,60000);
INSERT INTO cliente VALUES (24,'Vivero Humanes','Federico','Gomez','654987690','916040875','C/Miguel Echegaray 54',NULL,'Humanes','Madrid','Spain','28970',30,7430);
INSERT INTO cliente VALUES (25,'Fuenla City','Tony','Muñoz Mena','675842139','915483754','C/Callo 52',NULL,'Fuenlabrada','Madrid','Spain','28574',5,4500);
INSERT INTO cliente VALUES (26,'Jardines y Mansiones Cactus SL','Eva María','Sánchez','916877445','914477777','Polígono Industrial Maspalomas, Nº52','Móstoles','Madrid','Madrid','Spain','29874',9,76000);
INSERT INTO cliente VALUES (27,'Jardinerías Matías SL','Matías','San Martín','916544147','917897474','C/Francisco Arce, Nº44','Bustarviejo','Madrid','Madrid','Spain','37845',9,100500);
INSERT INTO cliente VALUES (28,'Agrojardin','Benito','Lopez','675432926','916549264','C/Mar Caspio 43',NULL,'Getafe','Madrid','Spain','28904',30,8040);
INSERT INTO cliente VALUES (29,'Top Campo','Joseluis','Sanchez','685746512','974315924','C/Ibiza 32',NULL,'Humanes','Madrid','Spain','28574',5,5500);
INSERT INTO cliente VALUES (30,'Jardineria Sara','Sara','Marquez','675124537','912475843','C/Lima 1',NULL,'Fuenlabrada','Madrid','Spain','27584',5,7500);
INSERT INTO cliente VALUES (31,'Campohermoso','Luis','Jimenez','645925376','916159116','C/Peru 78',NULL,'Fuenlabrada','Madrid','Spain','28945',30,3250);
INSERT INTO cliente VALUES (32,'france telecom','FraÃ§ois','Toulou','(33)5120578961','(33)5120578961','6 place d Alleray 15Ã¨me',NULL,'Paris',NULL,'France','75010',16,10000);
INSERT INTO cliente VALUES (33,'Musée du Louvre','Pierre','Delacroux','(33)0140205050','(33)0140205442','Quai du Louvre',NULL,'Paris',NULL,'France','75058',16,30000);
INSERT INTO cliente VALUES (35,'Tutifruti S.A','Jacob','Jones','2 9261-2433','2 9283-1695','level 24, St. Martins Tower.-31 Market St.',NULL,'Sydney','Nueva Gales del Sur','Australia','2000',31,10000);
INSERT INTO cliente VALUES (36,'Flores S.L.','Antonio','Romero','654352981','685249700','Avenida España',NULL,'Madrid','Fuenlabrada','Spain','29643',18,6000);
INSERT INTO cliente VALUES (37,'The Magic Garden','Richard','Mcain','926523468','9364875882','Lihgting Park',NULL,'London','London','United Kingdom','65930',18,10000);
INSERT INTO cliente VALUES (38,'El Jardin Viviente S.L','Justin','Smith','2 8005-7161','2 8005-7162','176 Cumberland Street The rocks',NULL,'Sydney','Nueva Gales del Sur','Australia','2003',31,8000);

-- Insercion tabla pedido
INSERT INTO pedido VALUES (1,'2006-01-17','2006-01-19','2006-01-19','Entregado','Pagado a plazos',5);
INSERT INTO pedido VALUES (2,'2007-10-23','2007-10-28','2007-10-26','Entregado','La entrega llego antes de lo esperado',5);
INSERT INTO pedido VALUES (3,'2008-06-20','2008-06-25',NULL,'Rechazado','Limite de credito superado',5);
INSERT INTO pedido VALUES (4,'2009-01-20','2009-01-26',NULL,'Pendiente',NULL,5);
INSERT INTO pedido VALUES (8,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas',1);
INSERT INTO pedido VALUES (9,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1);
INSERT INTO pedido VALUES (10,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3);
INSERT INTO pedido VALUES (11,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1);
INSERT INTO pedido VALUES (12,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1);
INSERT INTO pedido VALUES (13,'2009-01-12','2009-01-14','2009-01-15','Entregado',NULL,7);
INSERT INTO pedido VALUES (14,'2009-01-02','2009-01-02',null,'Rechazado','mal pago',7);
INSERT INTO pedido VALUES (15,'2009-01-09','2009-01-12','2009-01-11','Entregado',NULL,7);
INSERT INTO pedido VALUES (16,'2009-01-06','2009-01-07','2009-01-15','Entregado',NULL,7);
INSERT INTO pedido VALUES (17,'2009-01-08','2009-01-09','2009-01-11','Entregado','mal estado',7);
INSERT INTO pedido VALUES (18,'2009-01-05','2009-01-06','2009-01-07','Entregado',NULL,9);
INSERT INTO pedido VALUES (19,'2009-01-18','2009-02-12',NULL,'Pendiente','entregar en murcia',9);
INSERT INTO pedido VALUES (20,'2009-01-20','2009-02-15',NULL,'Pendiente',NULL,9);
INSERT INTO pedido VALUES (21,'2009-01-09','2009-01-09','2009-01-09','Rechazado','mal pago',9);
INSERT INTO pedido VALUES (22,'2009-01-11','2009-01-11','2009-01-13','Entregado',NULL,9);
INSERT INTO pedido VALUES (23,'2008-12-30','2009-01-10',NULL,'Rechazado','El pedido fue anulado por el cliente',5);
INSERT INTO pedido VALUES (24,'2008-07-14','2008-07-31','2008-07-25','Entregado',NULL,14);
INSERT INTO pedido VALUES (25,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta asociada',1);
INSERT INTO pedido VALUES (26,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mas producto',3);
INSERT INTO pedido VALUES (27,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3);
INSERT INTO pedido VALUES (28,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bastante de la espera asociada al producto',3);
INSERT INTO pedido VALUES (29,'2008-08-01','2008-09-01','2008-09-01','Rechazado','El cliente no está conforme con el pedido',14);
INSERT INTO pedido VALUES (30,'2008-08-03','2008-09-03','2008-08-31','Entregado',NULL,13);
INSERT INTO pedido VALUES (31,'2008-09-04','2008-09-30','2008-10-04','Rechazado','El cliente ha rechazado por llegar 5 dias tarde',13);
INSERT INTO pedido VALUES (32,'2007-01-07','2007-01-19','2007-01-27','Entregado','Entrega tardia, el cliente puso reclamacion',4);
INSERT INTO pedido VALUES (33,'2007-05-20','2007-05-28',NULL,'Rechazado','El pedido fue anulado por el cliente',4);
INSERT INTO pedido VALUES (34,'2007-06-20','2008-06-28','2008-06-28','Entregado','Pagado a plazos',4);
INSERT INTO pedido VALUES (35,'2008-03-10','2009-03-20',NULL,'Rechazado','Limite de credito superado',4);
INSERT INTO pedido VALUES (36,'2008-10-15','2008-12-15','2008-12-10','Entregado',NULL,14);
INSERT INTO pedido VALUES (37,'2008-11-03','2009-11-13',NULL,'Pendiente','El pedido nunca llego a su destino',4);
INSERT INTO pedido VALUES (38,'2009-03-05','2009-03-06','2009-03-07','Entregado',NULL,19);
INSERT INTO pedido VALUES (39,'2009-03-06','2009-03-07','2009-03-09','Pendiente',NULL,19);
INSERT INTO pedido VALUES (40,'2009-03-09','2009-03-10','2009-03-13','Rechazado',NULL,19);
INSERT INTO pedido VALUES (41,'2009-03-12','2009-03-13','2009-03-13','Entregado',NULL,19);
INSERT INTO pedido VALUES (42,'2009-03-22','2009-03-23','2009-03-27','Entregado',NULL,19);
INSERT INTO pedido VALUES (43,'2009-03-25','2009-03-26','2009-03-28','Pendiente',NULL,23);
INSERT INTO pedido VALUES (44,'2009-03-26','2009-03-27','2009-03-30','Pendiente',NULL,23);
INSERT INTO pedido VALUES (45,'2009-04-01','2009-03-04','2009-03-07','Entregado',NULL,23);
INSERT INTO pedido VALUES (46,'2009-04-03','2009-03-04','2009-03-05','Rechazado',NULL,23);
INSERT INTO pedido VALUES (47,'2009-04-15','2009-03-17','2009-03-17','Entregado',NULL,23);
INSERT INTO pedido VALUES (48,'2008-03-17','2008-03-30','2008-03-29','Entregado','Según el Cliente, el pedido llegó defectuoso',26);
INSERT INTO pedido VALUES (49,'2008-07-12','2008-07-22','2008-07-30','Entregado','El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora',26);
INSERT INTO pedido VALUES (50,'2008-03-17','2008-08-09',NULL,'Pendiente','Al parecer, el pedido se ha extraviado a la altura de Sotalbo (Ávila)',26);
INSERT INTO pedido VALUES (51,'2008-10-01','2008-10-14','2008-10-14','Entregado','Todo se entregó a tiempo y en perfecto estado, a pesar del pésimo estado de las carreteras.',26);
INSERT INTO pedido VALUES (52,'2008-12-07','2008-12-21',NULL,'Pendiente','El transportista ha llamado a Eva María para indicarle que el pedido llegará más tarde de lo esperado.',26);
INSERT INTO pedido VALUES (53,'2008-10-15','2008-11-15','2008-11-09','Entregado','El pedido llega 6 dias antes',13);
INSERT INTO pedido VALUES (54,'2009-01-11','2009-02-11',NULL,'Pendiente',NULL,14);
INSERT INTO pedido VALUES (55,'2008-12-10','2009-01-10','2009-01-11','Entregado','Retrasado 1 dia por problemas de transporte',14);
INSERT INTO pedido VALUES (56,'2008-12-19','2009-01-20',NULL,'Rechazado','El cliente a anulado el pedido el dia 2009-01-10',13);
INSERT INTO pedido VALUES (57,'2009-01-05','2009-02-05',NULL,'Pendiente',NULL,13);
INSERT INTO pedido VALUES (58,'2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',3);
INSERT INTO pedido VALUES (59,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas',1);
INSERT INTO pedido VALUES (60,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1);
INSERT INTO pedido VALUES (61,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3);
INSERT INTO pedido VALUES (62,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1);
INSERT INTO pedido VALUES (63,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1);
INSERT INTO pedido VALUES (64,'2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',1);
INSERT INTO pedido VALUES (65,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta asociada',1);
INSERT INTO pedido VALUES (66,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mas producto',3);
INSERT INTO pedido VALUES (67,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3);
INSERT INTO pedido VALUES (68,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bastante de la espera asociada al producto',3);
INSERT INTO pedido VALUES (74,'2009-01-14','2009-01-22',NULL,'Rechazado','El pedido no llego el dia que queria el cliente por fallo del transporte',15);
INSERT INTO pedido VALUES (75,'2009-01-11','2009-01-13','2009-01-13','Entregado','El pedido llego perfectamente',15);
INSERT INTO pedido VALUES (76,'2008-11-15','2008-11-23','2008-11-23','Entregado',NULL,15);
INSERT INTO pedido VALUES (77,'2009-01-03','2009-01-08',NULL,'Pendiente','El pedido no pudo ser entregado por problemas meteorologicos',15);
INSERT INTO pedido VALUES (78,'2008-12-15','2008-12-17','2008-12-17','Entregado','Fue entregado, pero faltaba mercancia que sera entregada otro dia',15);
INSERT INTO pedido VALUES (79,'2009-01-12','2009-01-13','2009-01-13','Entregado',NULL,28);
INSERT INTO pedido VALUES (80,'2009-01-25','2009-01-26',NULL,'Pendiente','No terminó el pago',28);
INSERT INTO pedido VALUES (81,'2009-01-18','2009-01-24',NULL,'Rechazado','Los producto estaban en mal estado',28);
INSERT INTO pedido VALUES (82,'2009-01-20','2009-01-29','2009-01-29','Entregado','El pedido llego un poco mas tarde de la hora fijada',28);
INSERT INTO pedido VALUES (83,'2009-01-24','2009-01-28',NULL,'Entregado',NULL,28);
INSERT INTO pedido VALUES (89,'2007-10-05','2007-12-13','2007-12-10','Entregado','La entrega se realizo dias antes de la fecha esperada por lo que el cliente quedo satisfecho',35);
INSERT INTO pedido VALUES (90,'2009-02-07','2008-02-17',NULL,'Pendiente','Debido a la nevada caída en la sierra, el pedido no podrá llegar hasta el día ',27);
INSERT INTO pedido VALUES (91,'2009-03-18','2009-03-29','2009-03-27','Entregado','Todo se entregó a su debido tiempo, incluso con un día de antelación',27);
INSERT INTO pedido VALUES (92,'2009-04-19','2009-04-30','2009-05-03','Entregado','El pedido se entregó tarde debido a la festividad celebrada en España durante esas fechas',27);
INSERT INTO pedido VALUES (93,'2009-05-03','2009-05-30','2009-05-17','Entregado','El pedido se entregó antes de lo esperado.',27);
INSERT INTO pedido VALUES (94,'2009-10-18','2009-11-01',NULL,'Pendiente','El pedido está en camino.',27);
INSERT INTO pedido VALUES (95,'2008-01-04','2008-01-19','2008-01-19','Entregado',NULL,35);
INSERT INTO pedido VALUES (96,'2008-03-20','2008-04-12','2008-04-13','Entregado','La entrega se retraso un dia',35);
INSERT INTO pedido VALUES (97,'2008-10-08','2008-11-25','2008-11-25','Entregado',NULL,35);
INSERT INTO pedido VALUES (98,'2009-01-08','2009-02-13',NULL,'Pendiente',NULL,35);
INSERT INTO pedido VALUES (99,'2009-02-15','2009-02-27',NULL,'Pendiente',NULL,16);
INSERT INTO pedido VALUES (100,'2009-01-10','2009-01-15','2009-01-15','Entregado','El pedido llego perfectamente',16);
INSERT INTO pedido VALUES (101,'2009-03-07','2009-03-27',NULL,'Rechazado','El pedido fue rechazado por el cliente',16);
INSERT INTO pedido VALUES (102,'2008-12-28','2009-01-08','2009-01-08','Entregado','Pago pendiente',16);
INSERT INTO pedido VALUES (103,'2009-01-15','2009-01-20','2009-01-24','Pendiente',NULL,30);
INSERT INTO pedido VALUES (104,'2009-03-02','2009-03-06','2009-03-06','Entregado',NULL,30);
INSERT INTO pedido VALUES (105,'2009-02-14','2009-02-20',NULL,'Rechazado','el producto ha sido rechazado por la pesima calidad',30);
INSERT INTO pedido VALUES (106,'2009-05-13','2009-05-15','2009-05-20','Pendiente',NULL,30);
INSERT INTO pedido VALUES (107,'2009-04-06','2009-04-10','2009-04-10','Entregado',NULL,30);
INSERT INTO pedido VALUES (108,'2009-04-09','2009-04-15','2009-04-15','Entregado',NULL,16);
INSERT INTO pedido VALUES (109,'2006-05-25','2006-07-28','2006-07-28','Entregado',NULL,38);
INSERT INTO pedido VALUES (110,'2007-03-19','2007-04-24','2007-04-24','Entregado',NULL,38);
INSERT INTO pedido VALUES (111,'2008-03-05','2008-03-30','2008-03-30','Entregado',NULL,36);
INSERT INTO pedido VALUES (112,'2009-03-05','2009-04-06','2009-05-07','Pendiente',NULL,36);
INSERT INTO pedido VALUES (113,'2008-10-28','2008-11-09','2009-01-09','Rechazado','El producto ha sido rechazado por la tardanza de el envio',36);
INSERT INTO pedido VALUES (114,'2009-01-15','2009-01-29','2009-01-31','Entregado','El envio llego dos dias más tarde debido al mal tiempo',36);
INSERT INTO pedido VALUES (115,'2008-11-29','2009-01-26','2009-02-27','Pendiente',NULL,36);
INSERT INTO pedido VALUES (116,'2008-06-28','2008-08-01','2008-08-01','Entregado',NULL,38);
INSERT INTO pedido VALUES (117,'2008-08-25','2008-10-01',NULL,'Rechazado','El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente',38);
INSERT INTO pedido VALUES (118,'2009-02-15','2009-02-27',NULL,'Pendiente',NULL,16);
INSERT INTO pedido VALUES (119,'2009-01-10','2009-01-15','2009-01-15','Entregado','El pedido llego perfectamente',16);
INSERT INTO pedido VALUES (120,'2009-03-07','2009-03-27',NULL,'Rechazado','El pedido fue rechazado por el cliente',16);
INSERT INTO pedido VALUES (121,'2008-12-28','2009-01-08','2009-01-08','Entregado','Pago pendiente',16);
INSERT INTO pedido VALUES (122,'2009-04-09','2009-04-15','2009-04-15','Entregado',NULL,16);
INSERT INTO pedido VALUES (123,'2009-01-15','2009-01-20','2009-01-24','Pendiente',NULL,30);
INSERT INTO pedido VALUES (124,'2009-03-02','2009-03-06','2009-03-06','Entregado',NULL,30);
INSERT INTO pedido VALUES (125,'2009-02-14','2009-02-20',NULL,'Rechazado','el producto ha sido rechazado por la pesima calidad',30);
INSERT INTO pedido VALUES (126,'2009-05-13','2009-05-15','2009-05-20','Pendiente',NULL,30);
INSERT INTO pedido VALUES (127,'2009-04-06','2009-04-10','2009-04-10','Entregado',NULL,30);
INSERT INTO pedido VALUES (128,'2008-11-10','2008-12-10','2008-12-29','Rechazado','El pedido ha sido rechazado por el cliente por el retraso en la entrega',38);

select * from pedido


-- Desarrollado por Daniel Navas - C.C: 1.***.***.797
