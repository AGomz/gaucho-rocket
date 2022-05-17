<?php

class RegisterController
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
        echo $this->printer->render("view/registerView.html");
    }

    public function register()
    {
        // TODO, Habría que validar que es método POST primero
        $email = $_POST["email"];
        $nickname = $_POST["nickname"];
        $password =  $_POST["password"];

        $user = $this->userModel->getUserByEmail($email);

        if ($email != "" && $nickname != "" && $password != "" &&  empty($user)) {

            // TODO, validar email contra regex, password > 8 caracteres, etc
            $hash = password_hash($password, PASSWORD_DEFAULT);

            $this->userModel->createNewUser($email, $hash, $nickname);

            header('Location: ../../login');
            die();
        } else {
            echo $this->printer->render(
                "view/registerView.html",
                ["error" => "Registro incorrecto"]
            );
        }
    }
}
