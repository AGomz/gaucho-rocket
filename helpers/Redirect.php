<?php

/*
    Calse para redirección a partir de rutas relativas al root de la web
*/
class Redirect
{
    public static function to($relativeRoute)
    {
        $domainUrl = 'http://' . $_SERVER['SERVER_NAME'];

        header("Location: $domainUrl$relativeRoute");
        die();
    }

    // Si el no vino por HTTP POST, redirecciona(para usar en controladores de formularios)
    public static function ifMethodIsNotPOST($relativeRoute)
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            Redirect::to($relativeRoute);
        }
    }
}
