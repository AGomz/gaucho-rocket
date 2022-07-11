<?php

class ReporteModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getCabinaMasVendida()
    {
        $query = "select count(*) as cantidad, 
                    c.nombre
                    from reserva r 
                    inner join cabina c 
                    on r.tipocabina = c.id 
                    where r.pagoid is not null
                    group by r.tipocabina";

        return $this->database->query($query);
    }

    public function getFacturacionMensual($fecha){
        $query = "select sum(p.importe) as importe,
                    p.transaccion as credito
                    from pago p
                    where month(p.fecha) = month('{$fecha}');";

        return $this->database->query($query);
    }

    public function getFacturacionPorCliente($id){
        $query = "select r.id as id,
                    r.fecha as fecha,
                    p.importe as importe,
                    r.usuarioid as idusuario
                    from reserva r 
                    inner join pago p 
                    on p.id = r.pagoid
                    where r.usuarioid = $id;";

        return $this->database->query($query);
    }

    public function getOcupacionPorViajeYEquipo($id){
        $query = "select count(DISTINCT r.id) as cantidad,
                    c2.cantidad as maximo,
                    c.nombre as cabina
                    from reserva r 
                    inner join reservatramo rt
                    on r.id = rt.reservaid
                    inner join cabina c 
                    on r.tipocabina = c.id 
                    inner join capacidadcabina c2 
                    on c2.cabinaid = c.id 
                    where r.pagoid is not null 
                    and rt.tramoid = $id    
                    group by r.tipocabina;";

        return $this->database->query($query);
    }

    public function getPosicionActualDeLasNaves($fecha){
        $query = "select t.id,
            e.nombre as equipo,
            t.fechasalida,
            d.nombre as origen,
            t.fechallegada,
            d2.nombre as destino
            from tramo t
            inner join equipo e 
            on t.equipoid = e.id 
            inner join destino d 
            on t.origenid = d.id 
            left join destino d2 
            on t.destinoid = d2.id 
            where t.fechasalida < '{$fecha}'
            and t.fechallegada > '{$fecha}'
            and not e.nombre like 'Gua%';";

        return $this->database->query($query);
    }
}