-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2021 at 03:59 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_member`
--

CREATE TABLE `tb_member` (
  `id_member` int(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `authors` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_member`
--

INSERT INTO `tb_member` (`id_member`, `username`, `password`, `name`, `lastname`, `address`, `tel`, `authors`) VALUES
(1, 'Sunan', '1234', 'สุนา', 'เมธา', '1447  Commerce Boulevard Lincoln', '081 551185', 'กันยา'),
(2, 'Ubon', '1234', 'อุบล', 'บันนา', '3371  Douglas Dairy Road Meadowview', '662722892', 'Intira'),
(3, 'Kanya', '1234', 'กันยา', 'วัททนา', '4791  Kenwood Place Fort Lauderdale', '662221744', 'Florida'),
(4, 'Arun', '1234', 'อรุณ', 'พรทิพ', '2894  Godfrey Street Beaverton', '662326919', 'Kanchana'),
(5, 'Prasert', '1234', 'ประเสิฐ', 'อันติ', '944  Hershell Hollow Road Knoxville', '6623744019', 'Sakchai'),
(6, 'Klahan', '1234', 'กาน่า', 'ประเสริฐ', '1876  Owagner Lane VAN NUYS', '0812811988', 'Siriporn'),
(7, 'Ratree', '1234', 'ราตรี', 'มาลัย', '392  Cedar Street Pine Bluff', '6622245970', 'Preecha'),
(8, 'Kulap', '1234', 'กุลา', 'สมพร', '1811  Morgan Street BURGHILL', '6622358213', 'Sasithorn'),
(9, 'Suchart', '1234', 'สุชาติ', 'กุลยา', '2288  Ruckman Road Oklahoma City', '026621489 ', 'Pakpao'),
(10, 'Sukhon ', '1234', 'สุกร', 'ทักสิน', '2538  Kooter Lane Charlotte', '662 437144', 'Prasert');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id_member`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id_member` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
