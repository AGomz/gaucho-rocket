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
	descripcion varchar(70) not null
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
("Nivel 2", "Viajes de baja aceleración"),
("Nivel 3", "Vaijes de alta aceleración");


/*table cabina
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/
insert into cabina (nombre, descripcion) values
("Turista", "Cabina de tipo Turista"),
("Ejecutivo", "Cabina de tipo Ejecutivo"),
("Primera", "Primera clase.");



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
("Alta aceleracion", "Vuelos de más de 2G");


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
("ISS", "Estaciï¿½n Internacional", "SSISS"),
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

