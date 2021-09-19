-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2021 at 06:00 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE `bid` (
  `Bid_id` varchar(10) NOT NULL,
  `Last_bid` int(50) NOT NULL,
  `Bid_amount` int(50) NOT NULL,
  `another_bid` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `car_upload`
--

CREATE TABLE `car_upload` (
  `car_model` varchar(50) NOT NULL,
  `used_time` int(50) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `next_bid`
--

CREATE TABLE `next_bid` (
  `Bid_id` varchar(10) NOT NULL,
  `Bid_amount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `name` varchar(50) NOT NULL,
  `asking_amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sign_up`
--

CREATE TABLE `sign_up` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`Bid_id`),
  ADD KEY `another_bid` (`another_bid`),
  ADD KEY `Last_bid` (`Last_bid`);

--
-- Indexes for table `car_upload`
--
ALTER TABLE `car_upload`
  ADD KEY `price` (`price`);

--
-- Indexes for table `next_bid`
--
ALTER TABLE `next_bid`
  ADD PRIMARY KEY (`Bid_amount`),
  ADD KEY `Bid_id` (`Bid_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`asking_amount`);

--
-- Indexes for table `sign_up`
--
ALTER TABLE `sign_up`
  ADD PRIMARY KEY (`name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`another_bid`) REFERENCES `next_bid` (`Bid_amount`),
  ADD CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`Last_bid`) REFERENCES `seller` (`asking_amount`);

--
-- Constraints for table `car_upload`
--
ALTER TABLE `car_upload`
  ADD CONSTRAINT `car_upload_ibfk_1` FOREIGN KEY (`price`) REFERENCES `seller` (`asking_amount`);

--
-- Constraints for table `next_bid`
--
ALTER TABLE `next_bid`
  ADD CONSTRAINT `next_bid_ibfk_1` FOREIGN KEY (`Bid_id`) REFERENCES `bid` (`Bid_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
