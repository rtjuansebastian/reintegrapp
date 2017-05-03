-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 03, 2017 at 04:39 PM
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

--
-- Dumping data for table `citas`
--

INSERT INTO `citas` (`id`, `doctor`, `paciente`, `fecha`, `estado`) VALUES
(3, '1121890219', '123456789', '2017-05-02', 2),
(4, '1121890219', '123456789', '2017-05-03', 3);

-- --------------------------------------------------------

--
-- Table structure for table `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id` int(11) NOT NULL,
  `cita` int(11) NOT NULL,
  `diagnostico_test` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diagnostico`
--

INSERT INTO `diagnostico` (`id`, `cita`, `diagnostico_test`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 3, 3);

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

--
-- Dumping data for table `diagnosticos_test`
--

INSERT INTO `diagnosticos_test` (`id`, `c`, `h`, `a`, `s`, `i`, `d`, `e`) VALUES
(1, 4, 0, 0, 0, 0, 0, 0),
(2, 4, 0, 0, 0, 0, 0, 0),
(3, 4, 0, 0, 0, 0, 0, 0);

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
(5, 'secundaria'),
(6, 'Profesional'),
(7, 'posgrado');

-- --------------------------------------------------------

--
-- Table structure for table `estados_cita`
--

CREATE TABLE `estados_cita` (
  `id` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estados_cita`
--

INSERT INTO `estados_cita` (`id`, `estado`) VALUES
(1, 'Solicitada'),
(2, 'Realizada'),
(3, 'Cancelada');

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
  `tiempo_militancia` int(11) NOT NULL,
  `fecha_reintegracion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pacientes`
--

INSERT INTO `pacientes` (`cedula`, `nombres`, `apellidos`, `genero`, `edad`, `estado_civil`, `escolaridad`, `tiempo_militancia`, `fecha_reintegracion`) VALUES
('123456789', 'Juan', 'Timo', 2, 45, 1, 3, 10, '2017-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `categoria` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `categoria`) VALUES
(1, '¿Aceptarías trabajar escribiendo artículos en la sección económica de un diario?', 'C'),
(2, '¿Te ofrecerías para organizar la despedida de soltero de uno de tus amigos?', 'C'),
(3, '¿Te gustaría dirigir un proyecto de urbanización en tu provincia?', 'A'),
(4, '¿A una frustración siempre opones un pensamiento positivo?', 'S'),
(5, '¿Te dedicarías a socorrer a personas accidentadas o atacadas por asaltantes?', 'D'),
(6, '¿Cuando eras chico, te interesaba saber cómo estaban construidos tus juguetes?', 'I'),
(7, '¿Te interesan más los misterios de la naturaleza que los secretos de la tecnología?', 'E'),
(8, '¿Escuchas atentamente los problemas que te plantean tus amigos?', 'S'),
(9, '¿Te ofrecerías para explicar a tus compañeros un determinado tema que ellos no entendieron?', 'H'),
(10, '¿Eres exigente y crítico con tu equipo de trabajo?', 'I'),
(11, '¿Te atrae armar rompecabezas o puzzles?', 'A'),
(12, '¿Puedes establecer la diferencia conceptual entre macroeconomía y microeconomía?', 'C'),
(13, '¿Usar uniforme te hace sentir distinto, importante?', 'D'),
(14, '¿Participarías como profesional en un espectáculo de acrobacia aérea?', 'D'),
(15, '¿Organizas tu dinero de manera que te alcance hasta el próximo cobro?', 'C'),
(16, '¿Convences fácilmente a otras personas sobre la validez de tus argumentos?', 'S'),
(17, '¿Estás informado sobre los nuevos descubrimientos que se están realizando sobre la Teoría del Big-Bang?', 'E'),
(18, '¿Ante una situación de emergencia actúas rápidamente?', 'D'),
(19, '¿Cuando tienes que resolver un problema matemático, perseveras hasta encontrar la solución?', 'I'),
(20, '¿Si te convocara tu club preferido para planificar, organizar y dirigir un campo de deportes, aceptarías?', 'C'),
(21, '¿Eres el que pone un toque de alegría en las fiestas?', 'A'),
(22, '¿Crees que los detalles son tan importantes como el todo?', 'A'),
(23, '¿Te sentirías a gusto trabajando en un ámbito hospitalario?', 'S'),
(24, '¿Te gustaría participar para mantener el orden ante grandes desórdenes y cataclismos?', 'D'),
(25, '¿Pasarías varias horas leyendo algún libro de tu interés?', 'H'),
(26, '¿Planificas detalladamente tus trabajos antes de empezar?', 'I'),
(27, '¿Entablas una relación casi personal con tu computadora?', 'I'),
(28, '¿Disfrutas modelando con arcilla?', 'A'),
(29, '¿Ayudas habitualmente a los no videntes a cruzar la calle?', 'S'),
(30, '¿Consideras importante que desde la escuela primaria se fomente la actitud crítica y la participación activa?', 'H'),
(31, '¿Aceptarías que las mujeres formaran parte de las fuerzas armadas bajo las mismas normas que los hombres?', 'D'),
(32, '¿Te gustaría crear nuevas técnicas para descubrir las patologías de algunas enfermedades a través del microscopio?', 'E'),
(33, '¿Participarías en una campaña de prevención contra la enfermedad de Chagas?', 'S'),
(34, '¿Te interesan los temas relacionados al pasado y a la evolución del hombre?', 'H'),
(35, '¿Te incluirías en un proyecto de investigación de los movimientos sísmicos y sus consecuencias?', 'E'),
(36, '¿Fuera de los horarios escolares, dedicas algún día de la semana a la realización de actividades corporales?', 'A'),
(37, '¿Te interesan las actividades de mucha acción y de reacción rápida en situaciones imprevistas y de peligro?', 'D'),
(38, '¿Te ofrecerías para colaborar como voluntario en los gabinetes espaciales de la NASA?', 'I'),
(39, '¿Te gusta más el trabajo manual que el trabajo intelectual?', 'A'),
(40, '¿Estarías dispuesto a renunciar a un momento placentero para ofrecer tu servicio como profesional?', 'S'),
(41, '¿Participarías de una investigación sobre la violencia en el fútbol?', 'H'),
(42, '¿Te gustaría trabajar en un laboratorio mientras estudias?', 'E'),
(43, '¿Arriesgarías tu vida para salvar la vida de otro que no conoces?', 'D'),
(44, '¿Te agradaría hacer un curso de primeros auxilios?', 'S'),
(45, '¿Tolerarías empezar tantas veces como fuere necesario hasta obtener el logro deseado?  ', 'A'),
(46, '¿Distribuyes tus horarios del día adecuadamente para poder hacer todo lo planeado?', 'C'),
(47, '¿Harías un curso para aprender a fabricar los instrumentos y/o piezas de las máquinas o aparatos con que trabajas?', 'I'),
(48, '¿Elegirías una profesión en la tuvieras que estar algunos meses alejado de tu familia, por ejemplo el marino?', 'D'),
(49, '¿Te radicarías en una zona agrícola-ganadera para desarrollar tus actividades como profesional?', 'E'),
(50, '¿Cuando estás en un grupo trabajando, te entusiasma producir ideas originales y que sean tenidas en cuenta?  ', 'A'),
(51, '¿Te resulta fácil coordinar un grupo de trabajo?  ', 'C'),
(52, '¿Te resultó interesante el estudio de las ciencias biológicas?', 'S'),
(53, '¿Si una gran empresa solicita un profesional como gerente de comercialización, te sentirías a gusto desempeñando ese rol?  ', 'C'),
(54, '¿Te incluirías en un proyecto nacional de desarrollo de la principal fuente de recursos de tu provincia?', 'I'),
(55, '¿Tenés interés por saber cuales son las causas que determinan ciertos fenómenos, aunque saberlo no altere tu vida?  ', 'E'),
(56, '¿Descubriste algún filósofo o escritor que haya expresado tus mismas ideas con antelación?', 'H'),
(57, '¿Desearías que te regalen algún instrumento musical para tu cumpleaños?', 'A'),
(58, '¿Aceptarías colaborar con el cumplimiento de las normas en lugares públicos?', 'D'),
(59, '¿Crees que tus ideas son importantes, y haces todo lo posible para ponerlas en práctica?', 'I'),
(60, '¿Cuando se descompone un artefacto en tu casa, te dispones prontamente a repararlo?', 'I'),
(61, '¿Formarías parte de un equipo de trabajo orientado a la preservación de la flora y la fauna en extinción?  ', 'E'),
(62, '¿Acostumbras a leer revistas relacionadas con los últimos avances científicos y tecnológicos en el área de la salud?', 'S'),
(63, '¿Preservar las raíces culturales de nuestro país, te parece importante y necesario?', 'H'),
(64, '¿Te gustaría realizar una investigación que contribuyera a hacer más justa la distribución de la riqueza?  ', 'C'),
(65, '¿Te gustaría realizar tareas auxiliares en una nave, como por ejemplo izado y arriado de velas, pintura y conservación del casco, arreglo de averías, conservación de motores, etc?  ', 'D'),
(66, '¿Crees que un país debe poseer la más alta tecnología armamentista, a cualquier precio?', 'D'),
(67, '¿La libertad y la justicia son valores fundamentales en tu vida?', 'H'),
(68, '¿Aceptarías hacer una práctica rentada en una industria de productos alimenticios en el sector de control de calidad?', 'E'),
(69, '¿Consideras que la salud pública debe ser prioritaria, gratuita y eficiente para todos?', 'S'),
(70, '¿Te interesaría investigar sobre alguna nueva vacuna?', 'S'),
(71, '¿En un equipo de trabajo, preferís el rol de coordinador?', 'C'),
(72, '¿En una discusión entre amigos, te ofreces como mediador?', 'H'),
(73, '¿Estás de acuerdo con la formación de un cuerpo de soldados profesionales?', 'D'),
(74, '¿Lucharías por una causa justa hasta las últimas consecuencias?', 'H'),
(75, '¿Te gustaría investigar científicamente sobre cultivos agrícolas?', 'I'),
(76, '¿Harías un nuevo diseño de una prenda pasada de moda, ante una reunión imprevista?', 'A'),
(77, '¿Visitarías un observatorio astronómico para conocer en acción el funcionamiento de los aparatos?', 'E'),
(78, '¿Dirigirías el área de importación y exportación de una empresa?', 'C'),
(79, '¿Te inhibís al entrar a un lugar nuevo con gente desconocida?', 'E'),
(80, '¿Te gratificaría el trabajar con niños?', 'H'),
(81, '¿Harías el diseño de un afiche para una campaña contra el sida?', 'A'),
(82, '¿Dirigirías un grupo de teatro independiente?', 'A'),
(83, '¿Enviarías tu currículum a una empresa automotriz que solicita gerente para su área de producción?', 'I'),
(84, '¿Participarías en un grupo de defensa internacional dentro de alguna fuerza armada?', 'D'),
(85, '¿Te costearías tus estudios trabajando en una auditoría?', 'C'),
(86, '¿Eres de los que defiendes causas perdidas?', 'H'),
(87, '¿Ante una emergencia epidémica participarías en una campaña brindando tu ayuda?', 'S'),
(88, '¿Sabrías responder que significa ADN y ARN?', 'E'),
(89, '¿Elegirías una carrera cuyo instrumento de trabajo fuere la utilización de un idioma extranjero?', 'H'),
(90, '¿Trabajar con objetos te resulta más gratificante que trabajar con personas?', 'I'),
(91, '¿Te resultaría gratificante ser asesor contable en una empresa reconocida?', 'C'),
(92, '¿Ante un llamado solidario, te ofrecerías para cuidar a un enfermo?', 'S'),
(93, '¿Te atrae investigar sobre los misterios del universo, por ejemplo los agujeros negros?', 'E'),
(94, '¿El trabajo individual te resulta más rápido y efectivo que el trabajo grupal?', 'E'),
(95, '¿Dedicarías parte de tu tiempo a ayudar a personas de zonas carenciadas?', 'H'),
(96, '¿Cuándo elegís tu ropa o decoras un ambiente, tienes en cuenta la combinación de los colores, las telas o el estilo de los muebles?', 'A'),
(97, '¿Te gustaría trabajar como profesional dirigiendo la construcción de una empresa hidroeléctrica?', 'I'),
(98, '¿Sabes qué es el PIB?', 'C');

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
-- Indexes for table `preguntas`
--
ALTER TABLE `preguntas`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `diagnosticos_test`
--
ALTER TABLE `diagnosticos_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `escolaridad`
--
ALTER TABLE `escolaridad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `estados_cita`
--
ALTER TABLE `estados_cita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
-- AUTO_INCREMENT for table `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
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
