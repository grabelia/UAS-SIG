-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 12:03 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sigkab`
--

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id_kabupaten` int(11) NOT NULL,
  `kode_kabupaten` varchar(100) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `koordinat` varchar(100) NOT NULL,
  `jumlah_penduduk` int(11) NOT NULL,
  `luas_wilayah` float(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id_kabupaten`, `kode_kabupaten`, `nama_kabupaten`, `koordinat`, `jumlah_penduduk`, `luas_wilayah`) VALUES
(1, '3302', 'Banyumas', '-7.362274826893668, 109.10943969842893', 82317924, 17083020.00);

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `kode_kecamatan` varchar(100) NOT NULL,
  `id_kabupaten` int(11) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `jumlah_penduduk` int(11) NOT NULL,
  `luas_wilayah` float(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`kode_kecamatan`, `id_kabupaten`, `nama_kecamatan`, `jumlah_penduduk`, `luas_wilayah`) VALUES
('3302010', 1, 'LUMBIR', 50546, 10266.00),
('3302020', 1, 'WANGON', 84755, 6078.00),
('330220', 1, 'Kembaran', 82085, 25092.00),
('330223', 1, 'Kedung Banteng', 62422, 6022.00),
('3302710', 1, 'PURWOKERTO SELATAN', 74305, 13705.00),
('3302730', 1, 'PURWOKERTO TIMUR', 58451, 8402.00),
('3302740', 1, 'PURWOKERTO UTARA', 48264, 90139.00);

-- --------------------------------------------------------

--
-- Table structure for table `universitas`
--

CREATE TABLE `universitas` (
  `no_universitas` int(11) NOT NULL,
  `kode_kecamatan` varchar(100) NOT NULL,
  `nama_universitas` varchar(100) NOT NULL,
  `alamat_universitas` varchar(100) NOT NULL,
  `koordinat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `universitas`
--

INSERT INTO `universitas` (`no_universitas`, `kode_kecamatan`, `nama_universitas`, `alamat_universitas`, `koordinat`) VALUES
(623321, '3302740', 'Universitas Amikom Purwokerto', 'Jl. Letjend Pol. Soemarto No.127, Watumas, Purwanegara, Kec. Purwokerto Utara', '-7.4007407,109.2288476'),
(636751, '330220', 'Universitas Muhammadiyah Purwokerto', 'Jl. KH. Ahmad Dahlan, Dusun III, Dukuhwaluh, Kec. Kembaran', '-7.4123407,109.2691362'),
(641629, '3302710', 'Institut Teknologi Telkom Purwokerto', 'Jl. DI Panjaitan No.128, Karangreja, Purwokerto Kidul, Kec. Purwokerto Selatan', '-7.4352578,109.2465177'),
(642848, '3302740', 'Universitas BSI Kampus Purwokerto', 'Jalan HR. Bunyamin No.106, Sumampir Wetan, Pabuaran, Kec. Purwokerto Utara', '-7.3989684,109.2427203'),
(6439889, '330223', 'Universitas Wijayakusuma Purwokerto', 'Jl. Raya Beji Karangsalam No.25, Dusun III, Karangsalam Kidul, Kec. Kedungbanteng', '-7.4000647,109.2144959'),
(6841836, '3302710', 'Universitas Nahdlatul Ulama Purwokerto', 'Jl. Sultan Agung No.42, Windusara, Karangklesem, Kec. Purwokerto Selatan', '-7.4484976,109.2433876'),
(6843493, '330220', 'Universitas Harapan Bangsa Purwokerto', 'Jl. Raden Patah No.100, Kedunglongsir, Ledug, Kec. Kembaran', '-7.4352105,109.2368332');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id_kabupaten`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`kode_kecamatan`),
  ADD KEY `kecamatan_ibfk_1` (`id_kabupaten`);

--
-- Indexes for table `universitas`
--
ALTER TABLE `universitas`
  ADD PRIMARY KEY (`no_universitas`),
  ADD KEY `kode_kecamatan` (`kode_kecamatan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kabupaten`
--
ALTER TABLE `kabupaten`
  MODIFY `id_kabupaten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_2` FOREIGN KEY (`id_kabupaten`) REFERENCES `kabupaten` (`id_kabupaten`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `universitas`
--
ALTER TABLE `universitas`
  ADD CONSTRAINT `universitas_ibfk_2` FOREIGN KEY (`kode_kecamatan`) REFERENCES `kecamatan` (`kode_kecamatan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
