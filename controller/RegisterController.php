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

    public function show($data = [])
    {
        echo $this->printer->render("view/registerView.html", $data);
        die();
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
        $errors = [];

        $preload = [
            "name" => $nombre,
            "lastname" => $apellido,
            "email" => $email,
            "password" => $password
        ];

        // Validar datos
        $errors['nameError'] = $nombre == "" ? 'El nombre no puede estar vacío' : null;
        $errors['lastnameError'] = $apellido == "" ? 'El apellido no puede estar vacío' : null;
        $errors['emailError'] = !filter_var($email, FILTER_VALIDATE_EMAIL) ? 'El formato de email no es válido' : null;
        $errors['passwordError'] = strlen($password) < 6  ? 'La contraseña debe tener al menos 6 caracteres' : null;

        // Limpia los errores null
        foreach ($errors as $key => $value) {
            if (!$value) {
                unset($errors[$key]);
            }
        }

        // Verificar que la cuenta no existe
        if (sizeof($this->userModel->getUserByEmail($email)) > 0) {
            $errors['emailError'] = 'El email ya se encuentra registrado';
        }

        if ($errors) {
            $data = array_merge($errors, $preload);
            $this->show($data);
        }

        $hash = password_hash($password, PASSWORD_DEFAULT);
        $this->userModel->createNewUser($nombre, $apellido, $email, $hash);

        Redirect::to("/login");
    }
}
