<?php

class PaymentController extends BaseController
{

    private $paymentModel;
    private $paymentPrinter;

    public function __construct($paymentModel, $paymentPrinter)
    {
        $this->paymentModel = $paymentModel;
        $this->paymentPrinter = $paymentPrinter;
    }

    public function show($data = [])
    {
        $this->checkIfSessionIsNotValid();
        $reserva = SessionManager::getDatosDeReserva();
        $data = [
            "total" => $reserva["importe"],
            "reservaId" => $reserva["reservaId"],
            "transaccion" => $reserva["transaccion"]
        ];
        echo $this->paymentPrinter->render("view/paymentView.html", $data);
    }

    public function confirm()
    {
        $this->checkIfSessionIsNotValid();
        $numeroDeTarjeta = isset($_POST["numeroDeTarjeta"]) ? $_POST["numeroDeTarjeta"] : "";
        $nombreTitular = isset($_POST["nombreTitular"]) ? $_POST["nombreTitular"] : "";
        $fechaDeExpiracion = isset($_POST["fechaDeExpiracion"]) ? $_POST["fechaDeExpiracion"] : "";
        $cvv = isset($_POST["cvv"]) ? $_POST["cvv"] : "";

        $reservaId = isset($_POST["reservaId"]) ? $_POST["reservaId"] : "";
        $total = isset($_POST["total"]) ? $_POST["total"] : "";
        $transaccion = isset($_POST["transaccion"]) ? $_POST["transaccion"] : "";

        if ($numeroDeTarjeta == "" || $nombreTitular == "" ||
            $fechaDeExpiracion == "" || $cvv == "") {
            SessionManager::setMessageAlert("Complete todos los campos", "danger");
            $this->show();
            return;
        }

        $this->paymentModel->realizarPago($reservaId, $total, $transaccion);
        SessionManager::setMessageAlert("¡Pago realizado exitosamente!", "success");
        Redirect::to("/home");
    }
}