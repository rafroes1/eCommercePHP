-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 15, 2020 at 12:32 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `total`, `fullname`, `phone`, `address`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 1, 440, 'Demo', '123456', '123 King St', 1, '2020-06-07 11:43:36', '2020-06-07 11:43:36', NULL),
(5, 1, 110, 'aaa', '123456', '123 King St', 2, '2020-06-13 22:14:11', '2020-06-13 22:14:11', NULL),
(6, 1, 110, 'aaa', '123456', '123 King St', 3, '2020-06-13 22:35:14', '2020-06-13 22:35:14', NULL),
(7, 1, 110, 'aaa', '123456', '123 King St', 4, '2020-06-13 22:39:33', '2020-06-13 22:39:33', NULL),
(8, 1, 110, 'aaa', '123456', '123 King St', 1, '2020-06-13 22:39:40', '2020-06-13 22:39:40', NULL),
(9, 1, 110, 'aaa', '123456', '123 King St', 1, '2020-06-13 22:40:51', '2020-06-13 22:40:51', NULL),
(10, 1, 110, 'aaa', '123456', '123 King St', 1, '2020-06-13 22:43:25', '2020-06-13 22:43:25', NULL),
(11, 1, 110, 'aaa', '123456', '123 King St', 1, '2020-06-13 22:48:11', '2020-06-13 22:48:11', NULL),
(12, 1, 110, 'aaa', '123456', '123 King St', 1, '2020-06-14 00:41:22', '2020-06-14 00:41:22', NULL),
(13, 1, 110, 'aaa', '123456', '123 King St', 1, '2020-06-15 09:50:48', '2020-06-15 09:50:48', NULL),
(14, 1, 110, 'aaa', '123456', '123 King St', 1, '2020-06-15 09:58:02', '2020-06-15 09:58:02', NULL),
(15, 1, 110, 'aaa', '123456', '123 King St', 1, '2020-06-15 09:59:54', '2020-06-15 09:59:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantities` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `shipping_cost` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `quantities`, `price`, `shipping_cost`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 3, 2, 300, 30, '2020-06-07 11:43:36', '2020-06-07 11:43:36', NULL),
(2, 4, 1, 2, 100, 10, '2020-06-07 11:43:36', '2020-06-07 11:43:36', NULL),
(3, 5, 1, 1, 100, 10, '2020-06-13 22:14:11', '2020-06-13 22:14:11', NULL),
(4, 6, 1, 2, 100, 10, '2020-06-13 22:35:14', '2020-06-13 22:35:14', NULL),
(5, 7, 1, 1, 100, 10, '2020-06-13 22:39:33', '2020-06-13 22:39:33', NULL),
(6, 8, 1, 1, 100, 10, '2020-06-13 22:39:40', '2020-06-13 22:39:40', NULL),
(7, 9, 1, 1, 100, 10, '2020-06-13 22:40:51', '2020-06-13 22:40:51', NULL),
(8, 10, 1, 1, 100, 10, '2020-06-13 22:43:25', '2020-06-13 22:43:25', NULL),
(9, 11, 1, 1, 100, 10, '2020-06-13 22:48:11', '2020-06-13 22:48:11', NULL),
(10, 12, 1, 1, 100, 10, '2020-06-14 00:41:22', '2020-06-14 00:41:22', NULL),
(11, 13, 1, 5, 100, 10, '2020-06-15 09:50:48', '2020-06-15 09:50:48', NULL),
(12, 14, 1, 5, 100, 10, '2020-06-15 09:58:02', '2020-06-15 09:58:02', NULL),
(13, 15, 1, 1, 100, 10, '2020-06-15 09:59:54', '2020-06-15 09:59:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `images` text NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `shipping_cost` int(11) NOT NULL,
  `image` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `shipping_cost`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Product 1', 'Product one description', 100, 10, 'product1.jpg', '2020-06-07 11:08:18', '2020-06-07 11:08:18', NULL),
(2, 'Product 2', 'Product two description', 200, 20, 'product2.jpg', '2020-06-07 11:08:18', '2020-06-07 11:08:18', NULL),
(3, 'Product 3', 'Product three description', 300, 30, 'product3.jpg', '2020-06-07 11:08:18', '2020-06-07 11:08:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fullname`, `phone`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'demo', '$2y$10$MunC0U6pEW949Eb3SoCiBOXvG1OVWoeFneqC/bxwtneoOHtWgva7W', 'demo@gmail.com', 'Demo', '123123', '123123', '2020-06-06 15:48:09', '2020-06-06 15:48:09', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
