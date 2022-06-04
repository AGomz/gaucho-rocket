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
        $query = "SELECT nombre, direccion, TurnosDiarios FROM centromedico WHERE id = ${id}";
        return $this->database->query($query)[0];
    }

    public function hayTurnoDisponible($fecha, $centroMedicoId)
    {
        // Devuelve si hay lugar en el $centroMedicoId en la $fecha
        $maximosTurnosPorDia = $this->getCentroMedicoById($centroMedicoId)['TurnosDiarios'];

        $query = "SELECT COUNT(*) AS CantidadTurnos 
            FROM turnomedico t
            JOIN centromedico c ON t.CentroMedicoID = c.id
            WHERE c.id = ${centroMedicoId} AND t.fecha = '${fecha}'";

        return $this->database->query($query)[0]['CantidadTurnos'] < $maximosTurnosPorDia;
    }

    // Agenda turno medico y devuelve nivel de vuelo
    public function agendarTurnoMedico($usuarioId, $centroId, $fecha)
    {
        $query = "INSERT INTO turnomedico (UsuarioID, CentroMedicoID, fecha)
                    VALUES (${usuarioId}, ${centroId}, '${fecha}')";

        // Asigna turno medico
        $this->database->insertQuery($query);
    }

    public function asignarNivelDeVuelo($usuarioId)
    {
        // Simula generar nivel de vuelo random
        $nivelVuelo = rand(1, 3);
        $query = "UPDATE usuario SET IDNivelVuelo = ${nivelVuelo} WHERE id = ${usuarioId}";
        $this->database->insertQuery($query);
        return $nivelVuelo;
    }
}
