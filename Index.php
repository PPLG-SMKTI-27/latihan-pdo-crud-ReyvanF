<?php
require_once "Siswa.php";

$PDO = new Database();
$DB = $PDO->GetConnection();

$Siswa = new Siswa($DB);
$Siswa->Read();
// $Siswa->Create("Faris", "XI-PPLG", "089178182918");      (Sudah ditambahkan)
// Untuk bagian kelas itu format nya harus seperti berikut: X-Jurusan, XI-Jurusan, XII-Jurusan

// $Siswa->Update(6, "Farel", "XII-MPLB", "089287230982");  (Sudah diperbarui)

// $Siswa->Delete(6);                                       (Sudah dihapus)
?>