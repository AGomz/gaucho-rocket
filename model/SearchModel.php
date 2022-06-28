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
                    dd.nombre as origen,
					c.nombre as cabina
                    from tramo t 
                    join destino dd 
                    on dd.id=t.origenid
					join equipo e 
                    on t.equipoid = e.id
                    join capacidadcabina cb
                    on e.id = cb.equipoid
                    join cabina c
                    on cb.cabinaid = c.id
                    where t.origenid = $origen ";


        if ($fecha != "") {
            $query = $query . " and date(t.fechasalida) = \"{$fecha};\" ";
        }
        $query = $query . " order by t.fechasalida asc";

        $result = $this->database->query($query);

        foreach ($result as &$tramo) {
            $tramo['cabinas'] = $this->getCabinas($tramo['idEquipo']);
        }

        return  $result;
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
					join equipo e 
                    on t.equipoid = e.id
                    where t.origenid = t.destinoid 
                    and datediff(date(t.fechallegada), date(t.fechasalida)) = 35";

        if ($fecha != "") {
            $query = $query . " and date(t.fechasalida) = \"{$fecha};\" ";
        }
        $query = $query . " order by t.fechasalida asc;";

        $result = $this->database->query($query);

        foreach ($result as &$tramo) {
            $tramo['cabinas'] = $this->getCabinas($tramo['idEquipo']);
        }

        return $result;
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
					join equipo e 
                    on t.equipoid = e.id
                    where t.origenid = t.destinoid
                        and datediff(date(t.fechallegada), date(t.fechasalida)) = 0
                        and t.origenid = {$origen}";

        if ($fecha != "") {
            $query = $query . " and date(t.fechasalida) = \"{$fecha};\" ";
        }
        $query = $query . " order by t.fechasalida asc;";

        $result = $this->database->query($query);

        foreach ($result as &$tramo) {
            $tramo['cabinas'] = $this->getCabinas($tramo['idEquipo']);
        }

        return $result;
    }

    private function getCabinas($equipoId)
    {

        $query = "SELECT c.id, c.nombre 
                    FROM equipo e
                    JOIN capacidadcabina cb ON e.id = cb.equipoid
                    JOIN cabina c ON cb.cabinaid = c.id
                    WHERE e.id = $equipoId";

        return $this->database->query($query);
    }
}
