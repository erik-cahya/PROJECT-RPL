-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2020 at 01:05 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kantorku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabsensi`
--

CREATE TABLE `tabsensi` (
  `id_absensi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `NIP` int(11) NOT NULL,
  `waktu_masuk_absensi` datetime NOT NULL,
  `waktu_keluar_absensi` datetime NOT NULL,
  `hari_tanggal_masuk_absensi` datetime NOT NULL,
  `hari_tanggal_keluar_absensi` datetime NOT NULL,
  `status_absensi` varchar(100) NOT NULL,
  `nominal_denda` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tcuti`
--

CREATE TABLE `tcuti` (
  `id_cuti` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `NIP` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `hari_tanggal_mulai_cuti` datetime NOT NULL,
  `hari_tanggal_selesai_cuti` datetime NOT NULL,
  `status_cuti` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tgaji`
--

CREATE TABLE `tgaji` (
  `id_gaji` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `NIP` int(11) NOT NULL,
  `nominal_gaji_pokok` varchar(12) NOT NULL,
  `nominal_gaji_bonus` varchar(12) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `hari_tanggal_input_gaji` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tlog`
--

CREATE TABLE `tlog` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tpengumuman`
--

CREATE TABLE `tpengumuman` (
  `id_pengumuman` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `isi_pengumuman` varchar(500) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tuser`
--

CREATE TABLE `tuser` (
  `id_user` int(11) NOT NULL,
  `NIP` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(30) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `TTL` datetime NOT NULL,
  `pendidikan_terakhir` varchar(30) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabsensi`
--
ALTER TABLE `tabsensi`
  ADD PRIMARY KEY (`id_absensi`);

--
-- Indexes for table `tcuti`
--
ALTER TABLE `tcuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indexes for table `tgaji`
--
ALTER TABLE `tgaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indexes for table `tlog`
--
ALTER TABLE `tlog`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `tpengumuman`
--
ALTER TABLE `tpengumuman`
  ADD PRIMARY KEY (`id_pengumuman`);

--
-- Indexes for table `tuser`
--
ALTER TABLE `tuser`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabsensi`
--
ALTER TABLE `tabsensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tcuti`
--
ALTER TABLE `tcuti`
  MODIFY `id_cuti` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tgaji`
--
ALTER TABLE `tgaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tlog`
--
ALTER TABLE `tlog`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tpengumuman`
--
ALTER TABLE `tpengumuman`
  MODIFY `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tuser`
--
ALTER TABLE `tuser`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tcuti`
--
ALTER TABLE `tcuti`
  ADD CONSTRAINT `tcuti_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tuser` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
