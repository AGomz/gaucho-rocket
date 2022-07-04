<?php

class PaymentModel {

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function realizarPago($reservaId, $total, $transaccion)
    {
        $query = "insert into pago (transaccion, importe, fecha)
                values ('$transaccion', ${total}, curdate())";

        $this->database->insertQuery($query);
        $pagoId = $this->database->lastID();

        // Actualiza la reserva con el id del pago
        $query = "update reserva set pagoid = $pagoId where id = ${reservaId}";
        $this->database->insertQuery($query);
    }
}