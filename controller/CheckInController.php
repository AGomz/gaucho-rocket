<?php

class CheckInController extends BaseController
{

    private $checkInModel;
    private $printer;
    private $mailer;
    private $logger;
    private $PDFGenerator;

    public function __construct($checkInModel, $printer, $mailer, $logger, $PDFGenerator)
    {
        $this->checkInModel = $checkInModel;
        $this->printer = $printer;
        $this->mailer = $mailer;
        $this->logger = $logger;
        $this->PDFGenerator = $PDFGenerator;
    }

    public function show($data = [])
    {
        $this->checkIfSessionIsNotValid();

        $userId = SessionManager::getUserId();
        $proximosVuelos = $this->checkInModel->getCheckInList($userId);

        $datos = ["proxVuelos" => $proximosVuelos];

        echo $this->printer->render("view/checkInView.html", $datos);
        die();
    }

    public function showCheckInDetail()
    {
        $this->checkIfSessionIsNotValid();

        $reservaId = $_POST['reservaId'] ?? null;
        $userId = SessionManager::getUserId();

        $this->validateReservaUser($reservaId, $userId);

        $datos = ["checkInData" => $this->checkInModel->getDatosCheckIn([$reservaId])];

        echo $this->printer->render("view/checkInDetailView.html", $datos);
    }

    public function validateCheckIn()
    {
        $this->checkIfSessionIsNotValid();

        $reservaId = $_POST['reservaId'] ?? null;
        $userId = SessionManager::getUserId();

        if (!$this->checkInModel->validateCheckIn($reservaId) || !$this->checkInModel->verificarReservaUsuario($reservaId, $userId)) {
            SessionManager::setMessageAlert('No se pudo validar el check in. Reserva incorrecta o pago no realizado', 'danger');
            $this->show();
        }

        $this->checkInModel->checkIn($reservaId);

        // Envío mail
        $datos = ["checkInData" => $this->checkInModel->getDatosCheckIn([$reservaId])];
        $this->sendCheckInMail($datos, $datos['checkInData'][0]['qrHashCode']);

        // log success
        $this->logger->info("El usuario con id $userId realizó el checkin para reserva con id $reservaId");
        SessionManager::setMessageAlert('🚀 Check in exitoso. Le deseamos un buen viaje 🚀', 'info');

        $this->showCheckInDetail();
    }

    public function generatePDF()
    {
        $this->checkIfSessionIsNotValid();

        $reservaId = $_POST['reservaId'] ?? null;
        $userId = SessionManager::getUserId();

        $this->validateReservaUser($reservaId, $userId);

        $datos = ["checkInData" => $this->checkInModel->getDatosCheckIn([$reservaId])];

        return $this->PDFGenerator->output($this->printer->render('view/pdf/checkInPDFView.html', $datos), 'checkin.pdf');
    }

    private function validateReservaUser($reservaId, $userId)
    {
        // Valido que la reserva sea del usuario logueado o vuelve a checkin con mensaje
        if (!$this->checkInModel->verificarReservaUsuario($reservaId, $userId)) {
            SessionManager::setMessageAlert('Reserva inválida', 'danger');
            $this->show();
        }
    }

    private function sendCheckInMail($datos, $qrHashCode)
    {
        $this->mailer->agregarDestinatario($_SESSION['user']["email"]);
        $this->mailer->agregarAsunto("Gaucho Rocket: Reserva confirmada");
        $this->mailer->agregarBody($this->printer->render("view/mail/checkInMailView.html", $datos));
        $this->mailer->agregarImagenRemota(
            "http://localhost/QR/show/?code=$qrHashCode",
            "img.png"
        );
        $this->mailer->enviar();
    }
}
