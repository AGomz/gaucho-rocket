<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require './third-party/PHPMailer/src/PHPMailer.php';
require './third-party/PHPMailer/src/Exception.php';
require './third-party/PHPMailer/src/SMTP.php';

// Create an instance; passing `true` enables exceptions
$mail = new PHPMailer(true);

// Configuracion con SMTP de gmail
// cuenta gmail del sitio para correos salientes
// usuario: "guachorocketArg@gmail.com"
// password: "grupo_10_pbII_2022"
$mail->IsSMTP(); // habilita SMTP
$mail->SMTPAuth = true; // auth habilitada
$mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
$mail->Host = "smtp.gmail.com";
$mail->Port = 465; // or 587

// Contrasenia para aplicacion de google
// Se genera con desde la verificaion de 2 pasos de contrasenia
// y contrasenias de aplicaciones
$mail->Username = $config['MAIL_SETTINGS']['email'];
$mail->Password = $config['MAIL_SETTINGS']['password'];

// Configuraciones del mail a enviar
$mail->SetFrom("gauchorocketArg@gmail.com");
$mail->isHTML(true);
