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
        SessionManager::checkIfSessionIsValid();

        $userId = SessionManager::getUserId();
        $listadDeReservas = $this->reservasModel->getReservas($userId);
        $datos = ["proxVuelos" => $listadDeReservas];

        echo $this->printer->render("view/reservasView.html", $datos);
    }

    public function reservar()
    {
        SessionManager::checkIfSessionIsValid("/login");

        $idOrigen = isset($_POST["origenId"]) ? $_POST["origenId"] : "";
        $idDestino = isset($_POST["destinoId"]) ? $_POST["destinoId"] : "";

        $salida = isset($_POST["salida"]) ? $_POST["salida"] : "";
        $origen = isset($_POST["origen"]) ? $_POST["origen"] : "";

        $userId = SessionManager::getUserId();

        /*REVISAR
        if($idOrigen && $idDestino){
            $datos = $this->searchModel->getDatosPor($idOrigen, $idDestino);
        }

        $data = ["datos" => $datos];*/

        $data = ["origenId" => $idOrigen,
            "destinoId"  => $idDestino,
            "salida" => $salida,
            "origen" => $origen];

        echo $this->printer->render("view/bookingView.html", $data);
    }
}
