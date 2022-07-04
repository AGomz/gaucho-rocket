create database gauchorocket;
use gauchorocket;

create table login (
	id integer unique auto_increment primary key,
	-- nickname varchar(35) not null,
	email varchar(60) not null,
	password varchar(61) not null
);

create table rol (
	id integer unique auto_increment primary key,
	descripcion varchar(45)
);

create table centromedico (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	direccion varchar(70) not null,
	turnosdiarios int not null
);

create table nivelvuelo (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
);


create table usuario (
	id integer unique auto_increment primary key,
	nombre varchar(35) not null,
	apellido varchar(45) not null,
	idlogin integer not null,
	activado boolean,
	idnivelvuelo integer,
	foreign key (idlogin) references login(id),
	foreign key (idnivelvuelo) references nivelvuelo(id)
);

create table usuariorol (
	usuarioid integer,
	rolid integer,
	foreign key (usuarioid) references usuario(id),
	foreign key (rolid) references rol(id),
	primary key (usuarioid, rolid)
);

create table turnomedico (
	usuarioid integer,
	centromedicoid integer,
	fecha date,
	primary key (usuarioid, centromedicoid),
	foreign key (usuarioid) references usuario(id),
	foreign key (centromedicoid) references centromedico(id)
);

create table cabina (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null,
	precio float
);

create table modelo (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
);

create table tipovuelo (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
);

create table equipo (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	modeloid integer not null,
	matricula varchar(15),
	tipovueloid integer not null,
	foreign key (modeloid) references modelo(id),
	foreign key (tipovueloid) references tipovuelo(id)
);

create table equiponivelvuelo(
	nivelvueloid integer,
	equipoid integer,
	primary key (nivelvueloid, equipoid),
	foreign key (nivelvueloid) references nivelvuelo(id),
	foreign key (equipoid) references equipo(id)
);

create table capacidadcabina(
	equipoid integer,
	cabinaid integer,
	cantidad integer,
	primary key (equipoid, cabinaid),
	foreign key (equipoid) references equipo(id),
	foreign key (cabinaid) references cabina(id)
);

create table servicioabordo (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null,
	precio float
);

create table destino (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null,
	iata varchar(6) not null
);

create table tramo (
	id integer unique auto_increment primary key,
	equipoid integer not null,
	origenid integer not null,
	destinoid integer not null,
	fechasalida datetime not null,
	fechallegada datetime not null,
	precio float not null,
	foreign key (equipoid) references equipo(id),
	foreign key (origenid) references destino(id),
	foreign key (destinoid) references destino(id)
);

create table pago (
	id integer unique auto_increment primary key,
	transaccion varchar(51) not null,
	importe float not null,
	fecha datetime not null
);

create table checkin (
	id integer unique auto_increment primary key,
	codigo varchar(46) not null,
	fecha datetime not null
);

create table reserva (
	id integer primary key auto_increment,
	usuarioid integer not null,
	fecha datetime not null,
	pagoid integer,
	checkinid integer,
	servicioid integer not null,
	listaespera boolean,
	tipocabina integer not null,
	-- primary key (usuarioid, tramoid),
	foreign key (usuarioid) references usuario(id),
	foreign key (servicioid) references servicioabordo(id),
	foreign key (tipoCabina) references cabina(id)
);

create table reservatramo (
	reservaid integer not null,
	tramoid integer not null,
	primary key (reservaid, tramoid),
	foreign key (reservaid) references reserva(id),
	foreign key (tramoid) references tramo(id)
);

insert into rol (descripcion) values
("Cliente"),
("Administrador");


/* centromedico
nombre varchar(60) not null,
	direccion varchar(70)
*/
insert into centromedico (nombre, direccion, turnosdiarios) values
("Buenos Aires Medical", "Av. Rivadavia 14241", 300),
("Shanghai Medical Clinic", "AE M-01, Rawadat Al Wasl Building", 210),
("Medical Park Ankara Hastanesi", "Kent Koop Mah 1868", 200);


/*
table nivelvuelo
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/
insert into nivelvuelo (nombre, descripcion) values
("Nivel 1", "Viajes de orbitales"),
("Nivel 2", "Viajes de baja aceleraci�n"),
("Nivel 3", "Vaijes de alta aceleraci�n");


/*table cabina
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/
insert into cabina (nombre, descripcion, precio) values
("Turista", "Cabina de tipo Turista", 0),
("Ejecutivo", "Cabina de tipo Ejecutivo", 100),
("Primera", "Primera clase.", 150);



/*table modelo
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/
insert into modelo (nombre, descripcion) values
("Aguila", "Clase Aguila"),
("Aguilucho", "Clase Aguilucho"),
("Calandria", "Clase Calandria"),
("Canario", "Clase Canario"),
("Carancho", "Clase Carancho"),
("Colibri", "Clase Calabri"),
("Condor", "Clase Condor"),
("Guanaco", "Clase Guanaco"),
("Halcon", "Clase Huanaco"),
("Zorzal", "Clase Zorzal");

/*
table tipovuelo (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/

insert into tipovuelo (nombre, descripcion) values
("Orbitales", "Vuelvos Orbitales"),
("Baja aceleracion", "Vuelos hasta 2G"),
("Alta aceleracion", "Vuelos de m�s de 2G");


/*
table equipo
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	modeloid integer not null,
	matricula varchar(15),
	tipovueloid integer not null,
	foreign key (modeloid) references modelo(id),
	foreign key (tipovueloid) references tipovuelo(id)
);
*/
insert into equipo(nombre, modeloid, matricula, tipovueloid) values
("Aguila 1", 1, "AA1", 3),
("Aguila 5", 1, "AA5", 3),
("Aguila 9", 1, "AA9", 3),
("Aguila 13", 1, "AA13", 3),
("Aguila 17", 1, "AA17", 3),
("Aguilucho 8", 2, "BA8", 2),
("Aguilucho 9", 2, "BA9", 2),
("Aguilucho 10", 2, "BA10", 2),
("Aguilucho 11", 2, "BA11", 2),
("Aguilucho 12", 2, "BA12", 2),
("Calandria 1", 3, "O1", 1),
("Calandria 2", 3, "O2", 1),
("Calandria 6", 3, "O6", 1),
("Calandria 7", 3, "O7", 1),
("Canario 13", 4, "BA13", 2),
("Canario 14", 4, "BA14", 2),
("Canario 15", 4, "BA15", 2),
("Canario 16", 4, "BA16", 2),
("Canario 17", 4, "BA17", 2),
("Carancho 4", 5, "BA4", 2),
("Carancho 5", 5, "BA5", 2),
("Carancho 6", 5, "BA6", 2),
("Carancho 7", 5, "BA7", 2),
("Colibri 3", 6, "O3", 1),
("Colibri 4", 6, "O4", 1),
("Colibri 5", 6, "O5", 1),
("Colibri 8", 6, "O8", 1),
("Condor 2", 7, "AA2", 3),
("Condor 6", 7, "AA6", 3),
("Condor 10", 7, "AA10", 3),
("Condor 14", 7, "AA14", 3),
("Condor 18", 7, "AA18", 3),
("Guanaco 4", 8, "AA4", 1),
("Guanaco 8", 8, "AA8", 1),
("Halcon 2", 9, "AA3", 3),
("Halcon 7", 9, "AA7", 3),
("Halcon 11", 9, "AA11", 3),
("Halcon 15", 9, "AA15", 3),
("Halcon 19", 9, "AA19", 3),
("Zorzal 1", 10, "BA1", 2),
("Zorzal 2", 10, "BA3", 2),
("Zorzal 3", 10, "BA3", 2);
/*
create table equiponivelvuelo(
	nivelvueloid integer,
	equipoid integer,
	primary key (nivelvueloid, equipoid),
	foreign key (nivelvueloid) references nivelvuelo(id),
	foreign key (equipoid) references equipo(id)
*/
insert into equiponivelvuelo (equipoid, nivelvueloid) values
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 2),
(3, 3),
(4, 2),
(4, 3),
(5, 2),
(5, 3),
(6, 2),
(6, 3),
(7, 2),
(7, 3),
(8, 2),
(8, 3),
(9, 2),
(9, 3),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 2),
(14, 3),
(15, 2),
(15, 3),
(16, 2),
(16, 3),
(17, 2),
(17, 3),
(18, 2),
(18, 3),
(19, 2),
(19, 3),
(20, 2),
(20, 3),
(21, 2),
(21, 3),
(22, 2),
(22, 3),
(23, 2),
(23, 3),
(24, 1),
(24, 2),
(24, 3),
(25, 1),
(25, 2),
(25, 3),
(26, 1),
(26, 2),
(26, 3),
(27, 1),
(27, 2),
(27, 3),
(28, 2),
(28, 3),
(29, 2),
(29, 3),
(30, 2),
(30, 3),
(31, 2),
(31, 3),
(32, 2),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 2),
(40, 3),
(41, 2),
(41, 3),
(42, 2),
(42, 3);




/*
 create table capacidadcabina(
	equipoid integer,
	cabinaid integer,
	cantidad integer,
	primary key (equipoid, cabinaid),
	foreign key (equipoid) references equipo(id),
	foreign key (cabinaid) references cabina(id)
1 ("turista", "cabina de tipo turista"),
2 ("ejecutivo", "cabina de tipo ejecutivo"),
3 ("primera", "primera clase.");
*/
insert into capacidadcabina (equipoid, cabinaid, cantidad) values
-- clase aguila
(1, 1, 200),
(1, 2, 75),
(1, 3, 25),
(2, 1, 200),
(2, 2, 75),
(2, 3, 25),
(3, 1, 200),
(3, 2, 75),
(3, 3, 25),
(4, 1, 200),
(4, 2, 75),
(4, 3, 25),
(5, 1, 200),
(5, 2, 75),
(5, 3, 25),
-- clase aguilucho
(6, 2, 50),
(6, 3, 10),
(7, 2, 50),
(7, 3, 10),
(8, 2, 50),
(8, 3, 10),
(9, 2, 50),
(9, 3, 10),
(10, 2, 50),
(10, 3, 10),
-- clase calandria
(11, 1, 200),
(11, 2, 50),
(11, 3, 10),
(12, 1, 200),
(12, 2, 50),
(12, 3, 10),
(13, 1, 200),
(13, 2, 50),
(13, 3, 10),
(14, 1, 200),
(14, 2, 50),
(14, 3, 10),
-- clase canario
(15, 2, 70),
(15, 3, 10),
(16, 2, 70),
(16, 3, 10),
(17, 2, 70),
(17, 3, 10),
(18, 2, 70),
(18, 3, 10),
(19, 2, 70),
(19, 3, 10),
-- clase carancho
(20, 1, 110),
(21, 1, 110),
(22, 1, 110),
(23, 1, 110),
-- clase colibri
(24, 1, 100),
(24, 2, 18),
(24, 3, 2),
(25, 1, 100),
(25, 2, 18),
(25, 3, 2),
(26, 1, 100),
(26, 2, 18),
(26, 3, 2),
(27, 1, 100),
(27, 2, 18),
(27, 3, 2),
-- clase condor
(28, 1, 300),
(28, 2, 10),
(28, 3, 40),
(29, 1, 300),
(29, 2, 10),
(29, 3, 40),
(30, 1, 300),
(30, 2, 10),
(30, 3, 40),
(31, 1, 300),
(31, 2, 10),
(31, 3, 40),
(32, 1, 300),
(32, 2, 10),
(32, 3, 40),
-- clase guanaco
(33,3,100),
(34,3,100),
-- clase halcon
(35, 1, 150),
(35, 2, 25),
(35, 3, 25),
(36, 1, 150),
(36, 2, 25),
(36, 3, 25),
(37, 1, 150),
(37, 2, 25),
(37, 3, 25),
(38, 1, 150),
(38, 2, 25),
(38, 3, 25),
(39, 1, 150),
(39, 2, 25),
(39, 3, 25),
-- clase zorzal
(40, 1, 50),
(40, 2, 80),
(41, 1, 50),
(41, 2, 80),
(42, 1, 50),
(42, 2, 80);



/*
create table destino (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
	iata varchar(6) not null
*/
insert into destino (nombre, descripcion, iata) values
("Buenos Aires", "Aeropuerto Espacial Villa Fiorito", "ARFIO"),
("Ankara", "Esenboga Space-Port", "TRESB"),
("ISS", "Estaci�n Internacional", "SSISS"),
("Orbital Hotel","Hotel orbital Zurich","SSZUR"),
("Luna", "Luna", "SSMON"),
("Marte", "Planeta rojo", "SSMAR"),
("Ganimedes", "Ganimedes Jupiter", "JUGAN"),
("Europa", "Europa Jupiter", "JUEUP"),
("Io", "Io Jupiter", "JUIO-"),
("Encedalo", "Encedalo Saturno", "SAENC"),
("Titan", "Titan Saturno", "SATIT");



/* table servicioabordo
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null,
	precio float
*/
insert into servicioabordo (nombre, descripcion, precio) values
("Standard", "Servicio estandar", 0.0),
("Gourmet", "Servicio Gourmet", 500.0),
("Spa", "Servicio Spa", 950.70);



USE gauchorocket;

DROP PROCEDURE IF exists Circuito1BA;
DROP PROCEDURE IF exists Circuito1AA;
DROP PROCEDURE IF exists Circuito2BA;
DROP PROCEDURE IF exists Circuito2AA;
DROP PROCEDURE IF exists Tour;
DROP PROCEDURE IF exists Orbital;

DELIMITER $$
-- Insert Circuito1 completo
-- CALL Circuito1BA(fecha, equipoID, origenID);
CREATE PROCEDURE Circuito1BA(IN fecha DATETIME, IN equipo INTEGER, IN origen INTEGER)
BEGIN

DECLARE fechaSalida1 DATETIME;
DECLARE fechaSalida2 DATETIME;
DECLARE fechaSalida3 DATETIME;
DECLARE fechaSalida4 DATETIME;
DECLARE fechaLlegada1 DATETIME;
DECLARE fechaLlegada2 DATETIME;
DECLARE fechaLlegada3 DATETIME;
DECLARE fechaLlegada4 DATETIME;

-- IDA
SET fechaSalida1 = fecha;
SET fechaLlegada1 = date_add(fecha, INTERVAL 4 HOUR );
SET fechaSalida2 = date_add(fecha, INTERVAL 5 HOUR);
SET fechaLlegada2 = date_add(fecha, INTERVAL 6 HOUR );
SET fechaSalida3 = date_add(fecha, INTERVAL 7 HOUR );
SET fechaLlegada3 = date_add(fecha, INTERVAL 23 HOUR );
SET fechaSalida4 = date_add(fecha, INTERVAL 24 HOUR );
SET fechaLlegada4 = date_add(fecha, INTERVAL 50 HOUR );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(equipo, origen, 3, fechaSalida1, fechaLlegada1, 100),
-- ISS / Orbital Hotel
(equipo, 3, 4, fechaSalida2, fechaLlegada2, 150),
-- Orbital hotel / luna -
(equipo, 4, 5, fechaSalida3, fechaLlegada3, 250),
-- luna / marte-
(equipo, 5, 6, fechaSalida4, fechaLlegada4, 300);

-- VUELTA
SET fechaSalida1 = date_add(fecha, INTERVAL 72 HOUR );
SET fechaLlegada1 = date_add(fecha, INTERVAL 98 HOUR );
SET fechaSalida2 = date_add(fecha, INTERVAL 99 HOUR);
SET fechaLlegada2 = date_add(fecha, INTERVAL 115 HOUR );
SET fechaSalida3 = date_add(fecha, INTERVAL 116 HOUR );
SET fechaLlegada3 = date_add(fecha, INTERVAL 117 HOUR );
SET fechaSalida4 = date_add(fecha, INTERVAL 118 HOUR );
SET fechaLlegada4 = date_add(fecha, INTERVAL 122 HOUR );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(equipo, 6, 5, fechaSalida1, fechaLlegada1, 300),
-- luna / orbital hotel
(equipo, 5, 4, fechaSalida2, fechaLlegada2, 250),
-- orbital hotel / ISS
(equipo, 4, 3, fechaSalida3, fechaLlegada3, 150),
-- ISS / BA
(equipo, 3, origen, fechaSalida4, fechaLlegada4, 100);
END$$

DELIMITER $$
-- Insert Circuito completo
-- CALL Circuito1AA(fecha, equipoID, origenID);
CREATE PROCEDURE Circuito1AA(IN fecha DATETIME, IN equipo INTEGER, IN origen INTEGER)
BEGIN

DECLARE fechaSalida1 DATETIME;
DECLARE fechaSalida2 DATETIME;
DECLARE fechaSalida3 DATETIME;
DECLARE fechaSalida4 DATETIME;
DECLARE fechaLlegada1 DATETIME;
DECLARE fechaLlegada2 DATETIME;
DECLARE fechaLlegada3 DATETIME;
DECLARE fechaLlegada4 DATETIME;

-- IDA
SET fechaSalida1 = fecha;
SET fechaLlegada1 = date_add(fecha, INTERVAL 3 HOUR );
SET fechaSalida2 = date_add(fecha, INTERVAL 4 HOUR);
SET fechaLlegada2 = date_add(fecha, INTERVAL 5 HOUR );
SET fechaSalida3 = date_add(fecha, INTERVAL 6 HOUR );
SET fechaLlegada3 = date_add(fecha, INTERVAL 17 HOUR );
SET fechaSalida4 = date_add(fecha, INTERVAL 18 HOUR );
SET fechaLlegada4 = date_add(fecha, INTERVAL 30 HOUR );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(equipo, origen, 3, fechaSalida1, fechaLlegada1, 100),
-- ISS / Orbital Hotel
(equipo, 3, 4, fechaSalida2, fechaLlegada2, 150),
-- Orbital hotel / luna -
(equipo, 4, 5, fechaSalida3, fechaLlegada3, 250),
-- luna / marte-
(equipo, 5, 6, fechaSalida4, fechaLlegada4, 300);

-- VUELTA
SET fechaSalida1 = date_add(fecha, INTERVAL 48 HOUR );
SET fechaLlegada1 = date_add(fecha, INTERVAL 70 HOUR );
SET fechaSalida2 = date_add(fecha, INTERVAL 71 HOUR);
SET fechaLlegada2 = date_add(fecha, INTERVAL 80 HOUR );
SET fechaSalida3 = date_add(fecha, INTERVAL 81 HOUR );
SET fechaLlegada3 = date_add(fecha, INTERVAL 82 HOUR );
SET fechaSalida4 = date_add(fecha, INTERVAL 83 HOUR );
SET fechaLlegada4 = date_add(fecha, INTERVAL 86 HOUR );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(equipo, 6, 5, fechaSalida1, fechaLlegada1, 300),
-- luna / orbital hotel
(equipo, 5, 4, fechaSalida2, fechaLlegada2, 250),
-- orbital hotel / ISS
(equipo, 4, 3, fechaSalida3, fechaLlegada3, 150),
-- ISS / BA
(equipo, 3, origen, fechaSalida4, fechaLlegada4, 100);
END$$



DELIMITER $$
-- Insert Circuito1 completo
-- CALL Circuito1BA(fecha, equipoID, origenID);
CREATE PROCEDURE Circuito2BA(IN fecha DATETIME, IN equipo INTEGER, IN origen INTEGER)
BEGIN

DECLARE fechaSalida1 DATETIME;
DECLARE fechaSalida2 DATETIME;
DECLARE fechaSalida3 DATETIME;
DECLARE fechaSalida4 DATETIME;
DECLARE fechaSalida5 DATETIME;
DECLARE fechaSalida6 DATETIME;
DECLARE fechaSalida7 DATETIME;
DECLARE fechaSalida8 DATETIME;
DECLARE fechaLlegada1 DATETIME;
DECLARE fechaLlegada2 DATETIME;
DECLARE fechaLlegada3 DATETIME;
DECLARE fechaLlegada4 DATETIME;
DECLARE fechaLlegada5 DATETIME;
DECLARE fechaLlegada6 DATETIME;
DECLARE fechaLlegada7 DATETIME;
DECLARE fechaLlegada8 DATETIME;
-- IDA
SET fechaSalida1 = fecha;
SET fechaLlegada1 = date_add(fecha, INTERVAL 4 HOUR );
SET fechaSalida2 = date_add(fecha, INTERVAL 5 HOUR);
SET fechaLlegada2 = date_add(fecha, INTERVAL 19 HOUR );
SET fechaSalida3 = date_add(fecha, INTERVAL 20 HOUR );
SET fechaLlegada3 = date_add(fecha, INTERVAL 46 HOUR );
SET fechaSalida4 = date_add(fecha, INTERVAL 47 HOUR );
SET fechaLlegada4 = date_add(fecha, INTERVAL 95 HOUR );
SET fechaSalida5 = date_add(fecha, INTERVAL 96 HOUR );
SET fechaLlegada5 = date_add(fecha, INTERVAL 146 HOUR );
SET fechaSalida6 = date_add(fecha, INTERVAL 147 HOUR);
SET fechaLlegada6 = date_add(fecha, INTERVAL 198 HOUR );
SET fechaSalida7 = date_add(fecha, INTERVAL 200 HOUR );
SET fechaLlegada7 = date_add(fecha, INTERVAL 270 HOUR );
SET fechaSalida8 = date_add(fecha, INTERVAL 272 HOUR );
SET fechaLlegada8 = date_add(fecha, interval 349 HOUR );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- origen / ISS
(equipo, origen, 3, fechaSalida1, fechaLlegada1, 100),
-- ISS / luna
(equipo, 3, 5, fechaSalida2, fechaLlegada2, 150),
-- luna / marte-
(equipo, 5, 6, fechaSalida3, fechaLlegada3, 250),
-- marte / ganimedes
(equipo, 6, 7, fechaSalida4, fechaLlegada4, 300),
-- ganimedes / europa
(equipo, 7, 8, fechaSalida1, fechaLlegada1, 100),
-- europa / lo
(equipo, 8, 9, fechaSalida2, fechaLlegada2, 150),
-- lo / encedalo
(equipo, 9, 10, fechaSalida3, fechaLlegada3, 250),
-- encedalo / titan
(equipo, 10, 11, fechaSalida4, fechaLlegada4, 300);

-- VUELTA
SET fechaSalida1 = date_add(fecha, INTERVAL 360 HOUR );
SET fechaLlegada1 = date_add(fecha, INTERVAL 437 HOUR );
SET fechaSalida2 = date_add(fecha, INTERVAL 438 HOUR);
SET fechaLlegada2 = date_add(fecha, INTERVAL 508 HOUR );
SET fechaSalida3 = date_add(fecha, INTERVAL 509 HOUR );
SET fechaLlegada3 = date_add(fecha, INTERVAL 560 HOUR );
SET fechaSalida4 = date_add(fecha, INTERVAL 562 HOUR );
SET fechaLlegada4 = date_add(fecha, INTERVAL 612 HOUR );
SET fechaSalida5 = date_add(fecha, INTERVAL 613 HOUR );
SET fechaLlegada5 = date_add(fecha, INTERVAL 661 HOUR );
SET fechaSalida6 = date_add(fecha, INTERVAL 662 HOUR);
SET fechaLlegada6 = date_add(fecha, INTERVAL 687 HOUR );
SET fechaSalida7 = date_add(fecha, INTERVAL 688 HOUR );
SET fechaLlegada7 = date_add(fecha, INTERVAL 701 HOUR );
SET fechaSalida8 = date_add(fecha, INTERVAL 702 HOUR );
SET fechaLlegada8 = date_add(fecha, INTERVAL 706 HOUR );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encedalo
(equipo, 11, 10, fechaSalida1, fechaLlegada1, 300),
-- encedalo / lo
(equipo, 10, 9, fechaSalida2, fechaLlegada2, 250),
-- lo / europa
(equipo, 9, 8, fechaSalida3, fechaLlegada3, 150),
-- europa / ganimedes
(equipo, 8, 7, fechaSalida4, fechaLlegada4, 100),
-- ganimedes / marte
(equipo, 7, 6, fechaSalida1, fechaLlegada1, 300),
-- marte / luna
(equipo, 6, 5, fechaSalida2, fechaLlegada2, 250),
-- luna / ISS
(equipo, 5, 3, fechaSalida3, fechaLlegada3, 150),
-- ISS / origen
(equipo, 3, origen, fechaSalida4, fechaLlegada4, 100);
END$$

DELIMITER $$
-- Insert Circuito completo
-- CALL Circuito1AA(fecha, equipoID, origenID);
CREATE PROCEDURE Circuito2AA(IN fecha DATETIME, IN equipo INTEGER, IN origen INTEGER)
BEGIN

DECLARE fechaSalida1 DATETIME;
DECLARE fechaSalida2 DATETIME;
DECLARE fechaSalida3 DATETIME;
DECLARE fechaSalida4 DATETIME;
DECLARE fechaSalida5 DATETIME;
DECLARE fechaSalida6 DATETIME;
DECLARE fechaSalida7 DATETIME;
DECLARE fechaSalida8 DATETIME;
DECLARE fechaLlegada1 DATETIME;
DECLARE fechaLlegada2 DATETIME;
DECLARE fechaLlegada3 DATETIME;
DECLARE fechaLlegada4 DATETIME;
DECLARE fechaLlegada5 DATETIME;
DECLARE fechaLlegada6 DATETIME;
DECLARE fechaLlegada7 DATETIME;
DECLARE fechaLlegada8 DATETIME;
-- IDA
SET fechaSalida1 = fecha;
SET fechaLlegada1 = date_add(fecha, INTERVAL 3 HOUR );
SET fechaSalida2 = date_add(fecha, INTERVAL 4 HOUR);
SET fechaLlegada2 = date_add(fecha, INTERVAL 14 HOUR );
SET fechaSalida3 = date_add(fecha, INTERVAL 15 HOUR );
SET fechaLlegada3 = date_add(fecha, INTERVAL 27 HOUR );
SET fechaSalida4 = date_add(fecha, INTERVAL 28 HOUR );
SET fechaLlegada4 = date_add(fecha, INTERVAL 60 HOUR );
SET fechaSalida5 = date_add(fecha, INTERVAL 61 HOUR );
SET fechaLlegada5 = date_add(fecha, INTERVAL 94 HOUR );
SET fechaSalida6 = date_add(fecha, INTERVAL 95 HOUR);
SET fechaLlegada6 = date_add(fecha, INTERVAL 130 HOUR );
SET fechaSalida7 = date_add(fecha, INTERVAL 131 HOUR );
SET fechaLlegada7 = date_add(fecha, INTERVAL 181 HOUR );
SET fechaSalida8 = date_add(fecha, INTERVAL 182 HOUR );
SET fechaLlegada8 = date_add(fecha, INTERVAL 232 HOUR );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- origen / ISS
(equipo, origen, 3, fechaSalida1, fechaLlegada1, 100),
-- ISS / luna
(equipo, 3, 5, fechaSalida2, fechaLlegada2, 150),
-- luna / marte-
(equipo, 5, 6, fechaSalida3, fechaLlegada3, 250),
-- marte / ganimedes
(equipo, 6, 7, fechaSalida4, fechaLlegada4, 300),
-- ganimedes / europa
(equipo, 7, 8, fechaSalida1, fechaLlegada1, 100),
-- europa / lo
(equipo, 8, 9, fechaSalida2, fechaLlegada2, 150),
-- lo / encedalo
(equipo, 9, 10, fechaSalida3, fechaLlegada3, 250),
-- encedalo / titan
(equipo, 10, 11, fechaSalida4, fechaLlegada4, 300);

-- VUELTA
SET fechaSalida1 = date_add(fecha, INTERVAL 240 HOUR );
SET fechaLlegada1 = date_add(fecha, INTERVAL 292 HOUR );
SET fechaSalida2 = date_add(fecha, INTERVAL 293 HOUR);
SET fechaLlegada2 = date_add(fecha, INTERVAL 343 HOUR );
SET fechaSalida3 = date_add(fecha, INTERVAL 344 HOUR );
SET fechaLlegada3 = date_add(fecha, INTERVAL 379 HOUR );
SET fechaSalida4 = date_add(fecha, INTERVAL 380 HOUR );
SET fechaLlegada4 = date_add(fecha, INTERVAL 411 HOUR );
SET fechaSalida5 = date_add(fecha, INTERVAL 412 HOUR );
SET fechaLlegada5 = date_add(fecha, INTERVAL 444 HOUR );
SET fechaSalida6 = date_add(fecha, INTERVAL 445 HOUR);
SET fechaLlegada6 = date_add(fecha, INTERVAL 467 HOUR );
SET fechaSalida7 = date_add(fecha, INTERVAL 468 HOUR );
SET fechaLlegada7 = date_add(fecha, INTERVAL 478 HOUR );
SET fechaSalida8 = date_add(fecha, INTERVAL 479 HOUR );
SET fechaLlegada8 = date_add(fecha, INTERVAL 482 HOUR );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encedalo
(equipo, 11, 10, fechaSalida1, fechaLlegada1, 300),
-- encedalo / lo
(equipo, 10, 9, fechaSalida2, fechaLlegada2, 250),
-- lo / europa
(equipo, 9, 8, fechaSalida3, fechaLlegada3, 150),
-- europa / ganimedes
(equipo, 8, 7, fechaSalida4, fechaLlegada4, 100),
-- ganimedes / marte
(equipo, 7, 6, fechaSalida1, fechaLlegada1, 300),
-- marte / luna
(equipo, 6, 5, fechaSalida2, fechaLlegada2, 250),
-- luna / ISS
(equipo, 5, 3, fechaSalida3, fechaLlegada3, 150),
-- ISS / origen
(equipo, 3, origen, fechaSalida4, fechaLlegada4, 100);
END$$

DELIMITER $$
-- Insert tour
-- CALL Tour(fecha, equipoID);
CREATE PROCEDURE Tour(IN fecha DATETIME, IN equipo INTEGER)
BEGIN

DECLARE fechaSalida1 DATETIME;
DECLARE fechaLlegada1 DATETIME;

SET fechaSalida1 = fecha;
SET fechaLlegada1 = date_add(fecha, INTERVAL 35 day );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(equipo, 1, 1, fechaSalida1, fechaLlegada1, 500);
END$$

DELIMITER $$
-- Insert tour
-- CALL Orbital(fecha, equipo,  origen );
CREATE PROCEDURE Orbital(IN fecha DATETIME, IN equipo INTEGER, in origen INTEGER)
BEGIN

DECLARE fechaSalida1 DATETIME;
DECLARE fechaLlegada1 DATETIME;

SET fechaSalida1 = fecha;
SET fechaLlegada1 = date_add(fecha, INTERVAL 8 hour );

INSERT INTO tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(equipo, origen, origen, fechaSalida1, fechaLlegada1, 80);
END$$

