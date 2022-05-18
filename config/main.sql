create database gauchorocket;
use gauchorocket;

create table login (
	id integer unique auto_increment primary key,  
	-- nickname varchar(35) not null,
	email varchar(60) not null, 
	password varchar(61) not null
);

create table Rol (
	id integer unique auto_increment primary key,  
	descripcion varchar(45)
);

create table CentroMedico (
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	direccion varchar(70) not null
);

create table NivelVuelo (
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
);


create table Usuario (
	id integer unique primary key,
	nombre varchar(35) not null,
	apellido varchar(45) not null, 
	IDLogin integer not null,
	activado boolean,
	IDNivelVuelo integer,
	foreign key (IDLogin) references Login(id),
	foreign key (IDNivelVuelo) references NivelVuelo(id)
);

create table UsuarioRol (
	UsuarioID integer,
	RolID integer,
	foreign key (UsuarioID) references Usuario(id), 
	foreign key (RolID) references Rol(id),
	primary key (UsuarioID, RolID)
);

create table TurnoMedico (
	UsuarioID integer,
	CentroMedicoID integer,
	fecha date,
	primary key (UsuarioID, CentroMedicoID),
	foreign key (UsuarioID) references Usuario(id),
	foreign key (CentroMedicoID) references CentroMedico(id)
);

create table Cabina (
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
);

create table Modelo (
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
);

create table TipoVuelo (
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
);

create table Equipo (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	modeloID integer not null,
	matricula varchar(15),
	TipoVueloID integer not null,
	foreign key (modeloID) references modelo(id),
	foreign key (TipoVueloID) references TipoVuelo(id)
);

create table NivelVueloTipoVuelo (
	NivelVueloID integer,
	TipoVueloID integer,
	primary key (NivelVueloID, TipoVueloID),
	foreign key (NivelVueloID) references NivelVuelo(id),
	foreign key (TipoVueloID) references TipoVuelo(id)
);

create table CapacidadCabina(
	EquipoID integer,
	CabinaID integer,
	cantidad integer,
	primary key (EquipoID, CabinaID),
	foreign key (EquipoID) references Equipo(id),
	foreign key (CabinaID) references Cabina(id)
);

create table ServicioABordo (
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null,
	precio float
);

create table Destino (
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null,
	IATA varchar(6) not null
);

create table Tramo (
	id integer unique auto_increment primary key,
	EquipoID integer not null,
	OrigenID integer not null,
	DestinoID integer not null,
	FechaSalida date not null,
	FechaLlegaga date not null,
	ServicioID integer not null,
	Precio float not null,
	foreign key (EquipoID) references Equipo(id),
	foreign key (OrigenID) references Destino(id),
	foreign key (DestinoID) references Destino(id),
	foreign key (ServicioID) references ServicioABordo(id)	
);

create table Pago (
	id integer unique auto_increment primary key,
	transaccion varchar(51) not null,
	importe float not null,
	fecha date not null
);

create table CheckIn (
	id integer unique auto_increment primary key,
	codigo varchar(46) not null,
	fecha date not null
);

create table Reserva (
	UsuarioID integer not null,
	TramoID integer not null, 
	fecha date not null,
	PagoID integer,
	CheckInID integer,
	primary key (UsuarioID, TramoID),
	foreign key (UsuarioID) references Usuario(id),
	foreign key (TramoID) references Tramo(id)
); 

insert into Rol (descripcion) values 
("Cliente"), 
("Administrador");


/* CentroMedico
nombre varchar(60) not null,
	direccion varchar(70)
*/
insert into centromedico (nombre, direccion) values
("Buenos Aires Medical", "Av. Rivadavia 14241"),
("Shanghai Medical Clinic", "AE M-01, Rawadat Al Wasl Building"),
("Medical Park Ankara Hastanesi", "Kent Koop Mah 1868");


/*
table NivelVuelo
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/
insert into nivelvuelo (nombre, descripcion) values
("Nivel 1", "Viajes de orbitales"),
("Nivel 2", "Viajes de baja aceleración"),
("Nivel 3", "Vaijes de alta aceleración");


/*table Cabina
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/
insert into Cabina (nombre, descripcion) values
("Turista", "Cabina de tipo Turista"),
("Ejecutivo", "Cabina de tipo Ejecutivo"),
("Primera", "Primera clase.");



/*table Modelo
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/
insert into Modelo (nombre, descripcion) values
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
table TipoVuelo (
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
*/

insert into TipoVuelo (nombre, descripcion) values
("Orbitales", "Vuelvos Orbitales"),
("Baja aceleracion", "Vuelos hasta 2G"),
("Alta aceleracion", "Vuelos de más de 2G");


/*
table Equipo 
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	modeloID integer not null,
	matricula varchar(15),
	TipoVueloID integer not null,
	foreign key (modeloID) references modelo(id),
	foreign key (TipoVueloID) references TipoVuelo(id)
);
*/
insert into Equipo(nombre, modeloID, matricula, TipoVueloID) values
("Aguila 1", 1, "AA1", 3),
("Aguila 5", 1, "AA5", 3),
("Aguila 9", 1, "AA9", 3),
("Aguila 13", 1, "AA13", 3),
("Aguila 17", 1, "AA17", 3),
("Aguilucho 8", 1, "BA8", 2),
("Aguilucho 9", 1, "BA9", 2),
("Aguilucho 10", 1, "BA10", 2),
("Aguilucho 11", 1, "BA11", 2),
("Aguilucho 12", 1, "BA12", 2),
("Calandria 1", 1, "O1", 1),
("Calandria 2", 1, "O2", 1),
("Calandria 6", 1, "O6", 1),
("Calandria 7", 1, "O7", 1),
("Canario 13", 1, "BA13", 2),
("Canario 14", 1, "BA14", 2),
("Canario 15", 1, "BA15", 2),
("Canario 16", 1, "BA16", 2),
("Canario 17", 1, "BA17", 2),
("Carancho 4", 1, "BA4", 2),
("Carancho 5", 1, "BA5", 2),
("Carancho 6", 1, "BA6", 2),
("Carancho 7", 1, "BA7", 2),
("Colibri 3", 1, "O3", 1),
("Colibri 4", 1, "O4", 1),
("Colibri 5", 1, "O5", 1),
("Colibri 8", 1, "O8", 1),
("Condor 2", 1, "AA2", 3),
("Condor 6", 1, "AA6", 3),
("Condor 10", 1, "AA10", 3),
("Condor 14", 1, "AA14", 3),
("Condor 18", 1, "AA18", 3),
("Halcon 2", 1, "AA3", 3),
("Halcon 7", 1, "AA7", 3),
("Halcon 11", 1, "AA11", 3),
("Halcon 15", 1, "AA15", 3),
("Halcon 19", 1, "AA19", 3),
("Zorzal 1", 1, "BA1", 2),
("Zorzal 2", 1, "BA3", 2),
("Zorzal 3", 1, "BA3", 2);



/*
 create table CapacidadCabina(
	EquipoID integer,
	CabinaID integer,
	cantidad integer,
	primary key (EquipoID, CabinaID),
	foreign key (EquipoID) references Equipo(id),
	foreign key (CabinaID) references Cabina(id)
1 ("Turista", "Cabina de tipo Turista"),
2 ("Ejecutivo", "Cabina de tipo Ejecutivo"),
3 ("Primera", "Primera clase.");
*/
insert into capacidadcabina (EquipoID, CabinaID, cantidad) values
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
-- clase Carancho
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
-- clase halcon
(33, 1, 150),
(33, 2, 25),
(33, 3, 25),
(34, 1, 150),
(34, 2, 25),
(34, 3, 25),
(35, 1, 150),
(35, 2, 25),
(35, 3, 25),
(36, 1, 150),
(36, 2, 25),
(36, 3, 25),
(37, 1, 150),
(37, 2, 25),
(37, 3, 25),
-- clase zorzal
(38, 1, 50),
(38, 2, 80),
(39, 1, 50),
(39, 2, 80),
(40, 1, 50),
(40, 2, 80);

/*
create table Destino (
	id integer unique auto_increment primary key,  
	nombre varchar(60) not null,
	descripcion varchar(70) not null
	IATA varchar(6) not null
*/
insert into Destino (nombre, descripcion, IATA) values 
("Buenos Aires", "Aeropuerto Espacial Villa Fiorito", "ARFIO"),
("Ankara", "Esenboga Space-Port", "TRESB"),
("ISS", "Estación Internacional", "SSISS"),
("Orbital Hotel","Hotel orbital Zurich","SSZUR"),
("Luna", "Luna", "SSMON"),
("Marte", "Planeta rojo", "SSMAR"),
("Ganimedes", "Ganimedes Jupiter", "JUGAN"),
("Europa", "Europa Jupiter", "JUEUP"),
("Io", "Io Jupiter", "JUIO-"),
("Encedalo", "Encedalo Saturno", "SAENC"),
("Titan", "Titan Saturno", "SATIT");



/* table ServicioABordo 
	id integer unique auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(70) not null,
	precio float
*/
insert into servicioabordo (nombre, descripcion, precio) values
("Standard", "Servicio estandar", 0.0),
("Gourmet", "Servicio Gourmet", 500.0),
("Spa", "Servicio Spa", 950.70);

/*
create table Tramo (
	id integer unique auto_increment primary key,
	EquipoID integer not null,
	OrigenID integer not null,
	DestinoID integer not null,
	FechaSalida date not null,
	FechaLlegaga date not null,
	ServicioID integer not null,
	Precio float not null,
*/
/*
insert into Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegaga, ServicioID, Precio) values
(12, 1, 3, "2022-05-18T00:02:00", "2022-05-19T11:10:00", 1, 500);
*/