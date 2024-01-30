-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Jan 2024 um 12:34
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `pizza_app`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_image` longblob DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `dishes`
--

INSERT INTO `dishes` (`id`, `product_name`, `product_image`, `price`) VALUES
(1, 'Margherita', NULL, '7.00'),
(2, 'Pepperoni', NULL, '10.99'),
(3, 'Vegetarian', NULL, '9.99'),
(4, 'Hawaiian', NULL, '11.99'),
(5, 'Supreme', NULL, '12.99'),
(6, 'BBQ Chicken', NULL, '13.99'),
(7, 'Mushroom Lovers', NULL, '11.49'),
(8, 'Spinach and Feta', NULL, '10.49'),
(9, 'Meat Lovers', NULL, '12.99'),
(10, 'Buffalo Chicken', NULL, '13.49'),
(11, 'Four Cheese', NULL, '10.99'),
(12, 'Veggie Delight', NULL, '11.49'),
(13, 'Margarita', NULL, '9.99'),
(14, 'Chicken Alfredo', NULL, '12.49'),
(15, 'Capricciosa', NULL, '7.00'),
(16, 'Pesto Chicken', NULL, '12.99'),
(17, 'Garlic Shrimp', NULL, '13.49'),
(18, 'Taco Pizza', NULL, '11.99'),
(19, 'Bacon Ranch', NULL, '12.49'),
(20, 'Greek Pizza', NULL, '10.99');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enduser_basket`
--

CREATE TABLE `enduser_basket` (
  `id` int(11) NOT NULL,
  `basket_products` text DEFAULT NULL,
  `basket_products_quantity` int(11) DEFAULT 0,
  `basket_products_images` longblob DEFAULT NULL,
  `basket_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `enduser_basket`
--

INSERT INTO `enduser_basket` (`id`, `basket_products`, `basket_products_quantity`, `basket_products_images`, `basket_created`) VALUES
(1, '1,2,3', 2, NULL, '2024-01-30 11:00:00'),
(2, '4,5,6', 3, NULL, '2024-01-30 11:30:00'),
(3, '7,8,9', 1, NULL, '2024-01-30 12:00:00'),
(4, '10,11,12', 2, NULL, '2024-01-30 12:30:00'),
(5, '13,14,15', 1, NULL, '2024-01-30 13:00:00'),
(6, '1,5,9', 3, NULL, '2024-01-30 13:30:00'),
(7, '2,6,10', 2, NULL, '2024-01-30 14:00:00'),
(8, '3,7,11', 1, NULL, '2024-01-30 14:30:00'),
(9, '4,8,12', 3, NULL, '2024-01-30 15:00:00'),
(10, '13,14,15', 2, NULL, '2024-01-30 15:30:00'),
(11, '1,2,3', 1, NULL, '2024-01-30 16:00:00'),
(12, '4,5,6', 2, NULL, '2024-01-30 16:30:00'),
(13, '7,8,9', 3, NULL, '2024-01-30 17:00:00'),
(14, '10,11,12', 1, NULL, '2024-01-30 17:30:00'),
(15, '13,14,15', 2, NULL, '2024-01-30 18:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enduser_order`
--

CREATE TABLE `enduser_order` (
  `id` int(11) NOT NULL,
  `order_customer_firstname` varchar(255) DEFAULT NULL,
  `order_customer_lastname` varchar(255) DEFAULT NULL,
  `order_customer_email` varchar(255) DEFAULT NULL,
  `order_customer_phonenumber` varchar(255) DEFAULT NULL,
  `order_products` text DEFAULT NULL,
  `order_products_quantity` int(11) DEFAULT 0,
  `order_products_images` longblob DEFAULT NULL,
  `order_price` decimal(10,2) DEFAULT NULL,
  `order_customer_address` varchar(255) DEFAULT NULL,
  `order_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `enduser_order`
--

INSERT INTO `enduser_order` (`id`, `order_customer_firstname`, `order_customer_lastname`, `order_customer_email`, `order_customer_phonenumber`, `order_products`, `order_products_quantity`, `order_products_images`, `order_price`, `order_customer_address`, `order_created`) VALUES
(1, 'John', 'Doe', 'john@example.com', '123456789', '1,2,3', 2, NULL, '29.97', '123 Main St', '2024-01-30 19:00:00'),
(2, 'Jane', 'Smith', 'jane@example.com', '987654321', '4,5,6', 3, NULL, '39.97', '456 Oak St', '2024-01-30 19:30:00'),
(3, 'Michael', 'Johnson', 'michael@example.com', '555123456', '7,8,9', 1, NULL, '21.97', '789 Pine St', '2024-01-30 20:00:00'),
(4, 'Emily', 'Williams', 'emily@example.com', '789654123', '10,11,12', 2, NULL, '45.96', '101 Elm St', '2024-01-30 20:30:00'),
(5, 'Robert', 'Brown', 'robert@example.com', '456789321', '13,14,15', 1, NULL, '33.98', '202 Maple St', '2024-01-30 21:00:00'),
(6, 'Emma', 'Davis', 'emma@example.com', '321987654', '1,5,9', 3, NULL, '51.96', '303 Birch St', '2024-01-30 21:30:00'),
(7, 'Daniel', 'Miller', 'daniel@example.com', '111222333', '2,6,10', 2, NULL, '44.96', '404 Cedar St', '2024-01-30 22:00:00'),
(8, 'Olivia', 'Wilson', 'olivia@example.com', '222333444', '3,7,11', 1, NULL, '33.97', '505 Oak St', '2024-01-30 22:30:00'),
(9, 'William', 'Moore', 'william@example.com', '333444555', '4,8,12', 3, NULL, '52.45', '606 Pine St', '2024-01-30 23:00:00'),
(16, 'Markus', 'Benzin', 'kundenummereins@example.com', '53453456', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', 1, NULL, NULL, '123 All Street', '2024-02-01 11:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`) VALUES
(1, 'Tomato Sauce'),
(2, 'Mozzarella Cheese'),
(3, 'Pepperoni'),
(4, 'Pineapple'),
(5, 'Salami'),
(6, 'Bell Peppers'),
(7, 'Onions'),
(8, 'BBQ Sauce'),
(9, 'Chicken'),
(10, 'Mushrooms'),
(11, 'Spinach'),
(12, 'Feta Cheese'),
(13, 'Ground Beef'),
(14, 'Buffalo Sauce'),
(15, 'Blue Cheese'),
(16, 'Cheddar Cheese'),
(17, 'Parmesan Cheese'),
(18, 'Alfredo Sauce'),
(19, 'Shrimp'),
(20, 'Taco Seasoning');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menu_ingredient`
--

CREATE TABLE `menu_ingredient` (
  `dishes_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `menu_ingredient`
--

INSERT INTO `menu_ingredient` (`dishes_id`, `ingredient_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 10),
(4, 1),
(4, 2),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 1),
(7, 2),
(7, 10),
(8, 1),
(8, 2),
(8, 11),
(9, 1),
(9, 2),
(9, 13),
(10, 9),
(10, 14),
(11, 2),
(11, 16),
(11, 17),
(11, 18),
(12, 1),
(12, 2),
(12, 11),
(12, 16),
(13, 1),
(13, 2),
(14, 8),
(14, 18),
(15, 1),
(15, 2),
(15, 10),
(16, 8),
(16, 9),
(16, 16),
(17, 1),
(17, 19),
(18, 13),
(18, 20),
(19, 5),
(19, 8),
(20, 2),
(20, 12),
(20, 17);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `enduser_basket`
--
ALTER TABLE `enduser_basket`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `enduser_order`
--
ALTER TABLE `enduser_order`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `menu_ingredient`
--
ALTER TABLE `menu_ingredient`
  ADD UNIQUE KEY `dishes_id` (`dishes_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `menu_ingredient`
--
ALTER TABLE `menu_ingredient`
  ADD CONSTRAINT `menu_ingredient_ibfk_1` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`),
  ADD CONSTRAINT `menu_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
