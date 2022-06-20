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
    * Muestra el listado de las reservas de las que 
    * todavía no se ha realizado el check-in
    */
    public function getCheckInPendientes($userId)
    {
        $query = "select r.id from reserva r where r.usuarioid = $userId and r.checkinid is null";
        $checkInPendientes = $this->database->query($query);
        $reservasIdPendientes = [];

        foreach ($checkInPendientes as $reservasId) {
            $reservasIdPendientes[] = $reservasId['id'];
        }

        return $this->getDatosCheckInPendientes($reservasIdPendientes);
    }

    /*
    * Datos de los checkin pendtientes
    */
    public function getDatosCheckInPendientes($reservasId)
    {
        $checkInPendientes = [];

        foreach ($reservasId as $reserva) {

            // Obtener tramos de la reserva
            $query = "SELECT rt.tramoid FROM reservatramo rt WHERE rt.reservaid = $reserva";
            $tramos = $this->database->query($query);

            // Si es más de un tramo
            if (count($tramos) > 1) {
                $tramoInicial = $this->getDatosTramo($tramos[0]['tramoid'], $reserva)[0];
                $tramoFinal = $this->getDatosTramo($tramos[count($tramos) - 1]['tramoid'], $reserva)[0];

                $checkInPendientes[] = [
                    'origen' => $tramoInicial['origen'],
                    'destino' => $tramoFinal['destino'],
                    'fechasalida' => $tramoInicial['fechasalida'],
                    'fechallegada' => $tramoFinal['fechallegada'],
                    'reservaid' => $tramoInicial['reservaid'],
                    'duracion' => $this->calcularDuracionAproximada($tramoInicial['fechasalida'], $tramoFinal['fechallegada']),
                    'servicio' => $tramoInicial['servicio'],
                    'cabina' => $tramoInicial['cabina'],
                    'tipovuelo' => $tramoInicial['tipovuelo'],
                    'desctipovuelo' => $tramoInicial['desctipovuelo'],
                    'nombreequipo' => $tramoInicial['nombreequipo'],
                ];
            } else {
                $checkInPendientes[] = $this->getDatosTramo($tramos[0]['tramoid'], $reserva)[0];
            }
        }

        return $checkInPendientes;
    }

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

        // Verificar si todavía no hizo el checkin 
        $query = "SELECT 1 FROM reserva r WHERE r.id = $reservaId AND r.checkinid IS NOT NULL";
        $this->database->query($query);

        if ($this->database->affected_rows() > 0) {
            $validCheckIn = false;
        }

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
    public function generateCheckInCode($numReserva)
    {
        $query = "SELECT r.fecha FROM reserva r WHERE id = $numReserva";
        $result = $this->database->query($query)[0]['fecha'];
        $checkInDate = date("Y-m-d H:i:s");

        $codigoReserva = md5($result . $checkInDate);

        return $codigoReserva;
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
