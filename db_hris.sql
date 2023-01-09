-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2023 at 08:22 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hris`
--

-- --------------------------------------------------------

--
-- Table structure for table `customertransaction`
--

CREATE TABLE `customertransaction` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `add_info` text NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customertransaction`
--

INSERT INTO `customertransaction` (`id`, `first_name`, `last_name`, `company_name`, `address`, `email`, `phone`, `add_info`, `service_id`, `service_name`) VALUES
(14, 'EUN', 'JIN', 'EUN-JIN', '#123 Palma St. SING', 'eun.jin2@gmail.com', '0917652222', 'Test Data 2', 42, 'Computer wipes and Operating System reinstallation'),
(15, 'Harold', 'Sala', 'HS Merch and Jewelery', '#123 Bautista Street', 'hs.merchandjewelry@gmail.com', '639431234545', 'Test Data 2', 43, 'Install MsOffice / System Antivirus / Adobe Photos'),
(16, 'Fred', 'Lopez', 'Fred Lopez Company Group', '#333 Ferdinand St, Forbes Park, MM ', 'fred_Lopez444@gmail.com', '09177533422', 'Test Data 4', 46, 'Data Recovery');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `date_time`) VALUES
(3, 'Sample Dept', '2022-12-02 12:12:40'),
(4, 'Sample Dept 2', '2022-12-02 12:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `department_id`, `salary`, `middle_name`) VALUES
(7, 'Kelly', 'Collins', 4, '81.00', 'Meredith Wallace'),
(9, 'Kermit', 'Ramos', 4, '40.00', 'Prescott Estes'),
(10, 'Evangeline', 'Mack', 4, '60.00', 'Fletcher Miranda'),
(13, 'Jennifer', 'Combs', 4, '14.00', 'Kendall Blake'),
(14, 'Macon', 'Keller', 4, '53.00', 'Aimee Dodson'),
(16, 'Vera', 'Moody', 3, '18.00', 'Marcia Wynn'),
(17, 'Donna', 'Potts', 3, '52.00', 'Penelope Jacobs'),
(19, 'Jaime', 'Watts', 4, '23.00', 'Danielle Justice'),
(21, 'Alfonso', 'Browning', 4, '94.00', 'Alea Wise');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `uom` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `uom`, `price`, `date_time`) VALUES
(2, 'Lani Garza', 'Lani Garza Updated', 'PC', '250.00', '2022-12-06 12:20:11'),
(3, 'Melanie Cabrera', 'Iusto fuga Quia eiu', 'Adipisci e', '432.00', '2022-12-06 12:20:25'),
(4, 'Levi Monroe', 'Levi Monroe Updated', 'KG', '100.00', '2022-12-06 12:19:08'),
(6, 'Paki Duffy', 'Consequat In fugiat', 'Vero qui i', '33.00', '2022-12-06 12:20:34'),
(7, 'Roblox', 'Roblox Desc', 'lbs', '44.00', '2023-01-06 13:00:51'),
(8, 'DBest ', 'DBest#1', 'lbs', '10000000.00', '2023-01-09 04:23:49'),
(9, 'DBest ', 'DBest#1', 'lbs', '10000000.00', '2023-01-09 04:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `productimage`
--

CREATE TABLE `productimage` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productimage`
--

INSERT INTO `productimage` (`id`, `product_id`, `product_image`) VALUES
(1, 1, 'image1'),
(2, 1, 'image2'),
(3, 1, 'image3'),
(4, 2, 'image4'),
(5, 2, 'iamge5');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`) VALUES
(1, 'product1'),
(2, 'product2');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `date_time`) VALUES
(42, 'Computer wipes and Operating System reinstallations', '1500.00', '2023-01-09 02:06:02'),
(43, 'Install MsOffice / System Antivirus / Adobe Photoshop etc.', '750.00', '2023-01-09 02:07:51'),
(44, 'Network Connection', '1600.00', '2023-01-09 02:08:03'),
(45, 'Hardware or software error diagnostics', '1100.00', '2023-01-09 02:08:16'),
(46, 'Data Recovery', '800.00', '2023-01-09 02:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `profile_pic` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `profile_pic`, `date_time`) VALUES
(8, 'test', '$2y$10$0jayGbbAQpa9eGaQXB8mbefFV3uJkFguXboTw7scNzDGAyu1c/AXu', 'uploads/pexels-photo-2116475.jpeg', '2023-01-09 07:20:40'),
(9, 'test123', '$2y$10$7LrOQS/Vt3RfSNbhDEhB0ubB4tXYwQfwClmFoDBl/xptCR6b1Ip/u', '', '2022-12-14 11:11:39'),
(11, 'test2', '$2y$10$m26U2iW0mPxQVPMm1cLFtOkjGr6bbY2eKhOrm32Nb3W2i49F/WqVu', '', '2023-01-07 03:41:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customertransaction`
--
ALTER TABLE `customertransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_name` (`company_name`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productimage`
--
ALTER TABLE `productimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customertransaction`
--
ALTER TABLE `customertransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `productimage`
--
ALTER TABLE `productimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
