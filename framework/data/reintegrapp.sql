-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2017 at 12:23 PM
-- Server version: 10.0.29-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reintegrapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `doctor` varchar(20) NOT NULL,
  `paciente` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id` int(11) NOT NULL,
  `cita` int(11) NOT NULL,
  `diagnostico_test` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosticos_test`
--

CREATE TABLE `diagnosticos_test` (
  `id` int(11) NOT NULL,
  `c` int(11) NOT NULL,
  `h` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `s` int(11) NOT NULL,
  `i` int(11) NOT NULL,
  `d` int(11) NOT NULL,
  `e` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doctores`
--

CREATE TABLE `doctores` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctores`
--

INSERT INTO `doctores` (`cedula`, `nombre`) VALUES
('1030522452', 'Edward Daniel Medina'),
('1121890219', 'Juan Sebastian Rodriguez Tovar'),
('52824587', 'Maria Fernanda Orjuela');

-- --------------------------------------------------------

--
-- Table structure for table `escolaridad`
--

CREATE TABLE `escolaridad` (
  `id` int(11) NOT NULL,
  `nivel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `escolaridad`
--

INSERT INTO `escolaridad` (`id`, `nivel`) VALUES
(1, 'Ninguno'),
(2, 'Primaria sin terminar'),
(3, 'Primaria '),
(4, 'Secundaria sin terminar'),
(5, 'Profesional'),
(6, 'posgrado');

-- --------------------------------------------------------

--
-- Table structure for table `estados_cita`
--

CREATE TABLE `estados_cita` (
  `id` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `estados_civil`
--

CREATE TABLE `estados_civil` (
  `id` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estados_civil`
--

INSERT INTO `estados_civil` (`id`, `estado`) VALUES
(1, 'Casado'),
(2, 'union libre'),
(3, 'Soltero'),
(4, 'Viudo'),
(5, 'Divorciado');

-- --------------------------------------------------------

--
-- Table structure for table `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `genero` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `generos`
--

INSERT INTO `generos` (`id`, `genero`) VALUES
(1, 'femenino'),
(2, 'masculino');

-- --------------------------------------------------------

--
-- Table structure for table `observaciones_diagnostico`
--

CREATE TABLE `observaciones_diagnostico` (
  `id` int(11) NOT NULL,
  `diagnostico` int(11) NOT NULL,
  `observacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pacientes`
--

CREATE TABLE `pacientes` (
  `cedula` varchar(20) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `genero` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `estado_civil` int(11) NOT NULL,
  `escolaridad` int(11) NOT NULL,
  `tiempo_miltancia` int(11) NOT NULL,
  `fecha_reintegracion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pacientes`
--

INSERT INTO `pacientes` (`cedula`, `nombres`, `apellidos`, `genero`, `edad`, `estado_civil`, `escolaridad`, `tiempo_miltancia`, `fecha_reintegracion`) VALUES
('123456789', 'Juan', 'Timo', 2, 45, 1, 5, 10, '2017-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `pregunta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(255) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `rol` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `cedula`, `rol`, `password`) VALUES
('edward', '1030522452', 1, '$2y$11$TEcfTUidl4haZnEl6Rc/Su1fc2kzqDAqmJPkf7Bl.56Qzcrzm6rYe'),
('juan', '1121890219', 1, '$2y$11$TEcfTUidl4haZnEl6Rc/Su1fc2kzqDAqmJPkf7Bl.56Qzcrzm6rYe'),
('mafe', '52824587', 1, '$2y$11$TEcfTUidl4haZnEl6Rc/Su1fc2kzqDAqmJPkf7Bl.56Qzcrzm6rYe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor` (`doctor`),
  ADD KEY `paciente` (`paciente`),
  ADD KEY `estado` (`estado`);

--
-- Indexes for table `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cita` (`cita`),
  ADD KEY `diagnostico_test` (`diagnostico_test`);

--
-- Indexes for table `diagnosticos_test`
--
ALTER TABLE `diagnosticos_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`cedula`);

--
-- Indexes for table `escolaridad`
--
ALTER TABLE `escolaridad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estados_cita`
--
ALTER TABLE `estados_cita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estados_civil`
--
ALTER TABLE `estados_civil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `observaciones_diagnostico`
--
ALTER TABLE `observaciones_diagnostico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagnostico` (`diagnostico`);

--
-- Indexes for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `genero` (`genero`),
  ADD KEY `estado_civil` (`estado_civil`),
  ADD KEY `escolaridad` (`escolaridad`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `cedula` (`cedula`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diagnosticos_test`
--
ALTER TABLE `diagnosticos_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `escolaridad`
--
ALTER TABLE `escolaridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `estados_cita`
--
ALTER TABLE `estados_cita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `estados_civil`
--
ALTER TABLE `estados_civil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `observaciones_diagnostico`
--
ALTER TABLE `observaciones_diagnostico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`doctor`) REFERENCES `doctores` (`cedula`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`paciente`) REFERENCES `pacientes` (`cedula`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`estado`) REFERENCES `estados_cita` (`id`);

--
-- Constraints for table `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `diagnostico_ibfk_1` FOREIGN KEY (`cita`) REFERENCES `citas` (`id`),
  ADD CONSTRAINT `diagnostico_ibfk_2` FOREIGN KEY (`diagnostico_test`) REFERENCES `diagnosticos_test` (`id`);

--
-- Constraints for table `observaciones_diagnostico`
--
ALTER TABLE `observaciones_diagnostico`
  ADD CONSTRAINT `observaciones_diagnostico_ibfk_1` FOREIGN KEY (`diagnostico`) REFERENCES `diagnostico` (`id`);

--
-- Constraints for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`genero`) REFERENCES `generos` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`estado_civil`) REFERENCES `estados_civil` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_3` FOREIGN KEY (`escolaridad`) REFERENCES `escolaridad` (`id`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `doctores` (`cedula`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
