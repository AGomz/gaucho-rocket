<?php

class PaymentController {

    private $paymentModel;
    private $paymentPrinter;

    public function __construct($paymentModel, $paymentPrinter)
    {
        $this->paymentModel = $paymentModel;
        $this->paymentPrinter = $paymentPrinter;
    }

    public function show($data = []) {
        echo $this->paymentPrinter->render("view/paymentView.html", $data);
    }
}