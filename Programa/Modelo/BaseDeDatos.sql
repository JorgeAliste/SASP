-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2017 at 09:15 PM
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
  `Tipo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `calificacion`
--

INSERT INTO `calificacion` (`Mail`, `Link`, `Nota`, `Comentario`, `Tipo`) VALUES
('@@@', 'http://conceptodefinicion.de/carga-electrica/', 5, NULL, 0),
('@@78@', 'http://conceptodefinicion.de/carga-electrica/', 5, NULL, 0),
('@@a78@', 'http://conceptodefinicion.de/carga-electrica/', 5, NULL, 0),
('@@a78@', 'https://es.wikipedia.org/wiki/Carga_el%C3%A9ctrica', 5, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `enlace`
--

CREATE TABLE `enlace` (
  `Link` varchar(250) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Titulo` varchar(10000) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Tipo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `CPromAcomodador` float NOT NULL DEFAULT '3',
  `CPromAsimilador` float NOT NULL DEFAULT '3',
  `CPromConvergente` float NOT NULL DEFAULT '3',
  `CPromDivergente` float NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `enlace`
--

INSERT INTO `enlace` (`Link`, `Titulo`, `Tipo`, `CPromAcomodador`, `CPromAsimilador`, `CPromConvergente`, `CPromDivergente`) VALUES
('google.cl', 'goooo', 'html', 3, 4.33333, 3, 3),
('http://acer.forestales.upm.es/basicas/udfisica/asignaturas/fisica/electro/campo_electr.html', 'Electrostática. Campo eléctrico y líneas de campo', 'html', 3, 4.33333, 3, 3),
('http://acer.forestales.upm.es/basicas/udfisica/asignaturas/fisica/magnet/ampere.html', 'Magnetismo. Ley de Ampère', 'html', 3, 3, 3, 3),
('http://acer.forestales.upm.es/basicas/udfisica/asignaturas/fisica/magnet/induccion.html', 'Inducción magnética', 'html', 3, 3, 3, 3),
('http://bibliotecadigital.ilce.edu.mx/sites/ciencia/volumen1/ciencia2/44/htm/sec_3.html', 'I. ¿QUÉ SON LAS CARGAS?', 'html', 3, 4.33333, 3, 3),
('http://cidecame.uaeh.edu.mx/lcc/mapa/PROYECTO/libro16/36_ley_de_lenz.html', '3.6 Ley de Lenz', 'html', 3, 3, 3, 3),
('http://conceptodefinicion.de/carga-electrica/', '¿Qué es Carga Eléctrica? - Su Definición, Concepto y Significado', 'html', 4.5, 4.5, 3, 3),
('http://definicion.de/carga-electrica/', 'Definición de carga eléctrica - Qué es, Significado y Concepto', 'html', 3, 4.33333, 3, 3),
('http://espaciociencia.com/ley-de-coulomb-formula/', 'Ley de Coulomb | Fórmula - EspacioCiencia.com', 'html', 3, 3, 3, 3),
('http://farside.ph.utexas.edu/teaching/302l/lectures/node75.html', 'Ampère\'s Circuital Law', 'html', 3, 3, 3, 3),
('http://hyperphysics.phy-astr.gsu.edu/hbasees/electric/elecur.html', 'Corriente Eléctrica', 'html', 3, 4.33333, 3, 3),
('http://hyperphysics.phy-astr.gsu.edu/hbasees/electric/elefor.html', 'ley de Coulomb', 'html', 3, 3, 3, 3),
('http://hyperphysics.phy-astr.gsu.edu/hbasees/electric/farlaw.html', 'ley de Faraday', 'html', 3, 3, 3, 3),
('http://hyperphysics.phy-astr.gsu.edu/hbasees/magnetic/amplaw.html', 'ley de Ampere', 'html', 3, 3, 3, 3),
('http://ing.unne.edu.ar/pub/fisica3/170308/teo/teo1.pdf', 'UNIDAD I: CARGA Y CAMPO ELECTRICO', 'pdf', 3, 4.33333, 3, 3),
('http://intercentres.edu.gva.es/iesleonardodavinci/Fisica/Magnetismo/Ley_de_Ampere.pdf', 'LEY DE AMPERE', 'pdf', 3, 3, 3, 3),
('http://ith.mx/documentos/Carreras/Electrica/Programas%20IELE-2010-209/AE020-Electromagnetismo.pdf', 'Electromagnetismo', 'pdf', 3, 3, 3, 3),
('http://laplace.us.es/wiki/index.php/Ley_de_Faraday_(GIE)', 'Ley de Faraday (GIE)', 'html', 3, 3, 3, 3),
('http://materias.fi.uba.ar/6203/Download/Teoricas/9-Ley%20de%20Ampere.pdf', 'LEY DE AMPERE y Ley de Gauss', 'pdf', 3, 3, 3, 3),
('http://maxwell.ugr.es/bgarcia/Fundamentos-em.pdf', 'Fundamentos de Electromagnetismo', 'pdf', 3, 3, 3, 3),
('http://ocw.uc3m.es/fisica/fisica-ii/clases/OCW-FISII-Tema01.pdf', 'Tema 1. Ley de Coulomb', 'pdf', 3, 3, 3, 3),
('http://oyc.yale.edu/node/836', 'Ampere\'s Law', 'html', 3, 3, 3, 3),
('http://oyc.yale.edu/node/837', 'Lenz\'s and Faraday\'s Laws', 'html', 3, 3, 3, 3),
('http://vitela.javerianacali.edu.co/handle/11522/3277', 'Electromagnetismo para ingeniería electrónica : campos y ondas ...', 'html', 3, 3, 3, 3),
('http://www.areatecnologia.com/videos/CARGAS%20ELECTRICAS.htm', 'Ley de Coulomb y Carga Electrica Aprende Facil', 'htm', 3, 4.33333, 3, 3),
('http://www.bdigital.unal.edu.co/45116/1/9789587612837.pdf', 'FÍSICA Principios de Electricidad y Magnetismo', 'pdf', 3, 3, 3, 3),
('http://www.bdigital.unal.edu.co/9319/6/9589322719.2001.pdf', 'ELECTROMAGNETISMO Y FÍSICA MODERNA', 'pdf', 3, 3, 3, 3),
('http://www.cecyt1.ipn.mx/Documents/FisicaIV.pdf', 'APUNTES DE FÍSICA IV', 'pdf', 3, 3, 3, 3),
('http://www.endesaeduca.com/Endesa_educa/recursos-interactivos/conceptos-basicos/ii.-la-naturaleza-electrica-de-la-materia', 'La naturaleza eléctrica de la materia | ENDESA EDUCA', 'html', 3, 4.33333, 3, 3),
('http://www.endesaeduca.com/Endesa_educa/recursos-interactivos/conceptos-basicos/iv.-electromagnetismo', 'Electromagnetismo | ENDESA EDUCA', 'html', 3, 3, 3, 3),
('http://www.familyscience.org/pdfs/Sample%20Activities/Charge%20It_Spanish.pdf', 'Cargas eléctricas', 'pdf', 3, 4.33333, 3, 3),
('http://www.fiq.unl.edu.ar/galileo/download/documentos/ampere.pdf', 'Ley de Ampere – Maxwell : Una discusión conceptual con ayuda de ...', 'pdf', 3, 3, 3, 3),
('http://www.fis.usb.ve/Ley_Ampere_Cap_34.pdf', 'Ley de Ampère (pdf)', 'pdf', 3, 3, 3, 3),
('http://www.fisicapractica.com/carga-electrica-2.php', 'Carga eléctrica - FisicaPractica.Com', 'php', 3, 4.33333, 3, 3),
('http://www.hiru.eus/fisica/carga-electrica-y-circuitos', 'La carga eléctrica. Ley de Coulomb - hiru.eus', 'html', 3, 4.33333, 3, 3),
('http://www.hiru.eus/fisica/fuerzas-entre-corrientes-electricas-primera-ley-de-ampere', 'Fuerzas entre corrientes eléctricas. Primera ley de Ampère - hiru.eus', 'html', 3, 3, 3, 3),
('http://www.hiru.eus/fisica/ley-de-faraday-henry', 'Ley de Faraday-Henry - hiru.eus', 'html', 3, 3, 3, 3),
('http://www.ib.edu.ar/becaib/cd-ib/trabajos/LopezL.pdf', 'LEY DE FARADAY-LENZ', 'pdf', 3, 3, 3, 3),
('http://www.iesbajoaragon.com/~fisica/fisica2/EM/indiceem.htm', 'Índice Electromagnetismo', 'htm', 3, 3, 3, 3),
('http://www.lawebdefisica.com/rama/em.php', 'La web de Física - Electromagnetismo', 'php', 3, 3, 3, 3),
('http://www.madrimasd.org/cienciaysociedad/taller/fisica/electromagnetismo/', 'Experimentos de física. Electromagnetismo', 'html', 3, 3, 3, 3),
('http://www.profesorenlinea.cl/fisica/ElectricidadCargayCorriente.htm', 'Electricidad: carga y corriente eléctrica', 'htm', 3, 4.33333, 3, 3),
('http://www.profesorenlinea.cl/fisica/ElectricidadLeyCoulomb.html', 'Electricidad: Ley de Coulomb', 'html', 3, 3, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/biblio/bibliografia.htm', 'Bibliografía. Electromagnetismo', 'htm', 3, 3, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/campo_electrico/fuerza/fuerza.htm', 'La ley de Coulomb', 'htm', 3, 4.33333, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/campo_magnetico/ampere/ampere.htm', 'Campo magnético producido por una corriente rectilínea indefinida', 'htm', 3, 3, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/induccion/foucault1/foucault1.htm', 'Movimiento de un imán en un tubo metálico vertical', 'htm', 3, 3, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/induccion/variable/variable.htm', 'Espiras en uncampo magnético variable con el tiempo (I)', 'htm', 3, 3, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/magnetico/cMagnetico.html', 'El solenoide y el toroide', 'html', 3, 3, 3, 3),
('http://www.sc.ehu.es/sbweb/fisica/elecmagnet/mov_campo/mov_campo.html', 'Fuerzas sobre las cargas', 'html', 3, 4.33333, 3, 3),
('http://www.sld.cu/galerias/pdf/sitios/santiagodecuba/electromagnetismo.pdf', 'QUÉ ES EL ELECTROMAGNETISMO Texto e ilustraciones José ...', 'pdf', 3, 3, 3, 3),
('http://www.uib.cat/depart/dfs/GTE/education/industrial/con_maq_electriques/teoria/Teoria%20Oviedo/Primer%20Parcial/Presentaciones%20en%20formato%20PDF/Primer%20parcial%20completo.pdf', 'Tema I: Leyes fundamentales del electromagnetismo Tema I: Leyes ...', 'pdf', 3, 3, 3, 3),
('http://www.uib.cat/depart/dfs/GTE/education/industrial/tec_electronica/teoria/MAGNETISMO.pdf', 'MAGNETISMO', 'pdf', 3, 3, 3, 3),
('http://www.unicoos.com/leccion/fisica/1-bachiller/electricidad/campo-electrico-y-ley-de-coulomb', 'Vídeos de Campo eléctrico y Ley de Coulomb | unicoos.com', 'html', 3, 3, 3, 3),
('https://commons.wikimedia.org/wiki/File:Ley_de_lenz.gif', 'File:Ley de lenz.gif - Wikimedia Commons', 'gif', 3, 3, 3, 3),
('https://departamento.us.es/deye/', 'Departamento de Electrónica y Electromagnetismo | Universidad de ...', 'html', 3, 3, 3, 3),
('https://diccionario.motorgiga.com/electromagnetismo', 'ELECTROMAGNETISMO - Definición - Significado', 'html', 3, 3, 3, 3),
('https://en.wikipedia.org/wiki/Coulomb%27s_law', 'Coulomb\'s law - Wikipedia', 'html', 3, 3, 3, 3),
('https://en.wikipedia.org/wiki/Lenz%27s_law', 'Lenz\'s law - Wikipedia', 'html', 3, 3, 3, 3),
('https://ergodic.ugr.es/efm/', 'Departamento de Electromagnetismo y Física de la Materia ...', 'html', 3, 3, 3, 3),
('https://es.khanacademy.org/science/physics/electric-charge-electric-force-and-voltage/charge-electric-force/v/triboelectric-effect-and-charge', 'Efecto triboeléctrico y carga (video) | Khan Academy', 'html', 3, 3, 3, 3),
('https://es.khanacademy.org/science/physics/magnetic-forces-and-magnetic-fields/magnetic-flux-faradays-law/v/lenzs-law', 'La ley de Lenz (video) | Khan Academy', 'html', 3, 3, 3, 3),
('https://es.wikibooks.org/wiki/Electricidad/Electrost%C3%A1tica/Ley_de_Coulomb', 'Electricidad/Electrostática/Ley de Coulomb - Wikilibros', 'html', 3, 3, 3, 3),
('https://es.wikibooks.org/wiki/F%C3%ADsica/Electromagnetismo', 'Física/Electromagnetismo - Wikilibros', 'html', 3, 3, 3, 3),
('https://es.wikipedia.org/wiki/Carga_el%C3%A9ctrica', 'Carga eléctrica - Wikipedia, la enciclopedia libre', 'html', 4, 4.33333, 3, 3),
('https://es.wikipedia.org/wiki/Electromagnetismo', 'Electromagnetismo - Wikipedia, la enciclopedia libre', 'html', 3, 3, 3, 3),
('https://es.wikipedia.org/wiki/Ley_de_Amp%C3%A8re', 'Ley de Ampère - Wikipedia, la enciclopedia libre', 'html', 3, 3, 3, 3),
('https://es.wikipedia.org/wiki/Ley_de_Coulomb', 'Ley de Coulomb - Wikipedia, la enciclopedia libre', 'html', 3, 3, 3, 3),
('https://es.wikipedia.org/wiki/Ley_de_Lenz', 'Ley de Lenz - Wikipedia, la enciclopedia libre', 'html', 3, 3, 3, 3),
('https://micro.magnet.fsu.edu/electromag/java/lenzlaw/', 'Lenz\'s Law', 'html', 3, 3, 3, 3),
('https://previa.uclm.es/profesorado/ajbarbero/teoria/leccion_induccion_electromagnetica.pdf', 'ley de Faraday', 'pdf', 3, 3, 3, 3),
('https://pt.wikipedia.org/wiki/Carga_el%C3%A9trica', 'Carga elétrica – Wikipédia, a enciclopédia livre', 'html', 4.33333, 4.33333, 3, 3),
('https://pt.wikipedia.org/wiki/Lei_de_Lenz', 'Lei de Lenz – Wikipédia, a enciclopédia livre', 'html', 3, 3, 3, 3),
('https://sites.google.com/site/timesolar/electricidad/electromagnetismo', 'Electromagnetismo - Física en Línea', 'html', 3, 3, 3, 3),
('https://www.definicionabc.com/tecnologia/carga-electrica.php', 'Definición de Carga eléctrica » Concepto en Definición ABC', 'php', 3, 4.33333, 3, 3),
('https://www.ecured.cu/Electromagnetismo', 'Electromagnetismo - EcuRed', 'html', 3, 3, 3, 3),
('https://www.ecured.cu/Ley_de_Ampere', 'Ley de Ampere - EcuRed', 'html', 3, 3, 3, 3),
('https://www.ecured.cu/Ley_de_Coulomb', 'Ley de Coulomb - EcuRed', 'html', 3, 3, 3, 3),
('https://www.educatina.com/s?categoria=ciencias&subcategoria=fisica', 'Educatina - Física', 'html', 3, 3, 3, 3),
('https://www.fisicalab.com/apartado/carga-electrica', 'Carga Eléctrica | Fisicalab', 'html', 3, 4.33333, 3, 3),
('https://www.fisicalab.com/apartado/ley-de-ampere', 'Ley de Ampère | Fisicalab', 'html', 3, 3, 3, 3),
('https://www.fisicalab.com/apartado/ley-de-coulomb', 'Ley de Coulomb | Fisicalab', 'html', 3, 3, 3, 3),
('https://www.geogebra.org/m/xkvhQ8wt', 'Simulador de la Ley de Coulomb - GeoGebra', 'html', 3, 3, 3, 3),
('https://www.nebrija.es/~cmalagon/Fisica_II/transparencias/02-Magnetismo/08-Ley_de_Ampere.pdf', 'Módulo 8: ley de Ampère', 'pdf', 3, 3, 3, 3),
('https://www.slideshare.net/LUISPOWELL/problemas-de-carga-elctrica-y-ley-de-gauss-tappens', 'Problemas (13 Pág. - 37 Probl.) de Carga Eléctrica y Ley de Coulomb', 'html', 3, 3, 3, 3),
('https://www.slideshare.net/mobile/forkar/solucionario-fundamentosdeelectromagnetismoparaingenieriadavidkcheng', 'Solucionario fundamentos-de-electromagnetismo-para-ingenieria ...', 'html', 3, 3, 3, 3),
('https://www.slideshare.net/mobile/juliobarretogarcia/tema-i-ley-de-coulomb-campo-electrico-fisica-ii-iutajs-53391374', 'Tema i ley de coulomb campo electrico fisica ii iutajs', 'html', 3, 3, 3, 3),
('https://www.slideshare.net/mobile/kurtmilach/ley-de-coulomb', 'Ley de coulomb', 'html', 3, 3, 3, 3),
('https://www.slideshare.net/mobile/LevanoHuamactoAlberto/semana6-ley-de-ampere-14349779', 'Semana6 ley de ampere', 'html', 3, 3, 3, 3),
('https://www.slideshare.net/mobile/OmarVargas12/carga-electrica', 'Carga electrica', 'html', 3, 4.33333, 3, 3),
('https://www.slideshare.net/mobile/waterry/ley-de-coulomb-5193816', 'Ley de coulomb', 'html', 3, 3, 3, 3),
('https://www.ucm.es/data/cont/docs/76-2013-11-08-26_01_Lenzs_tube.pdf', 'Tubo de Lenz', 'pdf', 3, 3, 3, 3),
('https://www.xatakaciencia.com/fisica/ralentizando-los-movimientos-gracias-a-la-ley-de-lenz', 'Ralentizando los movimientos gracias a la ley de Lenz', 'html', 3, 3, 3, 3),
('https://www.youtube.com/watch?v=Cp4NVvb9ChM', 'Ley de Ampere - YouTube', 'html', 3, 3, 3, 3),
('https://www.youtube.com/watch?v=DpI38BrrU1c', 'La Ley de Coulomb | MasterD - YouTube', 'html', 3, 3, 3, 3),
('https://www.youtube.com/watch?v=McZPm7tkguQ', 'Carga eléctrica - Física - Educatina - YouTube', 'html', 3, 4.33333, 3, 3),
('https://www.youtube.com/watch?v=UJ6SBaNNvJw', 'Ley de ampere - YouTube', 'html', 3, 3, 3, 3),
('https://www.youtube.com/watch?v=WmFrQpNbeyw', 'Ley de Lenz - YouTube', 'html', 3, 3, 3, 3);

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
