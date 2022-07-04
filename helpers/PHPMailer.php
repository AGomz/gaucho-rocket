<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require './third-party/PHPMailer/src/PHPMailer.php';
require './third-party/PHPMailer/src/Exception.php';
require './third-party/PHPMailer/src/SMTP.php';

// Configuracion con SMTP de gmail
// cuenta gmail del sitio para correos salientes
// usuario: "guachorocketArg@gmail.com"
// password: "grupo_10_pbII_2022"

class Mailer
{
    private $mail;

    public function __construct($username, $password)
    {
        $this->mail = new PHPMailer(true);

        $this->mail->isSMTP(true);
        $this->mail->SMTPAuth = true; // auth habilitada
        $this->mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $this->mail->Host = "smtp.gmail.com";
        $this->mail->Port = 465; // or 587

        // Sin esto no envía el correo
        $this->mail->SMTPOptions = [
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            ]
        ];

        $this->mail->Username = $username;
        $this->mail->Password = $password;

        // Configuraciones del mail a enviar
        $this->mail->SetFrom("gauchorocketArg@gmail.com");
        $this->mail->isHTML(true);
    }

    public function agregarDestinatario($email, $fullName = '')
    {
        $this->mail->addAddress($email, $fullName);
    }

    public function agregarAsunto($subject)
    {
        $this->mail->Subject = $subject;
    }

    public function agregarImagen($path, $identifier)
    {
        $this->mail->AddEmbeddedImage(
            $path,
            $identifier
        );
    }

    public function agregarImagenRemota($url, $nombre) {
        $this->mail->addStringAttachment(file_get_contents($url), $nombre);
    }

    public function agregarBody($body)
    {
        $this->mail->Body = $body;
    }

    public function enviar()
    {
        return $this->mail->send();
    }
}
