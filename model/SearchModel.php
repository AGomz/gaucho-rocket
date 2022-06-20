<?php


class SearchModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getDatosPor($origen, $destino)
    {

        $query = "select distinct dd.nombre as origen, 
                    d.nombre as destino,
                    t.fechasalida as salida, 
                    t.fechallegada as llegada,
                    dd.id as idOrigen,
                    d.id as idDestino
            from destino d join
            tramo t on d.id=t.destinoid join
            destino dd on dd.id=t.origenid
            where d.id=$destino or dd.id=$origen and t.fechasalida between curdate() and curdate() + interval 30 day";

        return $this->database->query($query);
    }

    public function getTramoOrigen($origen, $fecha)
    {
        $query = "select t.id as tramoIdOrigen, 
                    t.equipoid as idEquipo, 
                    t.fechasalida as salida, 
                    dd.nombre as origen
                    from tramo t 
                    join destino dd 
                    on dd.id=t.origenid
                    where t.origenid = $origen ";


        if ($fecha != "") {
            $query = $query . " and t.fechasalida > \"{$fecha};\" ";
        }
        $query = $query . " order by t.fechasalida asc";

        return  $this->database->query($query);
    }

    public function getTramoDestino($destino, $equipo, $fecha, $tramoIdOrigen)
    {
        $query =    "select t.id as tramoIdDestino, 
                    t.equipoid, 
                    t.fechallegada as llegada, 
                    d.nombre as destino
                    from tramo t 
                    join destino d 
                    on d.id=t.destinoid
                    where d.id = $destino 
                    and t.equipoid = $equipo 
                    and t.fechallegada >= \"{$fecha}\" 
                    /* tramos consecutivos deben ser menor al maximo total de tramos del circuito */
                    and ABS(t.id - $tramoIdOrigen) <= 11
                    order by t.id, t.fechallegada limit 1";

        return  $this->database->query($query);
    }

    public function getTramoCompleto($origen, $destino, $fecha)
    {
        $resultado = [];
        $salidas = $this->getTramoOrigen($origen, $fecha);

        foreach ($salidas as $tramo) {
            /*var_dump($tramo);
            echo "<br>";
            var_dump($destino);
            echo "<br>";
            var_dump( $tramo['salida']);
            echo "<br>";*/
            $llegadas = $this->getTramoDestino($destino, $tramo['idEquipo'], $tramo['salida'], $tramo['tramoIdOrigen']);
            /*
            * No permito las busquedas entre $origen == $destino
            * Así elimina vuelos suborbital y tour y evita que el cliente
            * compre un vuelo con reccorido completo de ida y vuelta
            * por todo el circuito
            */
            if (count($llegadas) > 0 && $origen != $destino) {
                //asigno
                $resultado[] = array_merge($tramo, $llegadas[0]);
            }
        }

        return $resultado;
    }


    public function getDatos($origen, $destino, $fecha, $nivelPasajero, $cabina, $servicio)
    {
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

    public function getDatosTour($fecha)
    {
        $query = "select distinct  t.id as tramoIdOrigen, 
                    t.equipoid as idEquipo, 
                    t.fechasalida as salida,
                    d.nombre as origen, 
                    t.fechallegada as llegada,
                    d2.nombre  as destino
                    from tramo t
                    inner join destino d 
                    on d.id = t.origenid
                    left join destino d2 
                    on d2.id = destinoid
                    where t.origenid = t.destinoid 
                    and datediff(date(t.fechallegada), date(t.fechasalida)) = 35 
                    and t.fechasalida > \"{$fecha}\"
                    order by t.fechasalida ;";

        return $this->database->query($query);
    }

    public function getDatosSuborbital($origen, $fecha)
    {
        $query = "select distinct  t.id as tramoIdOrigen, 
                    t.equipoid as idEquipo, 
                    t.fechasalida as salida,
                    d.nombre as origen, 
                    t.fechallegada as llegada,
                    d2.nombre  as destino
                    from tramo t
                    inner join destino d 
                    on d.id = t.origenid
                    left join destino d2 
                    on d2.id = destinoid
                    where t.origenid = t.destinoid
                        and datediff(date(t.fechallegada), date(t.fechasalida)) = 0
                        and t.fechasalida > \"{$fecha}\"
                        and t.origenid = {$origen}
                    order by t.fechasalida;";

        return $this->database->query($query);
    }
}
