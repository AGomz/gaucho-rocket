<?php

class AdminModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getList()
    {
        $query = "select distinct  t.id as tramoIdOrigen, 
                    t.equipoid as idEquipo, 
                    t.fechasalida as salida,
                    d.nombre as origen, 
                    t.fechallegada as llegada,
                    d2.nombre  as destino,
                    t.precio
                    from tramo t
                    inner join destino d 
                    on d.id = t.origenid
                    left join destino d2 
                    on d2.id = destinoid
					join equipo e 
                    on t.equipoid = e.id
                    order by t.fechasalida asc limit 50";

        return $this->database->query($query);
    }
}