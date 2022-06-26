<?php

class ReporteModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getValores(){
        $query = "select sum(g.valor) as valores, 
                    g.nombre
                    from grafico g
                    group by g.nombre";

        return $this->database->query($query);
    }

    public function getCabinaMasVendida()
    {
        $query = "select count(*) as cantidad, 
                    c.descripcion 
                    from reserva r 
                    inner join cabina c 
                    on r.tipocabina = c.id 
                    where r.pagoid is not null
                    group by r.tipocabina";

        return $this->database->query($query);
    }

    public function getFacturacionMensual(){
        $query = "select sum(p.importe)
                    from pago p; 
                    where month(p.fecha) = month(now());";

        return $this->database->query($query);
    }

    public function getFacturacionPorCliente(){
        $query = "select r.id as id,
                    r.fecha,
                    p.importe
                    from reserva r 
                    inner join pago p 
                    on p.id = r.pagoid;";

        return $this->database->query($query);
    }

    public function getOcupacionPorViaje(){
        $query = "select count(*) as cantidad,
                    c2.cantidad as maximo,
                    c.descripcion 
                    from reserva r 
                    inner join cabina c 
                    on r.tipocabina = c.id 
                    inner join capacidadcabina c2 
                    on c2.cabinaid = c.id 
                    where r.pagoid is not null
                    group by r.tipocabina;";

        return $this->database->query($query);
    }

    /*public function getOcupacionPorEquipo(){
        $query = "select count(*) as cantidad,
                    c2.cantidad as maximo,
                    c.descripcion 
                    from reserva r 
                    inner join cabina c 
                    on r.tipocabina = c.id 
                    inner join capacidadcabina c2 
                    on c2.cabinaid = c.id 
                    where r.pagoid is not null
                    group by r.;";

        return $this->database->query($query);
    }*/
}