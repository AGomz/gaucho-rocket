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

    private function getNivelDeVueloByEmail($email)
    {
        $query =        "select n.nombre 
                        from nivelvuelo n 
                        inner join usuario u
                        on  n.id = u.idnivelvuelo
                        inner join login l 
                        on u.idlogin = l.id 
                        where l.email = \"$email\"";
        return $this->database->query($query);
    }
    public function createNewUser($nombre, $apellido, $email, $password)
    {
        $query = "INSERT INTO login(email, password) 
                    VALUES (?, ?)";
        $this->database->preparedQuery($query, [$email, $password], 'ss');
        $IDLogin = $this->database->lastID();

        // Genero el usuario
        $query = "INSERT INTO usuario(nombre, apellido, IDLogin)
                    VALUES (?, ?, ?)";
        $this->database->preparedQuery($query, [$nombre, $apellido, $IDLogin], 'ssi');

        $IDUsuario = $this->database->lastID();
        $query = "INSERT INTO usuariorol (UsuarioID, RolID) 
                    VALUES (?, \"1\")";
        $this->database->preparedQuery($query, [$IDUsuario], 'i');

        return $IDUsuario;
    }
}
