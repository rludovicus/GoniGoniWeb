-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2019 at 10:23 AM
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
-- Database: `gogon`
--

-- --------------------------------------------------------

--
-- Table structure for table `banksampah`
--

CREATE TABLE `banksampah` (
  `id_banksampah` int(11) NOT NULL,
  `id_induk` int(11) DEFAULT NULL,
  `nomor_wallet` varchar(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama_banksampah` varchar(100) NOT NULL,
  `nohp_banksampah` varchar(13) NOT NULL,
  `email_banksampah` varchar(100) NOT NULL,
  `alamat_banksampah` text NOT NULL,
  `longitude` varchar(500) NOT NULL,
  `latitude` varchar(500) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banksampah`
--

INSERT INTO `banksampah` (`id_banksampah`, `id_induk`, `nomor_wallet`, `username`, `password`, `nama_banksampah`, `nohp_banksampah`, `email_banksampah`, `alamat_banksampah`, `longitude`, `latitude`, `status`) VALUES
(12, NULL, '5214696930', 'bersinar', '664ca252f08d1b868670f5a2ffb8a93b', 'Bersinar', '082273696930', 'fi@a.com', 'Jl.Dakol', '0', '0', 'baru'),
(13, NULL, '2355567885', 'adf', '664ca252f08d1b868670f5a2ffb8a93b', 'Berseri', '082273567885', 'f@l.com', 'Jl.Dakel', '0', '0', 'baru');

-- --------------------------------------------------------

--
-- Table structure for table `goniwallet`
--

CREATE TABLE `goniwallet` (
  `nomor_wallet` varchar(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  `limit_wallet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goniwallet`
--

INSERT INTO `goniwallet` (`nomor_wallet`, `saldo`, `limit_wallet`) VALUES
('0987654321', 0, 10000000),
('1234567890', 0, 10000000),
('2355567885', 0, 10000000),
('5214696930', 0, 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `join_akun`
--

CREATE TABLE `join_akun` (
  `id_joins` int(11) NOT NULL,
  `id_banksampah` int(11) NOT NULL,
  `id_nasabah` int(11) NOT NULL,
  `tanggal_join` date NOT NULL,
  `tanggal_out` date NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `join_akun`
--

INSERT INTO `join_akun` (`id_joins`, `id_banksampah`, `id_nasabah`, `tanggal_join`, `tanggal_out`, `status`) VALUES
(1, 12, 1, '2019-05-02', '0000-00-00', 'aktif'),
(2, 12, 2, '2019-05-03', '0000-00-00', 'aktif'),
(3, 13, 2, '2019-05-17', '0000-00-00', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `kategorisampah`
--

CREATE TABLE `kategorisampah` (
  `id_kategorisampah` varchar(20) NOT NULL,
  `id_banksampah` int(11) NOT NULL,
  `golongan` varchar(20) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `harga_atas` int(11) NOT NULL,
  `harga_bawah` int(11) NOT NULL,
  `deskripsi_kat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategorisampah`
--

INSERT INTO `kategorisampah` (`id_kategorisampah`, `id_banksampah`, `golongan`, `jenis`, `harga`, `harga_atas`, `harga_bawah`, `deskripsi_kat`) VALUES
('P01', 12, 'anorganik', 'Plastik Galon', 500, 0, 0, ''),
('P00', 12, 'anorganik', 'Plastik Aqua dan Ale', 100, 0, 0, '   '),
('P02', 12, 'anorganik', 'Emberan', 1500, 0, 0, ''),
('C00', 12, 'lainnya', 'campuran plastik', 500, 0, 0, ''),
('B00', 12, 'anorganik', 'Besi', 1000, 0, 0, ''),
('P03', 12, 'anorganik', 'Leher Aqua', 300, 0, 0, ''),
('C13', 12, 'lainnya', 'Campuran semua', 100, 0, 0, ''),
('P04', 12, 'anorganik', 'Kresekan', 300, 0, 0, ''),
('P05', 12, 'anorganik', 'Kresek Hitam', 500, 0, 0, ''),
('B01', 12, 'anorganik', 'Besi Tembaga', 1000, 0, 0, ''),
('P06', 12, 'anorganik', 'Plastik HDPE', 1500, 0, 0, 'Botol sahmpoo dan sabun'),
('P00', 13, 'anorganik', 'Plastik Aqua', 100, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `kodetransaksi`
--

CREATE TABLE `kodetransaksi` (
  `kode_transaksi` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id_nasabah` int(11) NOT NULL,
  `nomor_wallet` varchar(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama_nasabah` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `nohp_nasabah` varchar(12) NOT NULL,
  `email_nasabah` varchar(100) NOT NULL,
  `alamat_nasabah` text NOT NULL,
  `longitude` varchar(500) NOT NULL,
  `latitude` varchar(500) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id_nasabah`, `nomor_wallet`, `username`, `password`, `nama_nasabah`, `jenis_kelamin`, `nohp_nasabah`, `email_nasabah`, `alamat_nasabah`, `longitude`, `latitude`, `status`) VALUES
(1, '1234567890', 'fmn', '123', 'Firza Maulan', 'Pria', '082273696940', 'f@g.com', 'Jln. Dayuh', '0', '0', 'Baru'),
(2, '0987654321', 'rdh', '123', 'Rayan Kadek', 'Wanita', '082273696931', 'a@c.cpm', 'Jln.Kolot', '0', '0', 'Baru');

-- --------------------------------------------------------

--
-- Table structure for table `sampahkeluar`
--

CREATE TABLE `sampahkeluar` (
  `id_sampahkeluar` int(11) NOT NULL,
  `id_banksampah` int(11) NOT NULL,
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
  `id_sampahkeluar` int(11) NOT NULL,
  `id_kategorisampah` varchar(10) NOT NULL,
  `berat/kilogram` int(11) NOT NULL,
  `sub_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sampah_mutasi`
--

CREATE TABLE `sampah_mutasi` (
  `id_mutasi` int(11) NOT NULL,
  `id_katsebelum` varchar(10) NOT NULL,
  `id_katmutasi` varchar(10) NOT NULL,
  `berat/kg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setoran`
--

CREATE TABLE `setoran` (
  `id_setoran` varchar(20) NOT NULL,
  `jenis_setoran` varchar(10) NOT NULL,
  `id_banksampah` int(11) NOT NULL,
  `id_nasabah` int(11) DEFAULT NULL,
  `total_berat` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `tgl_setorin` date NOT NULL,
  `tgl_setordone` date NOT NULL,
  `status_setoran` varchar(15) NOT NULL,
  `keterangan_setoran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setoran`
--

INSERT INTO `setoran` (`id_setoran`, `jenis_setoran`, `id_banksampah`, `id_nasabah`, `total_berat`, `total_harga`, `tgl_setorin`, `tgl_setordone`, `status_setoran`, `keterangan_setoran`) VALUES
('S-06457', 'beli', 12, 2, 1, 300, '2019-05-01', '0000-00-00', 'diproses', ''),
('S-26510', 'hibah', 12, 2, 12, 0, '2019-05-01', '0000-00-00', 'selesai', 'sebagai dana sosial'),
('S-50325', 'hibah', 12, NULL, 10, 0, '2019-05-01', '0000-00-00', 'selesai', 'Hibah YPT'),
('S-57788', 'beli', 12, 1, 7, 10500, '2019-05-01', '0000-00-00', 'diproses', ''),
('S-69333', 'beli', 12, 1, 11, 5500, '2019-05-01', '0000-00-00', 'diproses', '');

-- --------------------------------------------------------

--
-- Table structure for table `setoran_detail`
--

CREATE TABLE `setoran_detail` (
  `id_setoran` varchar(20) NOT NULL,
  `id_kategorisampah` varchar(10) NOT NULL,
  `berat/kg` int(11) NOT NULL,
  `sub_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setoran_detail`
--

INSERT INTO `setoran_detail` (`id_setoran`, `id_kategorisampah`, `berat/kg`, `sub_harga`) VALUES
('S-50325', 'P01', 10, 0),
('S-06457', 'P04', 1, 300),
('S-57788', 'P02', 7, 10500),
('S-69333', 'C00', 1, 500),
('S-69333', 'P01', 10, 5000),
('S-26510', 'P02', 10, 0),
('S-26510', 'P06', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksikeluar`
--

CREATE TABLE `transaksikeluar` (
  `id_transaksikeluar` varchar(10) NOT NULL,
  `kode_transaksi` varchar(10) NOT NULL,
  `tgl_transaksikeluar` date NOT NULL,
  `nomor_wallet` varchar(11) NOT NULL,
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
  `nomor_wallet` varchar(11) NOT NULL,
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
  ADD UNIQUE KEY `nohp_banksampah` (`nohp_banksampah`),
  ADD KEY `banksampah_ibfk_2` (`nomor_wallet`),
  ADD KEY `banksampah_ibfk_3` (`id_induk`);

--
-- Indexes for table `goniwallet`
--
ALTER TABLE `goniwallet`
  ADD PRIMARY KEY (`nomor_wallet`);

--
-- Indexes for table `join_akun`
--
ALTER TABLE `join_akun`
  ADD PRIMARY KEY (`id_joins`),
  ADD KEY `id_banksampah` (`id_banksampah`),
  ADD KEY `id_nasabah` (`id_nasabah`);

--
-- Indexes for table `kategorisampah`
--
ALTER TABLE `kategorisampah`
  ADD KEY `id_banksampah` (`id_banksampah`);

--
-- Indexes for table `kodetransaksi`
--
ALTER TABLE `kodetransaksi`
  ADD PRIMARY KEY (`kode_transaksi`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `nomor_wallet` (`nomor_wallet`);

--
-- Indexes for table `sampahkeluar`
--
ALTER TABLE `sampahkeluar`
  ADD PRIMARY KEY (`id_sampahkeluar`),
  ADD KEY `id_banksampah` (`id_banksampah`);

--
-- Indexes for table `sampahkeluar_detail`
--
ALTER TABLE `sampahkeluar_detail`
  ADD KEY `id_sampahkeluar` (`id_sampahkeluar`);

--
-- Indexes for table `sampah_mutasi`
--
ALTER TABLE `sampah_mutasi`
  ADD PRIMARY KEY (`id_mutasi`);

--
-- Indexes for table `setoran`
--
ALTER TABLE `setoran`
  ADD PRIMARY KEY (`id_setoran`),
  ADD KEY `id_banksampah` (`id_banksampah`),
  ADD KEY `id_nasabah` (`id_nasabah`);

--
-- Indexes for table `setoran_detail`
--
ALTER TABLE `setoran_detail`
  ADD KEY `id_setoran` (`id_setoran`);

--
-- Indexes for table `transaksikeluar`
--
ALTER TABLE `transaksikeluar`
  ADD PRIMARY KEY (`id_transaksikeluar`),
  ADD KEY `nomor_wallet` (`nomor_wallet`),
  ADD KEY `kode_transaksi` (`kode_transaksi`);

--
-- Indexes for table `transaksimasuk`
--
ALTER TABLE `transaksimasuk`
  ADD PRIMARY KEY (`id_transaksimasuk`),
  ADD KEY `nomor_wallet` (`nomor_wallet`),
  ADD KEY `kode_transaksi` (`kode_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banksampah`
--
ALTER TABLE `banksampah`
  MODIFY `id_banksampah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `join_akun`
--
ALTER TABLE `join_akun`
  MODIFY `id_joins` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id_nasabah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sampahkeluar`
--
ALTER TABLE `sampahkeluar`
  MODIFY `id_sampahkeluar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sampah_mutasi`
--
ALTER TABLE `sampah_mutasi`
  MODIFY `id_mutasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banksampah`
--
ALTER TABLE `banksampah`
  ADD CONSTRAINT `banksampah_ibfk_2` FOREIGN KEY (`nomor_wallet`) REFERENCES `goniwallet` (`nomor_wallet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banksampah_ibfk_3` FOREIGN KEY (`id_induk`) REFERENCES `banksampah` (`id_banksampah`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `join_akun`
--
ALTER TABLE `join_akun`
  ADD CONSTRAINT `join_akun_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`),
  ADD CONSTRAINT `join_akun_ibfk_2` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`);

--
-- Constraints for table `kategorisampah`
--
ALTER TABLE `kategorisampah`
  ADD CONSTRAINT `kategorisampah_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`);

--
-- Constraints for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD CONSTRAINT `nasabah_ibfk_1` FOREIGN KEY (`nomor_wallet`) REFERENCES `goniwallet` (`nomor_wallet`);

--
-- Constraints for table `sampahkeluar`
--
ALTER TABLE `sampahkeluar`
  ADD CONSTRAINT `sampahkeluar_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`);

--
-- Constraints for table `sampahkeluar_detail`
--
ALTER TABLE `sampahkeluar_detail`
  ADD CONSTRAINT `sampahkeluar_detail_ibfk_2` FOREIGN KEY (`id_sampahkeluar`) REFERENCES `sampahkeluar` (`id_sampahkeluar`);

--
-- Constraints for table `setoran`
--
ALTER TABLE `setoran`
  ADD CONSTRAINT `setoran_ibfk_1` FOREIGN KEY (`id_banksampah`) REFERENCES `banksampah` (`id_banksampah`),
  ADD CONSTRAINT `setoran_ibfk_2` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`);

--
-- Constraints for table `setoran_detail`
--
ALTER TABLE `setoran_detail`
  ADD CONSTRAINT `setoran_detail_ibfk_1` FOREIGN KEY (`id_setoran`) REFERENCES `setoran` (`id_setoran`);

--
-- Constraints for table `transaksikeluar`
--
ALTER TABLE `transaksikeluar`
  ADD CONSTRAINT `transaksikeluar_ibfk_1` FOREIGN KEY (`nomor_wallet`) REFERENCES `goniwallet` (`nomor_wallet`),
  ADD CONSTRAINT `transaksikeluar_ibfk_2` FOREIGN KEY (`kode_transaksi`) REFERENCES `kodetransaksi` (`kode_transaksi`);

--
-- Constraints for table `transaksimasuk`
--
ALTER TABLE `transaksimasuk`
  ADD CONSTRAINT `transaksimasuk_ibfk_1` FOREIGN KEY (`nomor_wallet`) REFERENCES `goniwallet` (`nomor_wallet`),
  ADD CONSTRAINT `transaksimasuk_ibfk_2` FOREIGN KEY (`kode_transaksi`) REFERENCES `kodetransaksi` (`kode_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
