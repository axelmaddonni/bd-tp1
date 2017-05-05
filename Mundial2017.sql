-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: Mundial2017
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
  `id_itf` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_itf`),
  CONSTRAINT `fk_coach_participante` FOREIGN KEY (`id_itf`) REFERENCES `Participante` (`id_itf`)
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
  `id_itf` int(10) unsigned NOT NULL,
  `dni` smallint(5) unsigned NOT NULL,
  `genero` char(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `peso` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_itf`),
  CONSTRAINT `fk_competidor_participante` FOREIGN KEY (`id_itf`) REFERENCES `Participante` (`id_itf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competidor`
--

LOCK TABLES `Competidor` WRITE;
/*!40000 ALTER TABLE `Competidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Competidor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER chequeo_coach_cada_5_competidores
     BEFORE INSERT ON Competidor FOR EACH ROW
     BEGIN
          DECLARE id_escuela_nuevo_competidor INT;
          SELECT id_escuela INTO id_escuela_nuevo_competidor FROM Participante WHERE id_itf = NEW.id_itf;
          IF ((1 + (SELECT COUNT(c.id_itf) FROM Competidor c join Participante p on c.id_itf = p.id_itf where p.id_escuela = id_escuela_nuevo_competidor)) div 5 > (SELECT COUNT(c.id_itf) FROM Coach c
               JOIN Participante p on c.id_itf = p.id_itf WHERE p.id_escuela = id_escuela_nuevo_competidor))
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'No se puede agregar otro competidor sin agregar otro Coach de la misma escuela';
          END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Table structure for table `EquipoCompetidor`
--

DROP TABLE IF EXISTS `EquipoCompetidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EquipoCompetidor` (
  `id_equipo` smallint(5) unsigned NOT NULL,
  `id_itf_competidor` int(10) unsigned NOT NULL,
  `suplente` int(1) DEFAULT '0',
  PRIMARY KEY (`id_equipo`,`id_itf_competidor`),
  KEY `fk_equipoCompetidor_competidor` (`id_itf_competidor`),
  CONSTRAINT `fk_equipoCompetidor_competidor` FOREIGN KEY (`id_itf_competidor`) REFERENCES `Competidor` (`id_itf`),
  CONSTRAINT `fk_equipoCompetidor_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EquipoCompetidor`
--

LOCK TABLES `EquipoCompetidor` WRITE;
/*!40000 ALTER TABLE `EquipoCompetidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `EquipoCompetidor` ENABLE KEYS */;
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
  `codigo_pais` char(2) NOT NULL,
  PRIMARY KEY (`id_escuela`),
  KEY `fk_escuela_maestro` (`placa_maestro`),
  KEY `fk_escuela_pais` (`codigo_pais`),
  CONSTRAINT `fk_escuela_maestro` FOREIGN KEY (`placa_maestro`) REFERENCES `Maestro` (`placa`),
  CONSTRAINT `fk_escuela_pais` FOREIGN KEY (`codigo_pais`) REFERENCES `Pais` (`codigo`)
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
-- Table structure for table `InscripcionEquipo`
--

DROP TABLE IF EXISTS `InscripcionEquipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InscripcionEquipo` (
  `id_equipo` smallint(5) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_equipo`,`id_categoria`),
  KEY `fk_inscripcionEquipo_categoria` (`id_categoria`),
  CONSTRAINT `fk_inscripcionEquipo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaPorEquipos` (`id_categoria`),
  CONSTRAINT `fk_inscripcionEquipo_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InscripcionEquipo`
--

LOCK TABLES `InscripcionEquipo` WRITE;
/*!40000 ALTER TABLE `InscripcionEquipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `InscripcionEquipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InscripcionIndividual`
--

DROP TABLE IF EXISTS `InscripcionIndividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InscripcionIndividual` (
  `id_itf_competidor` int(10) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_itf_competidor`,`id_categoria`),
  KEY `fk_inscripcionIndividual_categoria` (`id_categoria`),
  CONSTRAINT `fk_inscripcionIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`),
  CONSTRAINT `fk_inscripcionIndividual_competidor` FOREIGN KEY (`id_itf_competidor`) REFERENCES `Competidor` (`id_itf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InscripcionIndividual`
--

LOCK TABLES `InscripcionIndividual` WRITE;
/*!40000 ALTER TABLE `InscripcionIndividual` DISABLE KEYS */;
/*!40000 ALTER TABLE `InscripcionIndividual` ENABLE KEYS */;
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
  PRIMARY KEY (`placa`)
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
-- Table structure for table `MedallaEquipo`
--

DROP TABLE IF EXISTS `MedallaEquipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedallaEquipo` (
  `id_equipo` smallint(5) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  `puesto` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_equipo`,`id_categoria`),
  KEY `fk_medallaEquipo_categoria` (`id_categoria`),
  CONSTRAINT `fk_medallaEquipo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaPorEquipos` (`id_categoria`),
  CONSTRAINT `fk_medallaEquipo_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedallaEquipo`
--

LOCK TABLES `MedallaEquipo` WRITE;
/*!40000 ALTER TABLE `MedallaEquipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `MedallaEquipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedallaIndividual`
--

DROP TABLE IF EXISTS `MedallaIndividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedallaIndividual` (
  `id_itf_competidor` int(10) unsigned NOT NULL,
  `id_categoria` smallint(5) unsigned NOT NULL,
  `puesto` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_itf_competidor`,`id_categoria`),
  KEY `fk_medallaIndividual_categoria` (`id_categoria`),
  CONSTRAINT `fk_medallaIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`),
  CONSTRAINT `fk_medallaIndividual_competidor` FOREIGN KEY (`id_itf_competidor`) REFERENCES `Competidor` (`id_itf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedallaIndividual`
--

LOCK TABLES `MedallaIndividual` WRITE;
/*!40000 ALTER TABLE `MedallaIndividual` DISABLE KEYS */;
/*!40000 ALTER TABLE `MedallaIndividual` ENABLE KEYS */;
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
-- Table structure for table `Participante`
--

DROP TABLE IF EXISTS `Participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Participante` (
  `id_itf` int(10) unsigned NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `graduacion` varchar(45) NOT NULL,
  `foto` longblob,
  `id_escuela` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_itf`),
  KEY `fk_participante_escuela` (`id_escuela`),
  CONSTRAINT `fk_participante_escuela` FOREIGN KEY (`id_escuela`) REFERENCES `Escuela` (`id_escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participante`
--

LOCK TABLES `Participante` WRITE;
/*!40000 ALTER TABLE `Participante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Participante` ENABLE KEYS */;
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

-- Dump completed on 2017-05-05 10:39:15
