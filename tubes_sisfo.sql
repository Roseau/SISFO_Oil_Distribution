-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2014 at 02:23 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tubes_sisfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `id_barang` varchar(5) NOT NULL,
  `jenis_barang` varchar(20) NOT NULL,
  `stok` int(10) NOT NULL,
  `harga` int(10) NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE IF NOT EXISTS `kendaraan` (
  `id_kendaraan` varchar(5) NOT NULL,
  `jenis_kendaraan` varchar(20) NOT NULL,
  `kapasitas` int(10) NOT NULL,
  `biaya_perawatan` int(10) NOT NULL,
  PRIMARY KEY (`id_kendaraan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE IF NOT EXISTS `pegawai` (
  `id_pegawai` varchar(5) NOT NULL,
  `nama_pegawai` varchar(20) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `ttl` date NOT NULL,
  `jenis_k` varchar(10) NOT NULL,
  `gaji_pegawai` int(11) NOT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` varchar(5) NOT NULL,
  `nama_cabang` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `stok` int(10) NOT NULL,
  `mulai_kontrak` date NOT NULL,
  `selesai_kontrak` date NOT NULL,
  `jumlah_kontrak` int(11) NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE IF NOT EXISTS `pengiriman` (
  `id_pengiriman` varchar(5) DEFAULT NULL,
  `id_kendaraan` varchar(5) DEFAULT NULL,
  `id_pegawai` varchar(5) DEFAULT NULL,
  `id_pelanggan` varchar(5) DEFAULT NULL,
  `jadwal_berangkat` date DEFAULT NULL,
  `jadwal_sampai` date DEFAULT NULL,
  `waktu_berangkat` date DEFAULT NULL,
  `waktu_sampai` date DEFAULT NULL,
  `stok_berangkat` int(10) DEFAULT NULL,
  `biaya_pengiriman` int(15) DEFAULT NULL,
  KEY `id_kendaraan` (`id_kendaraan`),
  KEY `id_pelanggan` (`id_pelanggan`),
  KEY `id_pegawai` (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pusat`
--

CREATE TABLE IF NOT EXISTS `pusat` (
  `id_pusat` varchar(5) NOT NULL DEFAULT '',
  `nama_pusat` varchar(20) DEFAULT NULL,
  `alamat_pusat` varchar(50) DEFAULT NULL,
  `stok_pusat` int(10) DEFAULT NULL,
  `id_kendaraan` varchar(5) DEFAULT NULL,
  `id_pelanggan` varchar(5) DEFAULT NULL,
  `id_pegawai` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_pusat`),
  KEY `id_kendaraan` (`id_kendaraan`),
  KEY `id_pelanggan` (`id_pelanggan`),
  KEY `id_pegawai` (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengiriman_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengiriman_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pusat`
--
ALTER TABLE `pusat`
  ADD CONSTRAINT `pusat_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pusat_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pusat_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
