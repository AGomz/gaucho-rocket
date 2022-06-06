<?php
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
        return new RegisterController($this->createUserModel(), $this->createPrinter(), $this->getPHPMailer());
    }

    public function createSearchController()
    {
        $this->getRedirect();
        require_once("controller/SearchController.php");
        return new SearchController($this->createSearchModel(), $this->createPrinter());
    }

    public function createReservasController()
    {
        $this->getRedirect();
        require_once("controller/ReservasController.php");
        return new ReservasController($this->createReservasModel(), $this->createPrinter());
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

    private function createReservasModel()
    {
        require_once("model/ReservasModel.php");
        $database = $this->getDatabase();
        return new ReservasModel($database);
    }

    // Helpers
    private  function getDatabase()
    {
        require_once("helpers/Database.php");
        $config = $this->getConfig();
        return new Database(
            $config["DATABASE"]["servername"],
            $config["DATABASE"]["username"],
            $config["DATABASE"]["password"],
            $config["DATABASE"]["dbname"]
        );
    }

    private function getRedirect()
    {
        require_once("helpers/Redirect.php");
    }

    private  function getConfig()
    {
        if (is_null($this->config))
            $this->config = parse_ini_file("config/config.ini", true);

        return  $this->config;
    }

    private function getPHPMailer()
    {
        $config = $this->getConfig();
        require_once("helpers/PHPMailer.php");
        return $mail;
    }

    // private function getLogger()
    // {
    //     require_once("helpers/Logger.php");
    //     return new Logger();
    // }

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
                'message_alert' => function () {
                    if (isset($_SESSION['message'])) {
                        $message = $_SESSION['message'];
                        unset($_SESSION['message']);
                        return "<div class='alert alert-success m-2' role='alert'>" .
                            $message .
                            "</div>";
                    }
                    return "";
                },
                // Se le pasa a las plantillas la variable de session para verificar
                // los datos del usuario
                'SESSION' => $_SESSION
            )
        );
    }
}
