<?php

class CheckInModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    // TODO refactor algunas cosas
    //  - Mostrar los check in anteriores / volver a generar el pdf
    //  - Extraer algunas funciones/métodos

    /*
    * Devuelve todos los datos de las reservas de las que 
    * todavía no se ha realizado el check-in
    */
    public function getCheckInList($userId)
    {
        $query = "select r.id from reserva r where r.usuarioid = $userId order by r.id";
        $checkInPendientes = $this->database->query($query);

        // Devuelve un array de ids de reservas
        $reservasIdPendientes = [];

        foreach ($checkInPendientes as $reservasId) {
            $reservasIdPendientes[] = $reservasId['id'];
        }

        return $this->getDatosCheckIn($reservasIdPendientes);
    }

    /*
    * Devuelve los datos de las reservas y checkin de la base de datos
    * Si existe el hash es un checkin confirmado
    * Admite como parámetro un array de reservasId [1,2,7,9, etc]
    */
    public function getDatosCheckIn($reservasId)
    {
        $datosCheckIn = [];

        foreach ($reservasId as $reserva) {

            // Obtener tramos de la reserva
            $query = "SELECT rt.tramoid FROM reservatramo rt WHERE rt.reservaid = $reserva";
            $tramos = $this->database->query($query);

            // Si es más de un tramo
            if (count($tramos) > 1) {
                $tramoInicial = $this->getDatosTramo($tramos[0]['tramoid'], $reserva)[0];
                $tramoFinal = $this->getDatosTramo($tramos[count($tramos) - 1]['tramoid'], $reserva)[0];

                $datosCheckIn[] = [
                    'origen' => $tramoInicial['origen'],
                    'destino' => $tramoFinal['destino'],
                    'fechasalida' => $tramoInicial['fechasalida'],
                    'fechallegada' => $tramoFinal['fechallegada'],
                    'reservaid' => $tramoInicial['reservaid'],
                    'servicio' => $tramoInicial['servicio'],
                    'cabina' => $tramoInicial['cabina'],
                    'tipovuelo' => $tramoInicial['tipovuelo'],
                    'desctipovuelo' => $tramoInicial['desctipovuelo'],
                    'nombreequipo' => $tramoInicial['nombreequipo'],
                ];
            } else {
                $datosCheckIn[] = $this->getDatosTramo($tramos[0]['tramoid'], $reserva)[0];
            }
            $actualCheckIn = count($datosCheckIn) - 1;
            $checkInHash = $this->getCheckInHashCode($reserva);

            $datosCheckIn[$actualCheckIn]['asiento'] = rand(0, 100) . chr(rand(65, 70));
            $datosCheckIn[$actualCheckIn]['duracion'] = $this->calcularDuracionAproximada(
                $datosCheckIn[$actualCheckIn]['fechasalida'],
                $datosCheckIn[$actualCheckIn]['fechallegada']
            );

            if ($checkInHash) {
                $datosCheckIn[$actualCheckIn]['qrHashCode'] = $checkInHash;
            }
        }

        return $datosCheckIn;
    }

    /*
    * Devuelve los datos asociados a un tramo de vuelo asociado a una reserva
    * TODO: Se podría unificar usando los datos del ReservasModel que hizo nico?
    */
    public function getDatosTramo($tramoId, $reservaId)
    {
        $query = "select o.nombre as origen, d.nombre as destino,
                    c.nombre as cabina, s.nombre as servicio,
                    e.nombre as nombreequipo, e.matricula as matricula,
                    tv.nombre as tipovuelo, tv.descripcion as desctipovuelo,
                    r.id as reservaid,
                    t.fechasalida, t.fechallegada
                    from reserva r
                    join reservatramo rt on r.id = rt.reservaid
                    join tramo t on rt.tramoid = t.id
                    join destino o on t.origenid = o.id
                    join equipo e on t.equipoid = e.id
                    join tipovuelo tv on e.tipovueloid = tv.id
                    join destino d on t.destinoid = d.id
                    join cabina c on r.tipocabina = c.id
                    join servicioabordo s on r.servicioid = s.id
                    where t.id = $tramoId and r.id = $reservaId";

        return $this->database->query($query);
    }

    /*
    * Verifica que la reserva corresponda al usuario logueado
    */
    public function verificarReservaUsuario($reservaId, $userId)
    {
        $query = "SELECT r.usuarioid FROM reserva r WHERE r.id = $reservaId";
        $result = $this->database->query($query)[0]['usuarioid'] ?? null;

        return $result === $userId;
    }

    /*
    * Valida el checkin de la reserva
    * No se permite si no esta realizado el pago 
    */
    public function validateCheckIn($reservaId)
    {
        $validCheckIn = true;

        // Verifica que el pago no sea nulo
        $query = "SELECT 1 FROM reserva r WHERE r.id = $reservaId AND r.pagoid IS NULL";
        $this->database->query($query);
        if ($this->database->affected_rows() > 0) {
            $validCheckIn = false;
        }

        return $validCheckIn;
    }

    /*
    * Genera el check in asociado a la reserva que se pasa por parámetro
    */
    public function checkIn($reservaId)
    {
        $checkInCode = $this->generateCheckInCode($reservaId);

        // Agrega check in
        $now = date('Y-m-d H:i:s');
        $query = "INSERT INTO checkin (codigo, fecha) VALUES ('$checkInCode', '$now')";


        $this->database->insertQuery($query);

        $checkInId = $this->database->lastID();

        // Agrega a la reserva que ya se ha ingresado el check in
        $query = "UPDATE reserva SET checkinid = $checkInId WHERE id = $reservaId";
        $this->database->insertQuery($query);
    }

    /*
    * Genera el código de abordaje
    * Corresponde al hash md5 de la combinación de la fecha en que se
    * hizo la reserva y la fecha actual en que se hace el checkin
    */
    private function generateCheckInCode($numReserva)
    {
        $query = "SELECT r.fecha FROM reserva r WHERE id = $numReserva";
        $result = $this->database->query($query)[0]['fecha'];
        $checkInDate = date("Y-m-d H:i:s");

        $codigoReserva = md5($result . $checkInDate);

        return $codigoReserva;
    }

    /*
    * Devuelve el hash del checkIn o vacío si no ha sido realizado 
    * todavía
    */
    public function getCheckInHashCode($reservaId)
    {
        $query = "SELECT c.codigo 
                    FROM checkin c 
                    WHERE c.id = (SELECT r.checkinid 
                        FROM reserva r 
                        WHERE r.id = $reservaId)";

        $result = $this->database->query($query);

        $result = empty($result) ? "" : $result[0]['codigo'];

        return $result;
    }

    // TODO helper?
    private function calcularDuracionAproximada($inicio, $fin)
    {
        $duracion = '';
        $inicio = new DateTime($inicio);
        $fin = new DateTime($fin);
        $interval = $inicio->diff($fin);
        // si es menos de 24hs 
        if ($interval->format('%a') < '1') {
            $duracion = $interval->format('%R%h horas');
        } else {
            $duracion = $interval->format('%R%a días');
        }
        return $duracion;
    }
}
