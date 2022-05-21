<?php

class RegisterController
{

    private $userModel;
    private $printer;
    private $formValidator;

    public function __construct($userModel, $printer)
    {
        $this->userModel = $userModel;
        $this->printer = $printer;
    }

    public function show()
    {
        echo $this->printer->render("view/registerView.html");
    }

    public function register()
    {
        // TODO, extraer a método?
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            Redirect::to('/register');
        }

        $nombre = isset($_POST["name"]) ? $_POST["name"] : "";
        $apellido = isset($_POST["lastname"]) ? $_POST["lastname"] : "";
        $email = isset($_POST["email"]) ? $_POST["email"] : "";
        $password =  isset($_POST["password"]) ? $_POST["password"] : "";

        // if ($this->userModel->getUserByEmail($email)) {
        //     // TODO invalid email
        // }

        // TODO falta validar
        if ($nombre != '' && $apellido != ''  && $email != '' && $password != '') {

            $hash = password_hash($password, PASSWORD_DEFAULT);
            $this->userModel->createNewUser($nombre, $apellido, $email, $hash);

            Redirect::to("/login");
        }
        Redirect::to("/register");
    }
}
