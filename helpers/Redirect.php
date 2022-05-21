<?php

class Redirect
{
    public static function to($relativeRoute)
    {
        $domainUrl = 'http://' . $_SERVER['SERVER_NAME'];

        header("Location: $domainUrl$relativeRoute");
        die();
    }
}
