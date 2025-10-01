<?php
class Database {
    private $host = "localhost";
    private $db = "sekolah";
    private $user = "root";
    private $pw = "";
    private $pdo;
    
    public function __construct() {
        try {
            $this->pdo = new PDO("mysql:host=$this->host;dbname=$this->db", $this->user, $this->pw);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Database '$this->db' berhasil terhubung\n\n";
        } catch (PDOException $e) {
            echo "Database gagal terhubung : \n", $e->getMessage(), "\n\n";
        }
    }

    public function GetConnection() {
        return $this->pdo;
    }  
}
?>