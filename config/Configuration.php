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
        return new RegisterController($this->createUserModel(), $this->createPrinter());
    }

    // Modelos
    private  function createUserModel()
    {
        require_once("model/UserModel.php");
        $database = $this->getDatabase();
        return new UserModel($database);
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

    // private function createFormValidator()
    // {
    //     require_once("helpers/Validator.php");
    //     return new FormValidator();
    // }

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
            array('URLS' => $config["URLS"])
        );
    }
}
