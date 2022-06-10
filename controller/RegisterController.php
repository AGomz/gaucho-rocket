<?php

class RegisterController
{

    private $userModel;
    private $turnoMedicoModel;
    private $printer;
    private $mailer;

    public function __construct($userModel, $turnoMedicoModel, $printer, $mailer, $logger)
    {
        $this->userModel = $userModel;
        $this->turnoMedicoModel = $turnoMedicoModel;
        $this->printer = $printer;
        $this->mailer = $mailer;
        $this->logger = $logger;
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
        $userID = $this->userModel->createNewUser($nombre, $apellido, $email, $hash);

        // Le asignamos el turno medico
        $datosTurnoMedico = $this->turnoMedicoModel->generateTurnoMedico($userID);

        // Le mandamos el mail
        $this->sendRegisterEmail($email, $nombre, $apellido, $datosTurnoMedico);


        Redirect::to("/login");
    }

    // Manda un mail cuando se registra el usuario
    private function sendRegisterEmail($email, $nombre, $apellido, $datosTurnoMedico)
    {
        $mailData = array(
            "mail" => $email,
            "nombre" => $nombre,
            "apellido" => $apellido,
            "turnoMedico" => $datosTurnoMedico
        );

        $this->mailer->agregarDestinatario($email, "$nombre $apellido");
        $this->mailer->agregarAsunto('Bienvenido a Gaucho Rocket!!!!');
        $this->mailer->agregarImagen(
            "./public/img/register-mail-image.jpg",
            "img"
        );
        $this->mailer->agregarBody($this->printer->render("view/registerMailView.html", $mailData));

        if ($this->mailer->enviar()) {
            $_SESSION['message'] = 'Registro exitoso, se ha enviado un nuevo correo electrónico';
        } else {
            // TODO Redirect a la pagina de error
            echo 'Error al enviar el correo';
            die();
        };

        $this->logger->info("$email se ha registrado");
    }
}
