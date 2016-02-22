<?php

/*
 * The new database class by DjMadness (Christopher Moore)
 * Rewritten to support data types for SQL injection protection.
 * This code is provided as is, and i will not be held responsible if it kills you cat, dog
 * you get fired, if it blows up your computer or anything at all. 
 * Its basicly made for me and provided without any support to anyone who wants it.
 * 
 * IF you use this code in your projects you are to include this message and the source code.
 * 
 */
class Database {
    private $hostname = DB_HOSTNAME;
    private $username = DB_USERNAME;
    private $password = DB_PASSWORD;
    private $database = DB_DATABASE;
    private $type = DB_TYPE;
    private $connected = 0;
    private $debug = false;
    private $bind = array();
    private $pdo;
    public function __construct($hostname = null, $username = null, $password = null, $database = null, $type = null) {
        if (($hostname != null) && ($username != null) && ($password != null) && ($database != null) && ($type != null)) {
            $this->hostname = $hostname;
            $this->username = $username;
            $this->password = $password;
            $this->database = $database;
            $this->type = $type;
        }
    }
    private function Connect() {
        try {
            switch (strtolower($this->type)) {
                case 'mysql':
                    $this->pdo = new PDO("mysql:host=$this->hostname;dbname=$this->database", $this->username, $this->password);
                    break;
            }
        } catch (PDOException $Exception) {
            $this->connected = 0;
            throw new PDOException($Exception->getMessage(), (int) $Exception->getCode());
        }
        $this->connected = 1;
        return true;
    }
    public function Bind($type, $name, $data) {
        switch (strtolower($type)) {
            case 'int':
                $ltype = PDO::PARAM_INT;
                break;
            case 'string':
                $ltype = PDO::PARAM_STR;
                break;
            case 'bool':
                $ltype = PDO::PARAM_BOOL;
                break;
            case 'null':
                $ltype = PDO::PARAM_NULL;
                break;
            default:
                $ltype = PDO::PARAM_STR;
                break;
        }
        array_push($this->bind, array('type' => $ltype, 'name' => $name, 'data' => $data));
        return $data; // lets just be friendly and return the actual data
    }
    public function Debug($bool) {
        $this->debug = $bool;
    }
    public function DebugPrint($query) {
        if ($this->debug) {
            foreach ($this->bind as $binds) $query = str_replace($binds['name'], "'" . $binds['data'] . "'", $query);
            echo "<br /> [DEBUG] $query;<br />";
        }
    }
    public function Count($query) {
        return count($query);
    }
    public function Select($table, $columns, $where = null) {
        $query = "SELECT $columns FROM " . DB_PREFIX . $table;
        $query = $where != null ? $query . " $where" : $query;
        $this->DebugPrint($query);
        if ($this->connected == 0) if ($this->Connect() != true) return null;
        try {
            $this->stmt = $this->pdo->prepare($query);
            foreach ($this->bind as $row) $this->stmt->bindValue($row['name'], $row['data'], $row['type']);
            $this->bind = array(); // Unset bind again
            $this->stmt->execute();
            return $this->stmt->fetchAll(PDO::FETCH_OBJ);
        } catch (PDOException $Exception) {
            throw new PDOException($Exception->getMessage(), (int) $Exception->getCode());
        }
    }
    public function Insert($table, $column, $data, $args = null) {
        $query = "INSERT INTO " . DB_PREFIX . $table . "($column) VALUES($data) $args";
        $this->DebugPrint($query);
        if ($this->connected == 0) if ($this->Connect() != true) return null;
        try {
            $this->stmt = $this->pdo->prepare($query);
            foreach ($this->bind as $row) $this->stmt->bindValue($row['name'], $row['data'], $row['type']);
            $this->bind = array(); // Unset bind again
            $this->stmt->execute();
            return $this->stmt->rowCount();
        } catch (PDOException $Exception) {
            throw new PDOException($Exception->getMessage(), (int) $Exception->getCode());
        }
    }
    public function Delete($table, $where = null) {
        $query = "DELETE FROM " . DB_PREFIX . $table;
        $query = $where != null ? $query . " $where" : $query;
        $this->DebugPrint($query);
        if ($this->connected == 0) if ($this->Connect() != true) return null;
        try {
            $this->stmt = $this->pdo->prepare($query);
            foreach ($this->bind as $row) $this->stmt->bindValue($row['name'], $row['data'], $row['type']);
            $this->bind = array(); // Unset bind again
            $this->stmt->execute();
            return $this->stmt->rowCount();
        } catch (PDOException $Exception) {
            throw new PDOException($Exception->getMessage(), (int) $Exception->getCode());
        }
    }
    // Special delete for joined tables
    public function SDelete($join, $table, $where = null) {
        $query = "DELETE $join FROM " . DB_PREFIX . $table;
        $query = $where != null ? $query . " $where" : $query;
        $this->DebugPrint($query);
        if ($this->connected == 0) if ($this->Connect() != true) return null;
        try {
            $this->stmt = $this->pdo->prepare($query);
            foreach ($this->bind as $row) $this->stmt->bindValue($row['name'], $row['data'], $row['type']);
            $this->bind = array(); // Unset bind again
            $this->stmt->execute();
            return $this->stmt->rowCount();
        } catch (PDOException $Exception) {
            throw new PDOException($Exception->getMessage(), (int) $Exception->getCode());
        }
    }
    public function Update($table, $data, $where = null) {
        $query = "UPDATE " . DB_PREFIX . $table . " SET $data";
        $query = $where != null ? $query . " $where" : $query;
        $this->DebugPrint($query);
        if ($this->connected == 0) if ($this->Connect() != true) return null;
        try {
            $this->stmt = $this->pdo->prepare($query);
            foreach ($this->bind as $row) $this->stmt->bindValue($row['name'], $row['data'], $row['type']);
            $this->bind = array(); // Unset bind again
            $this->stmt->execute();
            return $this->stmt->rowCount();
        } catch (PDOException $Exception) {
            throw new PDOException($Exception->getMessage(), (int) $Exception->getCode());
        }
    }
    public function RawQuery($query) {
        $this->DebugPrint($query);
        if ($this->connected == 0) if ($this->Connect() != true) return null;
        try {
            $this->stmt = $this->pdo->prepare($query);
            $this->stmt->execute();
            return $this->stmt->rowCount();
        } catch (PDOException $Exception) {
            throw new PDOException($Exception->getMessage(), (int) $Exception->getCode());
        }
    }
}