-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2023 at 06:56 AM
-- Server version: 10.5.20-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngslccor_respos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `Category` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Vat` int(11) NOT NULL,
  `Tax` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `Category`, `Vat`, `Tax`, `Date`) VALUES
(1, 'Food', 21, 22, '2020-04-02 12:30:44'),
(2, 'Drink', 10, 10, '2020-05-09 13:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `idNumber` bigint(20) NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `dob` date NOT NULL,
  `discount` int(11) NOT NULL,
  `purchases` int(11) NOT NULL,
  `lastPurchase` date NOT NULL,
  `registerDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `idNumber`, `address`, `email`, `mobile`, `dob`, `discount`, `purchases`, `lastPurchase`, `registerDate`) VALUES
(1, 'Cust1', 333, '16 W', 'm@gmail.com', '1234567890', '2020-01-01', 10, 0, '0000-00-00', '2020-03-10 02:55:32'),
(18, 'Cust2', 111, 'QW', 'QW@gmail.com', '0867585858', '2002-02-02', 1, 2, '2023-06-09', '2020-05-11 21:38:59'),
(19, 'Cust3', 101, 'dsa', 'dsa@gmail.com', '0851528274', '1995-08-12', 1, 3, '0000-00-00', '2020-05-22 14:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `open_tables`
--

CREATE TABLE `open_tables` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `idSeller` int(11) NOT NULL,
  `tableNo` int(11) NOT NULL,
  `products` text CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `netPrice` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `code` text NOT NULL,
  `product` text NOT NULL,
  `stock` int(11) NOT NULL,
  `buyingPrice` float NOT NULL,
  `sellingPrice` float NOT NULL,
  `sales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `idCategory`, `code`, `product`, `stock`, `buyingPrice`, `sellingPrice`, `sales`) VALUES
(1, 1, '101', 'Steak and Chips', 21, 14.65, 18.95, 13),
(2, 1, '102', 'Chicken and Chips', 19, 7.5, 12.95, 2),
(3, 1, '103', 'Heavy Breakfast', 20, 6.85, 8.95, 40),
(4, 1, '104', 'Light Breakfast', 20, 3.95, 7.95, 0),
(5, 1, '105', 'Beef Burger with Chips/wedges', 20, 5.55, 12.5, 0),
(6, 1, '106', 'Chicken Burger with chips/wedges', 20, 5.55, 12.5, 0),
(7, 1, '107', 'Pepper Soup', 0, 1.25, 4.5, 0),
(8, 1, '108', 'B.L.T.', 0, 3.25, 6.95, 0),
(9, 1, '109', 'Buffalo Chicken Wings', 0, 4.55, 8.95, 0),
(10, 1, '110', 'Chicken Curry', 0, 6.55, 11.95, 0),
(11, 1, '111', 'BBQ Pork Ribs', 0, 4.65, 8.95, 2),
(12, 1, '112', 'Bowl of chips', 1, 1, 2.95, -1),
(13, 1, '113', 'Bowl of Wedges', 0, 1.5, 4.5, 0),
(14, 1, '114', 'Mashed Potato', 7, 1, 2.95, 25),
(15, 1, '115', 'Cellar Style Bruschetta', 1, 3.2, 5.95, -1),
(16, 1, '116', 'Irish Oak Smoked Salmon', 1, 5.45, 8.95, -1),
(17, 1, '117', 'New York Style Baked Cheesecake', 18, 2.55, 5.5, 2),
(18, 1, '118', 'The Cellar Ice Cream Sundae', 0, 2.1, 4.95, 0),
(19, 1, '119', 'Hot Sticky Toffee Pudding', 1, 2.55, 5.5, -1),
(20, 1, '120', 'Warm Chocolate Fudge Cake', 0, 2.55, 5.5, 0),
(21, 2, '201', 'Guinness', 1, 2, 4.5, -1),
(23, 2, '203', 'Coke', 18, 2, 4.5, 2),
(24, 2, '204', 'Vimto', 20, 2, 4.5, 0),
(25, 2, '205', 'Mutzig', 0, 2, 4.5, 0),
(26, 2, '206', 'Star Beer', 0, 2, 4.5, 1),
(27, 2, '207', 'Wicklow Wolf', 9, 2.4, 4.5, 0),
(28, 2, '208', 'Galway Hooker', 20, 2, 4.5, 0),
(29, 2, '209', 'Vodka', 18, 4, 7.5, 2),
(30, 2, '210', 'Rum', 20, 4.8, 0, 0),
(31, 2, '211', 'Jack Daniels', 20, 4.8, 7.5, 0),
(32, 2, '212', 'Red Wine', 20, 3.48, 7, 1),
(33, 2, '213', 'White Wine', 20, 2.16, 7, 0),
(34, 2, '214', 'Rose', 20, 2.52, 7, -1),
(35, 2, '215', 'Coke', 20, 1.08, 2, 2),
(36, 2, '216', '7up', 18, 1.5, 2, 5),
(37, 2, '217', 'Fanta', 20, 1.2, 2, -1),
(39, 2, '219', 'Coffee', 20, 0.9, 1.95, 0),
(80, 2, '5054267000438', 'Lucozade', 19, 12, 17.4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `idSeller` int(11) NOT NULL,
  `tableNo` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `products` text NOT NULL,
  `netPrice` float NOT NULL,
  `discount` int(11) NOT NULL,
  `totalPrice` float NOT NULL,
  `paymentMethod` text NOT NULL,
  `saledate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `code`, `idSeller`, `tableNo`, `idCustomer`, `products`, `netPrice`, `discount`, `totalPrice`, `paymentMethod`, `saledate`) VALUES
(246, 10001, 12, 0, 111, '[{\"id\":\"2\",\"product\":\"Chicken and Chips\",\"category\":\"1\",\"quantity\":\"1\",\"stock\":\"19\",\"price\":\"12.95\",\"totalPrice\":\"12.95\"},{\"id\":\"2\",\"product\":\"Chicken and Chips\",\"category\":\"1\",\"quantity\":\"1\",\"stock\":\"19\",\"price\":\"12.95\",\"totalPrice\":\"12.95\"}]', 25.9, 1, 25.64, 'Cash', '2023-06-09 09:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `user` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `profile` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` int(1) NOT NULL,
  `lastLogin` datetime NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user`, `password`, `profile`, `status`, `lastLogin`, `date`) VALUES
(12, 'Admin', 'admin', '$2a$07$asxx54ahjppf45sd87a5aumUskocpQucMnvwsUt.aC6WLWGcLNcY6', 'administrator', 1, '2023-06-09 11:30:39', '2023-06-09 10:30:39'),
(41, 'staff1', 'staff', '$2a$07$asxx54ahjppf45sd87a5auy11QLpa3taRSiUSCzqaWHxjhmUKKSk6', 'staff', 1, '2020-05-22 15:52:36', '2020-05-22 14:52:36'),
(42, 'manager1', 'manager', '$2a$07$asxx54ahjppf45sd87a5auwsi2br/08hc1xNsiOS4IsP9cvjEnECi', 'manager', 1, '2020-05-22 15:53:32', '2020-05-22 14:53:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `open_tables`
--
ALTER TABLE `open_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `open_tables`
--
ALTER TABLE `open_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
