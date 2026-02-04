-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2023 at 03:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electricity`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` varchar(50) NOT NULL,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `adminName`, `password`) VALUES
('admin1', 'HlaingMyatMon', 'admin123'),
('admin2', 'MonMyatTheinGi', 'admin123'),
('admin3', 'KhaingZinThant', 'admin123'),
('admin4', 'ZweHtetNaing', 'admin123'),
('admin5', 'KyawLinnHtet', 'admin123'),
('admin6', 'YeYintAung', 'admin123'),
('admin7', 'ArkarKyawThu', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bmeterno` varchar(100) NOT NULL,
  `Bmonth` varchar(100) NOT NULL,
  `Byear` varchar(100) NOT NULL,
  `Bunit` varchar(100) NOT NULL,
  `Btotal_bill` varchar(100) NOT NULL,
  `Bstatus` varchar(100) NOT NULL,
  `Bdate` date NOT NULL,
  `Blastdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bmeterno`, `Bmonth`, `Byear`, `Bunit`, `Btotal_bill`, `Bstatus`, `Bdate`, `Blastdate`) VALUES
('1012786088', 'Jun', '2023', '49', '2000', 'Paid', '2023-07-03', '2023-07-11'),
('1029638206', 'Jun', '2023', '75', '3800', 'Paid', '2023-07-03', '2023-07-11'),
('1110341232', 'Jun', '2023', '110', '7150', 'Paid', '2023-07-03', '2023-07-11'),
('1078912345', 'Jun', '2023', '111', '7260', 'Paid', '2023-07-03', '2023-07-11'),
('1012345678', 'Jun', '2023', '68', '3310', 'Paid', '2023-07-03', '2023-07-11'),
('1098765432', 'Jun', '2023', '131', '9460', 'Paid', '2023-07-03', '2023-07-11'),
('1012786088', 'July', '2023', '117', '7920', 'Paid', '2023-08-04', '2023-08-12'),
('1029638206', 'July', '2023', '84', '4610', 'Paid', '2023-08-04', '2023-08-12'),
('1110341232', 'July', '2023', '96', '5690', 'Paid', '2023-08-04', '2023-08-12'),
('1078912345', 'July', '2023', '92', '5330', 'Paid', '2023-08-04', '2023-08-12'),
('1012345678', 'July', '2023', '126', '8910', 'Paid', '2023-08-04', '2023-08-12'),
('1098765432', 'July', '2023', '75', '3800', 'Paid', '2023-08-04', '2023-08-12'),
('1012786088', 'August', '2023', '90', '5150', 'Unpaid', '2023-09-02', '2023-09-10'),
('1029638206', 'August', '2023', '125', '8800', 'Paid', '2023-09-02', '2023-09-10'),
('1110341232', 'August', '2023', '120', '8250', 'Unpaid', '2023-09-02', '2023-09-10'),
('1078912345', 'August', '2023', '119', '8140', 'Unpaid', '2023-09-02', '2023-09-10'),
('1012345678', 'August', '2023', '79', '4160', 'Unpaid', '2023-09-02', '2023-09-10'),
('1098765432', 'August', '2023', '88', '4970', 'Unpaid', '2023-09-02', '2023-09-10'),
('1088776655', 'Jun', '2023', '100', '6050', 'unpaid', '2023-07-02', '2023-09-12');

-- --------------------------------------------------------

--
-- Table structure for table `meterinfo`
--

CREATE TABLE `meterinfo` (
  `meterNo` varchar(100) NOT NULL,
  `ownerName` varchar(100) NOT NULL,
  `meterType` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meterinfo`
--

INSERT INTO `meterinfo` (`meterNo`, `ownerName`, `meterType`, `address`, `city`) VALUES
('1012345678', 'Daw Moe Thazin', 'home', 'Na Wa Day', 'Pyay'),
('1012786088', 'Daw Aye Myint', 'home', 'AungSan', 'Pyay'),
('1029638206', 'U Myint Aye', 'home', 'ManAaungPauk', 'Pyay'),
('1078912345', 'DoctorUTinAye', 'home', 'Aung San', 'Pyay'),
('1098765432', 'U Thiha', 'home', 'ShweTaChaung', 'Pyay');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userName`, `password`, `email`, `phoneNo`, `address`) VALUES
('s1', 'ArkarKyawThu', '232487', 'arkarGyi@gmail.com', '09683969002', 'Pyay'),
('s10', 'YeYintAung', 'yint123', 'YeYintAung123@gmail.com', '09665432146', 'Pyay'),
('s11', 'Ma Aye', 'ayeaye123', 'ayeaye123@gmail.com', '0966723456', 'pyay'),
('s2', 'KoKyawGyi', 'kyawgyi123', 'KoKyawGyi123@gmail.com', '09683969002', 'Pyay'),
('s3', 'LoneLay', 'Lone@123', 'Lone@gmail.com', '09666434922', 'Pyay'),
('s4', 'KoKoLay', 'KoLay#888', 'KoLay3@gmail.com', '09683244677', 'Pyay'),
('s5', 'Ingyin', 'Inn00&2', 'GyiGyi22@gmail.com', '09791528955', 'Pyay'),
('s6', 'Khaing Zin', 'ZinZin334', 'Khaingzz1@gmail.com', '09250406688', 'Pyay'),
('s7', 'ZweHtet', '12345678', 'Zwe23@gmail.com', '09260252534', 'Pyay'),
('s8', 'KoGyiKyaw', 'KoKyaw115', 'GyiGyi885@gmail.com', '09987746753', 'Pyay'),
('s9', 'ChitTone', '154154', 'Khinswekyaw9@gmail.com', '09698147391', 'InnMa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
