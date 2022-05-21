<?php

class LoginController
{

    private $userModel;
    private $printer;

    public function __construct($userModel, $printer)
    {
        $this->userModel = $userModel;
        $this->printer = $printer;
    }

    public function show()
    {
        echo $this->printer->render("view/loginView.html");
    }

    public function login()
    {
        // TODO, extraer a método?
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            Redirect::to('/login');
        }
        $email = $_POST["email"];
        $password =  $_POST["password"];

        // Harcodeado por que faltan validaciones
        if ($email == '' || $password == '') {
            Redirect::to('/login');
        }

        $user = $this->userModel->getUserByEmail($email);

        if (sizeof($user) > 0 && $user['email'] == $email && password_verify($password, $user['password'])) {

            $_SESSION['logueado'] = $user['email'];

            Redirect::to("/");
        } else {
            echo $this->printer->render(
                "view/loginView.html",
                ["error" => 'Credenciales inválidas']
            );
        }
    }

    public function logout()
    {
        session_unset();
        session_destroy();

        Redirect::to("/");
    }
}
