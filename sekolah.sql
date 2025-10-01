-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 01, 2025 at 01:15 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `Id_Guru` int NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Mata_Pelajaran` int NOT NULL,
  `NoTelepon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`Id_Guru`, `Nama`, `Mata_Pelajaran`, `NoTelepon`) VALUES
(1, 'Bu Fara', 1, '088888888888'),
(2, 'Pak Sena', 2, '088888888887'),
(3, 'Bu Dian', 3, '088888888867'),
(4, 'Pak Yogie', 4, '088888888567'),
(5, 'Bu Chori', 5, '088888884567');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `Id_Mapel` int NOT NULL,
  `Nama_Mapel` varchar(100) NOT NULL,
  `Tingkat` enum('X (Kelas 10)','XI (Kelas 11)','XII (Kelas 12)') NOT NULL,
  `Jam_Perminggu` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`Id_Mapel`, `Nama_Mapel`, `Tingkat`, `Jam_Perminggu`) VALUES
(1, 'PPLG', 'X (Kelas 10)', 8),
(2, 'PPLG', 'XI (Kelas 11)', 16),
(3, 'Matematika', 'X (Kelas 10)', 4),
(4, 'Matematika', 'XI (Kelas 11)', 2),
(5, 'Pendidikan Agama Islam', 'XI (Kelas 11)', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `Id_Nilai` int NOT NULL,
  `Id_Siswa` int NOT NULL,
  `Id_Mapel` int NOT NULL,
  `Nilai` int NOT NULL,
  `Semester` enum('Ganjil','Genap') NOT NULL,
  `Tahun_Ajaran` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`Id_Nilai`, `Id_Siswa`, `Id_Mapel`, `Nilai`, `Semester`, `Tahun_Ajaran`) VALUES
(1, 1, 2, 90, 'Ganjil', '2025/2026'),
(2, 2, 2, 95, 'Ganjil', '2025/2026'),
(3, 3, 2, 85, 'Ganjil', '2025/2026'),
(4, 1, 4, 90, 'Ganjil', '2025/2026'),
(5, 2, 4, 70, 'Ganjil', '2025/2026'),
(6, 3, 4, 100, 'Ganjil', '2025/2026'),
(7, 4, 1, 0, 'Ganjil', '2024/2025'),
(8, 4, 3, 0, 'Ganjil', '2024/2025'),
(9, 1, 5, 90, 'Ganjil', '2025/2026'),
(10, 2, 5, 70, 'Ganjil', '2025/2026'),
(11, 3, 5, 75, 'Ganjil', '2025/2026'),
(12, 5, 5, 90, 'Ganjil', '2025/2026');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `Id_Siswa` int NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Kelas` enum('X-PPLG','XI-PPLG','XII-PPLG','X-TJKT','XI-TJKT','XII-TJKT','X-MPLB','XI-MPLB','XII-MPLB','X-DKV','XI-DKV','XII-DKV') NOT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `NoTelepon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`Id_Siswa`, `Nama`, `Kelas`, `Alamat`, `NoTelepon`) VALUES
(1, 'Reyvan', 'XI-PPLG', NULL, '081234567890'),
(2, 'Fauzan', 'XI-PPLG', NULL, '081348247266'),
(3, 'Rajawali', 'XI-PPLG', NULL, '081348247216'),
(4, 'Rico', 'X-PPLG', NULL, '081828247216'),
(5, 'Prima', 'XI-TJKT', NULL, '080828247216');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`Id_Guru`),
  ADD KEY `Mata_Pelajaran` (`Mata_Pelajaran`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`Id_Mapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`Id_Nilai`),
  ADD KEY `Id_Siswa` (`Id_Siswa`),
  ADD KEY `Id_Mapel` (`Id_Mapel`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`Id_Siswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `Id_Guru` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `Id_Mapel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `Id_Nilai` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `Id_Siswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`Mata_Pelajaran`) REFERENCES `mata_pelajaran` (`Id_Mapel`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`Id_Siswa`) REFERENCES `siswa` (`Id_Siswa`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Id_Mapel`) REFERENCES `mata_pelajaran` (`Id_Mapel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
