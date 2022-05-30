<?php


class SearchModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getDatosPor($origen, $destino){
        $query = "SELECT DISTINCT dd.nombre AS origen, d.nombre AS destino, t.FechaSalida AS salida, t.FechaLlegada AS llegada,
        sb.nombre AS servicio, c.nombre AS cabina, t.precio AS precio, tv.nombre AS tipoVuelo, nv.nombre AS nivelVuelo
        FROM destino d JOIN
        tramo t ON d.id=t.DestinoID JOIN
        destino dd ON dd.id=t.OrigenID JOIN
        servicioabordo sb ON  t.servicioID=sb.id JOIN
        equipo e ON sb.id=e.id JOIN
        capacidadcabina cap ON e.id=cap.CabinaID JOIN
        cabina c ON cap.CabinaID=c.id JOIN
        tipovuelo tv ON c.id=tv.id JOIN
        nivelvuelo nv ON tv.id=nv.id
        where d.id=$destino AND dd.id=$origen AND
        t.FechaSalida BETWEEN CURDATE() AND CURDATE() + INTERVAL 30 DAY;";

        return $this->database->query($query);
    }

    public function getDatos($origen, $destino, $fecha, $nivelPasajero, $cabina, $servicio){
        $query = "SELECT DISTINCT dd.nombre AS origen, d.nombre AS destino, t.FechaSalida AS salida, t.FechaLlegada AS llegada,
		sb.nombre AS servicio, c.nombre AS cabina, t.precio AS precio, tv.nombre AS tipoVuelo, nv.nombre AS nivelVuelo
        FROM destino d JOIN
        tramo t ON d.id=t.DestinoID JOIN
        destino dd ON dd.id=t.OrigenID JOIN
        servicioabordo sb ON  t.servicioID=sb.id JOIN
        equipo e ON sb.id=e.id JOIN
        capacidadcabina cap ON e.id=cap.CabinaID JOIN
        cabina c ON cap.CabinaID=c.id JOIN
        tipovuelo tv ON c.id=tv.id JOIN
        nivelvuelo nv ON tv.id=nv.id
        WHERE dd.id=$origen AND d.id=$destino AND DATE(t.fechaSalida)= \"$fecha\"
        AND c.id=$cabina AND sb.id=$servicio AND nv.id=$nivelPasajero";

        return $this->database->query($query);
    }

    public function getDatosTour($origen){
        $query = "SELECT DISTINCT dd.nombre AS origen, d.nombre AS destino, t.FechaSalida AS salida, t.FechaLlegada AS llegada,
		sb.nombre AS servicio, c.nombre AS cabina, t.precio AS precio, tv.nombre AS tipoVuelo, nv.nombre AS nivelVuelo
        FROM destino d JOIN
        tramo t ON d.id=t.DestinoID JOIN
        destino dd ON dd.id=t.OrigenID JOIN
        servicioabordo sb ON  t.servicioID=sb.id JOIN
        equipo e ON sb.id=e.id JOIN
        capacidadcabina cap ON e.id=cap.CabinaID JOIN
        cabina c ON cap.CabinaID=c.id JOIN
        tipovuelo tv ON c.id=tv.id JOIN
        nivelvuelo nv ON tv.id=nv.id
        WHERE dd.id=$origen AND d.id=$origen AND t.FechaSalida BETWEEN CURDATE() AND CURDATE() + INTERVAL 30 DAY";

        return $this->database->query($query);
    }
}
