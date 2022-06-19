<?php


class ConfirmBookingModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getNombreDeCabina($cabinaId)
    {
        $query = "select nombre
        from cabina 
        where id=${cabinaId}";

        return $this->database->query($query);
    }

    public function getNombreDeServicio($servicioId)
    {
        $query = "select nombre
        from servicioabordo 
        where id=${servicioId}";

        return $this->database->query($query);
    }

    public function getNivelVueloDelEquipo($equipoId)
    {
        $query = "select nivelvueloid
        from equiponivelvuelo 
        where equipoid=${equipoId}";

        return $this->database->query($query);
    }

    public function getCapacidadDeCabina($equipoId, $cabinaId)
    {
        $query = "select cantidad
        from capacidadcabina 
        where equipoid=${equipoId} and cabinaid=${cabinaId}";

        return $this->database->query($query);
    }

    public function getReservasByTramoId($tramoId)
    {
        $query = "select count(*) as cantidadreservas
        from reservatramo 
        where tramoid=${tramoId}";

        return $this->database->query($query);
    }

    public function realizarReservas($userId, $tramoIdOrigen, $tramoIdDestino, $servicioId, $cabinaId)
    {
        $query = "insert into reserva (usuarioid, fecha, servicioid, tipocabina)
            values (${userId}, curdate(), ${servicioId}, ${cabinaId})";

        $this->database->insertQuery($query);
        $reservaId = $this->database->lastID();

        $tramoId = intval($tramoIdOrigen);
        while ($tramoId <= $tramoIdDestino) {
            $query = "insert into reservatramo (reservaid, tramoid)
                    values (${reservaId}, ${tramoId})";
            $this->database->insertQuery($query);

            $tramoId++;
        }
    }
}