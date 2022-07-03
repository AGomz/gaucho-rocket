<?php


class ReservasModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    // forma un array de reservas mostrando 1 sola reserva si es multitramo
    public function gerReservasAMostrar($userId)
    {
        $reservas = [];
        $result = $this->getReservas($userId);
        if (count($result) > 0) {
            if (count($result) > 1) {
                $origen = null;
                $precio = 0;

                for ($i = 0; $i < count($result); $i++) {
                    $actual = $result[$i];

                    if ($i+1 == count($result)) {
                        if ($origen != null) {
                            $reservas[] = $this->getReservaMultiTramo($origen, $actual, $precio);
                        } else {
                            $reservas[] = $actual;
                        }

                        return $reservas;
                    }

                    $siguiente = $result[$i+1];

                    // toma 2 registros y compara si tienen el mismo reservaid
                    // si son iguales significa que es multitramo
                    if ($actual["reservaId"] != $siguiente["reservaId"]) {
                        if ($origen != null) {
                            $reservas[] = $this->getReservaMultiTramo($origen, $actual, $precio);
                            $origen = null;
                            $precio = 0;
                        } else {
                            $reservas[] = $actual;
                        }
                    } else {
                        $precio += $actual["precio"];
                        if ($origen == null) {
                            $origen = $actual;
                        }
                    }
                }
            } else {
                return $result;
            }
        } else {
            return [];
        }
    }

    public function cancelarReserva($reservaId)
    {
        $query = "delete from reservatramo where reservaid=?";
        $this->database->preparedQuery($query, [$reservaId], 'i');

        $query = "delete from reserva where id=?";
        $this->database->preparedQuery($query, [$reservaId], 'i');
    }

    // forma 1 solo array a mostrar con el origen, destino y precio total
    private function getReservaMultiTramo($origen, $destino, $precio)
    {
        return [
            "reservaId" => $origen["reservaId"],
            "precio" => $precio,
            "salida" => $origen["salida"],
            "origen" => $origen["origen"],
            "llegada" => $destino["llegada"],
            "destino" => $destino["destino"],
            "cabina" => $destino["cabina"],
            "servicio" => $destino["servicio"],
            "pagoid" => $destino["pagoid"],
            "tipovuelo" => $destino["tipovuelo"]
        ];
    }

    private function getReservas($userId)
    {
        $query = "select distinct r.id as reservaId, dd.nombre as origen, dno.nombre as destino, t.fechasalida as salida, t.fechallegada as llegada,
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
