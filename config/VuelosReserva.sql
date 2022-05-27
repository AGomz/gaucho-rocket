USE gauchorocket;

SET	@fecha = "2022-10-01 20:00:00";

SET @fechaSalida1 = @fecha;
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 8 HOUR);
SET @fechaSalida2 = date_add(@fecha, INTERVAL 16 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 24 HOUR);

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- Tierra / ISS 
(12, 1, 3, @fechaSalida1, @fechaLlegada1, 500),
(12, 3, 1, @fechaSalida2, @fechaLlegada2, 500),
(13, 3, 1, @fechaSalida1, @fechaLlegada1, 500),
(13, 1, 3, @fechaSalida2, @fechaLlegada2, 500);

SET @fechaSalida1 = date_add(@fecha, INTERVAL 8 hour);
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 16 hour);
SET @fechaSalida2 = date_add(@fecha, INTERVAL 24 hour);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 32 hour);
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- Tierra / ISS 
(25, 2, 3, @fechaSalida1, @fechaLlegada1, 500),
(25, 3, 2, @fechaSalida2, @fechaLlegada2, 500),
(26, 3, 2, @fechaSalida1, @fechaLlegada1, 500),
(26, 2, 3, @fechaSalida2, @fechaLlegada2, 500);

SET @fechaSalida1 = date_add(@fecha, INTERVAL 1 DAY);
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 36 DAY );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 16 DAY );
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 61 DAY );
INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- Tour
(33, 3, 2,  @fechaSalida1, @fechaLlegada1, 500),
(34, 2, 3,  @fechaSalida2, @fechaLlegada2, 500);


-- vuelos regulares

-- tramo corto baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 10 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 11 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 12 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 18 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 20 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 46 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- ISS / orbital hotel baja aceleracion
(41, 3, 4, @fechaSalida1, @fechaLlegada1, 500),
-- Orbital hotel / luna - baja aceleracion
(41, 4, 5, @fechaSalida2, @fechaLlegada2, 500),
-- luna / marte- baja aceleracion
(41, 5, 6, @fechaSalida3, @fechaLlegada3, 500);

-- tramo corto baja aceleracion retorno
SET @fechaSalida1 = date_add(@fecha, INTERVAL 110 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 111 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 112 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 118 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 120 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 146 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- luna / marte- baja aceleracion
(41, 6, 5, @fechaSalida3, @fechaLlegada3, 500),
-- Orbital hotel / luna - baja aceleracion
(41, 5, 4, @fechaSalida2, @fechaLlegada2, 500),
-- ISS / orbital hotel baja aceleracion
(41, 4, 3, @fechaSalida1, @fechaLlegada1, 500);

-- tramo corto alta aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 29 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 30 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 31 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 39 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 40 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 52 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- tramo corto
-- ISS / orbital hotel alta aceleracion
(28, 3, 4, @fechaSalida1, @fechaLlegada1, 500),
-- Orbital hotel / luna - alta aceleracion
(28, 4, 5, @fechaSalida2, @fechaLlegada2, 500),
-- luna / marte- alta aceleracion
(28, 5, 6, @fechaSalida3, @fechaLlegada3, 500);

-- tramo corto alta aceleracion retorno
SET @fechaSalida1 = date_add(@fecha, INTERVAL 129 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 130 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 131 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 139 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 152 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- luna / marte- alta aceleracion
(28, 6, 5, @fechaSalida3, @fechaLlegada3, 500),
-- Orbital hotel / luna - alta aceleracion
(28, 5, 4, @fechaSalida2, @fechaLlegada2, 500),
-- ISS / orbital hotel alta aceleracion
(28, 4, 3, @fechaSalida1, @fechaLlegada1, 500);


-- tramo largo baja aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 10 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 14 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 15 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 41 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 42 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 90 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 91 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 141 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 142 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 193 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 194 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 264 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 265 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 335 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- tramo largo
-- ISS / luna hotel baja aceleracion
(8, 3, 5, @fechaSalida1, @fechaLlegada1, 500),
-- luna / marte - baja aceleracion
(8, 5, 6, @fechaSalida2, @fechaLlegada2, 500),
-- marte / ganimedes baja aceleracion
(8, 6, 7, @fechaSalida3, @fechaLlegada3, 500),
-- ganimedes / europa - baja aceleracion
(8, 7, 8, @fechaSalida4, @fechaLlegada4, 500),
-- europa / lo baja aceleracion
(8, 8, 9, @fechaSalida5, @fechaLlegada5, 500),
-- lo / encendalo - baja aceleracion
(8, 9, 10, @fechaSalida6, @fechaLlegada6, 500),
-- encendalo / titan  baja aceleracion
(8, 10, 11, @fechaSalida7, @fechaLlegada7, 500);

SET @fechaSalida1 = date_add(@fecha, INTERVAL 410 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 414 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 415 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 441 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 442 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 490 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 491 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 541 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 542 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 593 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 594 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 664 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 665 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 735 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- tramo largo  Vuelta
-- encendalo / titan hotel baja aceleracion
(8, 11, 10, @fechaSalida7, @fechaLlegada4, 500),
-- lo / encendalo - baja aceleracion
(8, 10, 9, @fechaSalida6, @fechaLlegada4, 500),
-- europa / lo baja aceleracion
(8, 9, 8, @fechaSalida5, @fechaLlegada4, 500),
-- ganimedes / europa - baja aceleracion
(8, 8, 7, @fechaSalida4, @fechaLlegada4, 500),
-- marte / ganimedes baja aceleracion
(8, 7, 6, @fechaSalida3, @fechaLlegada3, 500),
-- luna / marte - baja aceleracion
(8, 6, 5, @fechaSalida2, @fechaLlegada2, 500),
-- luna / marte- baja aceleracion
(8, 5, 3, @fechaSalida1, @fechaLlegada1, 500);




-- tramo largo alta aceleracion
SET @fechaSalida1 = date_add(@fecha, INTERVAL 12 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 14 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 15 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 37 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 38 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 70 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 71 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 104 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 105 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 140 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 142 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 152 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 152 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 205 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- tramo largo
-- ISS / luna hotel baja aceleracion
(8, 3, 5, @fechaSalida1, @fechaLlegada1, 500),
-- luna / marte - baja aceleracion
(8, 5, 6, @fechaSalida2, @fechaLlegada2, 500),
-- marte / ganimedes baja aceleracion
(8, 6, 7, @fechaSalida3, @fechaLlegada3, 500),
-- ganimedes / europa - baja aceleracion
(8, 7, 8, @fechaSalida4, @fechaLlegada4, 500),
-- europa / lo baja aceleracion
(8, 8, 9, @fechaSalida5, @fechaLlegada5, 500),
-- lo / encendalo - baja aceleracion
(8, 9, 10, @fechaSalida6, @fechaLlegada6, 500),
-- encendalo / titan  baja aceleracion
(8, 10, 11, @fechaSalida7, @fechaLlegada7, 500);

-- tramo largo alta aceleracion retorno
SET @fechaSalida1 = date_add(@fecha, INTERVAL 312 HOUR );
SET @fechaLlegada1 = date_add(@fecha, INTERVAL 314 HOUR );
SET @fechaSalida2 = date_add(@fecha, INTERVAL 315 HOUR);
SET @fechaLlegada2 = date_add(@fecha, INTERVAL 337 HOUR );
SET @fechaSalida3 = date_add(@fecha, INTERVAL 338 HOUR );
SET @fechaLlegada3 = date_add(@fecha, INTERVAL 370 HOUR );
SET @fechaSalida4 = date_add(@fecha, INTERVAL 371 HOUR );
SET @fechaLlegada4 = date_add(@fecha, INTERVAL 404 HOUR );
SET @fechaSalida5 = date_add(@fecha, INTERVAL 405 HOUR);
SET @fechaLlegada5 = date_add(@fecha, INTERVAL 440 HOUR );
SET @fechaSalida6 = date_add(@fecha, INTERVAL 442 HOUR );
SET @fechaLlegada6 = date_add(@fecha, INTERVAL 452 HOUR );
SET @fechaSalida7 = date_add(@fecha, INTERVAL 452 HOUR );
SET @fechaLlegada7 = date_add(@fecha, INTERVAL 505 HOUR );

INSERT INTO Tramo (EquipoID, OrigenID, DestinoID, FechaSalida, FechaLlegada, Precio) VALUES
-- tramo largo  Vuelta
-- encendalo / titan hotel baja aceleracion
(8, 11, 10, @fechaSalida7, @fechaLlegada4, 500),
-- lo / encendalo - baja aceleracion
(8, 10, 9, @fechaSalida6, @fechaLlegada4, 500),
-- europa / lo baja aceleracion
(8, 9, 8, @fechaSalida5, @fechaLlegada4, 500),
-- ganimedes / europa - baja aceleracion
(8, 8, 7, @fechaSalida4, @fechaLlegada4, 500),
-- marte / ganimedes baja aceleracion
(8, 7, 6, @fechaSalida3, @fechaLlegada3, 500),
-- luna / marte - baja aceleracion
(8, 6, 5, @fechaSalida2, @fechaLlegada2, 500),
-- luna / marte- baja aceleracion
(8, 5, 3, @fechaSalida1, @fechaLlegada1, 500);


-- reservas de un vuelo ISS a orbital hotel
-- zorzal 50T 50E
-- tipo de cabina 1-Turista, 2-Ejecutivo, 3-primera
-- servicio a bordo: 1-standard, 2-gourmet, 3-spa

