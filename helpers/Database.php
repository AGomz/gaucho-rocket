<?php

class Database
{
    private $connection;

    public function __construct($servername, $username, $password, $dbname)
    {
        $this->connection = mysqli_connect($servername, $username, $password, $dbname);

        if (!$this->connection) {
            die("Connection failed: " . mysqli_connect_error());
        }
    }

    public function __destruct()
    {
        mysqli_close($this->connection);
    }

    public function query($sql)
    {
        $databaseResult = mysqli_query($this->connection, $sql);

        if (mysqli_affected_rows($this->connection) <= 0)
            return [];

        return mysqli_fetch_all($databaseResult, MYSQLI_ASSOC);
    }

    public function insertQuery($sql)
    {
        mysqli_query($this->connection, $sql);
    }

    public function lastID()
    {
        return mysqli_insert_id($this->connection);
    }
}
