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
        SessionManager::checkIfSessionIsValid();
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
        $userId = $this->userModel->getUserIDByEmail($email);
        $userRol = $this->userModel->getRolByUserID($userId[0]['id']) == 2;

        if (sizeof($user) > 0 && $user[0]['email'] == $email && password_verify($password, $user[0]['password'])) {
            SessionManager::setMessageAlert("Bienvenido nuevamente $email");
            SessionManager::saveUserData($userId, $email, $userRol);
        } else {
            $data = array_merge($preload, ["error" => 'Credenciales inválidas']);
            $this->show($data);
        }
    }

    public function logout()
    {
        SessionManager::logout();
    }
}
