-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2023 a las 19:40:20
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'BEBIDAS', '20231017153308.jpg', 0),
(2, 'FRUTAS', '20231017153400.jpg', 0),
(3, 'LECHES', '20231017153411.jpg', 0),
(4, 'DETERGENTES', '20231017154646.jpg', 0),
(5, 'ACEITES', '20231017154052.jpg', 0),
(6, 'DESODORANTES', '20231017154500.jpg', 0),
(7, 'Abrigos', '20231207065757.jpg', 1),
(8, 'Sudaderas', '20231207070226.jpg', 1),
(9, 'Camisas', '20231207070615.jpg', 1),
(10, 'Pantalones', '20231207070952.jpg', 1),
(11, 'Cazadoras', '20231207071002.jpg', 1),
(12, 'Chalecos', '20231207071012.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `host_smtp` varchar(100) NOT NULL,
  `user_smtp` varchar(100) NOT NULL,
  `pass_smtp` varchar(100) NOT NULL,
  `puerto_smtp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `correo`, `whatsapp`, `direccion`, `host_smtp`, `user_smtp`, `pass_smtp`, `puerto_smtp`) VALUES
(1, 'Bazar avellano', '528341234567', 'bazar_avellano@gmail.com', '528341234567', 'Cd.Victoria, Tamps. México', 'smtp.gmail.com', 'bazar_avellano@gmail.com', 'ikhnyjislfpyzhgj', 465);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `cantidad`, `precio`, `producto`, `id_producto`, `id_venta`) VALUES
(1, 1, 239.00, 'Camiseta manga corta print', 33, 1),
(2, 1, 549.00, 'Camiseta manga larga punto asimétrico', 32, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ventas` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(150) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `ventas`, `imagen`, `estado`, `id_categoria`) VALUES
(8, 'Cazadora acolchada', 'La compsocion tiene al menos: exterior 65% polister reciclado, y relleno 100% poliester reciclado.\r\n\r\nExterior: 100% poliester\r\nForro: 100% poliester\r\nInterior: 100% poliester', 1300.00, 2, 0, '20231206220719.jpg', 1, 11),
(9, 'Cazadora capucha teddy', 'Exterior: 100% poliéster\r\nForro: 100% poliéster', 1300.00, 1, 0, '20231206220904.jpg', 1, 11),
(16, 'Cazadora borreguillo parches', 'Exterior: 100% poliéster\r\nForro: 100% poliéster\r\nInterior: 100% poliéster', 1300.00, 4, 0, '20231206221029.jpg', 1, 11),
(17, 'Abrigo confort', 'Exterior: 100% poliéster\r\nForro: 100% poliéster', 1599.00, 1, 0, '20231206221200.jpg', 1, 7),
(18, 'Chaleco acolchado', 'Exterior: 100% poliéster\r\nForro: 100% poliéster\r\nInterior: 100% poliéster\r\n\r\nLa composición contiene al\r\nmenos: exterior 60% poliéster\r\nreciclado y relleno 100% poliéster\r\nreciclado.', 899.00, 2, 0, '20231206221430.jpg', 1, 12),
(19, 'Sudadera cuello polo print', 'Principal:\r\n65% algodón\r\n35% poliéster\r\n\r\nDetalles:\r\n96% algodón\r\n4% elastano\r\n\r\nLa composición contiene al\r\nmenos: exterior 20% algodón\r\nreciclado.', 799.00, 1, 0, '20231206221705.jpg', 1, 8),
(20, 'Sudadera capucha print', 'Principal:\r\n64% algodón\r\n36% poliéster\r\n\r\nDetalles:\r\n97% algodón\r\n3% elastano\r\n\r\nForro:\r\n64% algodón\r\n36% poliéster\r\n\r\nLa composición contiene al\r\nmenos: exterior 20% algodón\r\nreciclado.', 799.00, 1, 0, '20231206232134.jpg', 1, 8),
(21, 'Camisa manga larga oxford rayas', 'Exterior:\r\n100% algodón', 799.00, 2, 0, '20231206232312.jpg', 1, 9),
(22, 'Camisa manga corta oxford rayas', 'Exterior:\r\n60% algodón\r\n40% poliéster', 699.00, 0, 0, '20231206232340.jpg', 1, 9),
(23, 'Camisa manga corta tecnica', 'Exterior:\r\n100% poliéster', 799.00, 3, 0, '20231206232429.jpg', 1, 9),
(24, 'Sobrecamisa manga larga efecto franela', 'Exterior:\r\n100% poliéster\r\n\r\nLa composición contiene al\r\nmenos: exterior 50% poliéster\r\nreciclado.', 799.00, 1, 0, '20231206232545.jpg', 1, 7),
(25, 'Pantalon wide leg tailoring pinzas', 'Exterior:\r\n65% poliéster\r\n33% viscosa\r\n2% elastano\r\n\r\nLa composición contiene al\r\nmenos: exterior 45% poliéster\r\nreciclado.', 899.00, 1, 0, '20231206232638.jpg', 1, 10),
(26, 'pantalon cargo stroppers', 'Exterior:\r\n98% algodón\r\n2% elastano\r\n\r\nLa composición contiene al\r\nmenos: exterior 20% algodón\r\nreciclado.', 799.00, 1, 0, '20231206232836.jpg', 1, 10),
(27, 'Pantalon multicargo cremalleras', 'Exterior:\r\n98% algodón\r\n2% elastano', 1199.00, 2, 0, '20231206232926.jpg', 1, 10),
(28, 'Pantalón loose algodón', 'Exterior:\r\n97% algodón\r\n3% elastano', 799.00, 1, 0, '20231206233017.jpg', 1, 10),
(29, 'Jersey cuello polo rayas', 'Exterior:\r\n53% poliéster\r\n28% acrílico\r\n16% poliamida\r\n3% lana\r\n\r\nLa composición contiene al\r\nmenos: exterior 40% poliéster\r\nreciclado.', 749.00, 1, 0, '20231206233148.jpg', 1, 8),
(30, 'Jersey cropped escote', 'Exterior:\r\n39% viscosa\r\n34% poliamida\r\n24% algodón\r\n3% elastano', 549.00, 1, 0, '20231206233301.jpg', 1, 8),
(31, 'Cazadora bomber efecto piel desgastada', 'Recubrimiento:\r\n100% poliuretano\r\n\r\nTejido base:\r\n100% poliéster', 1199.00, 2, 0, '20231206233400.jpg', 1, 11),
(32, 'Camiseta manga larga punto asimétrico', 'Exterior:\r\n49% algodón\r\n47% poliéster\r\n4% elastano\r\n\r\nLa composición contiene al\r\nmenos: exterior 45% algodón\r\nreciclado.', 549.00, 0, 1, '20231206233506.jpg', 1, 9),
(33, 'Camiseta manga corta print', 'Exterior\r\n96% algodón\r\n4% elastano', 239.00, 0, 1, '20231206233548.jpg', 1, 9),
(34, 'Abrigo largo soft', 'Exterior:\r\n100% poliéster\r\n\r\nLa composición contiene al\r\nmenos: exterior 50% poliéster\r\nreciclado', 799.00, 2, 0, '20231206233643.jpg', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `token` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `apellido`, `clave`, `direccion`, `tipo`, `perfil`, `verify`, `token`, `estado`) VALUES
(1, 'bazar_avellano@gmail.com', 'Admin', 'ADMINISTRADOR', '$2y$10$YJPEpg7HtOh4dkGwyi2HeeZokS6oJcwi4ttaav/pSDecXaXyuFIGi', 'Victoria', 1, NULL, 0, NULL, 1),
(5, 'info@gmail.com', 'Ana Lopez', NULL, '$2y$10$IU0DrPBACYGug8YsXmKZyONddMoPawVy0XoRqSmW90Tqh7GEHfHD.', NULL, 2, NULL, 0, NULL, 1),
(6, 'yuli@gmail.com', 'Yuli Lopez', NULL, '$2y$10$1Q3quBslnwBhbuQ1QLJlPOfe92s57H94769tfr2G.YYUL.a8BC132', NULL, 2, NULL, 0, NULL, 1),
(7, 'yuliasencios@gmail.com', 'Yuli Asencios', NULL, '$2y$10$m68Aty7PfV8Rr5uak01byOoh6tZJucKn7W8Vx4UuLPRZGNhzMmqcu', NULL, 2, NULL, 0, NULL, 0),
(8, 'yampier19es@gmail.com', 'oscar', NULL, '$2y$10$DznN1c/FoYXtE4.5FzCWNuoOdj88splT9B66GJLvw5jTaSH3CueEi', NULL, 2, NULL, 0, NULL, 1),
(9, 'andresramos@gmail.com', 'admin', 'administrador', '$2y$10$v6q6YmQkvXgUrWYJB2f5/eK9wYsNC2HZwyyEt7cAL5XTvOBZO8tWC', 'bolivia', 1, NULL, 0, NULL, 0),
(10, 'virgo13alexa@gmail.com', 'Andrea', NULL, '$2y$10$nslhkvepnIn3.X6wn32Yy.lm9IEUTQRqQGbseDrE/YFdJrH/QjZJ2', NULL, 2, NULL, 0, NULL, 1),
(11, 'alexcastillonava@gmail.com', 'Alex Guillermo Castillo Nava', NULL, '$2y$10$Dxy4mbCCCM4i4bGUnoqU3./vqasZfNzDiPrvRMjV5jWoVeBonySu6', NULL, 2, NULL, 0, NULL, 0),
(12, 'alexcastillonava@gmail.com', 'alex', 'castillo nava', '$2y$10$lxlXjRHmfDwXgUrnXAazwexIZcY0H/AWNU4GgVHUBGXmHemt3R5WW', 'victoria tamaulipas', 1, NULL, 0, NULL, 1),
(13, 'admin@admin.com', 'admin', 'admin', '$2y$10$1.9nW7VhF3wfMCX4dY5ITuo95Pd0Ag2fXZXEWxxb9XAnN8c6lo7V2', 'admin', 1, NULL, 0, NULL, 1),
(14, '1930267@upv.edu.mx', 'Rodolfo', NULL, '$2y$10$AeudBdiBb3sBm31leR5uGODw6xZVkBpr7Ws3vLD2k7Ih8tKxcXXMW', NULL, 2, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `transaccion` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `pago` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cod` varchar(20) DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT 0.00,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `proceso` int(11) NOT NULL DEFAULT 1,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `transaccion`, `total`, `pago`, `nombre`, `apellido`, `direccion`, `telefono`, `ciudad`, `pais`, `cod`, `envio`, `fecha`, `proceso`, `tipo`, `estado`, `id_usuario`) VALUES
(1, '9YC45378M0275893L', 788.00, 0.00, 'Rodolfo', 'Cervantes', 'Mezquite 1930', '8341084580', 'Victoria', 'Mexico', '87018', 0.00, '2023-12-07 03:49:21', 1, 1, 1, 14);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
