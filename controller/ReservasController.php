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
        SessionManager::checkIfSessionIsNotValid();

        $userId = SessionManager::getUserId();
        $listadDeReservas = $this->reservasModel->gerReservasAMostrar($userId);
        $datos = ["proxVuelos" => $listadDeReservas];

        echo $this->printer->render("view/reservasView.html", $datos);
    }

    public function irAPagar()
    {
        SessionManager::checkIfSessionIsNotValid();

        $precio = isset($_POST["precio"]) ? $_POST["precio"] : "";
        $reservaId = isset($_POST["reservaId"]) ? $_POST["reservaId"] : "";

        SessionManager::setDatosDeReserva($reservaId, "", $precio);
        Redirect::to("/payment");
    }

    public function cancelarReserva()
    {
        SessionManager::checkIfSessionIsNotValid();

        $reservaId = isset($_POST["reservaId"]) ? $_POST["reservaId"] : "";
        $this->reservasModel->cancelarReserva($reservaId);

        $this->show();
    }
}
