-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2022 a las 06:39:43
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gamemate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compatibilidad`
--

CREATE TABLE `compatibilidad` (
  `juego` int(11) DEFAULT NULL,
  `dispositivo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE `dispositivos` (
  `id_dispositivos` int(11) NOT NULL,
  `pc` varchar(15) DEFAULT NULL,
  `version_celular` varchar(15) DEFAULT NULL,
  `nintendo_switch` varchar(10) DEFAULT NULL,
  `version_playstation` varchar(10) DEFAULT NULL,
  `version_xbox` varchar(10) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria`
--

CREATE TABLE `galeria` (
  `id_galeria` int(11) NOT NULL,
  `nombre_foto` varchar(25) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `jugador` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id_juego` int(11) NOT NULL,
  `juego` varchar(30) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugar`
--

CREATE TABLE `jugar` (
  `nivel_jugador` varchar(15) NOT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `juego` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE `redes` (
  `id_redes` int(11) NOT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `tik_tok` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `twitch` varchar(100) DEFAULT NULL,
  `discord` varchar(100) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nickname` varchar(15) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL,
  `provincia` varchar(15) NOT NULL,
  `disp_horaria` varchar(6) NOT NULL,
  `email` varchar(25) NOT NULL,
  `contraseña` varchar(10) NOT NULL,
  `imagen_perfil` varchar(50) DEFAULT NULL,
  `descripcion` text(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compatibilidad`
--
ALTER TABLE `compatibilidad`
  ADD KEY `juego` (`juego`),
  ADD KEY `dispositivo` (`dispositivo`);

--
-- Indices de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id_dispositivos`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id_galeria`),
  ADD KEY `jugador` (`jugador`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id_juego`);

--
-- Indices de la tabla `jugar`
--
ALTER TABLE `jugar`
  ADD KEY `usuario` (`usuario`),
  ADD KEY `juego` (`juego`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`id_redes`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`nickname`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id_dispositivos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `galeria`
--
ALTER TABLE `galeria`
  MODIFY `id_galeria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `redes`
--
ALTER TABLE `redes`
  MODIFY `id_redes` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compatibilidad`
--
ALTER TABLE `compatibilidad`
  ADD CONSTRAINT `compatibilidad_ibfk_1` FOREIGN KEY (`juego`) REFERENCES `juegos` (`id_juego`),
  ADD CONSTRAINT `compatibilidad_ibfk_2` FOREIGN KEY (`dispositivo`) REFERENCES `dispositivos` (`id_dispositivos`);

--
-- Filtros para la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD CONSTRAINT `dispositivos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`nickname`);

--
-- Filtros para la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD CONSTRAINT `galeria_ibfk_1` FOREIGN KEY (`jugador`) REFERENCES `usuarios` (`nickname`);

--
-- Filtros para la tabla `jugar`
--
ALTER TABLE `jugar`
  ADD CONSTRAINT `jugar_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`nickname`),
  ADD CONSTRAINT `jugar_ibfk_2` FOREIGN KEY (`juego`) REFERENCES `juegos` (`id_juego`);

--
-- Filtros para la tabla `redes`
--
ALTER TABLE `redes`
  ADD CONSTRAINT `redes_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`nickname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;