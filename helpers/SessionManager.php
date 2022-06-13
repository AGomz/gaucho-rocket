<?php

require_once("Redirect.php");

class SessionManager
{
    public static function checkIfSessionIsNotValid($relativeRoute = "/home")
    {
        if (!isset($_SESSION['user']["email"]) || $_SESSION['user'] == "" ){
            Redirect::to($relativeRoute);
        }
    }

    public static function checkIfSessionIsValid($relativeRoute = "/home")
    {
        if (isset($_SESSION['user']["email"]) && $_SESSION['user'] != "" ){
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
            unset($_SESSION['message']);
            return "<div class='alert alert-success m-2' role='alert'>" .
                $message .
                "</div>";
        }
        return "";
    }

    public static function setMessageAlert($message)
    {
        $_SESSION['message'] = $message;
    }

    public static function logout()
    {
        session_unset();
        session_destroy();

        Redirect::to("/");
    }

}