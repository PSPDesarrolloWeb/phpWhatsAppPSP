-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2023 a las 07:28:49
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apiwhatsapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL,
  `type_message` varchar(255) NOT NULL,
  `text_message` varchar(255) NOT NULL,
  `image_message` varchar(255) NOT NULL,
  `link_message` varchar(255) NOT NULL,
  `message_id_sender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `message`
--

INSERT INTO `message` (`id_message`, `type_message`, `text_message`, `image_message`, `link_message`, `message_id_sender`) VALUES
(1, 'text', 'Hola, esta es una prueba de mensaje. A continuación recibirás una imagen y un link al que debes acceder.', 'https://www.bizneo.com/blog/wp-content/uploads/2019/05/pruebas-psicometricas-810x455.jpg', 'https://youtu.be/cOaO14GFCe4?list=RDYbK00KvsNAE', 2),
(2, 'multi', 'Hola, esta es una prueba de campaña publicitaria, en donde recibirás una imagen y un link debajo de este texto.', 'https://foroalfa.org/imagenes/ilustraciones/3869.jpg', 'https://youtu.be/Z441JUsxIa8', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sender`
--

CREATE TABLE `sender` (
  `id_emisor` int(11) NOT NULL,
  `name_emisor` varchar(255) NOT NULL,
  `tel_emisor` varchar(255) NOT NULL,
  `dir_emisor` varchar(255) NOT NULL,
  `email_emisor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sender`
--

INSERT INTO `sender` (`id_emisor`, `name_emisor`, `tel_emisor`, `dir_emisor`, `email_emisor`) VALUES
(1, 'Ruiz + Ruiz Arquitectos', '593968479276', 'Bolivar y Oviedo', 'ruiz@gmail.com'),
(2, 'PSP Producciones', '0967049461', 'El Tejar', 'pspprodec@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `messageSender` (`message_id_sender`);

--
-- Indices de la tabla `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`id_emisor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sender`
--
ALTER TABLE `sender`
  MODIFY `id_emisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `messageSender` FOREIGN KEY (`message_id_sender`) REFERENCES `sender` (`id_emisor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
