USE gauchorocket;

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-03 08:00:00";
-- Zorzal 1
SET @equipo = 40;
-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);

-- circuito 2 AK  baja aceleracion
-- Carancho 4 
SET @equipo = 20;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);

-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-10-03 09:00:00";
-- Canario 13 
SET @equipo = 15;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-03 15:00:00";
-- Halcon 2
SET @equipo = 35;

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 5 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 16 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 38 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 48 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 79 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 80 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 81 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 84 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);

-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-03 20:00:00";
-- Guanaco 4 
SET @equipo = 33;

-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);

-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-03 20:00:00";
-- Condor 2 
SET @equipo = 28;

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 14 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 37 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 38 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 104 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 105 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 190 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 191 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 242 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 300 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 352 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 353 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 403 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 439 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 440 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 473 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 474 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 506 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 507 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 529 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 530 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 540 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 541 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 544 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-03 21:00:00";
-- Halcon 7
SET @equipo = 36;

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 5 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 16 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 38 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 48 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 79 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 80 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 81 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 84 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);

-- suborbital BA
SET	@fecha = "2022-10-03 08:00:00";
-- Calandria 1
SET @equipo = 11;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-03 08:00:00";
-- Colobri 3 
SET @equipo = 24;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-03 09:00:00";
-- Calandria 2
SET @equipo = 12;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-03 09:00:00";
-- Colobri 4 
SET @equipo = 25;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);


-- suborbital BA
SET	@fecha = "2022-10-03 12:00:00";
-- Calandria 6
SET @equipo = 13;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);


-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-10-04 08:00:00";
-- Carancho 5
SET @equipo = 21;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-04 09:00:00";
-- Canario 14
SET @equipo = 16;

-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);


-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-04 09:00:00";
-- Halcon 11
SET @equipo = 36;

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 5 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 16 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 38 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 48 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 79 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 80 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 81 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 84 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);

-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-10-04 09:00:00";
-- Zorzal 2 
SET @equipo = 41;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-04 15:00:00";
-- Aguilucho 8 
SET @equipo = 6;

-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);

-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-04 18:00:00";
-- Condor 6
SET @equipo = 29;

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 14 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 37 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 38 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 104 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 105 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 190 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 191 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 242 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 300 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 352 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 353 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 403 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 439 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 440 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 473 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 474 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 506 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 507 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 529 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 530 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 540 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 541 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 544 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);



-- suborbital BA
SET	@fecha = "2022-10-04 08:00:00";
-- Calandria 1
SET @equipo = 11;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-04 08:00:00";
-- Colobri 3 
SET @equipo = 24;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-04 09:00:00";
-- Calandria 2
SET @equipo = 12;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-04 09:00:00";
-- Colobri 4 
SET @equipo = 25;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);


-- suborbital BA
SET	@fecha = "2022-10-04 12:00:00";
-- Calandria 6
SET @equipo = 13;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);





-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-10-05 08:00:00";
-- Carancho 4 
SET @equipo = 20;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-05 09:00:00";
-- Zorzal 1
SET @equipo = 17;

-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);



-- circuito 2 BA ALTA aceleracion
SET	@fecha = "2022-10-05 09:00:00";
-- Halcon 15
SET @equipo = 38;

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 14 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 37 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 38 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 104 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 105 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 190 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 191 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 242 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 300 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 352 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 353 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 403 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 439 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 440 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 473 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 474 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 506 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 507 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 529 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 530 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 540 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 541 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 544 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida8, @fechaLlegada8, 100);


-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-10-05 09:00:00";
-- Zorzal 
SET @equipo = 42;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-05 15:00:00";
-- Aguilucho 9
SET @equipo = 7;

-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);

-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-05 18:00:00";
-- Aguilucho 8
SET @equipo = 10;

-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida4, @fechaLlegada4, 100);


-- Circuito 2 BA baja aceleracion
SET	@fecha = "2022-10-05 22:00:00";
-- Canario 16
SET @equipo = 18;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 1, @fechaSalida8, @fechaLlegada8, 100);



-- suborbital BA
SET	@fecha = "2022-10-05 08:00:00";
-- Calandria 1
SET @equipo = 11;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-05 08:00:00";
-- Colobri 3 
SET @equipo = 24;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-05 09:00:00";
-- Calandria 2
SET @equipo = 12;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-05 09:00:00";
-- Colobri 4 
SET @equipo = 25;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);


-- suborbital BA
SET	@fecha = "2022-10-05 12:00:00";
-- Calandria 6
SET @equipo = 13;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);


-- circuito 2 AK  baja aceleracion
SET	@fecha = "2022-10-06 08:00:00";
-- Canario 17
SET @equipo = 19;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-06 09:00:00";
-- Aguila 1
SET @equipo = 1;

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 14 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 37 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 38 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 104 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 105 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 190 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 191 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 242 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 300 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 352 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 353 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 403 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 439 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 440 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 473 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 474 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 506 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 507 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 529 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 530 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 540 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 541 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 544 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-06 15:00:00";
-- Condor 10
SET @equipo = 30;
-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);


-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-06 20:00:00";
-- Halcon 19
SET @equipo = 39;

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 5 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 16 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 38 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 48 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 79 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 80 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 81 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 84 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);


-- Circuito 2 AK baja aceleracion
SET	@fecha = "2022-10-06 21:00:00";
-- Condor 14
SET @equipo = 31;

-- tramo largo baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 19 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 47 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 95 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 96 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 146 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 147 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 198 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 200 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 270 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 272 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 342 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 400 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 419 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 420 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 446 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 447 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 495 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 496 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 546 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 547 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 598 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 600 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 670 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 672 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 742 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);

-- suborbital BA
SET	@fecha = "2022-10-06 08:00:00";
-- Calandria 1
SET @equipo = 11;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-06 08:00:00";
-- Colobri 3 
SET @equipo = 24;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-06 09:00:00";
-- Calandria 2
SET @equipo = 12;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-06 09:00:00";
-- Colobri 4 
SET @equipo = 25;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);


-- suborbital BA
SET	@fecha = "2022-10-06 12:00:00";
-- Calandria 6
SET @equipo = 13;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);




-- circuito 2 AK  ALTA aceleracion
SET	@fecha = "2022-10-07 09:00:00";
-- Aguila 5
SET @equipo = 2;

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 14 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 37 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 38 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 104 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 105 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 190 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 191 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 242 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / luna 
(@equipo, 3, 5, @fechaSalida2, @fechaLlegada2, 250),
-- luna / marte 
(@equipo, 5, 6, @fechaSalida3, @fechaLlegada3, 350),
-- marte / ganimedes 
(@equipo, 6, 7, @fechaSalida4, @fechaLlegada4, 350),
-- ganimedes / europa 
(@equipo, 7, 8, @fechaSalida5, @fechaLlegada5, 300),
-- europa / lo 
(@equipo, 8, 9, @fechaSalida6, @fechaLlegada6, 300),
-- lo / encendalo 
(@equipo, 9, 10, @fechaSalida7, @fechaLlegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechaSalida8, @fechaLlegada8, 300);

-- tramo largo ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 300 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 352 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 353 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 403 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 439 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 440 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 473 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 474 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 506 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 507 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 529 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 530 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 540 HOUR );
SET @fechaSalida8 = date_add(@fecha, INTERVAL 541 HOUR );
SET @fechaLlegada8 = date_add(@fecha, INTERVAL 544 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- titan / encendalo
(@equipo, 11, 10, @fechaSalida1, @fechaLlegada1, 300),
-- encendalo / lo 
(@equipo, 10, 9, @fechaSalida2, @fechaLlegada2, 300),
-- lo / europa 
(@equipo, 9, 8, @fechaSalida3, @fechaLlegada3, 300),
-- europa / ganimedes 
(@equipo, 8, 7, @fechaSalida4, @fechaLlegada4, 300),
-- ganimedes / marte 
(@equipo, 7, 6, @fechaSalida5, @fechaLlegada5, 350),
-- marte / luna 
(@equipo, 5, 4, @fechaSalida6, @fechaLlegada6, 350),
-- luna / ISS 
(@equipo, 4, 3, @fechaSalida7, @fechaLlegada7, 250),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida8, @fechaLlegada8, 100);


-- circuito 1 BA ALTA  aceleracion 
SET	@fecha = "2022-10-07 15:00:00";
-- Condor 18 
SET @equipo = 32;

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 3 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 4 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 5 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 15 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 16 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 38 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto ALTA aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 48 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 71 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 79 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 80 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 81 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 84 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);


-- circuito 1 BA baja aceleracion 
SET	@fecha = "2022-10-07 15:00:00";
-- Aguilucho 11
SET @equipo = 9;
-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / ISS
(@equipo, 1, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / BA
(@equipo, 3, 1, @fechaSalida4, @fechaLlegada4, 100);



-- circuito 1 AK baja aceleracion 
SET	@fecha = "2022-10-07 18:00:00";
-- Aguilucho 12
SET @equipo = 10;

-- tramo corto baja aceleracion
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 4 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 5 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 6 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 7 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 23 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 24 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 50 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / ISS
(@equipo, 2, 3, @fechaSalida1, @fechaLlegada1, 100),
-- ISS / Orbital Hotel
(@equipo, 3, 4, @fechaSalida2, @fechaLlegada2, 150),
-- Orbital hotel / luna -
(@equipo, 4, 5, @fechaSalida3, @fechaLlegada3, 250),
-- luna / marte- 
(@equipo, 5, 6, @fechaSalida4, @fechaLlegada4, 300);

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 72 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 78 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 80 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 96 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 97 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 98 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 99 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- marte / luna
(@equipo, 6, 5, @fechaSalida1, @fechaLlegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechaSalida2, @fechaLlegada2, 250),
-- orbital hotel / ISS
(@equipo, 4, 3, @fechaSalida3, @fechaLlegada3, 150),
-- ISS / AK
(@equipo, 3, 2, @fechaSalida4, @fechaLlegada4, 100);

-- suborbital BA
SET	@fecha = "2022-10-07 08:00:00";
-- Calandria 1
SET @equipo = 11;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-07 08:00:00";
-- Colobri 3 
SET @equipo = 24;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-07 09:00:00";
-- Colibri 5 
SET @equipo = 26;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-07 09:00:00";
-- Colobri 4 
SET @equipo = 25;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-07 12:00:00";
-- Calandria 6
SET @equipo = 13;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- SABADO 

-- suborbital AK
SET	@fecha = "2022-10-08 08:00:00";
-- Calandria 2 
SET @equipo = 12;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-07 08:00:00";
-- Colobri 3 
SET @equipo = 24;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-08 09:00:00";
-- Colobri 4 
SET @equipo = 25;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-08 12:00:00";
-- Calandria 1
SET @equipo = 11;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-08 08:00:00";
-- Calandria 6
SET @equipo = 13;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-08 08:00:00";
-- Colibri 5 
SET @equipo = 26;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-08 09:00:00";
-- Colibri 8
SET @equipo = 27;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- DOMINGO 
-- suborbital AK
SET	@fecha = "2022-10-09 09:00:00";
-- Colobri 3 
SET @equipo = 24;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-09 12:00:00";
-- Calandria 1
SET @equipo = 11;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-08 09:00:00";
-- Calandria 7
SET @equipo = 14;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital AK
SET	@fecha = "2022-10-09 08:00:00";
-- Colobri 4 
SET @equipo = 25;
-- tramo suboribtal
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- AK / AK
(@equipo, 2, 2, @fechaSalida1, @fechaLlegada1, 100);

-- suborbital BA
SET	@fecha = "2022-10-09 08:00:00";
-- Calandria 6
SET @equipo = 13;
-- tramo suboribtal
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);


-- TOUR 
SET	@fecha = "2022-10-09 07:00:00";
-- Guanao 8 
SET @equipo = 34;
SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 35 DAY );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- BA / BA
(@equipo, 1, 1, @fechaSalida1, @fechaLlegada1, 100);

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

insert into reserva (usuarioid, tramoid, fecha, servicioid, tipocabina) values
(2, 49, "2022-09-03 20:00:00", 2, 3), 
(2, 50, "2022-09-03 20:00:00", 2, 3), 
(2, 51, "2022-09-03 20:00:00", 2, 3), 
(2, 52, "2022-09-03 20:00:00", 2, 3), 
(2, 53, "2022-09-03 20:00:00", 2, 3), 
(2, 54, "2022-09-03 20:00:00", 2, 3), 
(2, 55, "2022-09-03 20:00:00", 2, 3), 
(2, 56, "2022-09-03 20:00:00", 2, 3), 
(2, 382, "2022-09-03 20:00:00", 2, 3);