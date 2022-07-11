<?php


class ReservasController extends BaseController
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
        $this->checkIfSessionIsNotValid();

        $userId = SessionManager::getUserId();
        $listadDeReservas = $this->reservasModel->gerReservasAMostrar($userId);
        $datos = ["proxVuelos" => $listadDeReservas];

        echo $this->printer->render("view/reservasView.html", $datos);
    }

    public function irAPagar()
    {
        $this->checkIfSessionIsNotValid();

        $precio = isset($_POST["precioTotal"]) ? $_POST["precioTotal"] : "";
        $reservaId = isset($_POST["reservaId"]) ? $_POST["reservaId"] : "";

        SessionManager::setDatosDeReserva($reservaId, "", $precio);
        Redirect::to("/payment");
    }

    public function cancelarReserva()
    {
        $this->checkIfSessionIsNotValid();

        $reservaId = isset($_POST["reservaId"]) ? $_POST["reservaId"] : "";
        $this->reservasModel->cancelarReserva($reservaId);

        $this->show();
    }
}
