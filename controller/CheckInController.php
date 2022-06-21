<?php

class CheckInController
{

    private $checkInModel;
    private $printer;
    private $mailer;
    private $logger;

    public function __construct($checkInModel, $printer, $mailer, $logger)
    {
        $this->checkInModel = $checkInModel;
        $this->printer = $printer;
        $this->mailer = $mailer;
        $this->logger = $logger;
    }

    public function show($data = [])
    {
        SessionManager::checkIfSessionIsNotValid();

        $userId = SessionManager::getUserId();
        $proximosVuelos = $this->checkInModel->getCheckInPendientes($userId);

        $datos = ["proxVuelos" => $proximosVuelos];

        echo $this->printer->render("view/checkInView.html", $datos);
        die();
    }

    public function showCheckInDetail()
    {
        $reservaId = $_POST['reservaId'] ?? null;
        $userId = SessionManager::getUserId();

        // Valido que la reserva sea del usuario logueado o vuelve a checkin con mensaje
        if (!$this->checkInModel->verificarReservaUsuario($reservaId, $userId)) {
            SessionManager::setMessageAlert('Reserva inválida', 'danger');
            $this->show();
        }
        $datos = ["checkInData" => $this->checkInModel->getDatosCheckInPendientes([$reservaId])];
        $datos['checkInData'][0]['asiento'] = rand(0, 100) . chr(rand(65, 70));
        $datos['checkInData'][0]['qrHashCode'] = $this->checkInModel->getCheckInHashCode($reservaId);

        echo $this->printer->render("view/checkInDetailView.html", $datos);
    }

    public function validateCheckIn()
    {
        $numReserva = $_POST['reservaId'] ?? null;
        $userId = SessionManager::getUserId();

        if (!$this->checkInModel->validateCheckIn($numReserva)) {
            SessionManager::setMessageAlert('No se pudo validar el check in. Verifique tener el pago realizado', 'danger');
            $this->show();
        }

        // TODO guardar qr y código alfanumerio de check in
        // Check in deberia devolver el codigo alfanumerico ?
        $this->checkInModel->checkIn($numReserva);

        // TODO mail con pdf del checkin al usuario

        // log success
        $this->logger->info("El usuario con id $userId realizó el checkin para reserva con id $numReserva");
        SessionManager::setMessageAlert('🚀 Check in exitoso. Le deseamos un buen viaje 🚀', 'info');

        // TODO ir a la vista del resumen del check in 

        $this->showCheckInDetail();
    }
}
