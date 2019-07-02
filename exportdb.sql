-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 02, 2019 at 04:40 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `symfony-ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `street`, `zipcode`, `city`, `country`) VALUES
(1, 2, '10 rue de Test', '75012', 'Paris', 'France'),
(2, 1, '15 avenue de Fixtures', '69001', 'Lyon', 'France');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`) VALUES
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 101, 1),
(2, 1, 102, 1),
(3, 2, 101, 1),
(4, 2, 102, 1);

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`id`, `name`, `slug`, `picture_url`, `date_add`) VALUES
(51, 'Voluptas', 'voluptas', 'https://lorempixel.com/1920/780/cats/?84699', '2019-04-18 18:13:40'),
(52, 'Laudantium', 'laudantium', 'https://lorempixel.com/1920/780/cats/?16002', '2019-04-18 18:13:40'),
(53, 'Quisquam', 'quisquam', 'https://lorempixel.com/1920/780/cats/?17108', '2019-04-18 18:13:40'),
(54, 'Nihil', 'nihil', 'https://lorempixel.com/1920/780/cats/?70222', '2019-04-18 18:13:40'),
(55, 'Inventore', 'inventore', 'https://lorempixel.com/1920/780/cats/?13192', '2019-04-18 18:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20190418175347');

-- --------------------------------------------------------

--
-- Table structure for table `order_command`
--

CREATE TABLE `order_command` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_command`
--

INSERT INTO `order_command` (`id`, `user_id`, `cart_id`, `created_at`) VALUES
(1, 2, 1, '2019-04-18 18:13:40'),
(2, 1, 2, '2019-04-18 18:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_add` datetime NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `collection_id`, `name`, `slug`, `price`, `sku`, `picture_url`, `date_add`, `stock`) VALUES
(101, 55, 'Occaecati', 'occaecati', 39, 'PRODUCT-0', 'https://lorempixel.com/710/960/cats/?95538', '2019-04-18 18:13:40', 44),
(102, 53, 'Libero', 'libero', 52, 'PRODUCT-1', 'https://lorempixel.com/710/960/cats/?58909', '2019-04-18 18:13:40', 32),
(103, 51, 'Aliquam', 'aliquam', 82, 'PRODUCT-2', 'https://lorempixel.com/710/960/cats/?63330', '2019-04-18 18:13:40', 58),
(104, 51, 'Excepturi', 'excepturi', 70, 'PRODUCT-3', 'https://lorempixel.com/710/960/cats/?90252', '2019-04-18 18:13:40', 14),
(105, 51, 'Modi', 'modi', 85, 'PRODUCT-4', 'https://lorempixel.com/710/960/cats/?41280', '2019-04-18 18:13:40', 93),
(106, 52, 'Sunt', 'sunt', 39, 'PRODUCT-5', 'https://lorempixel.com/710/960/cats/?98410', '2019-04-18 18:13:40', 26),
(107, 51, 'Reprehenderit', 'reprehenderit', 99, 'PRODUCT-6', 'https://lorempixel.com/710/960/cats/?52818', '2019-04-18 18:13:40', 46),
(108, 53, 'Incidunt', 'incidunt', 10, 'PRODUCT-7', 'https://lorempixel.com/710/960/cats/?59124', '2019-04-18 18:13:40', 15),
(109, 54, 'Provident', 'provident', 31, 'PRODUCT-8', 'https://lorempixel.com/710/960/cats/?17467', '2019-04-18 18:13:40', 92),
(110, 53, 'Qui', 'qui', 57, 'PRODUCT-9', 'https://lorempixel.com/710/960/cats/?44413', '2019-04-18 18:13:40', 23),
(111, 55, 'Nesciunt', 'nesciunt', 98, 'PRODUCT-10', 'https://lorempixel.com/710/960/cats/?62450', '2019-04-18 18:13:40', 68),
(112, 55, 'Cum', 'cum', 98, 'PRODUCT-11', 'https://lorempixel.com/710/960/cats/?81032', '2019-04-18 18:13:40', 24),
(113, 51, 'Quos', 'quos', 28, 'PRODUCT-12', 'https://lorempixel.com/710/960/cats/?59003', '2019-04-18 18:13:40', 62),
(114, 55, 'Ut', 'ut', 96, 'PRODUCT-13', 'https://lorempixel.com/710/960/cats/?63169', '2019-04-18 18:13:40', 61),
(115, 52, 'Incidunt', 'incidunt', 91, 'PRODUCT-14', 'https://lorempixel.com/710/960/cats/?79978', '2019-04-18 18:13:40', 44),
(116, 54, 'Laboriosam', 'laboriosam', 52, 'PRODUCT-15', 'https://lorempixel.com/710/960/cats/?37739', '2019-04-18 18:13:40', 58),
(117, 51, 'Iure', 'iure', 42, 'PRODUCT-16', 'https://lorempixel.com/710/960/cats/?16812', '2019-04-18 18:13:40', 23),
(118, 53, 'Ut', 'ut', 51, 'PRODUCT-17', 'https://lorempixel.com/710/960/cats/?25661', '2019-04-18 18:13:40', 28),
(119, 51, 'Voluptatum', 'voluptatum', 65, 'PRODUCT-18', 'https://lorempixel.com/710/960/cats/?69160', '2019-04-18 18:13:40', 83),
(120, 52, 'Veritatis', 'veritatis', 46, 'PRODUCT-19', 'https://lorempixel.com/710/960/cats/?73347', '2019-04-18 18:13:40', 17),
(121, 53, 'Ut', 'ut', 64, 'PRODUCT-20', 'https://lorempixel.com/710/960/cats/?64553', '2019-04-18 18:13:40', 86),
(122, 52, 'Necessitatibus', 'necessitatibus', 60, 'PRODUCT-21', 'https://lorempixel.com/710/960/cats/?10240', '2019-04-18 18:13:40', 40),
(123, 55, 'Itaque', 'itaque', 35, 'PRODUCT-22', 'https://lorempixel.com/710/960/cats/?75803', '2019-04-18 18:13:40', 11),
(124, 53, 'Laudantium', 'laudantium', 21, 'PRODUCT-23', 'https://lorempixel.com/710/960/cats/?42073', '2019-04-18 18:13:40', 69),
(125, 54, 'Blanditiis', 'blanditiis', 47, 'PRODUCT-24', 'https://lorempixel.com/710/960/cats/?11853', '2019-04-18 18:13:40', 16),
(126, 53, 'Voluptatem', 'voluptatem', 91, 'PRODUCT-25', 'https://lorempixel.com/710/960/cats/?25641', '2019-04-18 18:13:40', 80),
(127, 52, 'Illum', 'illum', 31, 'PRODUCT-26', 'https://lorempixel.com/710/960/cats/?17336', '2019-04-18 18:13:40', 76),
(128, 54, 'Quia', 'quia', 76, 'PRODUCT-27', 'https://lorempixel.com/710/960/cats/?89185', '2019-04-18 18:13:40', 63),
(129, 53, 'Odit', 'odit', 85, 'PRODUCT-28', 'https://lorempixel.com/710/960/cats/?23544', '2019-04-18 18:13:40', 19),
(130, 51, 'Totam', 'totam', 38, 'PRODUCT-29', 'https://lorempixel.com/710/960/cats/?69037', '2019-04-18 18:13:40', 76),
(131, 55, 'Corrupti', 'corrupti', 80, 'PRODUCT-30', 'https://lorempixel.com/710/960/cats/?22871', '2019-04-18 18:13:40', 21),
(132, 53, 'Aut', 'aut', 73, 'PRODUCT-31', 'https://lorempixel.com/710/960/cats/?41444', '2019-04-18 18:13:40', 16),
(133, 55, 'Ut', 'ut', 56, 'PRODUCT-32', 'https://lorempixel.com/710/960/cats/?50662', '2019-04-18 18:13:40', 70),
(134, 54, 'Quae', 'quae', 77, 'PRODUCT-33', 'https://lorempixel.com/710/960/cats/?31081', '2019-04-18 18:13:40', 27),
(135, 55, 'Nisi', 'nisi', 72, 'PRODUCT-34', 'https://lorempixel.com/710/960/cats/?74875', '2019-04-18 18:13:40', 25),
(136, 54, 'Repudiandae', 'repudiandae', 27, 'PRODUCT-35', 'https://lorempixel.com/710/960/cats/?80209', '2019-04-18 18:13:40', 92),
(137, 51, 'Est', 'est', 79, 'PRODUCT-36', 'https://lorempixel.com/710/960/cats/?94784', '2019-04-18 18:13:40', 79),
(138, 54, 'Provident', 'provident', 70, 'PRODUCT-37', 'https://lorempixel.com/710/960/cats/?32844', '2019-04-18 18:13:40', 24),
(139, 54, 'Sed', 'sed', 84, 'PRODUCT-38', 'https://lorempixel.com/710/960/cats/?53082', '2019-04-18 18:13:40', 10),
(140, 55, 'Voluptatem', 'voluptatem', 75, 'PRODUCT-39', 'https://lorempixel.com/710/960/cats/?22118', '2019-04-18 18:13:40', 94),
(141, 55, 'Sit', 'sit', 18, 'PRODUCT-40', 'https://lorempixel.com/710/960/cats/?96814', '2019-04-18 18:13:40', 27),
(142, 55, 'Occaecati', 'occaecati', 76, 'PRODUCT-41', 'https://lorempixel.com/710/960/cats/?31848', '2019-04-18 18:13:40', 23),
(143, 54, 'Voluptas', 'voluptas', 62, 'PRODUCT-42', 'https://lorempixel.com/710/960/cats/?17950', '2019-04-18 18:13:40', 53),
(144, 52, 'Illum', 'illum', 97, 'PRODUCT-43', 'https://lorempixel.com/710/960/cats/?22285', '2019-04-18 18:13:40', 54),
(145, 51, 'Et', 'et', 87, 'PRODUCT-44', 'https://lorempixel.com/710/960/cats/?15454', '2019-04-18 18:13:40', 13),
(146, 53, 'Suscipit', 'suscipit', 87, 'PRODUCT-45', 'https://lorempixel.com/710/960/cats/?28031', '2019-04-18 18:13:40', 14),
(147, 55, 'Recusandae', 'recusandae', 14, 'PRODUCT-46', 'https://lorempixel.com/710/960/cats/?90040', '2019-04-18 18:13:40', 82),
(148, 54, 'Commodi', 'commodi', 65, 'PRODUCT-47', 'https://lorempixel.com/710/960/cats/?10282', '2019-04-18 18:13:40', 47),
(149, 54, 'Eius', 'eius', 57, 'PRODUCT-48', 'https://lorempixel.com/710/960/cats/?33271', '2019-04-18 18:13:40', 24),
(150, 51, 'Voluptas', 'voluptas', 25, 'PRODUCT-49', 'https://lorempixel.com/710/960/cats/?58033', '2019-04-18 18:13:40', 76);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `roles`, `password`) VALUES
(1, 'admin@admin.fr', 'Pierre', 'Grimaud', '[\"ROLE_ADMIN\"]', '$2y$13$MHAhjUIkDSlmY0IFdJ2UlO/l5/U4SU/RfnIb0VUnzXCZqj7XlFvW.'),
(2, 'user@user.fr', 'John', 'Doe', '[\"ROLE_USER\"]', '$2y$13$zonH.kJ/Qrp/q0twsqeuv.2S9ltWGQaxQ9xRSSPYSfx.f5lBEKM2O');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BA388B7A76ED395` (`user_id`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2890CCAA1AD5CDBF` (`cart_id`),
  ADD KEY `IDX_2890CCAA4584665A` (`product_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `order_command`
--
ALTER TABLE `order_command`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_78B0439F1AD5CDBF` (`cart_id`),
  ADD KEY `IDX_78B0439FA76ED395` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD514956FD` (`collection_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `order_command`
--
ALTER TABLE `order_command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `FK_2890CCAA1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_2890CCAA4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `order_command`
--
ALTER TABLE `order_command`
  ADD CONSTRAINT `FK_78B0439F1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_78B0439FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD514956FD` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`);
