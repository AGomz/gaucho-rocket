<?php

require_once("Redirect.php");

class SessionManager
{
    public static function checkIfSessionIsNotValid($relativeRoute = "/home")
    {
        if (!isset($_SESSION['user']["email"]) || $_SESSION['user']["email"] == "") {
            Redirect::to($relativeRoute);
        }
    }

    public static function checkIfSessionIsValid($relativeRoute = "/home")
    {
        if (isset($_SESSION['user']["email"]) && $_SESSION['user']["email"] != "") {
            Redirect::to($relativeRoute);
        }
    }

    public static function getUserId()
    {
        $array = $_SESSION['user']["id"];
        return $array[0]['id'];
    }

    public static function saveUserData($userId, $email)
    {
        // Se asigna id de usuario a la sesion
        // Luego desde el <<userModel>> con el Id de usuario accedemos a cualquier dato
        $_SESSION['user'] = array(
            "id" => $userId,
            "email" => $email
        );

        Redirect::to("/");
    }

    public static function getMessageAlert()
    {
        if (isset($_SESSION['message'])) {
            $message = $_SESSION['message'];
            $messageLevel = $_SESSION['message_level'];
            unset($_SESSION['message']);
            unset($_SESSION['message_level']);
            return "<div class='alert alert-{$messageLevel} m-2' role='alert'>" .
                $message .
                "</div>";
        }
        return "";
    }

    /*
    * El nivel de error corresponde a las clases de bootstrap del alert
    * 'info' -> celeste (default)
    * 'success' -> verde (éxito)
    * 'danger' -> rojo (errores)
    */
    public static function setMessageAlert($message, $level = 'info')
    {
        $_SESSION['message'] = $message;
        $_SESSION['message_level'] = $level;
    }

    public static function logout()
    {
        session_unset();
        session_destroy();

        Redirect::to("/");
    }

    // Guarda datos de la reserva para realizar el pago
    public static function setDatosDeReserva($reservaId, $transaccion, $importe)
    {
        $reserva = [
            "reservaId" => $reservaId,
            "transaccion" => $transaccion,
            "importe" => $importe
        ];

        $_SESSION['reserva'] = $reserva;
    }

    public static function getDatosDeReserva()
    {
        if (isset($_SESSION['reserva'])) {
            $reserva = $_SESSION['reserva'];
            unset($_SESSION['reserva']);
            return $reserva;
        }

        return "";
    }

    public static function finsh()
    {
        session_unset();
        session_destroy();
    }
}
