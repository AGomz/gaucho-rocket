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
        require_once("controller/LoginController.php");
        return new LoginController($this->createUserModel(), $this->createPrinter());
    }

    public function createRegisterController()
    {
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
        return new Database($config["servername"], $config["username"], $config["password"], $config["dbname"]);
    }

    private  function getConfig()
    {
        if (is_null($this->config))
            $this->config = parse_ini_file("config/config.ini");

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
        return new MustachePrinter("view/partials");
    }
}
