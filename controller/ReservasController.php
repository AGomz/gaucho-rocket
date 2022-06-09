<?php


class ReservasController
{
    private $reservasModel;
    private $printer;

    public function __construct($model, $printer)
    {
        $this->reservasModel = $model;
        $this->printer = $printer;
    }

    public function show($data = [])
    {
        if (isset($_SESSION['user'])) {
            $array = $_SESSION['user']["id"];
            $userId = $array[0]['id'];

            $listadDeReservas = $this->reservasModel->getReservas($userId);
            $datos = ["proxVuelos" => $listadDeReservas];

            echo $this->printer->render("view/reservasView.html", $datos);
        } else {
            Redirect::to("/");
        }
    }
}