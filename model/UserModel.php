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
        // Devuelve un único registro o array vacío
        $query = "SELECT email, password FROM login WHERE email = \"$email\"";
        return $this->database->query($query)[0];
    }

    public function createNewUser($nombre, $apellido, $email, $password)
    {
        // Creo el login
        $query = "INSERT INTO login(email, password) 
                    VALUES (\"$email\", \"$password\")";
        $this->database->insertQuery($query);
        $IDLogin = $this->database->lastID();

        // Genero el usuario
        $query = "INSERT INTO usuario(nombre, apellido, IDLogin)
                    VALUES (\"$nombre\", \"$apellido\", \"$IDLogin\")";

        return $this->database->insertQuery($query);
    }
}
