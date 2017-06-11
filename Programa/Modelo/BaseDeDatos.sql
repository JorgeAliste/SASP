-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2017 at 05:26 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sasp`
--

-- --------------------------------------------------------

--
-- Table structure for table `calificacion`
--

CREATE TABLE `calificacion` (
  `Mail` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Link` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Nota` int(1) NOT NULL,
  `Comentario` varchar(500) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Tipo` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enlace`
--

CREATE TABLE `enlace` (
  `Link` varchar(250) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Titulo` varchar(10000) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Tipo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `CPromAcomodador` int(1) NOT NULL DEFAULT '3',
  `CPromAsimilador` int(1) NOT NULL DEFAULT '3',
  `CPromConvergente` int(1) NOT NULL DEFAULT '3',
  `CPromDivergente` int(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `enlace`
--

INSERT INTO `enlace` (`Link`, `Titulo`, `Tipo`, `CPromAcomodador`, `CPromAsimilador`, `CPromConvergente`, `CPromDivergente`) VALUES
('a', 'a', 'a', 3, 3, 3, 3),
('google.cl', 'gugul', '0', 3, 3, 3, 3),
('http://acer.forestales.upm.es/basicas/udfisica/asignaturas/fisica/electro/campo_electr.html', 'Electrostática. Campo eléctrico y líneas de campo', 'html', 3, 3, 3, 3),
('http://bibliotecadigital.ilce.edu.mx/sites/ciencia/volumen1/ciencia2/44/htm/sec_3.html', 'I. ¿QUÉ SON LAS CARGAS?', 'html', 3, 3, 3, 3),
('http://conceptodefinicion.de/carga-electrica/', '¿Qué es Carga Eléctrica? - Su Definición, Concepto y Significado', 'html', 3, 3, 3, 3),
('http://definicion.de/carga-electrica/', 'Definición de carga eléctrica - Qué es, Significado y Concepto', 'html', 3, 3, 3, 3),
('http://hyperphysics.phy-astr.gsu.edu/hbasees/electric/elecur.html', 'Corriente Eléctrica', 'html', 3, 3, 3, 3),
('http://ing.unne.edu.ar/pub/fisica3/170308/teo/teo1.pdf', 'UNIDAD I: CARGA Y CAMPO ELECTRICO', 'pdf', 3, 3, 3, 3),
('http://www.areatecnologia.com/videos/CARGAS%20ELECTRICAS.htm', 'Ley de Coulomb y Carga Electrica Aprende Facil', 'htm', 3, 3, 3, 3),
('http://www.endesaeduca.com/Endesa_educa/recursos-interactivos/conceptos-basicos/ii.-la-naturaleza-electrica-de-la-materia', 'La naturaleza eléctrica de la materia | ENDESA EDUCA', 'html', 3, 3, 3, 3),
('http://www.familyscience.org/pdfs/Sample%20Activities/Charge%20It_Spanish.pdf', 'Cargas eléctricas', 'pdf', 3, 3, 3, 3),
('http://www.fisicapractica.com/carga-electrica-2.php', 'Carga eléctrica - FisicaPractica.Com', 'php', 3, 3, 3, 3),
('http://www.hiru.eus/fisica/carga-electrica-y-circuitos', 'La carga eléctrica. Ley de Coulomb - hiru.eus', 'html', 3, 3, 3, 3),
('http://www.profesorenlinea.cl/fisica/ElectricidadCargayCorriente.htm', 'Electricidad: carga y corriente eléctrica', 'htm', 3, 3, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/campo_electrico/fuerza/fuerza.htm', 'La ley de Coulomb', 'htm', 3, 3, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/mov_campo/mov_campo.html', 'Fuerzas sobre las cargas', 'html', 3, 3, 3, 3),
('https://es.wikipedia.org/wiki/Carga_el%C3%A9ctrica', 'Carga eléctrica - Wikipedia, la enciclopedia libre', 'html', 3, 3, 3, 3),
('https://pt.wikipedia.org/wiki/Carga_el%C3%A9trica', 'Carga elétrica – Wikipédia, a enciclopédia livre', 'html', 3, 3, 3, 3),
('https://www.definicionabc.com/tecnologia/carga-electrica.php', 'Definición de Carga eléctrica » Concepto en Definición ABC', 'php', 3, 3, 3, 3),
('https://www.fisicalab.com/apartado/carga-electrica', 'Carga Eléctrica | Fisicalab', 'html', 3, 3, 3, 3),
('https://www.slideshare.net/mobile/OmarVargas12/carga-electrica', 'Carga electrica', 'html', 3, 3, 3, 3),
('https://www.youtube.com/watch?v=McZPm7tkguQ', 'Carga eléctrica - Física - Educatina - YouTube', 'html', 3, 3, 3, 3),
('webma11cster@paaaaython.org', 'very-saaecret', '2', 3, 3, 3, 3),
('webma11dbbbdcster@paaaaython.org', 'very-saaecret', '2', 3, 3, 3, 3),
('webma11ddcster@paaaaython.org', 'very-saaecret', '2', 3, 3, 3, 3),
('webmacster@paaaaython.org', 'very-saaecret', '2', 3, 3, 3, 3),
('webmaster@paaaaython.org', 'very-saaecret', '2', 3, 3, 3, 3),
('webmaster@python.org', 'very-secret', '2', 3, 3, 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`Mail`,`Link`),
  ADD KEY `link` (`Link`);

--
-- Indexes for table `enlace`
--
ALTER TABLE `enlace`
  ADD PRIMARY KEY (`Link`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`Link`) REFERENCES `enlace` (`Link`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
