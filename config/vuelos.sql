USE gauchorocket;

-- datos para reservas: usuario
insert into login (email, password) values 
("email1@mail.com", md5("123456")),
("email2@mail.com", md5("123456")),
("email3@mail.com", md5("123456"));

insert into usuario (nombre, apellido, idlogin, idnivelvuelo, activado) values
("usuario1", "usuario1", 1, 1, true),
("usuario2", "usuario2", 2, 2, true),
("usuario3", "usuario3", 3, 3, true);

-- guanaco a capacidad 1
update capacidadcabina 
set capacidadcabina.cantidad = 2
where equipoid = 33;
update capacidadcabina 
set capacidadcabina.cantidad = 1
where equipoid = 34;

insert into reserva (usuarioid, fecha, servicioid, tipocabina) values
(2, "2022-09-03 20:00:00", 2, 3), 
(2, "2022-09-03 20:00:00", 2, 3);



-- semana 1/8
-- lunes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-03 08:00:00";
-- Zorzal 1
SET @equipo = 40;
CALL Circuito1BA(@fecha, @equipo, 1);
-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;
CALL Circuito1BA(@fecha, @equipo, 2);

-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-10-03 09:00:00";
-- Canario 13 
SET @equipo = 15;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-03 15:00:00";
-- Halcon 2
SET @equipo = 35;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-03 20:00:00";
-- Guanaco 4 
SET @equipo = 33;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-03 20:00:00";
-- Condor 2 
SET @equipo = 28;
CALL Circuito2AA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-03 21:00:00";
-- Halcon 7
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-03 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 


-- suborbital AK
SET	@fecha = "2022-10-03 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-03 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-10-03 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-03 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

-- Martes
-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-10-04 08:00:00";
-- Carancho 5
SET @equipo = 21;
CALL Orbital(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-04 09:00:00";
-- Canario 14
SET @equipo = 16;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-04 09:00:00";
-- Halcon 11
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);


-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-10-04 09:00:00";
-- Zorzal 2 
SET @equipo = 41;
CALL Circuito2BA(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-04 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-04 18:00:00";
-- Condor 6
SET @equipo = 29;
CALL Circuito2AA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-04 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-04 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-04 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-04 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-04 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Miercoles
-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-10-05 08:00:00";
-- Carancho 4 
SET @equipo = 20;
CALL Circuito2BA(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-05 09:00:00";
-- Zorzal 1
SET @equipo = 17;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 2 BA ALTA aceleracion
SET	@fecha = "2022-10-05 09:00:00";
-- Halcon 15
SET @equipo = 38;
CALL Circuito1AA(@fecha, @equipo, 1);

-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-10-05 09:00:00";
-- Zorzal 
SET @equipo = 42;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-05 15:00:00";
-- Aguilucho 9
SET @equipo = 7;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-05 18:00:00";
-- Aguilucho 8
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- Circuito 2 BA baja aceleracion
SET	@fecha = "2022-10-05 22:00:00";
-- Canario 16
SET @equipo = 18;
CALL Circuito2BA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-05 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-05 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-05 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-05 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-05 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Jueves
-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-10-06 08:00:00";
-- Canario 17
SET @equipo = 19;
CALL Circuito2BA(@fecha, @equipo, 2);

-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-06 09:00:00";
-- Aguila 1
SET @equipo = 1;
CALL Circuito2AA(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-06 15:00:00";
-- Condor 10
SET @equipo = 30;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-06 20:00:00";
-- Halcon 19
SET @equipo = 39;
CALL Circuito1AA(@fecha, @equipo, 1);

-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-10-06 21:00:00";
-- Condor 14
SET @equipo = 31;
CALL Circuito2BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-06 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-06 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-06 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-06 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-06 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Viernes
-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-07 09:00:00";
-- Aguila 5
SET @equipo = 2;
CALL Circuito2AA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-07 15:00:00";
-- Condor 18 
SET @equipo = 32;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-07 18:00:00";
-- Aguilucho 12
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-07 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-07 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-07 09:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-07 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-07 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- SABADO 
-- suborbital AK
SET	@fecha = "2022-10-08 08:00:00";
-- Calandria 2 
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital AK
SET	@fecha = "2022-10-07 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-10-08 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-08 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-08 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-08 08:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-08 09:00:00";
-- Colibri 8
SET @equipo = 27;
CALL Orbital(@fecha, @equipo, 1); 
-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-10-09 09:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-09 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-08 09:00:00";
-- Calandria 7
SET @equipo = 14;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-10-09 08:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-09 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 
-- TOUR 
SET	@fecha = "2022-10-09 07:00:00";
-- Guanao 8 
SET @equipo = 34;
CALL Tour(@fecha, @equipo);

-- Semana 2/8
-- lunes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-10 08:00:00";
-- Zorzal 1
SET @equipo = 40;
CALL Circuito1BA(@fecha, @equipo, 1);
-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-10 15:00:00";
-- Halcon 2
SET @equipo = 35;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-10 20:00:00";
-- Guanaco 4 
SET @equipo = 33;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-10 21:00:00";
-- Halcon 7
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-10 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-10 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-10 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-10-10 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-10 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

-- Martes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-11 09:00:00";
-- Canario 14
SET @equipo = 16;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-11 09:00:00";
-- Halcon 11
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-11 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;
CALL Circuito1BA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-11 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-11 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-11 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-11 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-11 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Miercoles
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-12 09:00:00";
-- Zorzal 1
SET @equipo = 17;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-12 15:00:00";
-- Aguilucho 9
SET @equipo = 7;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-12 18:00:00";
-- Aguilucho 8
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-12 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-12 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-12 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-12 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-12 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Jueves
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-13 15:00:00";
-- Condor 10
SET @equipo = 30;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-13 20:00:00";
-- Halcon 19
SET @equipo = 39;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-13 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-13 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-13 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-13 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-13 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Viernes
-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-14 15:00:00";
-- Condor 18 
SET @equipo = 32;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-14 18:00:00";
-- Aguilucho 12
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-14 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-14 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-14 09:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-14 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-14 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- SABADO 
-- suborbital AK
SET	@fecha = "2022-10-15 08:00:00";
-- Calandria 2 
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital AK
SET	@fecha = "2022-10-15 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-10-15 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-15 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-15 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-15 08:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-15 09:00:00";
-- Colibri 8
SET @equipo = 27;
CALL Orbital(@fecha, @equipo, 1); 

-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-10-16 09:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-16 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-16 09:00:00";
-- Calandria 7
SET @equipo = 14;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-10-16 08:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-16 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Semana 3/8
-- lunes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-17 08:00:00";
-- Zorzal 1
SET @equipo = 40;
CALL Circuito1BA(@fecha, @equipo, 1);
-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-17 15:00:00";
-- Halcon 2
SET @equipo = 35;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-17 21:00:00";
-- Halcon 7
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-17 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-17 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-17 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-10-17 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-17 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

-- Martes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-18 09:00:00";
-- Canario 14
SET @equipo = 16;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-18 09:00:00";
-- Halcon 11
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-18 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;
CALL Circuito1BA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-18 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-18 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-18 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-18 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-18 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Miercoles
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-19 09:00:00";
-- Zorzal 1
SET @equipo = 17;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-19 15:00:00";
-- Aguilucho 9
SET @equipo = 7;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-19 18:00:00";
-- Aguilucho 8
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-19 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-19 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-19 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-19 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-19 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Jueves
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-20 15:00:00";
-- Condor 10
SET @equipo = 30;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-20 20:00:00";
-- Halcon 19
SET @equipo = 39;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-20 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-20 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-20 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-20 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-20 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Viernes
-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-21 15:00:00";
-- Condor 18 
SET @equipo = 32;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-21 18:00:00";
-- Aguilucho 12
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-21 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-21 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-21 09:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-21 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-21 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- SABADO 
-- suborbital AK
SET	@fecha = "2022-10-22 08:00:00";
-- Calandria 2 
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital AK
SET	@fecha = "2022-10-22 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-10-22 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-22 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-22 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-22 08:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-22 09:00:00";
-- Colibri 8
SET @equipo = 27;
CALL Orbital(@fecha, @equipo, 1); 

-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-10-23 09:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-23 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-23 09:00:00";
-- Calandria 7
SET @equipo = 14;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-10-23 08:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-23 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 


-- Semana 4/8
-- lunes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-24 08:00:00";
-- Zorzal 1
SET @equipo = 40;
CALL Circuito1BA(@fecha, @equipo, 1);
-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-24 15:00:00";
-- Halcon 2
SET @equipo = 35;
CALL Circuito1AA(@fecha, @equipo, 1);


-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-24 21:00:00";
-- Halcon 7
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-24 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-24 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-24 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-10-24 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-24 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

-- Martes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-25 09:00:00";
-- Canario 14
SET @equipo = 16;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-25 09:00:00";
-- Halcon 11
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-25 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;
CALL Circuito1BA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-25 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-25 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-25 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-25 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-25 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Miercoles
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-26 09:00:00";
-- Zorzal 1
SET @equipo = 17;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-26 15:00:00";
-- Aguilucho 9
SET @equipo = 7;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-26 18:00:00";
-- Aguilucho 8
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-26 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-26 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-26 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-26 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-26 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Jueves
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-27 15:00:00";
-- Condor 10
SET @equipo = 30;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-27 20:00:00";
-- Halcon 19
SET @equipo = 39;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-27 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-27 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-27 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-27 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-27 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Viernes
-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-28 15:00:00";
-- Condor 18 
SET @equipo = 32;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-28 18:00:00";
-- Aguilucho 12
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-28 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-28 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-28 09:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-28 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-28 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- SABADO 
-- suborbital AK
SET	@fecha = "2022-10-29 08:00:00";
-- Calandria 2 
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital AK
SET	@fecha = "2022-10-29 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-10-29 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-29 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-29 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-29 08:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-10-29 09:00:00";
-- Colibri 8
SET @equipo = 27;
CALL Orbital(@fecha, @equipo, 1); 
-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-10-30 09:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-30 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-10-30 09:00:00";
-- Calandria 7
SET @equipo = 14;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-10-30 08:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-10-30 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);


-- semana 5/8
-- lunes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-31 08:00:00";
-- Zorzal 1
SET @equipo = 40;
CALL Circuito1BA(@fecha, @equipo, 1);
-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;
CALL Circuito1BA(@fecha, @equipo, 2);

-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-10-31 09:00:00";
-- Canario 13 
SET @equipo = 15;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-31 15:00:00";
-- Halcon 2
SET @equipo = 35;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-31 20:00:00";
-- Condor 2 
SET @equipo = 28;
CALL Circuito2AA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-31 21:00:00";
-- Halcon 7
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-10-31 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-10-31 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-31 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-10-31 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-10-31 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

-- Martes
-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-11-01 08:00:00";
-- Carancho 5
SET @equipo = 21;
CALL Orbital(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-01 09:00:00";
-- Canario 14
SET @equipo = 16;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-01 09:00:00";
-- Halcon 11
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-11-01 09:00:00";
-- Zorzal 2 
SET @equipo = 41;
CALL Circuito2BA(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-01 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-11-01 18:00:00";
-- Condor 6
SET @equipo = 29;
CALL Circuito2AA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-01 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-01 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-01 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-01 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-01 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Miercoles
-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-11-02 08:00:00";
-- Carancho 4 
SET @equipo = 20;
CALL Circuito2BA(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-02 09:00:00";
-- Zorzal 1
SET @equipo = 17;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 2 BA ALTA aceleracion
SET	@fecha = "2022-11-02 09:00:00";
-- Halcon 15
SET @equipo = 38;
CALL Circuito1AA(@fecha, @equipo, 1);

-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-11-02 09:00:00";
-- Zorzal 
SET @equipo = 42;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-02 15:00:00";
-- Aguilucho 9
SET @equipo = 7;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-11-02 18:00:00";
-- Aguilucho 8
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- Circuito 2 BA baja aceleracion
SET	@fecha = "2022-11-02 22:00:00";
-- Canario 16
SET @equipo = 18;
CALL Circuito2BA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-02 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-02 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-02 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-02 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-02 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Jueves
-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-11-03 08:00:00";
-- Canario 17
SET @equipo = 19;
CALL Circuito2BA(@fecha, @equipo, 2);

-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-11-03 09:00:00";
-- Aguila 1
SET @equipo = 1;
CALL Circuito2AA(@fecha, @equipo, 2);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-03 15:00:00";
-- Condor 10
SET @equipo = 30;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-03 20:00:00";
-- Halcon 19
SET @equipo = 39;
CALL Circuito1AA(@fecha, @equipo, 1);

-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-11-03 21:00:00";
-- Condor 14
SET @equipo = 31;
CALL Circuito2BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-03 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-03 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-03 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-03 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-03 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Viernes
-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-11-04 09:00:00";
-- Aguila 5
SET @equipo = 2;
CALL Circuito2AA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-04 15:00:00";
-- Condor 18 
SET @equipo = 32;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-11-04 18:00:00";
-- Aguilucho 12
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-04 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-04 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-04 09:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-04 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-04 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- SABADO 
-- suborbital AK
SET	@fecha = "2022-11-05 08:00:00";
-- Calandria 2 
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital AK
SET	@fecha = "2022-11-05 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-11-05 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-05 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-05 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-05 08:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-05 09:00:00";
-- Colibri 8
SET @equipo = 27;
CALL Orbital(@fecha, @equipo, 1); 

-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-11-06 09:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-06 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-06 09:00:00";
-- Calandria 7
SET @equipo = 14;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-11-06 08:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-06 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- TOUR 
SET	@fecha = "2022-11-06 07:00:00";
-- Guanao 4 
SET @equipo = 33;
CALL Tour(@fecha, @equipo);

-- Semana 6/8
-- lunes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-07 08:00:00";
-- Zorzal 1
SET @equipo = 40;
CALL Circuito1BA(@fecha, @equipo, 1);
-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-07 15:00:00";
-- Halcon 2
SET @equipo = 35;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-07 21:00:00";
-- Halcon 7
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-07 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-07 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-07 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-11-07 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-07 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

-- Martes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-08 09:00:00";
-- Canario 14
SET @equipo = 16;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-08 09:00:00";
-- Halcon 11
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-08 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;
CALL Circuito1BA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-08 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-08 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-08 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-08 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-08 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Miercoles
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-09 09:00:00";
-- Zorzal 1
SET @equipo = 17;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-09 15:00:00";
-- Aguilucho 9
SET @equipo = 7;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-11-09 18:00:00";
-- Aguilucho 8
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-09 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-09 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-09 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-09 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-09 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Jueves
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-10 15:00:00";
-- Condor 10
SET @equipo = 30;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-10 20:00:00";
-- Halcon 19
SET @equipo = 39;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-10 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-10 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-10 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-10 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-10 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Viernes
-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-11 15:00:00";
-- Condor 18 
SET @equipo = 32;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-11-11 18:00:00";
-- Aguilucho 12
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-11 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-11 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-11 09:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-11 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-11 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- SABADO 
-- suborbital AK
SET	@fecha = "2022-11-12 08:00:00";
-- Calandria 2 
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital AK
SET	@fecha = "2022-11-12 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-11-12 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-12 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-12 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-12 08:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-12 09:00:00";
-- Colibri 8
SET @equipo = 27;
CALL Orbital(@fecha, @equipo, 1); 

-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-11-13 09:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-13 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-13 09:00:00";
-- Calandria 7
SET @equipo = 14;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-11-13 08:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-13 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 


-- Semana 7/8
-- lunes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-14 08:00:00";
-- Zorzal 1
SET @equipo = 40;
CALL Circuito1BA(@fecha, @equipo, 1);
-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-14 15:00:00";
-- Halcon 2
SET @equipo = 35;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-14 21:00:00";
-- Halcon 7
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-14 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-14 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-14 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-11-14 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-14 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

-- Martes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-15 09:00:00";
-- Canario 14
SET @equipo = 16;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-15 09:00:00";
-- Halcon 11
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-15 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;
CALL Circuito1BA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-15 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-15 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-15 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-15 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-15 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Miercoles
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-16 09:00:00";
-- Zorzal 1
SET @equipo = 17;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-16 15:00:00";
-- Aguilucho 9
SET @equipo = 7;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-11-16 18:00:00";
-- Aguilucho 8
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-16 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-16 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-16 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-16 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-16 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Jueves
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-17 15:00:00";
-- Condor 10
SET @equipo = 30;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-17 20:00:00";
-- Halcon 19
SET @equipo = 39;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-17 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-17 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-17 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-17 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-17 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Viernes
-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-18 15:00:00";
-- Condor 18 
SET @equipo = 32;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-11-18 18:00:00";
-- Aguilucho 12
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-18 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-18 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-18 09:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-18 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-18 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- SABADO 
-- suborbital AK
SET	@fecha = "2022-11-19 08:00:00";
-- Calandria 2 
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital AK
SET	@fecha = "2022-11-19 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-11-19 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-19 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-19 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-19 08:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-19 09:00:00";
-- Colibri 8
SET @equipo = 27;
CALL Orbital(@fecha, @equipo, 1); 

-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-11-20 09:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-20 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-20 09:00:00";
-- Calandria 7
SET @equipo = 14;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-11-20 08:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-20 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 


-- Semana 8/8
-- lunes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-21 08:00:00";
-- Zorzal 1
SET @equipo = 40;
CALL Circuito1BA(@fecha, @equipo, 1);
-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;
CALL Circuito1BA(@fecha, @equipo, 2);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-21 15:00:00";
-- Halcon 2
SET @equipo = 35;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-21 21:00:00";
-- Halcon 7
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-21 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-21 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-21 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1);

-- suborbital AK
SET	@fecha = "2022-11-21 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-21 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

-- Martes
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-22 09:00:00";
-- Canario 14
SET @equipo = 16;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-22 09:00:00";
-- Halcon 11
SET @equipo = 36;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-22 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;
CALL Circuito1BA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-22 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-22 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-22 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-22 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-22 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Miercoles
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-23 09:00:00";
-- Zorzal 1
SET @equipo = 17;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-23 15:00:00";
-- Aguilucho 9
SET @equipo = 7;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-11-23 18:00:00";
-- Aguilucho 8
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-23 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-23 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-23 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-23 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-23 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Jueves
-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-11-24 15:00:00";
-- Condor 10
SET @equipo = 30;
CALL Circuito1BA(@fecha, @equipo, 1);

-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-24 20:00:00";
-- Halcon 19
SET @equipo = 39;
CALL Circuito1AA(@fecha, @equipo, 1);

-- suborbital BA
SET	@fecha = "2022-11-24 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-24 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-24 09:00:00";
-- Calandria 2
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-24 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-24 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- Viernes
-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-11-25 15:00:00";
-- Condor 18 
SET @equipo = 32;
CALL Circuito1AA(@fecha, @equipo, 1);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-11-25 18:00:00";
-- Aguilucho 12
SET @equipo = 10;
CALL Circuito1BA(@fecha, @equipo, 2);

-- suborbital BA
SET	@fecha = "2022-11-25 08:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-25 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-25 09:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-25 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-25 12:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- SABADO 
-- suborbital AK
SET	@fecha = "2022-11-26 08:00:00";
-- Calandria 2 
SET @equipo = 12;
CALL Orbital(@fecha, @equipo, 2);

-- suborbital AK
SET	@fecha = "2022-11-26 08:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-11-26 09:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-26 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-26 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-26 08:00:00";
-- Colibri 5 
SET @equipo = 26;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital BA
SET	@fecha = "2022-11-26 09:00:00";
-- Colibri 8
SET @equipo = 27;
CALL Orbital(@fecha, @equipo, 1);

-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-11-27 09:00:00";
-- Colobri 3 
SET @equipo = 24;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-27 12:00:00";
-- Calandria 1
SET @equipo = 11;
CALL Orbital(@fecha, @equipo, 1); 

-- suborbital AK
SET	@fecha = "2022-11-27 09:00:00";
-- Calandria 7
SET @equipo = 14;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital AK
SET	@fecha = "2022-11-27 08:00:00";
-- Colobri 4 
SET @equipo = 25;
CALL Orbital(@fecha, @equipo, 2); 

-- suborbital BA
SET	@fecha = "2022-11-27 08:00:00";
-- Calandria 6
SET @equipo = 13;
CALL Orbital(@fecha, @equipo, 1);

insert into reservatramo (reservaid, tramoid) values
(1, 49);
insert into reservatramo (reservaid, tramoid) values
(1, 50);
insert into reservatramo (reservaid, tramoid) values
(1, 51);
insert into reservatramo (reservaid, tramoid) values
(1, 52);
insert into reservatramo (reservaid, tramoid) values
(1, 53);
insert into reservatramo (reservaid, tramoid) values
(1, 54);
insert into reservatramo (reservaid, tramoid) values
(1, 55);
insert into reservatramo (reservaid, tramoid) values
(1, 56);
insert into reservatramo (reservaid, tramoid) values
(2, 382);