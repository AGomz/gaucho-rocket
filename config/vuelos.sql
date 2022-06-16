use gauchorocket;

-- circuito 1 ba baja aceleracion
set	@fecha = "2022-10-03 08:00:00";
-- zorzal 1
set @equipo = 40;
-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);

-- circuito 2 ak  baja aceleracion
-- carancho 4
set @equipo = 20;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);

-- circuito 2 ak baja aceleracion
set	@fecha = "2022-10-03 09:00:00";
-- canario 13
set @equipo = 15;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 1 ba alta  aceleracion
set	@fecha = "2022-10-03 15:00:00";
-- halcon 2
set @equipo = 35;

-- tramo corto alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 5 hour );
set @fechasalida3 = date_add(@fecha, interval 6 hour );
set @fechallegada3 = date_add(@fecha, interval 15 hour );
set @fechasalida4 = date_add(@fecha, interval 16 hour );
set @fechallegada4 = date_add(@fecha, interval 38 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 48 hour );
set @fechallegada1 = date_add(@fecha, interval 70 hour );
set @fechasalida2 = date_add(@fecha, interval 71 hour);
set @fechallegada2 = date_add(@fecha, interval 78 hour );
set @fechasalida3 = date_add(@fecha, interval 79 hour );
set @fechallegada3 = date_add(@fecha, interval 80 hour );
set @fechasalida4 = date_add(@fecha, interval 81 hour );
set @fechallegada4 = date_add(@fecha, interval 84 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);

-- circuito 1 ba baja aceleracion
set	@fecha = "2022-10-03 20:00:00";
-- guanaco 4
set @equipo = 33;

-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);

-- circuito 2 ak  alta aceleracion
set	@fecha = "2022-10-03 20:00:00";
-- condor 2
set @equipo = 28;

-- tramo largo alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 14 hour );
set @fechasalida3 = date_add(@fecha, interval 15 hour );
set @fechallegada3 = date_add(@fecha, interval 37 hour );
set @fechasalida4 = date_add(@fecha, interval 38 hour );
set @fechallegada4 = date_add(@fecha, interval 70 hour );
set @fechasalida5 = date_add(@fecha, interval 71 hour);
set @fechallegada5 = date_add(@fecha, interval 104 hour );
set @fechasalida6 = date_add(@fecha, interval 105 hour );
set @fechallegada6 = date_add(@fecha, interval 140 hour );
set @fechasalida7 = date_add(@fecha, interval 140 hour );
set @fechallegada7 = date_add(@fecha, interval 190 hour );
set @fechasalida8 = date_add(@fecha, interval 191 hour );
set @fechallegada8 = date_add(@fecha, interval 242 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 300 hour );
set @fechallegada1 = date_add(@fecha, interval 352 hour );
set @fechasalida2 = date_add(@fecha, interval 353 hour);
set @fechallegada2 = date_add(@fecha, interval 403 hour );
set @fechasalida3 = date_add(@fecha, interval 404 hour );
set @fechallegada3 = date_add(@fecha, interval 439 hour );
set @fechasalida4 = date_add(@fecha, interval 440 hour );
set @fechallegada4 = date_add(@fecha, interval 473 hour );
set @fechasalida5 = date_add(@fecha, interval 474 hour);
set @fechallegada5 = date_add(@fecha, interval 506 hour );
set @fechasalida6 = date_add(@fecha, interval 507 hour );
set @fechallegada6 = date_add(@fecha, interval 529 hour );
set @fechasalida7 = date_add(@fecha, interval 530 hour );
set @fechallegada7 = date_add(@fecha, interval 540 hour );
set @fechasalida8 = date_add(@fecha, interval 541 hour );
set @fechallegada8 = date_add(@fecha, interval 544 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 1 ba alta  aceleracion
set	@fecha = "2022-10-03 21:00:00";
-- halcon 7
set @equipo = 36;

-- tramo corto alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 5 hour );
set @fechasalida3 = date_add(@fecha, interval 6 hour );
set @fechallegada3 = date_add(@fecha, interval 15 hour );
set @fechasalida4 = date_add(@fecha, interval 16 hour );
set @fechallegada4 = date_add(@fecha, interval 38 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 48 hour );
set @fechallegada1 = date_add(@fecha, interval 70 hour );
set @fechasalida2 = date_add(@fecha, interval 71 hour);
set @fechallegada2 = date_add(@fecha, interval 78 hour );
set @fechasalida3 = date_add(@fecha, interval 79 hour );
set @fechallegada3 = date_add(@fecha, interval 80 hour );
set @fechasalida4 = date_add(@fecha, interval 81 hour );
set @fechallegada4 = date_add(@fecha, interval 84 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);

-- suborbital ba
set	@fecha = "2022-10-03 08:00:00";
-- calandria 1
set @equipo = 11;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-03 08:00:00";
-- colobri 3
set @equipo = 24;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-03 09:00:00";
-- calandria 2
set @equipo = 12;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-03 09:00:00";
-- colobri 4
set @equipo = 25;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);


-- suborbital ba
set	@fecha = "2022-10-03 12:00:00";
-- calandria 6
set @equipo = 13;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);


-- circuito 2 ak  baja aceleracion
set	@fecha = "2022-10-04 08:00:00";
-- carancho 5
set @equipo = 21;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 1 ba baja aceleracion
set	@fecha = "2022-10-04 09:00:00";
-- canario 14
set @equipo = 16;

-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);


-- circuito 1 ba alta  aceleracion
set	@fecha = "2022-10-04 09:00:00";
-- halcon 11
set @equipo = 36;

-- tramo corto alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 5 hour );
set @fechasalida3 = date_add(@fecha, interval 6 hour );
set @fechallegada3 = date_add(@fecha, interval 15 hour );
set @fechasalida4 = date_add(@fecha, interval 16 hour );
set @fechallegada4 = date_add(@fecha, interval 38 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 48 hour );
set @fechallegada1 = date_add(@fecha, interval 70 hour );
set @fechasalida2 = date_add(@fecha, interval 71 hour);
set @fechallegada2 = date_add(@fecha, interval 78 hour );
set @fechasalida3 = date_add(@fecha, interval 79 hour );
set @fechallegada3 = date_add(@fecha, interval 80 hour );
set @fechasalida4 = date_add(@fecha, interval 81 hour );
set @fechallegada4 = date_add(@fecha, interval 84 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);

-- circuito 2 ak  baja aceleracion
set	@fecha = "2022-10-04 09:00:00";
-- zorzal 2
set @equipo = 41;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 1 ba baja aceleracion
set	@fecha = "2022-10-04 15:00:00";
-- aguilucho 8
set @equipo = 6;

-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);

-- circuito 2 ak  alta aceleracion
set	@fecha = "2022-10-04 18:00:00";
-- condor 6
set @equipo = 29;

-- tramo largo alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 14 hour );
set @fechasalida3 = date_add(@fecha, interval 15 hour );
set @fechallegada3 = date_add(@fecha, interval 37 hour );
set @fechasalida4 = date_add(@fecha, interval 38 hour );
set @fechallegada4 = date_add(@fecha, interval 70 hour );
set @fechasalida5 = date_add(@fecha, interval 71 hour);
set @fechallegada5 = date_add(@fecha, interval 104 hour );
set @fechasalida6 = date_add(@fecha, interval 105 hour );
set @fechallegada6 = date_add(@fecha, interval 140 hour );
set @fechasalida7 = date_add(@fecha, interval 140 hour );
set @fechallegada7 = date_add(@fecha, interval 190 hour );
set @fechasalida8 = date_add(@fecha, interval 191 hour );
set @fechallegada8 = date_add(@fecha, interval 242 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 300 hour );
set @fechallegada1 = date_add(@fecha, interval 352 hour );
set @fechasalida2 = date_add(@fecha, interval 353 hour);
set @fechallegada2 = date_add(@fecha, interval 403 hour );
set @fechasalida3 = date_add(@fecha, interval 404 hour );
set @fechallegada3 = date_add(@fecha, interval 439 hour );
set @fechasalida4 = date_add(@fecha, interval 440 hour );
set @fechallegada4 = date_add(@fecha, interval 473 hour );
set @fechasalida5 = date_add(@fecha, interval 474 hour);
set @fechallegada5 = date_add(@fecha, interval 506 hour );
set @fechasalida6 = date_add(@fecha, interval 507 hour );
set @fechallegada6 = date_add(@fecha, interval 529 hour );
set @fechasalida7 = date_add(@fecha, interval 530 hour );
set @fechallegada7 = date_add(@fecha, interval 540 hour );
set @fechasalida8 = date_add(@fecha, interval 541 hour );
set @fechallegada8 = date_add(@fecha, interval 544 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);



-- suborbital ba
set	@fecha = "2022-10-04 08:00:00";
-- calandria 1
set @equipo = 11;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-04 08:00:00";
-- colobri 3
set @equipo = 24;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-04 09:00:00";
-- calandria 2
set @equipo = 12;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-04 09:00:00";
-- colobri 4
set @equipo = 25;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);


-- suborbital ba
set	@fecha = "2022-10-04 12:00:00";
-- calandria 6
set @equipo = 13;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);





-- circuito 2 ak  baja aceleracion
set	@fecha = "2022-10-05 08:00:00";
-- carancho 4
set @equipo = 20;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 1 ba baja aceleracion
set	@fecha = "2022-10-05 09:00:00";
-- zorzal 1
set @equipo = 17;

-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);



-- circuito 2 ba alta aceleracion
set	@fecha = "2022-10-05 09:00:00";
-- halcon 15
set @equipo = 38;

-- tramo largo alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 14 hour );
set @fechasalida3 = date_add(@fecha, interval 15 hour );
set @fechallegada3 = date_add(@fecha, interval 37 hour );
set @fechasalida4 = date_add(@fecha, interval 38 hour );
set @fechallegada4 = date_add(@fecha, interval 70 hour );
set @fechasalida5 = date_add(@fecha, interval 71 hour);
set @fechallegada5 = date_add(@fecha, interval 104 hour );
set @fechasalida6 = date_add(@fecha, interval 105 hour );
set @fechallegada6 = date_add(@fecha, interval 140 hour );
set @fechasalida7 = date_add(@fecha, interval 140 hour );
set @fechallegada7 = date_add(@fecha, interval 190 hour );
set @fechasalida8 = date_add(@fecha, interval 191 hour );
set @fechallegada8 = date_add(@fecha, interval 242 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 300 hour );
set @fechallegada1 = date_add(@fecha, interval 352 hour );
set @fechasalida2 = date_add(@fecha, interval 353 hour);
set @fechallegada2 = date_add(@fecha, interval 403 hour );
set @fechasalida3 = date_add(@fecha, interval 404 hour );
set @fechallegada3 = date_add(@fecha, interval 439 hour );
set @fechasalida4 = date_add(@fecha, interval 440 hour );
set @fechallegada4 = date_add(@fecha, interval 473 hour );
set @fechasalida5 = date_add(@fecha, interval 474 hour);
set @fechallegada5 = date_add(@fecha, interval 506 hour );
set @fechasalida6 = date_add(@fecha, interval 507 hour );
set @fechallegada6 = date_add(@fecha, interval 529 hour );
set @fechasalida7 = date_add(@fecha, interval 530 hour );
set @fechallegada7 = date_add(@fecha, interval 540 hour );
set @fechasalida8 = date_add(@fecha, interval 541 hour );
set @fechallegada8 = date_add(@fecha, interval 544 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ba
(@equipo, 3, 1, @fechasalida8, @fechallegada8, 100);


-- circuito 2 ak baja aceleracion
set	@fecha = "2022-10-05 09:00:00";
-- zorzal
set @equipo = 42;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 1 ba baja aceleracion
set	@fecha = "2022-10-05 15:00:00";
-- aguilucho 9
set @equipo = 7;

-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);

-- circuito 1 ak baja aceleracion
set	@fecha = "2022-10-05 18:00:00";
-- aguilucho 8
set @equipo = 10;

-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ak
(@equipo, 3, 2, @fechasalida4, @fechallegada4, 100);


-- circuito 2 ba baja aceleracion
set	@fecha = "2022-10-05 22:00:00";
-- canario 16
set @equipo = 18;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 1, @fechasalida8, @fechallegada8, 100);



-- suborbital ba
set	@fecha = "2022-10-05 08:00:00";
-- calandria 1
set @equipo = 11;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-05 08:00:00";
-- colobri 3
set @equipo = 24;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-05 09:00:00";
-- calandria 2
set @equipo = 12;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-05 09:00:00";
-- colobri 4
set @equipo = 25;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);


-- suborbital ba
set	@fecha = "2022-10-05 12:00:00";
-- calandria 6
set @equipo = 13;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);


-- circuito 2 ak  baja aceleracion
set	@fecha = "2022-10-06 08:00:00";
-- canario 17
set @equipo = 19;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 2 ak  alta aceleracion
set	@fecha = "2022-10-06 09:00:00";
-- aguila 1
set @equipo = 1;

-- tramo largo alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 14 hour );
set @fechasalida3 = date_add(@fecha, interval 15 hour );
set @fechallegada3 = date_add(@fecha, interval 37 hour );
set @fechasalida4 = date_add(@fecha, interval 38 hour );
set @fechallegada4 = date_add(@fecha, interval 70 hour );
set @fechasalida5 = date_add(@fecha, interval 71 hour);
set @fechallegada5 = date_add(@fecha, interval 104 hour );
set @fechasalida6 = date_add(@fecha, interval 105 hour );
set @fechallegada6 = date_add(@fecha, interval 140 hour );
set @fechasalida7 = date_add(@fecha, interval 140 hour );
set @fechallegada7 = date_add(@fecha, interval 190 hour );
set @fechasalida8 = date_add(@fecha, interval 191 hour );
set @fechallegada8 = date_add(@fecha, interval 242 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 300 hour );
set @fechallegada1 = date_add(@fecha, interval 352 hour );
set @fechasalida2 = date_add(@fecha, interval 353 hour);
set @fechallegada2 = date_add(@fecha, interval 403 hour );
set @fechasalida3 = date_add(@fecha, interval 404 hour );
set @fechallegada3 = date_add(@fecha, interval 439 hour );
set @fechasalida4 = date_add(@fecha, interval 440 hour );
set @fechallegada4 = date_add(@fecha, interval 473 hour );
set @fechasalida5 = date_add(@fecha, interval 474 hour);
set @fechallegada5 = date_add(@fecha, interval 506 hour );
set @fechasalida6 = date_add(@fecha, interval 507 hour );
set @fechallegada6 = date_add(@fecha, interval 529 hour );
set @fechasalida7 = date_add(@fecha, interval 530 hour );
set @fechallegada7 = date_add(@fecha, interval 540 hour );
set @fechasalida8 = date_add(@fecha, interval 541 hour );
set @fechallegada8 = date_add(@fecha, interval 544 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 1 ba baja aceleracion
set	@fecha = "2022-10-06 15:00:00";
-- condor 10
set @equipo = 30;
-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);


-- circuito 1 ba alta  aceleracion
set	@fecha = "2022-10-06 20:00:00";
-- halcon 19
set @equipo = 39;

-- tramo corto alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 5 hour );
set @fechasalida3 = date_add(@fecha, interval 6 hour );
set @fechallegada3 = date_add(@fecha, interval 15 hour );
set @fechasalida4 = date_add(@fecha, interval 16 hour );
set @fechallegada4 = date_add(@fecha, interval 38 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 48 hour );
set @fechallegada1 = date_add(@fecha, interval 70 hour );
set @fechasalida2 = date_add(@fecha, interval 71 hour);
set @fechallegada2 = date_add(@fecha, interval 78 hour );
set @fechasalida3 = date_add(@fecha, interval 79 hour );
set @fechallegada3 = date_add(@fecha, interval 80 hour );
set @fechasalida4 = date_add(@fecha, interval 81 hour );
set @fechallegada4 = date_add(@fecha, interval 84 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);


-- circuito 2 ak baja aceleracion
set	@fecha = "2022-10-06 21:00:00";
-- condor 14
set @equipo = 31;

-- tramo largo baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 19 hour );
set @fechasalida3 = date_add(@fecha, interval 20 hour );
set @fechallegada3 = date_add(@fecha, interval 46 hour );
set @fechasalida4 = date_add(@fecha, interval 47 hour );
set @fechallegada4 = date_add(@fecha, interval 95 hour );
set @fechasalida5 = date_add(@fecha, interval 96 hour);
set @fechallegada5 = date_add(@fecha, interval 146 hour );
set @fechasalida6 = date_add(@fecha, interval 147 hour );
set @fechallegada6 = date_add(@fecha, interval 198 hour );
set @fechasalida7 = date_add(@fecha, interval 200 hour );
set @fechallegada7 = date_add(@fecha, interval 270 hour );
set @fechasalida8 = date_add(@fecha, interval 272 hour );
set @fechallegada8 = date_add(@fecha, interval 342 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 400 hour );
set @fechallegada1 = date_add(@fecha, interval 404 hour );
set @fechasalida2 = date_add(@fecha, interval 405 hour);
set @fechallegada2 = date_add(@fecha, interval 419 hour );
set @fechasalida3 = date_add(@fecha, interval 420 hour );
set @fechallegada3 = date_add(@fecha, interval 446 hour );
set @fechasalida4 = date_add(@fecha, interval 447 hour );
set @fechallegada4 = date_add(@fecha, interval 495 hour );
set @fechasalida5 = date_add(@fecha, interval 496 hour);
set @fechallegada5 = date_add(@fecha, interval 546 hour );
set @fechasalida6 = date_add(@fecha, interval 547 hour );
set @fechallegada6 = date_add(@fecha, interval 598 hour );
set @fechasalida7 = date_add(@fecha, interval 600 hour );
set @fechallegada7 = date_add(@fecha, interval 670 hour );
set @fechasalida8 = date_add(@fecha, interval 672 hour );
set @fechallegada8 = date_add(@fecha, interval 742 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);

-- suborbital ba
set	@fecha = "2022-10-06 08:00:00";
-- calandria 1
set @equipo = 11;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-06 08:00:00";
-- colobri 3
set @equipo = 24;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-06 09:00:00";
-- calandria 2
set @equipo = 12;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-06 09:00:00";
-- colobri 4
set @equipo = 25;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);


-- suborbital ba
set	@fecha = "2022-10-06 12:00:00";
-- calandria 6
set @equipo = 13;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);




-- circuito 2 ak  alta aceleracion
set	@fecha = "2022-10-07 09:00:00";
-- aguila 5
set @equipo = 2;

-- tramo largo alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 14 hour );
set @fechasalida3 = date_add(@fecha, interval 15 hour );
set @fechallegada3 = date_add(@fecha, interval 37 hour );
set @fechasalida4 = date_add(@fecha, interval 38 hour );
set @fechallegada4 = date_add(@fecha, interval 70 hour );
set @fechasalida5 = date_add(@fecha, interval 71 hour);
set @fechallegada5 = date_add(@fecha, interval 104 hour );
set @fechasalida6 = date_add(@fecha, interval 105 hour );
set @fechallegada6 = date_add(@fecha, interval 140 hour );
set @fechasalida7 = date_add(@fecha, interval 140 hour );
set @fechallegada7 = date_add(@fecha, interval 190 hour );
set @fechasalida8 = date_add(@fecha, interval 191 hour );
set @fechallegada8 = date_add(@fecha, interval 242 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / luna
(@equipo, 3, 5, @fechasalida2, @fechallegada2, 250),
-- luna / marte
(@equipo, 5, 6, @fechasalida3, @fechallegada3, 350),
-- marte / ganimedes
(@equipo, 6, 7, @fechasalida4, @fechallegada4, 350),
-- ganimedes / europa
(@equipo, 7, 8, @fechasalida5, @fechallegada5, 300),
-- europa / lo
(@equipo, 8, 9, @fechasalida6, @fechallegada6, 300),
-- lo / encendalo
(@equipo, 9, 10, @fechasalida7, @fechallegada7, 300),
-- encendalo / titan
(@equipo, 10, 11, @fechasalida8, @fechallegada8, 300);

-- tramo largo alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 300 hour );
set @fechallegada1 = date_add(@fecha, interval 352 hour );
set @fechasalida2 = date_add(@fecha, interval 353 hour);
set @fechallegada2 = date_add(@fecha, interval 403 hour );
set @fechasalida3 = date_add(@fecha, interval 404 hour );
set @fechallegada3 = date_add(@fecha, interval 439 hour );
set @fechasalida4 = date_add(@fecha, interval 440 hour );
set @fechallegada4 = date_add(@fecha, interval 473 hour );
set @fechasalida5 = date_add(@fecha, interval 474 hour);
set @fechallegada5 = date_add(@fecha, interval 506 hour );
set @fechasalida6 = date_add(@fecha, interval 507 hour );
set @fechallegada6 = date_add(@fecha, interval 529 hour );
set @fechasalida7 = date_add(@fecha, interval 530 hour );
set @fechallegada7 = date_add(@fecha, interval 540 hour );
set @fechasalida8 = date_add(@fecha, interval 541 hour );
set @fechallegada8 = date_add(@fecha, interval 544 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- titan / encendalo
(@equipo, 11, 10, @fechasalida1, @fechallegada1, 300),
-- encendalo / lo
(@equipo, 10, 9, @fechasalida2, @fechallegada2, 300),
-- lo / europa
(@equipo, 9, 8, @fechasalida3, @fechallegada3, 300),
-- europa / ganimedes
(@equipo, 8, 7, @fechasalida4, @fechallegada4, 300),
-- ganimedes / marte
(@equipo, 7, 6, @fechasalida5, @fechallegada5, 350),
-- marte / luna
(@equipo, 5, 4, @fechasalida6, @fechallegada6, 350),
-- luna / iss
(@equipo, 4, 3, @fechasalida7, @fechallegada7, 250),
-- iss / ak
(@equipo, 3, 2, @fechasalida8, @fechallegada8, 100);


-- circuito 1 ba alta  aceleracion
set	@fecha = "2022-10-07 15:00:00";
-- condor 18
set @equipo = 32;

-- tramo corto alta aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 3 hour );
set @fechasalida2 = date_add(@fecha, interval 4 hour);
set @fechallegada2 = date_add(@fecha, interval 5 hour );
set @fechasalida3 = date_add(@fecha, interval 6 hour );
set @fechallegada3 = date_add(@fecha, interval 15 hour );
set @fechasalida4 = date_add(@fecha, interval 16 hour );
set @fechallegada4 = date_add(@fecha, interval 38 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto alta aceleracion
set @fechasalida1 = date_add(@fecha, interval 48 hour );
set @fechallegada1 = date_add(@fecha, interval 70 hour );
set @fechasalida2 = date_add(@fecha, interval 71 hour);
set @fechallegada2 = date_add(@fecha, interval 78 hour );
set @fechasalida3 = date_add(@fecha, interval 79 hour );
set @fechallegada3 = date_add(@fecha, interval 80 hour );
set @fechasalida4 = date_add(@fecha, interval 81 hour );
set @fechallegada4 = date_add(@fecha, interval 84 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);


-- circuito 1 ba baja aceleracion
set	@fecha = "2022-10-07 15:00:00";
-- aguilucho 11
set @equipo = 9;
-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / iss
(@equipo, 1, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ba
(@equipo, 3, 1, @fechasalida4, @fechallegada4, 100);



-- circuito 1 ak baja aceleracion
set	@fecha = "2022-10-07 18:00:00";
-- aguilucho 12
set @equipo = 10;

-- tramo corto baja aceleracion
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 4 hour );
set @fechasalida2 = date_add(@fecha, interval 5 hour);
set @fechallegada2 = date_add(@fecha, interval 6 hour );
set @fechasalida3 = date_add(@fecha, interval 7 hour );
set @fechallegada3 = date_add(@fecha, interval 23 hour );
set @fechasalida4 = date_add(@fecha, interval 24 hour );
set @fechallegada4 = date_add(@fecha, interval 50 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / iss
(@equipo, 2, 3, @fechasalida1, @fechallegada1, 100),
-- iss / orbital hotel
(@equipo, 3, 4, @fechasalida2, @fechallegada2, 150),
-- orbital hotel / luna -
(@equipo, 4, 5, @fechasalida3, @fechallegada3, 250),
-- luna / marte-
(@equipo, 5, 6, @fechasalida4, @fechallegada4, 300);

-- tramo corto baja aceleracion
set @fechasalida1 = date_add(@fecha, interval 72 hour );
set @fechallegada1 = date_add(@fecha, interval 78 hour );
set @fechasalida2 = date_add(@fecha, interval 80 hour);
set @fechallegada2 = date_add(@fecha, interval 96 hour );
set @fechasalida3 = date_add(@fecha, interval 97 hour );
set @fechallegada3 = date_add(@fecha, interval 98 hour );
set @fechasalida4 = date_add(@fecha, interval 99 hour );
set @fechallegada4 = date_add(@fecha, interval 104 hour );

insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- marte / luna
(@equipo, 6, 5, @fechasalida1, @fechallegada1, 300),
-- luna / orbital hotel
(@equipo, 5, 4, @fechasalida2, @fechallegada2, 250),
-- orbital hotel / iss
(@equipo, 4, 3, @fechasalida3, @fechallegada3, 150),
-- iss / ak
(@equipo, 3, 2, @fechasalida4, @fechallegada4, 100);

-- suborbital ba
set	@fecha = "2022-10-07 08:00:00";
-- calandria 1
set @equipo = 11;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-07 08:00:00";
-- colobri 3
set @equipo = 24;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-07 09:00:00";
-- colibri 5
set @equipo = 26;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-07 09:00:00";
-- colobri 4
set @equipo = 25;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-07 12:00:00";
-- calandria 6
set @equipo = 13;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- sabado

-- suborbital ak
set	@fecha = "2022-10-08 08:00:00";
-- calandria 2
set @equipo = 12;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-07 08:00:00";
-- colobri 3
set @equipo = 24;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-08 09:00:00";
-- colobri 4
set @equipo = 25;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-08 12:00:00";
-- calandria 1
set @equipo = 11;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-08 08:00:00";
-- calandria 6
set @equipo = 13;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-08 08:00:00";
-- colibri 5
set @equipo = 26;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-08 09:00:00";
-- colibri 8
set @equipo = 27;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- domingo
-- suborbital ak
set	@fecha = "2022-10-09 09:00:00";
-- colobri 3
set @equipo = 24;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-09 12:00:00";
-- calandria 1
set @equipo = 11;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-08 09:00:00";
-- calandria 7
set @equipo = 14;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ak
set	@fecha = "2022-10-09 08:00:00";
-- colobri 4
set @equipo = 25;
-- tramo suboribtal
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ak / ak
(@equipo, 2, 2, @fechasalida1, @fechallegada1, 100);

-- suborbital ba
set	@fecha = "2022-10-09 08:00:00";
-- calandria 6
set @equipo = 13;
-- tramo suboribtal
set @fechallegada1 = date_add(@fecha, interval 8 hour );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);


-- tour
set	@fecha = "2022-10-09 07:00:00";
-- guanao 8
set @equipo = 34;
set @fechasalida1 = @fecha;
set @fechallegada1 = date_add(@fecha, interval 35 day );
insert into tramo (equipoid, origenid, destinoid, fechasalida, fechallegada, precio) values
-- ba / ba
(@equipo, 1, 1, @fechasalida1, @fechallegada1, 100);

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