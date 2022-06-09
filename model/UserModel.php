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
        $query = "select email, password from login where email = \"$email\"";
        return $this->database->query($query);
    }

    public function getUserIDByEmail($email)
    {
        // Devuelve un único registro o array vacío
        $query = "select u.id
                    from login l
                    inner join usuario u 
                    on u.idlogin = l.id 
                    where l.email =  \"$email\"";
        return $this->database->query($query);
    }



    public function getRolByUserID($id)
    {
        $query = "select descripcion 
                  from usuariorol u inner join rol r on u.rolid = r.id 
                  where u.usuarioid = \"$id\"";
        return $this->database->query($query)[0]['descripcion'];
    }

    public function esCliente($id)
    {
        $query =    "select count(*)
                    from usuario u 
                    inner join usuariorol u2 
                    on u2.usuarioid = u.id
                    inner join login l 
                    on u.idlogin = l.id
                    where l.email =  \"$id\"
                    and u2.rolid = 1;";
        return $this->database->query($query) === 1;
    }

    public function esAdmin($id)
    {
        $query =    "select count(*)
                    from usuario u 
                    inner join usuariorol u2 
                    on u2.usuarioid = u.id
                    inner join login l 
                    on u.idlogin = l.id
                    where l.email =  \"$id\"
                    and u2.rolid = 2;";
        return $this->database->query($query) === 1;
    }

    private function getNivelDeVueloByUserID($id)
    {
        $query = "select n.nombre 
                  from nivelvuelo n inner join usario u on  n.id = u.idniveldevuelo
                  where n.id = \"$id\"";
        return $this->database->query($query);
    }

    public function createNewUser($nombre, $apellido, $email, $password)
    {
        // TODO debería ir todo en una Transaction, por si falla alguna query?
        // Creo el login
        $query = "insert into login(email, password) 
                    values (\"$email\", \"$password\")";
        $this->database->insertQuery($query);
        $IDLogin = $this->database->lastID();

        // Genero el usuario
        $query = "insert into usuario(nombre, apellido, idlogin)
                    values (\"$nombre\", \"$apellido\", \"$IDLogin\")";
        $this->database->insertQuery($query);

        // Le doy el rol de cliente
        // El rol esta harcodeado, se debería traer del modelo de rol?
        $IDUsuario = $this->database->lastID();
        $query = "insert into usuariorol (usuarioid, rolid) 
                    values (\"$IDUsuario\", \"1\")";
        $this->database->insertQuery($query);

        return $IDUsuario;
    }
}
