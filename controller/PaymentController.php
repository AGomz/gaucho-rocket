<?php

class PaymentController
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
        SessionManager::checkIfSessionIsNotValid();
        echo $this->paymentPrinter->render("view/paymentView.html", $data);
    }

    public function confirm()
    {
        $numeroDeTarjeta = isset($_POST["numeroDeTarjeta"]) ? $_POST["numeroDeTarjeta"] : "";
        $nombreTitular = isset($_POST["nombreTitular"]) ? $_POST["nombreTitular"] : "";
        $fechaDeExpiracion = isset($_POST["fechaDeExpiracion"]) ? $_POST["fechaDeExpiracion"] : "";
        $cvv = isset($_POST["cvv"]) ? $_POST["cvv"] : "";

        if ($numeroDeTarjeta == "" || $nombreTitular == "" ||
            $fechaDeExpiracion == "" || $cvv == "") {
            return;
        }

        $this->paymentModel->realizarPago(SessionManager::getDatosDeReserva());
        SessionManager::setMessageAlert("¡Pago realizado exitosamente!", "success");
        Redirect::to("/home");
    }
}