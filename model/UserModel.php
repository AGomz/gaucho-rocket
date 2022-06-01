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
        return $this->database->query($query);
    }

    public function getUserIDByEmail($email)
    {
        // Devuelve un único registro o array vacío
        $query = "SELECT u.id
                    FROM login l
                    INNER JOIN usuario u 
                    ON u.IDLogin = l.id 
                    WHERE l.email =  \"$email\"";
        return $this->database->query($query);
    }



    public function getRolByUserID($id)
    {
        $query = "SELECT descripcion 
                  FROM usuariorol u INNER JOIN rol r ON u.RolID = r.id 
                  WHERE u.UsuarioID = \"$id\"";
        return $this->database->query($query)[0]['descripcion'];
    }

    public function esCliente($id)
    {
        $query =    "SELECT count(*)
                    FROM usuario u 
                    INNER JOIN usuariorol u2 
                    ON u2.UsuarioID = u.id
                    INNER JOIN login l 
                    ON u.IDLogin = l.id
                    WHERE l.email =  \"$id\"
                    AND u2.RolID = 1;";
        return $this->database->query($query) === 1;
    }

    public function esAdmin($id)
    {
        $query =    "SELECT count(*)
                    FROM usuario u 
                    INNER JOIN usuariorol u2 
                    ON u2.UsuarioID = u.id
                    INNER JOIN login l 
                    ON u.IDLogin = l.id
                    WHERE l.email =  \"$id\"
                    AND u2.RolID = 2;";
        return $this->database->query($query) === 1;
    }

    private function getNivelDeVueloByUserID($id)
    {
        $query = "SELECT n.nombre 
                  FROM nivelvuelo n INNER JOIN usario u ON  n.id = u.IDNivelDeVuelo
                  WHERE n.id = \"$id\"";
        return $this->database->query($query);
    }

    public function createNewUser($nombre, $apellido, $email, $password)
    {
        // TODO debería ir todo en una Transaction, por si falla alguna query?
        // Creo el login
        $query = "INSERT INTO login(email, password) 
                    VALUES (\"$email\", \"$password\")";
        $this->database->insertQuery($query);
        $IDLogin = $this->database->lastID();

        // Genero el usuario
        $query = "INSERT INTO usuario(nombre, apellido, IDLogin)
                    VALUES (\"$nombre\", \"$apellido\", \"$IDLogin\")";
        $this->database->insertQuery($query);

        // Le doy el rol de cliente
        // El rol esta harcodeado, se debería traer del modelo de rol?
        $IDUsuario = $this->database->lastID();
        $query = "INSERT INTO usuariorol (UsuarioID, RolID) 
                    VALUES (\"$IDUsuario\", \"1\")";

        return $this->database->insertQuery($query);
    }
}
