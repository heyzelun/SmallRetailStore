-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 03:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smallretailstore`
--
CREATE DATABASE IF NOT EXISTS `smallretailstore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `smallretailstore`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `cus_id` varchar(45) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cus_id`, `firstname`, `lastname`, `email`, `phone`) VALUES
('C111', 'Randy', 'Barbie', 'babrbieako@gmail.com', '123456'),
('C222', 'Juswa', 'Malupiton', 'juswaa@gmail.com', '352354'),
('C333', 'JC', 'Boni', 'boniahh@gmail.com', '2143869'),
('C444', 'Boni', 'Maloi', 'binii@gmail.com', '2104863'),
('C555', 'Mikha', 'Binene', 'mikahh@gmail.com', '2541507');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `ord_id` varchar(45) DEFAULT NULL,
  `prod_id` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`ord_id`, `prod_id`, `quantity`) VALUES
('O1', 'P1', '2'),
('O2', 'P2', '2'),
('O3', 'P3', '5'),
('O4', 'P4', '7'),
('05', 'P5', '2');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ord_id` varchar(45) NOT NULL,
  `cus_id` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ord_id`, `cus_id`, `quantity`) VALUES
('O1', 'C111', '2'),
('O2', 'C222', '2'),
('O3', 'C333', '5'),
('O4', 'C444', '7'),
('O5', 'C555', '2');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `prod_id` varchar(45) NOT NULL,
  `ProdName` varchar(45) DEFAULT NULL,
  `Price` varchar(45) DEFAULT NULL,
  `Stock_quantity` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `ProdName`, `Price`, `Stock_quantity`) VALUES
('P1', 'Laptop', '999.99', '10'),
('P2', 'Smartphone', '499.99', '20'),
('P3', 'Tablet', '299.99', '15'),
('P4', 'Headphones', '99.99', '30'),
('P5', 'Charger', '19.99', '50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD KEY `fk_orderdetails_products` (`prod_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ord_id`),
  ADD KEY `fk_orders_customers` (`cus_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `fk_orderdetails_products` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
