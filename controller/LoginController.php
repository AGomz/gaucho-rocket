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
        // TODO, Habría que validar el método POST primero
        $email = $_POST["email"];
        $password =  $_POST["password"];

        $user = $this->userModel->getUserByEmail($email);

        if (sizeof($user) > 0 && $user['email'] == $email && password_verify($password, $user['password'])) {

            $_SESSION['logueado'] = $user['nickname'];

            // Baja 2 niveles hasta la home
            header('Location: ../../');
            die();
        } else {
            echo $this->printer->render(
                "view/loginView.html",
                ["error" => "Login incorrecto"]
            );
        }
    }

    public function logout()
    {
        session_unset();
        session_destroy();

        header('Location: ./../');
        die();
    }
}
