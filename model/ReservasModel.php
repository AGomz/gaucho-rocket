<?php


class ReservasModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getReservas($userId)
    {
        $query = "select distinct dd.nombre as origen, dno.nombre as destino, t.fechasalida as salida, t.fechallegada as llegada,
        sb.nombre as servicio, c.nombre as cabina, t.precio as precio, tv.nombre as tipovuelo, nv.nombre as nivelvuelo
        from reserva r join
        tramo t on r.tramoid=t.id join
        destino dd on dd.id=t.origenid join
        destino dno on dno.id=t.destinoid join
        servicioabordo sb on t.servicioid=sb.id join
        equipo e on sb.id=e.id join
        capacidadcabina cap on e.id=cap.cabinaid join
        cabina c on cap.cabinaid=c.id join
        tipovuelo tv on c.id=tv.id join
        nivelvuelo nv on tv.id=nv.id
        where r.usuarioid=${userId}";

        return $this->database->query($query);
    }
}
