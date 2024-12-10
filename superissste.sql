-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-12-2024 a las 07:19:28
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `superissste`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `producto_id`, `cantidad`, `total`, `fecha`) VALUES
(1, 1, 9, '900.00', '2024-12-06 18:11:08'),
(2, 2, 1, '200.00', '2024-12-06 18:11:09'),
(3, 3, 1, '150.00', '2024-12-06 18:11:09'),
(4, 1, 9, '900.00', '2024-12-06 18:12:26'),
(5, 2, 2, '400.00', '2024-12-06 18:12:26'),
(6, 3, 1, '150.00', '2024-12-06 18:12:26'),
(7, 1, 9, '900.00', '2024-12-06 18:19:35'),
(8, 3, 1, '150.00', '2024-12-06 18:19:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `categoria` varchar(75) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `categoria`) VALUES
(1, 'Categoría 1'),
(2, 'Categoría 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `existencia` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `categoria` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ruta` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `oferta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `codigo`, `descripcion`, `existencia`, `precio`, `categoria`, `ruta`, `oferta`) VALUES
(1, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(2, '0002', 'Producto 2', 1, '1', 'Categoría 2', 'producto_02.jpg', 0),
(3, '0003', 'Producto 3', 1, '1', 'Categoría 3', 'producto_03.jpg', 0),
(4, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(5, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(6, '0002', 'Producto 2', 1, '1', 'Categoría 2', 'producto_02.jpg', 1),
(7, '0003', 'Producto 3', 1, '1', 'Categoría 3', 'producto_03.jpg', 0),
(8, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(9, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(10, '0002', 'Producto 2', 1, '1', 'Categoría 2', 'producto_02.jpg', 0),
(11, '0003', 'Producto 3', 1, '1', 'Categoría 3', 'producto_03.jpg', 0),
(12, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(13, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(14, '0002', 'Producto 2', 1, '1', 'Categoría 2', 'producto_02.jpg', 0),
(15, '0003', 'Producto 3', 1, '1', 'Categoría 3', 'producto_03.jpg', 0),
(16, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(17, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(18, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(19, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(20, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(21, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(22, '0003', 'Producto 3', 1, '1', 'Categoría 3', 'producto_03.jpg', 1),
(23, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(24, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(25, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 1),
(26, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(27, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(28, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(29, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(30, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(31, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(32, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(33, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(34, '0001', 'Producto 1', 1, '1', 'Categoría 1', 'producto_01.jpg', 0),
(35, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(36, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0),
(37, '0004', 'Producto 4', 1, '1', 'Categoría 1', 'producto_04.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr`
--

CREATE TABLE `usr` (
  `id` int(11) NOT NULL,
  `usr` int(11) NOT NULL,
  `pwd` int(11) NOT NULL,
  `perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `usr`
--
ALTER TABLE `usr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
