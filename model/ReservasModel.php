<?php


class ReservasModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getReservas($userId) {
        $query = "SELECT DISTINCT dd.nombre AS origen, dno.nombre AS destino, t.FechaSalida AS salida, t.FechaLlegada AS llegada,
        sb.nombre AS servicio, c.nombre AS cabina, t.precio AS precio, tv.nombre AS tipoVuelo, nv.nombre AS nivelVuelo
        FROM Reserva r JOIN
        Tramo t ON r.TramoID=t.id JOIN
        Destino dd ON dd.id=t.OrigenID JOIN
        Destino dno ON dno.id=t.DestinoID JOIN
        ServicioABordo sb ON t.servicioID=sb.id JOIN
        Equipo e ON sb.id=e.id JOIN
        CapacidadCabina cap ON e.id=cap.CabinaID JOIN
        Cabina c ON cap.CabinaID=c.id JOIN
        TipoVuelo tv ON c.id=tv.id JOIN
        NivelVuelo nv ON tv.id=nv.id
        where r.UsuarioID=$userId";

        return $this->database->query($query);
    }
}