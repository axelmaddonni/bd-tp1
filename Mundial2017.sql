-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: Mundial2017
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Arbitro`
--

DROP TABLE IF EXISTS `Arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Arbitro` (
  `placa` smallint(5) unsigned NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL,
  `graduacion` tinyint(3) unsigned NOT NULL,
  `codigo_pais` char(2) NOT NULL,
  PRIMARY KEY (`placa`),
  KEY `fk_arbitro_pais` (`codigo_pais`),
  CONSTRAINT `fk_arbitro_pais` FOREIGN KEY (`codigo_pais`) REFERENCES `Pais` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arbitro`
--

LOCK TABLES `Arbitro` WRITE;
/*!40000 ALTER TABLE `Arbitro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `id_categoria` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sexo` char(1) NOT NULL,
  `id_modalidad` tinyint(3) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `fk_categoria_modalidad` (`id_modalidad`),
  CONSTRAINT `fk_categoria_modalidad` FOREIGN KEY (`id_modalidad`) REFERENCES `Modalidad` (`id_modalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriaCombateIndividual`
--

DROP TABLE IF EXISTS `CategoriaCombateIndividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaCombateIndividual` (
  `id_categoria` smallint(5) unsigned NOT NULL,
  `peso` tinyint(3) unsigned NOT NULL,
  `edad` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `fk_categoriaCombateIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaCombateIndividual`
--

LOCK TABLES `CategoriaCombateIndividual` WRITE;
/*!40000 ALTER TABLE `CategoriaCombateIndividual` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriaCombateIndividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriaFormasIndiviual`
--

DROP TABLE IF EXISTS `CategoriaFormasIndiviual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaFormasIndiviual` (
  `id_categoria` smallint(5) unsigned NOT NULL,
  `edad` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `fk_categoriaFormasIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaFormasIndiviual`
--

LOCK TABLES `CategoriaFormasIndiviual` WRITE;
/*!40000 ALTER TABLE `CategoriaFormasIndiviual` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriaFormasIndiviual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriaIndividual`
--

DROP TABLE IF EXISTS `CategoriaIndividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaIndividual` (
  `id_categoria` smallint(5) unsigned NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `fk_categoriaIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaIndividual`
--

LOCK TABLES `CategoriaIndividual` WRITE;
/*!40000 ALTER TABLE `CategoriaIndividual` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriaIndividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriaPorEquipos`
--

DROP TABLE IF EXISTS `CategoriaPorEquipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaPorEquipos` (
  `id_categoria` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `fk_categoriaPorEquipos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaPorEquipos`
--

LOCK TABLES `CategoriaPorEquipos` WRITE;
/*!40000 ALTER TABLE `CategoriaPorEquipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriaPorEquipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriaSaltoIndividual`
--

DROP TABLE IF EXISTS `CategoriaSaltoIndividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaSaltoIndividual` (
  `id_categoria` smallint(5) unsigned NOT NULL,
  `edad` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `fk_categoriaSaltoIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaSaltoIndividual`
--

LOCK TABLES `CategoriaSaltoIndividual` WRITE;
/*!40000 ALTER TABLE `CategoriaSaltoIndividual` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriaSaltoIndividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coach`
--

DROP TABLE IF EXISTS `Coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coach` (
  `itf` smallint(5) unsigned NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL,
  `id_escuela` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`itf`),
  KEY `fk_coach_escuela` (`id_escuela`),
  CONSTRAINT `fk_coach_escuela` FOREIGN KEY (`id_escuela`) REFERENCES `Escuela` (`id_escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coach`
--

LOCK TABLES `Coach` WRITE;
/*!40000 ALTER TABLE `Coach` DISABLE KEYS */;
/*!40000 ALTER TABLE `Coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Competidor`
--

DROP TABLE IF EXISTS `Competidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Competidor` (
  `dni` smallint(5) unsigned NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL,
  `genero` char(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `peso` tinyint(3) unsigned NOT NULL,
  `graduacion` tinyint(3) unsigned NOT NULL,
  `id_escuela` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_competidor_escuela` (`id_escuela`),
  CONSTRAINT `fk_competidor_escuela` FOREIGN KEY (`id_escuela`) REFERENCES `Escuela` (`id_escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competidor`
--

LOCK TABLES `Competidor` WRITE;
/*!40000 ALTER TABLE `Competidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Competidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipo`
--

DROP TABLE IF EXISTS `Equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Equipo` (
  `id_equipo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipo`
--

LOCK TABLES `Equipo` WRITE;
/*!40000 ALTER TABLE `Equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EquipoCompetidores`
--

DROP TABLE IF EXISTS `EquipoCompetidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EquipoCompetidores` (
  `id_equipo` smallint(5) unsigned NOT NULL,
  `dni_competidor` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_equipo`,`dni_competidor`),
  KEY `fk_equipoCompetidor_competidor` (`dni_competidor`),
  CONSTRAINT `fk_equipoCompetidor_competidor` FOREIGN KEY (`dni_competidor`) REFERENCES `Competidor` (`dni`),
  CONSTRAINT `fk_equipoCompetidor_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EquipoCompetidores`
--

LOCK TABLES `EquipoCompetidores` WRITE;
/*!40000 ALTER TABLE `EquipoCompetidores` DISABLE KEYS */;
/*!40000 ALTER TABLE `EquipoCompetidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escuela`
--

DROP TABLE IF EXISTS `Escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Escuela` (
  `id_escuela` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `placa_maestro` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_escuela`),
  KEY `fk_escuela_maestro` (`placa_maestro`),
  CONSTRAINT `fk_escuela_maestro` FOREIGN KEY (`placa_maestro`) REFERENCES `Maestro` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escuela`
--

LOCK TABLES `Escuela` WRITE;
/*!40000 ALTER TABLE `Escuela` DISABLE KEYS */;
/*!40000 ALTER TABLE `Escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FuncionArbitraje`
--

DROP TABLE IF EXISTS `FuncionArbitraje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FuncionArbitraje` (
  `id_funcion_arbitraje` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  PRIMARY KEY (`id_funcion_arbitraje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FuncionArbitraje`
--

LOCK TABLES `FuncionArbitraje` WRITE;
/*!40000 ALTER TABLE `FuncionArbitraje` DISABLE KEYS */;
/*!40000 ALTER TABLE `FuncionArbitraje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InscripcionesEquipos`
--

DROP TABLE IF EXISTS `InscripcionesEquipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InscripcionesEquipos` (
  `id_equipo` smallint(5) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_equipo`,`id_categoria`),
  KEY `fk_inscripcionEquipo_categoria` (`id_categoria`),
  CONSTRAINT `fk_inscripcionEquipo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaPorEquipos` (`id_categoria`),
  CONSTRAINT `fk_inscripcionEquipo_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InscripcionesEquipos`
--

LOCK TABLES `InscripcionesEquipos` WRITE;
/*!40000 ALTER TABLE `InscripcionesEquipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `InscripcionesEquipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InscripcionesIndividuales`
--

DROP TABLE IF EXISTS `InscripcionesIndividuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InscripcionesIndividuales` (
  `dni_competidor` smallint(5) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`dni_competidor`,`id_categoria`),
  KEY `fk_inscripcionIndividual_categoria` (`id_categoria`),
  CONSTRAINT `fk_inscripcionIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`),
  CONSTRAINT `fk_inscripcionIndividual_competidor` FOREIGN KEY (`dni_competidor`) REFERENCES `Competidor` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InscripcionesIndividuales`
--

LOCK TABLES `InscripcionesIndividuales` WRITE;
/*!40000 ALTER TABLE `InscripcionesIndividuales` DISABLE KEYS */;
/*!40000 ALTER TABLE `InscripcionesIndividuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maestro`
--

DROP TABLE IF EXISTS `Maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maestro` (
  `placa` smallint(5) unsigned NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL,
  `graduacion` tinyint(3) unsigned NOT NULL,
  `codigo_pais` char(2) NOT NULL,
  PRIMARY KEY (`placa`),
  KEY `fk_maestro_pais` (`codigo_pais`),
  CONSTRAINT `fk_maestro_pais` FOREIGN KEY (`codigo_pais`) REFERENCES `Pais` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maestro`
--

LOCK TABLES `Maestro` WRITE;
/*!40000 ALTER TABLE `Maestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedallasEquipos`
--

DROP TABLE IF EXISTS `MedallasEquipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedallasEquipos` (
  `id_equipo` smallint(5) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_equipo`,`id_categoria`),
  KEY `fk_medallaEquipo_categoria` (`id_categoria`),
  CONSTRAINT `fk_medallaEquipo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaPorEquipos` (`id_categoria`),
  CONSTRAINT `fk_medallaEquipo_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedallasEquipos`
--

LOCK TABLES `MedallasEquipos` WRITE;
/*!40000 ALTER TABLE `MedallasEquipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `MedallasEquipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedallasIndividuales`
--

DROP TABLE IF EXISTS `MedallasIndividuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedallasIndividuales` (
  `dni_competidor` smallint(5) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  `puesto` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`dni_competidor`,`id_categoria`),
  KEY `fk_medallaIndividual_categoria` (`id_categoria`),
  CONSTRAINT `fk_medallaIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`),
  CONSTRAINT `fk_medallaIndividual_competidor` FOREIGN KEY (`dni_competidor`) REFERENCES `Competidor` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedallasIndividuales`
--

LOCK TABLES `MedallasIndividuales` WRITE;
/*!40000 ALTER TABLE `MedallasIndividuales` DISABLE KEYS */;
/*!40000 ALTER TABLE `MedallasIndividuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modalidad`
--

DROP TABLE IF EXISTS `Modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Modalidad` (
  `id_modalidad` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_modalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modalidad`
--

LOCK TABLES `Modalidad` WRITE;
/*!40000 ALTER TABLE `Modalidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pais` (
  `codigo` char(2) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ring`
--

DROP TABLE IF EXISTS `Ring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ring` (
  `id_ring` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_ring`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ring`
--

LOCK TABLES `Ring` WRITE;
/*!40000 ALTER TABLE `Ring` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RingCategoria`
--

DROP TABLE IF EXISTS `RingCategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RingCategoria` (
  `id_ring` smallint(5) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_ring`,`id_categoria`),
  KEY `fk_ringCategoria_categoria` (`id_categoria`),
  CONSTRAINT `fk_ringCategoria_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `fk_ringCategoria_ring` FOREIGN KEY (`id_ring`) REFERENCES `Ring` (`id_ring`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RingCategoria`
--

LOCK TABLES `RingCategoria` WRITE;
/*!40000 ALTER TABLE `RingCategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `RingCategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RingConsejoArbitros`
--

DROP TABLE IF EXISTS `RingConsejoArbitros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RingConsejoArbitros` (
  `id_ring` smallint(5) unsigned NOT NULL,
  `placa_arbitro` smallint(5) unsigned NOT NULL,
  `id_funcion_arbitraje` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_ring`,`placa_arbitro`),
  KEY `fk_ringConsejoArbitros_arbitro` (`placa_arbitro`),
  KEY `fk_ringConsejoArbitros_funcionArbitraje` (`id_funcion_arbitraje`),
  CONSTRAINT `fk_ringConsejoArbitros_arbitro` FOREIGN KEY (`placa_arbitro`) REFERENCES `Arbitro` (`placa`),
  CONSTRAINT `fk_ringConsejoArbitros_funcionArbitraje` FOREIGN KEY (`id_funcion_arbitraje`) REFERENCES `FuncionArbitraje` (`id_funcion_arbitraje`),
  CONSTRAINT `fk_ringConsejoArbitros_ring` FOREIGN KEY (`id_ring`) REFERENCES `Ring` (`id_ring`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RingConsejoArbitros`
--

LOCK TABLES `RingConsejoArbitros` WRITE;
/*!40000 ALTER TABLE `RingConsejoArbitros` DISABLE KEYS */;
/*!40000 ALTER TABLE `RingConsejoArbitros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-29 18:32:58
