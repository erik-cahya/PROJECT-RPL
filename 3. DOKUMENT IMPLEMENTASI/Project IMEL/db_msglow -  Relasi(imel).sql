-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 04:25 AM
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
-- Database: `db_msglow`
--

-- --------------------------------------------------------

--
-- Table structure for table `tdetiltransaksi`
--

CREATE TABLE `tdetiltransaksi` (
  `kode_detil_transaksi` int(11) NOT NULL,
  `kode_transaksi` int(11) NOT NULL,
  `nama_produk` varchar(30) NOT NULL,
  `kuantity` int(11) NOT NULL,
  `harga_produk` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tpembayaran`
--

CREATE TABLE `tpembayaran` (
  `kode_pembayaran` int(11) NOT NULL,
  `kode_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `grand_total` varchar(12) NOT NULL,
  `bukti_pembayaran` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tproduk`
--

CREATE TABLE `tproduk` (
  `kode_produk` int(11) NOT NULL,
  `nama_produk` varchar(30) NOT NULL,
  `deskripsi_produk` varchar(100) NOT NULL,
  `harga_produk` varchar(12) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `review_produk` varchar(100) NOT NULL,
  `foto_produk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ttransaksi`
--

CREATE TABLE `ttransaksi` (
  `kode_transaksi` int(11) NOT NULL,
  `kode_user` int(11) NOT NULL,
  `kuantity` int(11) NOT NULL,
  `grand_total` varchar(12) NOT NULL,
  `tgl_transaksi` int(11) NOT NULL,
  `no_resi` varchar(12) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tuser`
--

CREATE TABLE `tuser` (
  `kode_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `nama_lengkap` varchar(80) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `pendidikan_terakhir` varchar(30) NOT NULL,
  `level_user` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tdetiltransaksi`
--
ALTER TABLE `tdetiltransaksi`
  ADD PRIMARY KEY (`kode_detil_transaksi`),
  ADD KEY `tdetiltransaksi_FK` (`kode_transaksi`);

--
-- Indexes for table `tpembayaran`
--
ALTER TABLE `tpembayaran`
  ADD PRIMARY KEY (`kode_pembayaran`),
  ADD KEY `tpembayaran_FK` (`kode_transaksi`);

--
-- Indexes for table `tproduk`
--
ALTER TABLE `tproduk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- Indexes for table `ttransaksi`
--
ALTER TABLE `ttransaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `ttransaksi_FK` (`kode_user`);

--
-- Indexes for table `tuser`
--
ALTER TABLE `tuser`
  ADD PRIMARY KEY (`kode_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tdetiltransaksi`
--
ALTER TABLE `tdetiltransaksi`
  MODIFY `kode_detil_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tpembayaran`
--
ALTER TABLE `tpembayaran`
  MODIFY `kode_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tproduk`
--
ALTER TABLE `tproduk`
  MODIFY `kode_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ttransaksi`
--
ALTER TABLE `ttransaksi`
  MODIFY `kode_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tuser`
--
ALTER TABLE `tuser`
  MODIFY `kode_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tdetiltransaksi`
--
ALTER TABLE `tdetiltransaksi`
  ADD CONSTRAINT `tdetiltransaksi_FK` FOREIGN KEY (`kode_transaksi`) REFERENCES `ttransaksi` (`kode_transaksi`);

--
-- Constraints for table `tpembayaran`
--
ALTER TABLE `tpembayaran`
  ADD CONSTRAINT `tpembayaran_FK` FOREIGN KEY (`kode_transaksi`) REFERENCES `ttransaksi` (`kode_transaksi`);

--
-- Constraints for table `ttransaksi`
--
ALTER TABLE `ttransaksi`
  ADD CONSTRAINT `ttransaksi_FK` FOREIGN KEY (`kode_user`) REFERENCES `tuser` (`kode_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
