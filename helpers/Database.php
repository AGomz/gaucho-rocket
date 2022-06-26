<?php

class Database
{
    private $connection;
    private $logger;

    public function __construct($servername, $username, $password, $dbname, $logger)
    {
        $this->logger = $logger;
        $this->connection = new mysqli($servername, $username, $password, $dbname);

        if ($this->connection->connect_error) {
            $this->logger->error('Falló la conexión con db. ' . $this->connection->connect_error);
            Redirect::to("/error");
        }
    }

    public function __destruct()
    {
        $this->connection->close();
    }

    /** 
     *  Ejecuta una consulta a la bd utilizando prepared statements
     * 
     *  Cuando la consulta es un SELECT, devuelve un array asociativo de registros 
     *  encontrados en la consulta o array vacío
     *  Si la query es cualquiera de las otras operaciones INSERT, UPDATE, O DELETE,
     *  devuelve un boolean
     * 
     *  @param  String  $preparedSql    La query SQL que se quiere ejecutar
     *  @param  Array   $params         El array de valores que se deben pasar(bind_params) en la query
     *  @param  String  $paramsTypes    Los tipos de datos de los valores en el mismo orden de secuencia
     *  @return mixed
     */
    public function preparedQuery($preparedSql, $params = [], $paramsTypes = "")
    {
        $stmt = $this->connection->prepare($preparedSql);
        if ($params) {
            $stmt->bind_param($paramsTypes, ...$params);
        }

        $result = $stmt->execute();
        $this->checkErrors();

        if (strpos(strtolower($preparedSql), 'select')) {
            $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        }

        $stmt->close();
        return $result;
    }

    // Procedimientos sin prepared statements
    public function query($sql)
    {
        $databaseResult = $this->connection->query($sql);
        $this->checkErrors();

        if ($this->connection->affected_rows <= 0)
            return [];

        return $databaseResult->fetch_all(MYSQLI_ASSOC);
    }

    public function insertQuery($sql)
    {
        $insertSuccess = $this->connection->query($sql);
        $this->checkErrors();
        return $insertSuccess;
    }

    public function lastID()
    {
        $lastID = $this->connection->insert_id;
        $this->checkErrors();
        return $lastID;
    }

    /*
    * Devuelve la cantidad de filas affectadas en la  última operación
    */
    public function affected_rows()
    {
        return $this->connection->affected_rows;
    }

    /**
     * Verifica errores durante la consulta y los reporta en el log
     */
    private function checkErrors()
    {
        if ($this->connection->error) {
            $this->logger->error('(DB ERROR) ' . $this->connection->errno . ': ' . $this->connection->error);
            Redirect::to("/error");
        }
    }
}
