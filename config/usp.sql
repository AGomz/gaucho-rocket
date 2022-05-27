DROP PROCEDURE IF EXISTS uspListarDestinos;
DROP PROCEDURE IF EXISTS uspListarCabinas;
DROP PROCEDURE IF EXISTS uspListarServicioABordo;
DROP PROCEDURE IF EXISTS uspListarEquipos;

DELIMITER $$
CREATE PROCEDURE uspListarDestinos()
BEGIN
	SELECT d.id, d.nombre, d.descripcion, d.IATA 
	FROM destino d;
END 
 $$
 DELIMITER ;

DELIMITER $$

CREATE PROCEDURE uspListarCabinas()
BEGIN
	SELECT * FROM cabina c ;
END 
$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE uspListarServicioABordo()
BEGIN 
	SELECT * FROM servicioabordo;
END

$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE uspListarEquipos()
BEGIN 
	SELECT  e.id, e.nombre, e.matricula, t.nombre 
	FROM equipo e
	INNER JOIN tipoVuelo t
	ON e.TipoVueloID = t.id;
END

$$
DELIMITER ;

CALL uspListarDestinos();
CALL uspListarCabinas();
CALL uspListarServicioABordo();
CALL uspListarEquipos();