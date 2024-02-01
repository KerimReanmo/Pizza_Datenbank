-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Feb 2024 um 10:40
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
-- Datenbank: `pizza_house`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_image` blob DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `dishes`
--

INSERT INTO `dishes` (`id`, `product_name`, `product_image`, `price`, `created`) VALUES
(1, 'Margherita', NULL, '8.99', '2024-02-01 09:38:23'),
(2, 'Quattro Formaggi', NULL, '10.99', '2024-02-01 09:38:23'),
(3, 'Prosciutto e Funghi', NULL, '9.99', '2024-02-01 09:38:23'),
(4, 'Diavola', NULL, '11.99', '2024-02-01 09:38:23'),
(5, 'Capricciosa', NULL, '10.49', '2024-02-01 09:38:23'),
(6, 'Frutti di Mare', NULL, '12.99', '2024-02-01 09:38:23'),
(7, 'Vegetariana', NULL, '9.49', '2024-02-01 09:38:23'),
(8, 'Tonno e Cipolla', NULL, '11.49', '2024-02-01 09:38:23'),
(9, 'Quattro Stagioni', NULL, '11.99', '2024-02-01 09:38:23'),
(10, 'Calzone', NULL, '10.99', '2024-02-01 09:38:23'),
(11, 'Rucola e Parmigiano', NULL, '12.49', '2024-02-01 09:38:23'),
(12, 'Caprese', NULL, '8.99', '2024-02-01 09:38:23'),
(13, 'Gorgonzola e Noci', NULL, '11.49', '2024-02-01 09:38:23'),
(14, 'Funghi e Salsiccia', NULL, '10.99', '2024-02-01 09:38:23'),
(15, 'Bianca', NULL, '9.99', '2024-02-01 09:38:23'),
(16, 'Spinaci e Ricotta', NULL, '10.49', '2024-02-01 09:38:23'),
(17, 'Pesto e Pollo', NULL, '11.99', '2024-02-01 09:38:23'),
(18, 'Margherita Extra', NULL, '12.49', '2024-02-01 09:38:23'),
(19, 'Marinara', NULL, '8.49', '2024-02-01 09:38:23'),
(20, 'Carbonara', NULL, '11.49', '2024-02-01 09:38:23'),
(21, 'Salami Deluxe', NULL, '7.50', '2024-02-01 09:40:08');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enduser_basket`
--

CREATE TABLE `enduser_basket` (
  `id` int(11) NOT NULL,
  `products` varchar(255) DEFAULT NULL,
  `products_quantity` int(11) DEFAULT 0,
  `products_images` blob DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `enduser_basket`
--

INSERT INTO `enduser_basket` (`id`, `products`, `products_quantity`, `products_images`, `created`) VALUES
(1, 'Margherita, Quattro Formaggi', 2, NULL, '2024-02-01 09:38:23'),
(2, 'Prosciutto e Funghi, Capricciosa', 2, NULL, '2024-02-01 09:38:23'),
(3, 'Diavola, Frutti di Mare', 2, NULL, '2024-02-01 09:38:23'),
(4, 'Vegetariana, Tonno e Cipolla', 2, NULL, '2024-02-01 09:38:23'),
(5, 'Quattro Stagioni, Calzone', 2, NULL, '2024-02-01 09:38:23'),
(6, 'Rucola e Parmigiano, Caprese', 2, NULL, '2024-02-01 09:38:23'),
(7, 'Gorgonzola e Noci, Funghi e Salsiccia', 2, NULL, '2024-02-01 09:38:23'),
(8, 'Bianca, Spinaci e Ricotta', 2, NULL, '2024-02-01 09:38:23'),
(9, 'Pesto e Pollo, Margherita Extra', 2, NULL, '2024-02-01 09:38:23'),
(10, 'Marinara, Carbonara', 2, NULL, '2024-02-01 09:38:23');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enduser_order`
--

CREATE TABLE `enduser_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `products` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `dishes_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `enduser_order`
--

INSERT INTO `enduser_order` (`id`, `user_id`, `products`, `quantity`, `dishes_id`, `created`) VALUES
(11, 1, 'Salami Deluxe', 1, 21, '2023-12-15 11:30:00'),
(12, 2, 'Quattro Formaggi, Funghi e Salsiccia', 2, 2, '2023-02-05 17:45:00'),
(13, 3, 'Margherita, Prosciutto e Funghi, Capricciosa', 2, 1, '2023-07-20 18:15:00'),
(14, 4, 'Vegetariana', 1, 7, '2023-09-10 12:00:00'),
(15, 4, 'Diavola', 1, 4, '2023-09-12 14:30:00'),
(16, 4, 'Frutti di Mare', 1, 6, '2023-10-05 17:45:00'),
(17, 4, 'Tonno e Cipolla', 1, 8, '2023-11-08 20:00:00'),
(18, 4, 'Quattro Stagioni', 1, 9, '2023-12-01 21:30:00'),
(19, 4, 'Calzone', 1, 10, '2023-12-18 17:00:00'),
(20, 4, 'Rucola e Parmigiano', 1, 11, '2024-01-05 11:15:00');

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
(1, 'Tomatensoße'),
(2, 'Mozzarella'),
(3, 'Champignons'),
(4, 'Schinken'),
(5, 'Salami'),
(6, 'Paprika'),
(7, 'Zwiebeln'),
(8, 'Oliven'),
(9, 'Thunfisch'),
(10, 'Artischocken'),
(11, 'Peperoni'),
(12, 'Spinat'),
(13, 'Rucola'),
(14, 'Parmesan'),
(15, 'Gorgonzola'),
(16, 'Frischkäse'),
(17, 'Tomaten'),
(18, 'Knoblauch'),
(19, 'Basilikum'),
(20, 'Oregano');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `menu_ingredient`
--

CREATE TABLE `menu_ingredient` (
  `dishes_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `menu_ingredient`
--

INSERT INTO `menu_ingredient` (`dishes_id`, `ingredient_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 14),
(2, 16),
(3, 1),
(3, 4),
(3, 11),
(4, 1),
(4, 5),
(4, 11),
(5, 1),
(5, 4),
(5, 7),
(5, 17),
(6, 1),
(6, 9),
(6, 18),
(7, 1),
(7, 3),
(7, 6),
(7, 7),
(7, 17),
(8, 7),
(8, 9),
(8, 17),
(9, 2),
(9, 4),
(9, 7),
(9, 17),
(10, 1),
(10, 2),
(10, 4),
(10, 7),
(10, 17),
(11, 13),
(11, 14),
(12, 1),
(12, 17),
(13, 14),
(13, 15),
(13, 16),
(14, 3),
(14, 4),
(14, 11),
(14, 16),
(15, 16),
(16, 12),
(16, 16),
(17, 13),
(17, 16),
(17, 18),
(18, 1),
(18, 2),
(18, 17),
(19, 1),
(19, 6),
(19, 16),
(20, 2),
(20, 16),
(20, 18),
(21, 1),
(21, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `phonenumber`, `address`, `created`) VALUES
(1, 'Max', 'Mustermann', 'max.mustermann@example.com', '1234567890', 'Musterstraße 123, Musterstadt', '2024-02-01 09:39:05'),
(2, 'Maria', 'Musterfrau', 'maria.musterfrau@example.com', '0987654321', 'Beispielweg 456, Beispielstadt', '2024-02-01 09:39:05'),
(3, 'Hans', 'Beispiel', 'hans.beispiel@example.com', '1122334455', 'Musterplatz 789, Musterstadt', '2024-02-01 09:39:05'),
(4, 'Klaus', 'Kunde', 'klaus.kunde@example.com', '5555555555', 'Musterstraße 123, Musterstadt', '2024-02-01 09:40:08');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dishes_id` (`dishes_id`);

--
-- Indizes für die Tabelle `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `menu_ingredient`
--
ALTER TABLE `menu_ingredient`
  ADD PRIMARY KEY (`dishes_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `enduser_order`
--
ALTER TABLE `enduser_order`
  ADD CONSTRAINT `enduser_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `enduser_order_ibfk_2` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`);

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