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

    public function show($data = [])
    {
        echo $this->printer->render("view/loginView.html", $data);
    }

    public function login()
    {
        // TODO, extraer a método?
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            Redirect::to('/login');
        }

        $email = isset($_POST["email"]) ? $_POST["email"] : "";
        $password =  isset($_POST["password"]) ? $_POST["password"] : "";

        $preload = [
            "email" => $email,
            "password" => $password
        ];

        $user = $this->userModel->getUserByEmail($email);

        if (sizeof($user) > 0 && $user[0]['email'] == $email && password_verify($password, $user[0]['password'])) {

            $_SESSION['logueado'] = $user[0]['email'];

            Redirect::to("/");
        } else {
            $data = array_merge($preload, ["error" => 'Credenciales inválidas']);
            $this->show($data);
        }
    }

    public function logout()
    {
        session_unset();
        session_destroy();

        Redirect::to("/");
    }
}
