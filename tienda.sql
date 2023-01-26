-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-01-2023 a las 12:33:27
-- Versión del servidor: 8.0.31-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `photo`, `price`) VALUES
(1, 'Producto 1', 'product-1.png', 12.45),
(2, 'Producto 2', 'product-2.png', 100),
(3, 'Producto 3', 'product-3.png', 20),
(4, 'Producto 4', 'product-4.png', 50),
(5, 'Producto 5', 'product-3.png', 34),
(6, 'Product 6', '256_cultivar tulipanes 02a-a.jpg', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team`
--

CREATE TABLE `team` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `team`
--

INSERT INTO `team` (`id`, `name`, `photo`, `designation`) VALUES
(1, 'Team 1', '/team-1.jpg', 'Designation'),
(2, 'Team 2', '/team-2.jpg', 'Designation'),
(3, 'Team 3', '/team-3.jpg', 'Designation'),
(4, 'Team 4', '/team-4.jpg', 'Designation'),
(5, 'Team 5', '/team-5.jpg', 'Designation'),
(7, 'Team 1', '256_cultivar tulipanes 02a-a.jpg', 'Designation');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(1, 'v@v.com', '[\"ROLE_ADMIN\"]', '$2y$13$TuAt.YgktE09MOsJLMIJTeXLE58cibHhnn9GTl.ZO/NezAXo8mFU.', 'Víctor');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `team`
--
ALTER TABLE `team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
