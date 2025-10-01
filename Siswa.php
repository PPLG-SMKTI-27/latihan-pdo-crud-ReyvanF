<?php
require_once "Db.php";

class Siswa {
    private $pdo;

    public function __construct($db) {
        $this->pdo = $db;
    }

    public function Create($Nama, $Kelas, $Notelp) {
        $Sql = "INSERT INTO siswa (Nama, Kelas, NoTelepon) VALUES (:Nama, :Kelas, :NoTelepon)";
        $Stmt = $this->pdo->prepare($Sql);
        $Stmt->execute([
            ':Nama' => $Nama,
            ':Kelas' => $Kelas,
            ':NoTelepon' => $Notelp
        ]);
        echo "Siswa bernama '$Nama' berhasil di tambahkan pada tabel\n\n";
    }

    public function Read() {
        try {
            $Sql = "SELECT * FROM siswa";
            $Stmt = $this->pdo->query($Sql);
            $Data = $Stmt->fetchAll(PDO::FETCH_ASSOC);
            if (empty($Data)) {
                echo "Tabel daftar siswa kosong...";
                return;
            } else {
                echo "Daftar Siswa : \n\n";
                foreach ($Data as $Row) {
                    echo "ID : ", $Row['Id_Siswa'], "\n - Nama : ", $Row['Nama'], "\n - Kelas : ", $Row['Kelas'], "\n - No.Hp : ", $Row['NoTelepon'], "\n\n";
                }
                echo "====================\n\n";
            }
        } catch (PDOException $e) {
            echo "Query gagal dilakukan : ", $e->getMessage();
        }
    }

    public function Update($Id, $Nama, $Kelas, $NoTelp) {
        $Sql = "UPDATE Siswa SET Nama = :Nama, Kelas = :Kelas, NoTelepon = :NoTelepon WHERE Id_Siswa = :Id_Siswa";
        $Stmt = $this->pdo->prepare($Sql);
        $Stmt->execute([
            ':Id_Siswa' => $Id,
            ':Nama' => $Nama,
            ':Kelas' => $Kelas,
            ':NoTelepon' => $NoTelp
        ]);
        echo "Data siswa pada table dengan ID $Id berhasil di perbarui\n\n";
    }
    public function Delete($Id) {
        $Sql = "DELETE FROM Siswa WHERE Id_Siswa = :Id_Siswa";
        $Stmt = $this->pdo->prepare($Sql);
        $Stmt->execute([
            ':Id_Siswa' => $Id
        ]);
        echo "Data siswa pada table dengan ID $Id berhasil di hapus\n\n";
    }     
}

?>