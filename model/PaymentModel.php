<?php

class PaymentModel {

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }
}