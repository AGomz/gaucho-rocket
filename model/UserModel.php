<?php

class UserModel
{

    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getUserByEmail($email)
    {
        // Necesito que devuelva un único registro
        $query = "SELECT * FROM usuario WHERE email = \"$email\"";
        return $this->database->query($query)[0];
    }

    public function createNewUser($email, $password, $nickname)
    {
        $query = "INSERT INTO usuario(email, password, nickname)
                    VALUES (\"$email\", \"$password\", \"$nickname\")";

        return $this->database->query($query);
    }
}
