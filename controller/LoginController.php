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
        Redirect::ifMethodIsNotPOST('/login');

        $email = isset($_POST["email"]) ? $_POST["email"] : "";
        $password =  isset($_POST["password"]) ? $_POST["password"] : "";

        // Datos precargados por el cliente por si tengo
        // que marcale un error en los datos
        $preload = [
            "email" => $email,
            "password" => $password
        ];

        $user = $this->userModel->getUserByEmail($email);

        if (sizeof($user) > 0 && $user[0]['email'] == $email && password_verify($password, $user[0]['password'])) {

            // Se asigna id de usuario a la sesion
            // Luego desde el <<userModel>> con el Id de usuario accedemos a cualquier dato
            $_SESSION['user'] = array(
                "id" => $user[0]['id'],
                "email" => $user[0]['email'],
                "isAdmin" => $this->userModel->getRolByUserId($user[0]['id']) == 'Administrador'
            );

            $_SESSION['message'] = "Bienvenido nuevamente $email";

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
