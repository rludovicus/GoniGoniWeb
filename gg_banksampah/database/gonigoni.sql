-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 08:08 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gonigoni`
--

-- --------------------------------------------------------

--
-- Table structure for table `banksampah`
--

CREATE TABLE `banksampah` (
  `id_banksampah` varchar(10) NOT NULL,
  `id_induk` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_banksampah` varchar(100) NOT NULL,
  `alamat_banksampah` text NOT NULL,
  `longitude` varchar(500) NOT NULL,
  `latitude` varchar(500) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `join`
--

CREATE TABLE `join` (
  `id_banksampah` varchar(10) NOT NULL,
  `id_nasabah` varchar(10) NOT NULL,
  `tanggal_join` date NOT NULL,
  `tanggal_out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategorisampah`
--

CREATE TABLE `kategorisampah` (
  `id_kategorisampah` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga_atas` int(11) NOT NULL,
  `harga_bawah` int(11) NOT NULL,
  `deskripsi_kat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klaim`
--

CREATE TABLE `klaim` (
  `id_banksampah` varchar(10) NOT NULL,
  `id_kategorisampah` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id_nasabah` varchar(10) NOT NULL,
  `nama_nasabah` int(11) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `longitude` varchar(500) NOT NULL,
  `latitude` varchar(500) NOT NULL,
  `alamat` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sampahkeluar`
--

CREATE TABLE `sampahkeluar` (
  `id_sampahkeluar` varchar(10) NOT NULL,
  `id_banksampah` varchar(10) NOT NULL,
  `tgl_sampahkeluar` date NOT NULL,
  `berat_sampahkeluar` int(11) NOT NULL,
  `total_harga_sampahkeluar` int(11) NOT NULL,
  `keterangan_sampahkeluar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sampahkeluar_detail`
--

CREATE TABLE `sampahkeluar_detail` (
  `id_sampahkeluar` varchar(10) NOT NULL,
  `id_kategorisampah` varchar(10) NOT NULL,
  `berat/kilogram` int(11) NOT NULL,
  `sub_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setoran`
--

CREATE TABLE `setoran` (
  `id_setoran` varchar(10) NOT NULL,
  `id_banksampah` varchar(10) NOT NULL,
  `tgl_setorin` date NOT NULL,
  `tgl_setordone` date NOT NULL,
  `berat_setoran` int(11) NOT NULL,
  `total_harga_setoran` int(11) NOT NULL,
  `status_setoran` varchar(15) NOT NULL,
  `keterangan_setoran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setoran_detail`
--

CREATE TABLE `setoran_detail` (
  `id_setoran` varchar(10) NOT NULL,
  `id_kategorisampah` varchar(10) NOT NULL,
  `berat/kg` int(11) NOT NULL,
  `sub_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksikeluar`
--

CREATE TABLE `transaksikeluar` (
  `id_transaksikeluar` varchar(10) NOT NULL,
  `kode_transaksi` varchar(10) NOT NULL,
  `tgl_transaksikeluar` date NOT NULL,
  `id_banksampah` varchar(10) NOT NULL,
  `destination` varchar(20) NOT NULL,
  `jumlah_transaksikeluar` int(11) NOT NULL,
  `keterangan_transaksikeluar` text NOT NULL,
  `status_transaksikeluar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksimasuk`
--

CREATE TABLE `transaksimasuk` (
  `id_transaksimasuk` varchar(10) NOT NULL,
  `kode_transaksi` varchar(10) NOT NULL,
  `tgl_transaksimasuk` date NOT NULL,
  `id_banksampah` varchar(10) NOT NULL,
  `origin` varchar(20) NOT NULL,
  `jumlah_transaksimasuk` int(11) NOT NULL,
  `keterangan_transaksimasuk` text NOT NULL,
  `status_transaksimasuk` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banksampah`
--
ALTER TABLE `banksampah`
  ADD PRIMARY KEY (`id_banksampah`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_induk` (`id_induk`);

--
-- Indexes for table `join`
--
ALTER TABLE `join`
  ADD KEY `id_banksampah` (`id_banksampah`),
  ADD KEY `id_nasabah` (`id_nasabah`);

--
-- Indexes for table `kategorisampah`
--
ALTER TABLE `kategorisampah`
  ADD PRIMARY KEY (`id_kategorisampah`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`);

--
-- Indexes for table `sampahkeluar`
--
ALTER TABLE `sampahkeluar`
  ADD PRIMARY KEY (`id_sampahkeluar`),
  ADD KEY `id_banksampah` (`id_banksampah`);

--
-- Indexes for table `setoran`
--
ALTER TABLE `setoran`
  ADD PRIMARY KEY (`id_setoran`),
  ADD KEY `id_banksampah` (`id_banksampah`);

--
-- Indexes for table `setoran_detail`
--
ALTER TABLE `setoran_detail`
  ADD KEY `id_setoran` (`id_setoran`),
  ADD KEY `id_kategorisampah` (`id_kategorisampah`);

--
-- Indexes for table `transaksikeluar`
--
ALTER TABLE `transaksikeluar`
  ADD PRIMARY KEY (`id_transaksikeluar`),
  ADD KEY `id_banksampah` (`id_banksampah`);

--
-- Indexes for table `transaksimasuk`
--
ALTER TABLE `transaksimasuk`
  ADD PRIMARY KEY (`id_transaksimasuk`),
  ADD KEY `id_banksampah` (`id_banksampah`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banksampah`
--
ALTER TABLE `banksampah`
  ADD CONSTRAINT `banksampah_ibfk_1` FOREIGN KEY (`id_induk`) REFERENCES `banksampah` (`id_banksampah`);

--
-- Constraints for table `join`
--
ALTER TABLE `join`
  ADD CONSTRAINT `join_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`),
  ADD CONSTRAINT `join_ibfk_2` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`);

--
-- Constraints for table `sampahkeluar`
--
ALTER TABLE `sampahkeluar`
  ADD CONSTRAINT `sampahkeluar_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`);

--
-- Constraints for table `setoran`
--
ALTER TABLE `setoran`
  ADD CONSTRAINT `setoran_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`);

--
-- Constraints for table `setoran_detail`
--
ALTER TABLE `setoran_detail`
  ADD CONSTRAINT `setoran_detail_ibfk_1` FOREIGN KEY (`id_setoran`) REFERENCES `setoran` (`id_setoran`),
  ADD CONSTRAINT `setoran_detail_ibfk_2` FOREIGN KEY (`id_kategorisampah`) REFERENCES `kategorisampah` (`id_kategorisampah`);

--
-- Constraints for table `transaksikeluar`
--
ALTER TABLE `transaksikeluar`
  ADD CONSTRAINT `transaksikeluar_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`);

--
-- Constraints for table `transaksimasuk`
--
ALTER TABLE `transaksimasuk`
  ADD CONSTRAINT `transaksimasuk_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
