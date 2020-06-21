-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 20, 2020 at 10:51 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.4.7

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
  `user_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
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

INSERT INTO `carts` (`id`, `user_id`, `coupon_id`, `total`, `fullname`, `phone`, `address`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(65, 1, NULL, 440, 'Anonymous User', '123456', '123 King St', 3, '2020-06-20 22:41:15', '2020-06-20 22:41:15', NULL),
(66, 1, 3, 300, 'Anonymous User', '123456', '123 King St', 3, '2020-06-20 22:41:15', '2020-06-20 22:41:15', NULL),
(67, 1, NULL, 110, 'Kitchener Waterloo', '(226) 123-4567', '123 King St', 1, '2020-06-20 22:41:17', '2020-06-20 22:41:17', NULL),
(68, NULL, NULL, 330, 'Anonymous User', '123456', '123 King St', 1, '2020-06-20 22:42:17', '2020-06-20 22:42:17', NULL),
(69, NULL, 3, 300, 'Anonymous User', '123456', '123 King St', 1, '2020-06-20 22:42:17', '2020-06-20 22:42:17', NULL),
(70, 1, NULL, 110, 'Kitchener Waterloo', '(226) 123-4567', '123 King St', 1, '2020-06-20 22:42:19', '2020-06-20 22:42:19', NULL),
(71, 1, NULL, 330, 'Anonymous User', '123456', '123 King St', 1, '2020-06-20 22:49:38', '2020-06-20 22:49:38', NULL),
(72, 1, 3, 300, 'Anonymous User', '123456', '123 King St', 1, '2020-06-20 22:49:38', '2020-06-20 22:49:38', NULL),
(73, 1, NULL, 110, 'Kitchener Waterloo', '(226) 123-4567', '123 King St', 1, '2020-06-20 22:49:40', '2020-06-20 22:49:40', NULL),
(74, 1, NULL, 330, 'Anonymous User', '123456', '123 King St', 1, '2020-06-20 22:50:12', '2020-06-20 22:50:12', NULL),
(75, 1, 3, 300, 'Anonymous User', '123456', '123 King St', 1, '2020-06-20 22:50:12', '2020-06-20 22:50:12', NULL),
(76, 1, NULL, 110, 'Kitchener Waterloo', '(226) 123-4567', '123 King St', 1, '2020-06-20 22:50:14', '2020-06-20 22:50:14', NULL),
(77, 1, NULL, 330, 'Anonymous User', '123456', '123 King St', 1, '2020-06-20 22:50:29', '2020-06-20 22:50:29', NULL),
(78, 1, 3, 300, 'Anonymous User', '123456', '123 King St', 1, '2020-06-20 22:50:29', '2020-06-20 22:50:29', NULL),
(79, 1, NULL, 110, 'Kitchener Waterloo', '(226) 123-4567', '123 King St', 1, '2020-06-20 22:50:31', '2020-06-20 22:50:31', NULL);

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
(47, 65, 1, 5, 100, 10, '2020-06-20 22:41:15', '2020-06-20 22:41:15', NULL),
(48, 65, 3, 3, 300, 30, '2020-06-20 22:41:15', '2020-06-20 22:41:15', NULL),
(49, 66, 3, 3, 300, 30, '2020-06-20 22:41:15', '2020-06-20 22:41:15', NULL),
(50, 67, 1, 5, 100, 10, '2020-06-20 22:41:17', '2020-06-20 22:41:17', NULL),
(51, 68, 3, 3, 300, 30, '2020-06-20 22:42:17', '2020-06-20 22:42:17', NULL),
(52, 69, 3, 3, 300, 30, '2020-06-20 22:42:17', '2020-06-20 22:42:17', NULL),
(53, 70, 1, 5, 100, 10, '2020-06-20 22:42:19', '2020-06-20 22:42:19', NULL),
(54, 71, 3, 3, 300, 30, '2020-06-20 22:49:38', '2020-06-20 22:49:38', NULL),
(55, 72, 3, 3, 300, 30, '2020-06-20 22:49:38', '2020-06-20 22:49:38', NULL),
(56, 73, 1, 5, 100, 10, '2020-06-20 22:49:40', '2020-06-20 22:49:40', NULL),
(57, 74, 3, 3, 300, 30, '2020-06-20 22:50:12', '2020-06-20 22:50:12', NULL),
(58, 75, 3, 3, 300, 30, '2020-06-20 22:50:12', '2020-06-20 22:50:12', NULL),
(59, 76, 1, 5, 100, 10, '2020-06-20 22:50:14', '2020-06-20 22:50:14', NULL),
(60, 77, 3, 3, 300, 30, '2020-06-20 22:50:29', '2020-06-20 22:50:29', NULL),
(61, 78, 3, 3, 300, 30, '2020-06-20 22:50:29', '2020-06-20 22:50:29', NULL),
(62, 79, 1, 5, 100, 10, '2020-06-20 22:50:31', '2020-06-20 22:50:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `images` text,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `rating`, `images`, `text`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, NULL, 'comment', '2020-06-20 09:38:09', '2020-06-20 09:38:09', NULL),
(2, 1, 1, 5, NULL, 'testing this input', '2020-06-20 10:28:37', '2020-06-20 10:28:37', NULL),
(3, 1, 1, 5, NULL, 'testing this input', '2020-06-20 10:28:50', '2020-06-20 10:28:50', NULL),
(4, 1, 1, 5, NULL, 'testing this input', '2020-06-20 10:29:15', '2020-06-20 10:29:15', NULL),
(5, 1, 1, 5, NULL, 'testing this input', '2020-06-20 18:28:49', '2020-06-20 18:28:49', NULL),
(6, 1, 1, 5, NULL, 'testing this input', '2020-06-20 19:29:07', '2020-06-20 19:29:07', NULL),
(7, 1, 1, 5, NULL, 'testing this input', '2020-06-20 19:30:00', '2020-06-20 19:30:00', NULL),
(8, 1, 1, 5, NULL, 'testing this input', '2020-06-20 19:34:44', '2020-06-20 19:34:44', NULL),
(9, 1, 1, 5, NULL, 'testing this input', '2020-06-20 19:37:00', '2020-06-20 19:37:00', NULL),
(10, 1, 1, 5, NULL, 'testing this input', '2020-06-20 19:37:31', '2020-06-20 19:37:31', NULL),
(11, 1, 1, 5, NULL, 'testing this input', '2020-06-20 19:37:39', '2020-06-20 19:37:39', NULL),
(12, 1, 1, 5, NULL, 'testing this input', '2020-06-20 20:12:07', '2020-06-20 20:12:07', NULL),
(13, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:08:06', '2020-06-20 22:08:06', NULL),
(14, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:19:28', '2020-06-20 22:19:28', NULL),
(15, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:19:55', '2020-06-20 22:19:55', NULL),
(16, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:33:16', '2020-06-20 22:33:16', NULL),
(17, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:37:49', '2020-06-20 22:37:49', NULL),
(18, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:38:15', '2020-06-20 22:38:15', NULL),
(19, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:41:18', '2020-06-20 22:41:18', NULL),
(20, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:42:20', '2020-06-20 22:42:20', NULL),
(21, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:49:41', '2020-06-20 22:49:41', NULL),
(22, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:50:14', '2020-06-20 22:50:14', NULL),
(23, 1, 1, 5, NULL, 'testing this input', '2020-06-20 22:50:31', '2020-06-20 22:50:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `value`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'X10', 10, 1, '2020-06-20 00:47:04', '2020-06-20 00:47:04', NULL),
(2, 'X20', 20, 1, '2020-06-20 20:21:36', '2020-06-20 20:21:36', NULL),
(3, 'X30', 30, 1, '2020-06-20 20:21:45', '2020-06-20 20:21:45', NULL);

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
(1, 'vana', '$2y$10$YRT/AN0jGkQ3OsuQo/pld.7RLdzXttbcOfRLl1s2MKcpl0cH41o9y', 'demo@gmail.com', 'Nguyen Van A', '123456789', '100 Victoria St', '2020-06-06 15:48:09', '2020-06-06 15:48:09', NULL),
(10, 'vana', '$2y$10$ywADxXtm/EmDDoo.sj7L8O3UFYjU3rPRBSDsBR77cJexeeum0yOFy', 'a@gmail.com', 'Nguyen Van A', '123456789', '100 Victoria St', '2020-06-20 22:41:15', '2020-06-20 22:41:15', NULL),
(12, 'abcde', '$2y$10$Kupf0NI8ZV5TcqQpmyZL9.9rRRAws9uKrgmNOVLdIWCsOZKSiNCGu', 'abcde@gmail.com', 'Nguyen Van abcde', '123456789', '100 Victoria St', '2020-06-20 22:50:29', '2020-06-20 22:50:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coupon_id` (`coupon_id`);

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
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

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
