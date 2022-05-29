<?php

class RegisterController
{

    private $userModel;
    private $printer;
    private $mailer;

    public function __construct($userModel, $printer, $mailer)
    {
        $this->userModel = $userModel;
        $this->printer = $printer;
        $this->mailer = $mailer;
    }

    public function show($data = [])
    {
        echo $this->printer->render("view/registerView.html", $data);
        die();
    }

    public function register()
    {
        Redirect::ifMethodIsNotPOST('/register');

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

        // Se registra al usuario en la db
        $hash = password_hash($password, PASSWORD_DEFAULT);
        $this->userModel->createNewUser($nombre, $apellido, $email, $hash);

        // Le mando el mail
        $this->sendRegisterEmail($email, $nombre, $apellido);

        Redirect::to("/login");
    }

    // Manda un mail cuando se registra el usuario
    private function sendRegisterEmail($email, $nombre, $apellido)
    {
        //Content
        $mailData = array(
            "mail" => $email,
            "nombre" => $nombre,
            "apellido" => $apellido
        );

        // Ejemplo de imagen en el body del emial
        // $mail->AddEmbeddedImage("rocks.png", "my-attach", "rocks.png");
        // $mail->Body = 'Embedded Image: <img alt="PHPMailer" src="cid:my-attach"> Here is an image!';

        //Recipients
        $this->mailer->addAddress($email, "$nombre $apellido");     //Add a recipient
        // Asunto
        $this->mailer->Subject = 'Bienvenido a Gaucho Rocket!!!!';
        // Img para el body del mail
        $this->mailer->AddEmbeddedImage(
            "./public/img/register-mail-image.jpg",
            "img"
        );
        // Body html del mail
        $mailHTML = $this->printer->render("view/registerMailview.html", $mailData);
        $this->mailer->Body = $mailHTML;

        if ($this->mailer->send()) {
            // Mensaje enviado ok
            $_SESSION['message'] = 'Registro exitoso, se ha enviado un nuevo correo electrónico';
        } else {
            echo 'Error al enviar el correo';
            die();
        };
    }
}
