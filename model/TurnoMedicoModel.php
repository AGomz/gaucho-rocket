<?php

class TurnoMedicoModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getCentroMedicoById($id)
    {
        $query = "select nombre, direccion, turnosdiarios from centromedico where id = ${id}";
        return $this->database->query($query)[0];
    }

    public function hayTurnoDisponible($fecha, $centroMedicoId)
    {
        // Devuelve si hay lugar en el $centroMedicoId en la $fecha
        $maximosTurnosPorDia = $this->getCentroMedicoById($centroMedicoId)['turnosdiarios'];

        $query = "select count(*) as cantidadturnos 
            from turnomedico t
            join centromedico c on t.centromedicoid = c.id
            where c.id = ${$centroMedicoId} and t.fecha = '${fecha}'";

        return $this->database->query($query)[0]['cantidadturnos'] < $maximosTurnosPorDia;
    }

    // Agenda turno medico y devuelve nivel de vuelo
    public function agendarTurnoMedico($usuarioId, $centroId, $fecha)
    {
        $query = "insert into turnomedico (usuarioid, centromedicoid, fecha)
                    values (${usuarioId}, ${centroId}, '${fecha}')";

        // Asigna turno medico
        $this->database->insertQuery($query);
    }

    public function asignarNivelDeVuelo($usuarioId)
    {
        // Simula generar nivel de vuelo random
        $nivelVuelo = rand(1, 3);
        $query = "update usuario set idnivelvuelo = ${$nivelVuelo} where id = ${usuarioId}";
        $this->database->insertQuery($query);
        return $nivelVuelo;
    }
}
