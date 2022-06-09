<?php


class SearchModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getDatosPor($origen, $destino){
        $query = "select distinct dd.nombre as origen, d.nombre as destino, t.fechasalida as salida, t.fechallegada as llegada,
        sb.nombre as servicio, c.nombre as cabina, t.precio as precio, tv.nombre as tipovuelo, nv.nombre as nivelvuelo
        from destino d join
        tramo t on d.id=t.destinoid join
        destino dd on dd.id=t.origenid join
        servicioabordo sb on  t.servicioid=sb.id join
        equipo e on sb.id=e.id join
        capacidadcabina cap on e.id=cap.cabinaid join
        cabina c on cap.cabinaid=c.id join
        tipovuelo tv on c.id=tv.id join
        nivelvuelo nv on tv.id=nv.id
        where d.id=$destino and dd.id=$origen and
        t.fechasalida between curdate() and curdate() + interval 30 day;";

        return $this->database->query($query);
    }

    public function getDatos($origen, $destino, $fecha, $nivelPasajero, $cabina, $servicio){
        $query = "select distinct dd.nombre as origen, d.nombre as destino, t.fechasalida as salida, t.fechallegada as llegada,
		sb.nombre as servicio, c.nombre as cabina, t.precio as precio, tv.nombre as tipovuelo, nv.nombre as nivelvuelo
        from destino d join
        tramo t on d.id=t.destinoid join
        destino dd on dd.id=t.origenid join
        servicioabordo sb on  t.servicioid=sb.id join
        equipo e on sb.id=e.id join
        capacidadcabina cap on e.id=cap.cabinaid join
        cabina c on cap.cabinaid=c.id join
        tipovuelo tv on c.id=tv.id join
        nivelvuelo nv on tv.id=nv.id
        where dd.id=$origen and d.id=$destino and date(t.fechasalida)= \"$fecha\"
        and c.id=$cabina and sb.id=$servicio and nv.id=$nivelPasajero";

        return $this->database->query($query);
    }

    public function getDatosTour($origen){
        $query = "select distinct dd.nombre as origen, d.nombre as destino, t.fechasalida as salida, t.fechallegada as llegada,
		sb.nombre as servicio, c.nombre as cabina, t.precio as precio, tv.nombre as tipovuelo, nv.nombre as nivelvuelo
        from destino d join
        tramo t on d.id=t.destinoid join
        destino dd on dd.id=t.origenid join
        servicioabordo sb on  t.servicioid=sb.id join
        equipo e on sb.id=e.id join
        capacidadcabina cap on e.id=cap.cabinaid join
        cabina c on cap.cabinaid=c.id join
        tipovuelo tv on c.id=tv.id join
        nivelvuelo nv on tv.id=nv.id
        where dd.id=$origen and d.id=$origen and t.fechasalida between curdate() and curdate() + interval 30 day";

        return $this->database->query($query);
    }

    public function getDatosSuborbital($origen){
        $query = "select distinct dd.nombre as origen, d.nombre as destino, t.fechasalida as salida, t.fechallegada as llegada,
		sb.nombre as servicio, c.nombre as cabina, t.precio as precio, tv.nombre as tipovuelo, nv.nombre as nivelvuelo
        from destino d join
        tramo t on d.id=t.destinoid join
        destino dd on dd.id=t.origenid join
        servicioabordo sb on  t.servicioid=sb.id join
        equipo e on sb.id=e.id join
        capacidadcabina cap on e.id=cap.cabinaid join
        cabina c on cap.cabinaid=c.id join
        tipovuelo tv on c.id=tv.id join
        nivelvuelo nv on tv.id=nv.id
        where dd.id=$origen and d.id=$origen and t.fechasalida between curdate() and curdate() + interval 30 day";

        return $this->database->query($query);
    }
}
