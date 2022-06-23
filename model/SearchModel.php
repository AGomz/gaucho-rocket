<?php


class SearchModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
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
