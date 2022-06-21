<?php
include_once("helpers/SessionManager.php");

class Configuration
{
    private $config;

    // Controladores
    public function createGauchoRocketController()
    {
        require_once("controller/GauchoRokectController.php");
        return new GauchoRocketController($this->createPrinter());
    }

    public function createLoginController()
    {
        $this->getRedirect();
        require_once("controller/LoginController.php");
        return new LoginController($this->createUserModel(), $this->createPrinter());
    }

    public function createRegisterController()
    {
        $this->getRedirect();
        require_once("controller/RegisterController.php");
        return new RegisterController(
            $this->createUserModel(),
            $this->createTurnoMedicoModel(),
            $this->createPrinter(),
            $this->getPHPMailer(),
            $this->getLogger()
        );
    }

    public function createSearchController()
    {
        require_once("controller/SearchController.php");
        return new SearchController($this->createSearchModel(), $this->createPrinter());
    }

    public function createReservasController()
    {
        require_once("controller/ReservasController.php");
        return new ReservasController($this->createReservasModel(), $this->createPrinter());
    }

    public function createPaymentController()
    {
        require_once("controller/PaymentController.php");
        return new PaymentController($this->createPaymentModel(), $this->createPrinter());
    }

    public function createConfirmBookingController()
    {
        require_once("controller/ConfirmBookingController.php");
        return new ConfirmBookingController(
            $this->createConfirmBookingModel(),
            $this->createPrinter(),
            $this->createUserModel()
        );
    }

    public function createCheckInController()
    {
        require_once("controller/CheckInController.php");
        return new CheckInController(
            $this->createCheckInModel(),
            $this->createPrinter(),
            $this->getPHPMailer(),
            $this->getLogger()
        );
    }

    public function createQrController()
    {
        require_once("third-party/phpqrcode/phpqrcode.php");
        require_once("controller/QRController.php");
        return new QRController();
    }

    public function createErrorController()
    {
        require_once("controller/ErrorController.php");
        return new ErrorController($this->createPrinter());
    }

    // Modelos
    private function createUserModel()
    {
        require_once("model/UserModel.php");
        $database = $this->getDatabase();
        return new UserModel($database);
    }

    private function createSearchModel()
    {
        require_once("model/SearchModel.php");
        $database = $this->getDatabase();
        return new SearchModel($database);
    }

    private function createTurnoMedicoModel()
    {
        require_once("model/TurnoMedicoModel.php");
        $database = $this->getDatabase();
        return new TurnoMedicoModel($database);
    }

    private function createReservasModel()
    {
        require_once("model/ReservasModel.php");
        $database = $this->getDatabase();
        return new ReservasModel($database);
    }

    private function createPaymentModel()
    {
        require_once("model/PaymentModel.php");
        $database = $this->getDatabase();
        return new PaymentModel($database);
    }

    private function createConfirmBookingModel()
    {
        require_once("model/ConfirmBookingModel.php");
        $database = $this->getDatabase();
        return new ConfirmBookingModel($database);
    }

    private function createCheckInModel()
    {
        require_once("model/CheckInModel.php");
        $database = $this->getDatabase();
        return new CheckInModel($database);
    }

    // Helpers
    private function getDatabase()
    {
        require_once("helpers/Database.php");
        $config = $this->getConfig();
        return new Database(
            $config["DATABASE"]["servername"],
            $config["DATABASE"]["username"],
            $config["DATABASE"]["password"],
            $config["DATABASE"]["dbname"],
            $this->getLogger()
        );
    }

    private function getRedirect()
    {
        require_once("helpers/Redirect.php");
    }

    private function getConfig()
    {
        if (is_null($this->config))
            $this->config = parse_ini_file("config/config.ini", true);

        return  $this->config;
    }

    private function getPHPMailer()
    {
        $config = $this->getConfig();
        require_once("helpers/PHPMailer.php");
        return new Mailer($config['MAIL_SETTINGS']['email'], $config['MAIL_SETTINGS']['password']);
    }

    private function getLogger()
    {
        require_once("helpers/Logger.php");
        return new Logger();
    }

    public function createRouter($defaultController, $defaultAction)
    {
        include_once("helpers/Router.php");
        return new Router($this, $defaultController, $defaultAction);
    }

    private function createPrinter()
    {
        require_once('third-party/mustache/src/Mustache/Autoloader.php');
        require_once("helpers/MustachePrinter.php");
        $config = $this->getConfig();
        return new MustachePrinter(
            "view/partials",
            // Constantes y funciones para usar en cualquier vista
            array(
                // Rutas de url del config.ini
                'URLS' => $config["URLS"],
                // Sirve para acceder a mensajes globales en la sesion, por unica vez
                // Ej, cuando el usuario se loguea en el controller del logueo
                // Le genera $_SESSION['message'] = 'Login exitoso' y muestra en la proxima pagina
                // Todos los alert se muestran desde el header por única vez. Luego se 
                // destruye la variable para que no se vuelva a mostrar. 
                'message_alert' => fn () => SessionManager::getMessageAlert(),
                // Se le pasa a las plantillas la variable de session para verificar
                // los datos del usuario
                'SESSION' => $_SESSION
            )
        );
    }
}
