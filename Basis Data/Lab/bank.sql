-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2023 at 08:07 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id_nasabah` int(11) NOT NULL,
  `nama_depan` varchar(255) NOT NULL,
  `nama_belakang` varchar(255) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `no_tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id_nasabah`, `nama_depan`, `nama_belakang`, `nik`, `tgl_lahir`, `pekerjaan`, `alamat`, `no_tlp`) VALUES
(1, 'John', 'Doe', '1234567890123456', '1990-01-01', 'Programmer', 'Jl. Jendral Sudirman No. 1, Jakarta', '081234567890'),
(2, 'Jane', 'Doe', '9876543210987654', '1992-02-02', 'Designer', 'Jl. Thamrin No. 2, Jakarta', '082123456789'),
(3, 'Adam', 'Smith', '8765432109876543', '1994-03-03', 'Sales', 'Jl. Merdeka No. 3, Jakarta', '083123456789'),
(4, 'Mike', 'Mondro', '897823456712845', '2000-11-15', 'Programmer', 'Jl.Otto Iskandar Dinata No 89', '081233445567');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `nik` varchar(16) NOT NULL,
  `no_tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `alamat`, `nik`, `no_tlp`) VALUES
(1, 'Agus', 'Jl. Jendral Sudirman No. 1, Jakarta', '1234567890123456', '081234567890'),
(2, 'Budi', 'Jl. Thamrin No. 2, Jakarta', '9876543210987654', '082123456789'),
(3, 'Cici', 'Jl. Merdeka No. 3, Jakarta', '8765432109876543', '083123456789');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `no_rekening` varchar(16) NOT NULL,
  `pin` varchar(4) NOT NULL,
  `id_nasabah` int(11) NOT NULL,
  `kantor_cabang` enum('Jakarta','Bandung','Surabaya','Semarang') NOT NULL,
  `jenis_rekening` enum('Giro','Tabungan') NOT NULL,
  `saldo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`no_rekening`, `pin`, `id_nasabah`, `kantor_cabang`, `jenis_rekening`, `saldo`) VALUES
('1234567890', '1234', 1, 'Jakarta', 'Giro', 1000000),
('8765432109', '9876', 3, 'Surabaya', 'Giro', 2000000),
('9876543210', '4321', 2, 'Bandung', 'Tabungan', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` varchar(16) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `id_nasabah` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `tgl_transaksi`, `id_nasabah`, `id_pegawai`) VALUES
('1234567890', '2023-08-01', 1, 1),
('8765432109', '2023-08-03', 3, 3),
('9876543210', '2023-08-02', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_dt` int(11) NOT NULL,
  `no_transaksi` varchar(16) NOT NULL,
  `rekening_sumber` varchar(16) NOT NULL,
  `rekening_tujuan` varchar(16) NOT NULL,
  `jenis_transaksi` enum('Setoran','Penarikan','Transfer') NOT NULL,
  `jumlah_transaksi` double NOT NULL,
  `status` enum('Pending','Success','Failed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_dt`, `no_transaksi`, `rekening_sumber`, `rekening_tujuan`, `jenis_transaksi`, `jumlah_transaksi`, `status`) VALUES
(1, '1234567890', '1234567890', '9876543210', 'Setoran', 100000, 'Success'),
(2, '9876543210', '9876543210', '8765432109', 'Penarikan', 50000, 'Pending'),
(3, '8765432109', '8765432109', '1234567890', 'Transfer', 200000, 'Success');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`no_rekening`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_dt`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id_nasabah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id_dt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
