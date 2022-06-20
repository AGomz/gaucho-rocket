<?php


class ReservasModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    // TODO: Revisar query
    public function getReservas($userId)
    {
        $query = "select distinct dd.nombre as origen, dno.nombre as destino, t.fechasalida as salida, t.fechallegada as llegada,
        sb.nombre as servicio, c.nombre as cabina, t.precio as precio, tv.nombre as tipovuelo, nv.nombre as nivelvuelo, r.pagoid
        from reserva r join
        reservatramo rt on rt.reservaid=r.id join
        tramo t on rt.tramoid=t.id join
        destino dd on dd.id=t.origenid join
        destino dno on dno.id=t.destinoid join
        servicioabordo sb on r.servicioid=sb.id join
        cabina c on r.tipocabina=c.id join
        tipovuelo tv on c.id=tv.id join
        nivelvuelo nv on tv.id=nv.id
        where r.usuarioid=${userId}";

        return $this->database->query($query);
    }

}
