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
INSERT INTO `Arbitro` VALUES (1,'Stefan','Salvator',6,'AR'),(2,'Bonnie','Bennett',5,'BI'),(3,'Elena','Gilbert',6,'GE'),(4,'Ian','Somerhalder',6,'AL'),(5,'Paul','Wesley',5,'FK'),(6,'Nina','Dobrev',4,'IL'),(7,'Damon','Salvator',5,'JM'),(8,'Matt','Donovan',6,'KP'),(9,'Tyler','Lockwood',5,'AR'),(10,'Klaus','Mikaelson',5,'GE'),(11,'Caroline','Forbes',6,'GE'),(12,'Barry','Allen',6,'AL'),(13,'Caitlin','Snow',4,'FK'),(14,'Iris','West',4,'IL'),(15,'Grant','Gastin',6,'JM'),(16,'Oliver','Queen',5,'KP'),(17,'Cisco','Ramon',6,'AR'),(18,'Joe','West',6,'BI'),(19,'Harry','Wells',5,'GE'),(20,'Felicity','Smoak',5,'AL'),(21,'Luke','Skywalker',4,'FK'),(22,'Han','Solo',6,'IL'),(23,'Obi-Wan','Kenobi',5,'JM'),(24,'Leia','Skywalker',6,'KP'),(25,'Angeles','Rinaldi',4,'AR'),(26,'Nicolas','Jackson',4,'BI'),(27,'Marianela','Chaves',5,'GE'),(28,'Pedro','Rami­rez',6,'AL'),(29,'Luna','Trigo',5,'FK'),(30,'Jazmin','Ordenaz',5,'IL'),(31,'Ramiro','Romero',5,'JM'),(32,'Agusti­n','Garcia',6,'KP'),(33,'Jose','Johnson',4,'AR'),(34,'Jane','Doe',6,'BI'),(35,'Claudia','Guzman',6,'GE'),(36,'Silvio','Martinez',5,'AR'),(37,'Sara','Castiera',6,'AR'),(38,'Federico','Nuñez',6,'IL'),(39,'Gonzalo','Pereira',6,'JM'),(40,'Romina','Garmendia',6,'AR');
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
  `tipo` char(1) NOT NULL,
  `edadMin` smallint(5) unsigned NOT NULL,
  `edadMax` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (1,'M','I',18,25),(2,'M','I',18,25),(3,'M','I',18,25),(4,'M','I',18,25),(5,'M','I',18,25),(6,'M','I',18,25),(7,'M','I',18,25),(8,'M','I',18,25),(9,'M','I',18,25),(10,'M','I',18,25),(11,'M','I',26,31),(12,'M','I',26,31),(13,'M','I',26,31),(14,'M','I',26,31),(15,'M','I',26,31),(16,'M','I',26,31),(17,'M','I',26,31),(18,'M','I',26,31),(19,'M','I',26,31),(20,'M','I',26,31),(21,'M','I',26,31),(22,'M','I',31,35),(23,'M','I',31,35),(24,'M','I',31,35),(25,'M','I',31,35),(26,'M','I',31,35),(27,'M','I',31,35),(28,'M','I',31,35),(29,'M','I',31,35),(30,'M','I',31,35),(31,'M','I',31,35),(32,'M','I',31,35),(33,'M','E',18,25),(34,'M','E',26,31),(35,'M','E',31,35),(36,'F','I',18,25),(37,'F','I',18,25),(38,'F','I',18,25),(39,'F','I',18,25),(40,'F','I',18,25),(41,'F','I',18,25),(42,'F','I',18,25),(43,'F','I',18,25),(44,'F','I',18,25),(45,'F','I',18,25),(46,'F','I',18,25),(47,'F','I',26,31),(48,'F','I',26,31),(49,'F','I',26,31),(50,'F','I',26,31),(51,'F','I',26,31),(52,'F','I',26,31),(53,'F','I',26,31),(54,'F','I',26,31),(55,'F','I',26,31),(56,'F','I',26,31),(57,'F','I',26,31),(58,'F','I',31,35),(59,'F','I',31,35),(60,'F','I',31,35),(61,'F','I',31,35),(62,'F','I',31,35),(63,'F','I',31,35),(64,'F','I',31,35),(65,'F','I',31,35),(66,'F','I',31,35),(67,'F','I',31,35),(68,'F','I',31,35),(69,'F','E',0,0),(70,'F','E',0,0),(72,'M','I',18,25),(73,'M','E',0,0),(74,'M','E',0,0);
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
  `pesoMin` tinyint(3) unsigned NOT NULL,
  `pesoMax` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `fk_categoriaCombateIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaCombateIndividual`
--

LOCK TABLES `CategoriaCombateIndividual` WRITE;
/*!40000 ALTER TABLE `CategoriaCombateIndividual` DISABLE KEYS */;
INSERT INTO `CategoriaCombateIndividual` VALUES (1,71,80),(2,81,100),(11,60,70),(12,71,80),(13,81,100),(22,60,70),(23,71,80),(24,81,100),(36,60,70),(37,71,80),(38,81,100),(47,60,70),(48,71,80),(49,81,100),(58,60,70),(59,71,80),(60,81,100);
/*!40000 ALTER TABLE `CategoriaCombateIndividual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriaFormasIndividual`
--

DROP TABLE IF EXISTS `CategoriaFormasIndividual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaFormasIndividual` (
  `id_categoria` smallint(5) unsigned NOT NULL,
  `graduacion` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `fk_categoriaFormasIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaFormasIndividual`
--

LOCK TABLES `CategoriaFormasIndividual` WRITE;
/*!40000 ALTER TABLE `CategoriaFormasIndividual` DISABLE KEYS */;
INSERT INTO `CategoriaFormasIndividual` VALUES (3,1),(4,2),(5,3),(6,4),(7,5),(8,6),(14,1),(15,2),(16,3),(17,4),(18,5),(19,6),(25,1),(26,2),(27,3),(28,4),(29,5),(30,6),(39,1),(40,2),(41,3),(42,4),(43,5),(44,6),(50,1),(51,2),(52,3),(53,4),(54,5),(55,6),(61,1),(62,2),(63,3),(64,4),(65,5),(66,6);
/*!40000 ALTER TABLE `CategoriaFormasIndividual` ENABLE KEYS */;
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
INSERT INTO `CategoriaIndividual` VALUES (1,'C'),(2,'C'),(3,'F'),(4,'F'),(5,'F'),(6,'F'),(7,'F'),(8,'F'),(9,'S'),(10,'R'),(11,'C'),(12,'C'),(13,'C'),(14,'F'),(15,'F'),(16,'F'),(17,'F'),(18,'F'),(19,'F'),(20,'S'),(21,'R'),(22,'C'),(23,'C'),(24,'C'),(25,'F'),(26,'F'),(27,'F'),(28,'F'),(29,'F'),(30,'F'),(31,'S'),(32,'R'),(36,'C'),(37,'C'),(38,'C'),(39,'F'),(40,'F'),(41,'F'),(42,'F'),(43,'F'),(44,'F'),(45,'S'),(46,'R'),(47,'C'),(48,'C'),(49,'C'),(50,'F'),(51,'F'),(52,'F'),(53,'F'),(54,'F'),(55,'F'),(56,'S'),(57,'R'),(58,'C'),(59,'C'),(60,'C'),(61,'F'),(62,'F'),(63,'F'),(64,'F'),(65,'F'),(66,'F'),(67,'S');
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
  `tipo` varchar(1) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  CONSTRAINT `fk_categoriaPorEquipos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaPorEquipos`
--

LOCK TABLES `CategoriaPorEquipos` WRITE;
/*!40000 ALTER TABLE `CategoriaPorEquipos` DISABLE KEYS */;
INSERT INTO `CategoriaPorEquipos` VALUES (69,'F'),(70,'C'),(73,'F'),(74,'C');
/*!40000 ALTER TABLE `CategoriaPorEquipos` ENABLE KEYS */;
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
  CONSTRAINT `fk_coach_participante` FOREIGN KEY (`id_itf`) REFERENCES `Participante` (`id_itf`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coach`
--

LOCK TABLES `Coach` WRITE;
/*!40000 ALTER TABLE `Coach` DISABLE KEYS */;
INSERT INTO `Coach` VALUES (6),(12),(18),(24),(30),(36),(42),(48),(54),(60);
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
  `dni` varchar(8) NOT NULL,
  `genero` char(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `peso` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_itf`),
  CONSTRAINT `fk_competidor_participante` FOREIGN KEY (`id_itf`) REFERENCES `Participante` (`id_itf`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competidor`
--

LOCK TABLES `Competidor` WRITE;
/*!40000 ALTER TABLE `Competidor` DISABLE KEYS */;
INSERT INTO `Competidor` VALUES (1,'38474943','F','1985-02-14',91),(2,'39574938','F','1986-03-23',76),(3,'34914785','F','1991-01-30',92),(4,'31472383','F','1984-10-29',79),(5,'37483931','F','1986-12-26',70),(6,'31947492','F','1989-05-16',74),(7,'39025385','F','1983-07-10',83),(8,'31749253','M','1987-11-19',94),(9,'32854037','M','1988-06-22',84),(10,'31482749','M','1984-04-10',85),(11,'36294729','M','1982-05-12',73),(12,'39173921','M','1981-10-06',81),(13,'37162847','M','1989-12-18',78),(14,'39375916','M','1986-02-11',93),(15,'39173638','M','1983-02-01',88),(16,'31728372','F','1985-03-01',85),(17,'38162834','F','1987-06-29',85),(18,'37192739','F','1981-10-31',90),(19,'37163905','F','1983-11-02',89),(20,'38193056','F','1984-07-15',81),(21,'38263917','F','1989-07-16',77),(22,'36382600','F','1990-05-10',73),(23,'38474901','F','1985-02-14',89),(24,'39574902','M','1986-03-23',94),(25,'34914703','M','1991-01-30',95),(26,'31472304','M','1984-10-29',71),(27,'37483905','M','1986-12-26',90),(28,'31947406','M','1989-05-16',86),(29,'39025807','M','1983-07-10',83),(30,'31749208','M','1987-11-19',92),(31,'32854009','M','1988-06-22',75),(32,'36382610','F','1990-05-10',80),(33,'38474911','F','1985-02-14',92),(34,'35749312','F','1986-03-23',70),(35,'34914713','F','1991-01-30',91),(36,'31472314','F','1984-10-29',93),(37,'37439315','F','1986-12-26',86),(38,'31947416','F','1989-05-16',74),(39,'39025317','F','1983-07-10',84),(40,'31749218','M','1987-11-19',79),(41,'32854019','M','1988-06-22',88),(42,'36382620','M','1990-05-10',89),(43,'38474941','M','1985-02-14',87),(44,'39574932','M','1986-03-23',73),(45,'34914783','M','1991-01-30',87),(46,'31472384','M','1984-10-29',81),(47,'37483935','M','1986-12-26',79),(48,'31947496','F','1989-05-16',87),(49,'39025387','F','1983-07-10',90),(50,'31749258','F','1987-11-19',82),(51,'32854039','F','1988-06-22',78),(52,'36382630','F','1990-05-10',83),(53,'38474931','F','1985-02-14',95),(54,'39574932','F','1986-03-23',85),(55,'34914733','F','1991-01-30',91),(56,'31472334','M','1984-10-29',84),(57,'37483935','M','1986-12-26',73),(58,'31947436','M','1989-05-16',82),(59,'39025337','M','1983-07-10',70),(60,'31749238','M','1987-11-19',70),(61,'32854039','M','1988-06-22',93),(62,'31749240','M','1989-07-16',82),(63,'32854041','M','1990-05-10',88),(64,'38673121','M','1995-06-21',80);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipo`
--

LOCK TABLES `Equipo` WRITE;
/*!40000 ALTER TABLE `Equipo` DISABLE KEYS */;
INSERT INTO `Equipo` VALUES (1,'Asereje'),(2,'Karate Kid'),(3,'Los 5 Mejores'),(4,'The Beatles'),(5,'Los Guardianes del Taekwondo'),(6,'Grupo número 1'),(7,'Rolling Stones'),(8,'Los Anonimos');
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
  PRIMARY KEY (`id_equipo`,`id_itf_competidor`),
  KEY `fk_equipoCompetidores_competidor_idx` (`id_itf_competidor`),
  CONSTRAINT `fk_equipoCompetidor_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`),
  CONSTRAINT `fk_equipoCompetidores_competidor` FOREIGN KEY (`id_itf_competidor`) REFERENCES `Competidor` (`id_itf`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EquipoCompetidor`
--

LOCK TABLES `EquipoCompetidor` WRITE;
/*!40000 ALTER TABLE `EquipoCompetidor` DISABLE KEYS */;
INSERT INTO `EquipoCompetidor` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(6,40),(6,41),(6,42),(6,43),(6,44),(6,45),(6,46),(6,47),(7,48),(7,49),(7,50),(7,51),(7,52),(7,53),(7,54),(7,55),(8,56),(8,57),(8,58),(8,59),(8,60),(8,61),(8,62),(8,63),(1,64);
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
  `codigo_pais` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_escuela`),
  KEY `fk_escuela_maestro` (`placa_maestro`),
  CONSTRAINT `fk_escuela_maestro` FOREIGN KEY (`placa_maestro`) REFERENCES `Maestro` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escuela`
--

LOCK TABLES `Escuela` WRITE;
/*!40000 ALTER TABLE `Escuela` DISABLE KEYS */;
INSERT INTO `Escuela` VALUES (1,'Club Argentino de Wushu, Sede Central',1,'AE'),(2,'Escuela Argentina de Taekwondo',2,'AF'),(3,'Escuela Fraternidad de Taekwondo',3,'AG'),(4,'Taekwon - Do - Sasil - Do - Escuela de Taekwondo',4,'AI'),(5,'Organizacion Escuela Argentina de Taekwondo Marcial',5,'AL'),(6,'Escuela de Taekwon-Do Lautaro Gallardo',6,'AM'),(7,'Taekwondo Instituto Pyong-Ahn',7,'AN'),(8,'Taekwondo Seng - Do',8,'AO'),(9,'Taekwondo UGAB',9,'AQ'),(10,'Escuela Integral de Taekwon-Do Marcelo Gonzalez',10,'AR'),(11,'Club Social y Deportivo 12 de Octubre',11,'AS'),(12,'Confederación Argentina de Taekwondo WTF',12,'AT'),(13,'Pitbull Dojo',13,'AU'),(14,'betsubara dojo',14,'AW'),(15,'Asociacion Yusan De Taekwon-do ITF (Sede C. A. Parque Patricios)',15,'AZ'),(16,'Gym Hakkyo - Sede J. L. Borges',16,'BA'),(17,'Escuela de Taekwon-do',17,'BB'),(18,'Unión Taekwon-do Argentina',18,'BD'),(19,'BOSS Lanús',19,'BE'),(20,'Academia ATEIM & ESKBT . KICK BOXING - TAEKWONDO - MUAY THAI',20,'BF'),(21,'Taekwondo Grupo Aguayo - AITFA Moron',21,'BG'),(22,'Gym Hakkyo - Sede Av. Santa Fe',22,'BH');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FuncionArbitraje`
--

LOCK TABLES `FuncionArbitraje` WRITE;
/*!40000 ALTER TABLE `FuncionArbitraje` DISABLE KEYS */;
INSERT INTO `FuncionArbitraje` VALUES (1,'Arbitro Central'),(2,'Presidente de Mesa'),(3,'Juez'),(4,'Suplente');
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
INSERT INTO `InscripcionEquipo` VALUES (1,69),(3,69),(5,69),(7,69),(1,70),(3,70),(5,70),(7,70),(2,73),(4,73),(6,73),(8,73),(2,74),(4,74),(6,74),(8,74);
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
  CONSTRAINT `fk_inscripcionesIndividuales_competidor` FOREIGN KEY (`id_itf_competidor`) REFERENCES `Competidor` (`id_itf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InscripcionIndividual`
--

LOCK TABLES `InscripcionIndividual` WRITE;
/*!40000 ALTER TABLE `InscripcionIndividual` DISABLE KEYS */;
INSERT INTO `InscripcionIndividual` VALUES (64,1),(64,9),(8,10),(64,10),(8,11),(60,11),(13,12),(31,12),(40,12),(44,12),(47,12),(57,12),(8,13),(9,13),(14,13),(24,13),(25,13),(27,13),(28,13),(30,13),(41,13),(42,13),(45,13),(58,13),(61,13),(62,13),(63,13),(8,20),(9,20),(13,20),(14,20),(24,20),(25,20),(27,20),(28,20),(30,20),(31,20),(40,20),(41,20),(42,20),(44,20),(45,20),(47,20),(57,20),(58,20),(60,20),(61,20),(62,20),(63,20),(8,21),(9,21),(13,21),(14,21),(24,21),(25,21),(27,21),(28,21),(30,21),(31,21),(40,21),(41,21),(42,21),(44,21),(45,21),(47,21),(57,21),(58,21),(60,21),(61,21),(62,21),(63,21),(59,22),(11,23),(26,23),(44,23),(47,23),(57,23),(10,24),(14,24),(15,24),(24,24),(27,24),(29,24),(43,24),(46,24),(56,24),(10,31),(11,31),(14,31),(15,31),(24,31),(26,31),(27,31),(29,31),(43,31),(44,31),(46,31),(47,31),(56,31),(57,31),(59,31),(10,32),(11,32),(14,32),(15,32),(24,32),(26,32),(27,32),(29,32),(43,32),(44,32),(46,32),(47,32),(56,32),(57,32),(59,32),(5,47),(34,47),(2,48),(6,48),(21,48),(22,48),(32,48),(38,48),(51,48),(3,49),(17,49),(35,49),(37,49),(48,49),(50,49),(52,49),(54,49),(55,49),(2,56),(3,56),(5,56),(6,56),(17,56),(21,56),(22,56),(32,56),(34,56),(35,56),(37,56),(38,56),(48,56),(50,56),(51,56),(52,56),(54,56),(55,56),(2,57),(3,57),(5,57),(6,57),(17,57),(21,57),(22,57),(32,57),(34,57),(35,57),(37,57),(38,57),(48,57),(50,57),(51,57),(52,57),(54,57),(55,57),(5,58),(34,58),(2,59),(4,59),(1,60),(7,60),(16,60),(19,60),(20,60),(23,60),(33,60),(36,60),(37,60),(39,60),(49,60),(53,60),(54,60),(1,67),(2,67),(4,67),(5,67),(7,67),(16,67),(19,67),(20,67),(23,67),(33,67),(34,67),(36,67),(37,67),(39,67),(49,67),(53,67),(54,67);
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
INSERT INTO `Maestro` VALUES (1,'Leighton','Meester',4,'AE'),(2,'Blair','Waldorf',1,'AF'),(3,'Penn','Badgley',4,'AG'),(4,'Daniel','Humphrey',1,'AI'),(5,'Ed','Westwick',3,'AL'),(6,'Charles','BartholomewBass',1,'AM'),(7,'Chace','Crawford',3,'AN'),(8,'Nathaniel','Archibald',3,'AO'),(9,'Taylor','Momsen',2,'AQ'),(10,'Jennifer','Humphrey',2,'AR'),(11,'Jessica','Szohr',1,'AS'),(12,'Vanessa','Abrams',6,'AT'),(13,'Kelly','Rutherford',3,'AU'),(14,'Lilian','Wilhelmina Rhodes',4,'AW'),(15,'Matthew','Settle',4,'AZ'),(16,'Rufus','Rufus',4,'BA'),(17,'Michelle','Trachtenberg',5,'BB'),(18,'Georgina','Sparks',1,'BD'),(19,'Kaylee','DeFer',5,'BE'),(20,'Charlotte','Rhodes',4,'BF'),(21,'Zuzanna','Szadkowski',2,'BG'),(22,'Dorotea','Kishlovsky',5,'BH'),(23,'Aarón','Abad',2,'BI'),(24,'Abdalá','Abalos',1,'BJ'),(25,'Abdón','Abarca',2,'BM'),(26,'Abdul','Abendano',2,'BN'),(27,'Abel','Abila',3,'BO'),(28,'Abelardo','Abina',3,'BR'),(29,'Abilio','Abitua',2,'BS'),(30,'Abner','Aboites',1,'BT'),(31,'Abraham','Camahu',1,'BV'),(32,'Absalón','Camarena',1,'BW'),(33,'Acacio','Camargo',6,'BY'),(34,'Accio','Camarillo',5,'BZ'),(35,'Adalberto','Camau',2,'CA'),(36,'Adán','Camberos',4,'CC'),(37,'Adelfo','Cambray',3,'CF'),(38,'Ecio','Camino',3,'CD'),(39,'Edelmar','Campa',4,'CG'),(40,'Edelmiro','Campillo',1,'CH'),(41,'Edén','Campirano',2,'CI'),(42,'Edgar','Campos',6,'CK'),(43,'Edgardo','Camposano',2,'CL'),(44,'Edilio','Gloria',6,'CM'),(45,'Edipo','Gobea',2,'CN'),(46,'Edison','Goche',4,'CO'),(47,'Edmundo','Godina',6,'CR'),(48,'Eduardo','Godines',4,'CS'),(49,'Efraín','Godoi',1,'CU'),(50,'Egidio','Godoy',5,'CV'),(51,'Egisto','Gomes',6,'CX'),(52,'Apolinaria','Goncales',5,'CY'),(53,'Apolonia','Gongora',4,'CZ'),(54,'Aquilina','Heredia',1,'DE'),(55,'Arabela','Hererra',3,'DJ'),(56,'Araceli','Hermoso',5,'DK'),(57,'Aracelli','Hernandes',1,'DM'),(58,'Arantza','Hernandez',4,'DO'),(59,'Aránzazu','Herrada',4,'DZ'),(60,'Arcadia','Herrera',5,'EC'),(61,'Argentina','Herver',5,'EE'),(62,'Argripina','Hibarra',5,'EG'),(63,'Ariadna','Hierro',2,'EH');
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
  `puesto` smallint(5) NOT NULL,
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
INSERT INTO `MedallaEquipo` VALUES (1,69,1),(1,70,1),(2,73,1),(2,74,1),(3,69,2),(3,70,2),(4,73,2),(4,74,2),(5,69,3),(5,70,3),(6,73,3),(6,74,3);
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
  KEY `fk_medallaIndividual_categoria` (`id_categoria`),
  KEY `fk_MedallasIndividuales_1_idx` (`id_itf_competidor`),
  CONSTRAINT `fk_medallaIndividual_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `CategoriaIndividual` (`id_categoria`),
  CONSTRAINT `fk_medallasIndividuales_competidor` FOREIGN KEY (`id_itf_competidor`) REFERENCES `Competidor` (`id_itf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedallaIndividual`
--

LOCK TABLES `MedallaIndividual` WRITE;
/*!40000 ALTER TABLE `MedallaIndividual` DISABLE KEYS */;
INSERT INTO `MedallaIndividual` VALUES (1,60,1),(1,67,1),(2,48,1),(2,56,1),(2,57,1),(2,59,1),(2,67,2),(3,49,1),(3,56,2),(3,57,2),(4,59,2),(4,67,3),(5,47,1),(5,56,3),(5,57,3),(5,58,1),(6,48,2),(7,60,2),(8,13,1),(8,20,1),(8,21,1),(9,13,2),(9,20,2),(9,21,2),(10,24,1),(10,31,1),(10,32,1),(11,23,1),(11,31,2),(11,32,2),(13,12,1),(13,20,3),(13,21,3),(14,13,3),(14,24,2),(14,31,3),(14,32,3),(15,24,3),(16,60,3),(17,49,2),(21,48,3),(26,23,2),(31,12,2),(34,47,2),(34,58,2),(35,49,3),(40,12,3),(44,23,3),(59,22,1),(60,11,1),(64,1,1),(64,9,1),(64,10,1);
/*!40000 ALTER TABLE `MedallaIndividual` ENABLE KEYS */;
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
INSERT INTO `Pais` VALUES ('A1','Anonymous proxy'),('A2','Satellite provider'),('AD','Andorra, Principality of'),('AE','United Arab Emirates'),('AF','Afghanistan, Islamic State of'),('AG','Antigua and Barbuda'),('AI','Anguilla'),('AL','Albania'),('AM','Armenia'),('AN','Netherlands Antilles'),('AO','Angola'),('AQ','Antarctica'),('AR','Argentina'),('AS','American Samoa'),('AT','Austria'),('AU','Australia'),('AW','Aruba'),('AX','Aland Islands'),('AZ','Azerbaidjan'),('BA','Bosnia-Herzegovina'),('BB','Barbados'),('BD','Bangladesh'),('BE','Belgium'),('BF','Burkina Faso'),('BG','Bulgaria'),('BH','Bahrain'),('BI','Burundi'),('BJ','Benin'),('BM','Bermuda'),('BN','Brunei Darussalam'),('BO','Bolivia'),('BR','Brazil'),('BS','Bahamas'),('BT','Bhutan'),('BV','Bouvet Island'),('BW','Botswana'),('BY','Belarus'),('BZ','Belize'),('CA','Canada'),('CC','Cocos (Keeling) Islands'),('CD','Congo, The Democratic Republic of the'),('CF','Central African Republic'),('CG','Congo'),('CH','Switzerland'),('CI','Ivory Coast (Cote D\'Ivoire)'),('CK','Cook Islands'),('CL','Chile'),('CM','Cameroon'),('CN','China'),('CO','Colombia'),('CR','Costa Rica'),('CS','Former Czechoslovakia'),('CU','Cuba'),('CV','Cape Verde'),('CX','Christmas Island'),('CY','Cyprus'),('CZ','Czech Republic'),('DE','Germany'),('DJ','Djibouti'),('DK','Denmark'),('DM','Dominica'),('DO','Dominican Republic'),('DZ','Algeria'),('EC','Ecuador'),('EE','Estonia'),('EG','Egypt'),('EH','Western Sahara'),('ER','Eritrea'),('ES','Spain'),('ET','Ethiopia'),('FI','Finland'),('FJ','Fiji'),('FK','Falkland Islands'),('FM','Micronesia'),('FO','Faroe Islands'),('FR','France'),('FX','France (European Territory)'),('GA','Gabon'),('GB','Great Britain'),('GD','Grenada'),('GE','Georgia'),('GF','French Guyana'),('GH','Ghana'),('GI','Gibraltar'),('GL','Greenland'),('GM','Gambia'),('GN','Guinea'),('GP','Guadeloupe (French)'),('GQ','Equatorial Guinea'),('GR','Greece'),('GS','S. Georgia &amp; S. Sandwich Isls.'),('GT','Guatemala'),('GU','Guam (USA)'),('GW','Guinea Bissau'),('GY','Guyana'),('HK','Hong Kong'),('HM','Heard and McDonald Islands'),('HN','Honduras'),('HR','Croatia'),('HT','Haiti'),('HU','Hungary'),('ID','Indonesia'),('IE','Ireland'),('IL','Israel'),('IM','Isle of Man'),('IN','India'),('IO','British Indian Ocean Territory'),('IQ','Iraq'),('IR','Iran'),('IS','Iceland'),('IT','Italy'),('JE','Jersey'),('JM','Jamaica'),('JO','Jordan'),('JP','Japan'),('KE','Kenya'),('KG','Kyrgyz Republic (Kyrgyzstan)'),('KH','Cambodia, Kingdom of'),('KI','Kiribati'),('KM','Comoros'),('KN','Saint Kitts &amp; Nevis Anguilla'),('KP','North Korea'),('KR','South Korea'),('KW','Kuwait'),('KY','Cayman Islands'),('KZ','Kazakhstan'),('LA','Laos'),('LB','Lebanon'),('LC','Saint Lucia'),('LI','Liechtenstein'),('LK','Sri Lanka'),('LR','Liberia'),('LS','Lesotho'),('LT','Lithuania'),('LU','Luxembourg'),('LV','Latvia'),('LY','Libya'),('MA','Morocco'),('MC','Monaco'),('MD','Moldavia'),('ME','Montenegro'),('MF','Saint Martin'),('MG','Madagascar'),('MH','Marshall Islands'),('MK','Macedonia'),('ML','Mali'),('MM','Myanmar'),('MN','Mongolia'),('MO','Macau'),('MP','Northern Mariana Islands'),('MQ','Martinique (French)'),('MR','Mauritania'),('MS','Montserrat'),('MT','Malta'),('MU','Mauritius'),('MV','Maldives'),('MW','Malawi'),('MX','Mexico'),('MY','Malaysia'),('MZ','Mozambique'),('NA','Namibia'),('NC','New Caledonia (French)'),('NE','Niger'),('NF','Norfolk Island'),('NG','Nigeria'),('NI','Nicaragua'),('NL','Netherlands'),('NO','Norway'),('NP','Nepal'),('NR','Nauru'),('NT','Neutral Zone'),('NU','Niue'),('NZ','New Zealand'),('OM','Oman'),('PA','Panama'),('PE','Peru'),('PF','Polynesia (French)'),('PG','Papua New Guinea'),('PH','Philippines'),('PK','Pakistan'),('PL','Poland'),('PM','Saint Pierre and Miquelon'),('PN','Pitcairn Island'),('PR','Puerto Rico'),('PT','Portugal'),('PW','Palau'),('PY','Paraguay'),('QA','Qatar'),('RE','Reunion (French)'),('RO','Romania'),('RS','Serbia'),('RU','Russian Federation'),('RW','Rwanda'),('SA','Saudi Arabia'),('SB','Solomon Islands'),('SC','Seychelles'),('SD','Sudan'),('SE','Sweden'),('SG','Singapore'),('SH','Saint Helena'),('SI','Slovenia'),('SJ','Svalbard and Jan Mayen Islands'),('SK','Slovak Republic'),('SL','Sierra Leone'),('SM','San Marino'),('SN','Senegal'),('SO','Somalia'),('SR','Suriname'),('ST','Saint Tome (Sao Tome) and Principe'),('SU','Former USSR'),('SV','El Salvador'),('SY','Syria'),('SZ','Swaziland'),('TC','Turks and Caicos Islands'),('TD','Chad'),('TF','French Southern Territories'),('TG','Togo'),('TH','Thailand'),('TJ','Tadjikistan'),('TK','Tokelau'),('TL','East Timor'),('TM','Turkmenistan'),('TN','Tunisia'),('TO','Tonga'),('TP','East Timor'),('TR','Turkey'),('TT','Trinidad and Tobago'),('TV','Tuvalu'),('TW','Taiwan'),('TZ','Tanzania'),('UA','Ukraine'),('UG','Uganda'),('UK','United Kingdom'),('UM','USA Minor Outlying Islands'),('US','United States'),('UY','Uruguay'),('UZ','Uzbekistan'),('VA','Holy See (Vatican City State)'),('VC','Saint Vincent &amp; Grenadines'),('VE','Venezuela'),('VG','Virgin Islands (British)'),('VI','Virgin Islands (USA)'),('VN','Vietnam'),('VU','Vanuatu'),('WF','Wallis and Futuna Islands'),('WS','Samoa'),('YE','Yemen'),('YT','Mayotte'),('YU','Yugoslavia'),('ZA','South Africa'),('ZM','Zambia'),('ZR','Zaire'),('ZW','Zimbabwe'),('\\N','Desconocido');
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
  `tipo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_itf`),
  KEY `id_escuela_idx` (`id_escuela`),
  CONSTRAINT `fk_participante_escuela` FOREIGN KEY (`id_escuela`) REFERENCES `Escuela` (`id_escuela`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participante`
--

LOCK TABLES `Participante` WRITE;
/*!40000 ALTER TABLE `Participante` DISABLE KEYS */;
INSERT INTO `Participante` VALUES (1,'Leighton','Meester','4','NULL',1,'p'),(2,'Blair','Waldorf','1','NULL',1,'p'),(3,'Penn','Badgley','4','NULL',1,'p'),(4,'Daniel','Humphrey','1','NULL',1,'p'),(5,'Ed','Westwick','3','NULL',1,'p'),(6,'Charles','BartholomewBass','1','NULL',1,'h'),(7,'Chace','Crawford','3','NULL',1,'p'),(8,'Nathaniel','Archibald','3','NULL',1,'p'),(9,'Taylor','Momsen','2','NULL',1,'p'),(10,'Jennifer ','Humphrey','2','NULL',1,'p'),(11,'Jessica','Szohr','1','NULL',1,'p'),(12,'Vanessa','Abrams','6','NULL',1,'h'),(13,'Kelly','Rutherford','3','NULL',1,'p'),(14,'Lilian','Wilhelmina Rhodes','4','NULL',1,'p'),(15,'Matthew','Settle','4','NULL',1,'p'),(16,'Rufus','Rufus','4','NULL',2,'p'),(17,'Michelle','Trachtenberg','5','NULL',2,'p'),(18,'Georgina','Sparks','1','NULL',2,'h'),(19,'Kaylee','DeFer','5','NULL',2,'p'),(20,'Charlotte','Rhodes','4','NULL',2,'p'),(21,'Zuzanna','Szadkowski','2','NULL',2,'p'),(22,'Dorotea','Kishlovsky','5','NULL',2,'p'),(23,'Aarón','Abad','2','NULL',2,'p'),(24,'Abdalá','Abalos','1','NULL',2,'h'),(25,'Abdón','Abarca','2','NULL',2,'p'),(26,'Abdul','Abendano','2','NULL',2,'p'),(27,'Abel','Abila','3','NULL',2,'p'),(28,'Abelardo','Abina','3','NULL',2,'p'),(29,'Abilio','Abitua','2','NULL',2,'p'),(30,'Abner','Aboites','1','NULL',2,'h'),(31,'Abraham','Camahu','1','NULL',2,'p'),(32,'Absalón','Camarena','1','NULL',3,'p'),(33,'Acacio','Camargo','6','NULL',3,'p'),(34,'Accio','Camarillo','5','NULL',3,'p'),(35,'Adalberto','Camau','2','NULL',3,'p'),(36,'Adán','Camberos','4','NULL',3,'h'),(37,'Adelfo','Cambray','3','NULL',3,'p'),(38,'Ecio','Camino','3','NULL',3,'p'),(39,'Edelmar','Campa','4','NULL',3,'p'),(40,'Edelmiro','Campillo','1','NULL',3,'p'),(41,'Edén','Campirano','2','NULL',3,'p'),(42,'Edgar','Campos','6','NULL',3,'h'),(43,'Edgardo','Camposano','2','NULL',3,'p'),(44,'Edilio','Gloria','6','NULL',3,'p'),(45,'Edipo','Gobea','2','NULL',3,'p'),(46,'Edison','Goche','4','NULL',3,'p'),(47,'Edmundo','Godina','6','NULL',3,'p'),(48,'Eduardo','Godines','4','NULL',4,'h'),(49,'Efraín','Godoi','1','NULL',4,'p'),(50,'Egidio','Godoy','5','NULL',4,'p'),(51,'Egisto','Gomes','6','NULL',4,'p'),(52,'Apolinaria','Goncales','5','NULL',4,'p'),(53,'Apolonia','Gongora','4','NULL',4,'p'),(54,'Aquilina','Heredia','1','NULL',4,'h'),(55,'Arabela','Hererra','3','NULL',4,'p'),(56,'Araceli','Hermoso','5','NULL',4,'p'),(57,'Aracelli','Hernandes','1','NULL',4,'p'),(58,'Arantza','Hernandez','4','NULL',4,'p'),(59,'Aránzazu','Herrada','4','NULL',4,'p'),(60,'Arcadia','Herrera','5','NULL',4,'h'),(61,'Argentina','Herver','5','NULL',4,'p'),(62,'Argripina','Hibarra','5','NULL',4,'p'),(63,'Ariadna','Hierro','2','NULL',4,'p'),(64,'Axel','Maddonni','8',NULL,1,'p');
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
INSERT INTO `Ring` VALUES (1),(2),(3),(4),(5);
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
INSERT INTO `RingCategoria` VALUES (2,1),(3,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(4,9),(5,10),(2,11),(3,12),(4,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(5,20),(2,21),(3,22),(4,23),(5,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(2,31),(3,32),(4,33),(5,34),(2,35),(3,36),(4,37),(5,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(2,45),(3,46),(4,47),(5,48),(2,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(3,56),(4,57),(5,58),(2,59),(3,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(4,67),(5,68),(2,69),(3,70),(4,72),(5,73),(2,74);
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
INSERT INTO `RingConsejoArbitros` VALUES (1,40,1),(2,1,1),(3,9,1),(4,17,1),(5,25,1),(1,39,2),(2,2,2),(3,10,2),(4,18,2),(5,26,2),(1,35,3),(1,38,3),(2,3,3),(2,5,3),(3,11,3),(3,13,3),(4,19,3),(4,21,3),(5,27,3),(5,30,3),(1,28,4),(1,32,4),(1,34,4),(1,37,4),(2,4,4),(2,6,4),(2,7,4),(2,8,4),(3,12,4),(3,14,4),(3,15,4),(3,16,4),(4,20,4),(4,22,4),(4,23,4),(4,24,4),(5,29,4),(5,31,4),(5,33,4),(5,36,4);
/*!40000 ALTER TABLE `RingConsejoArbitros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foo`
--

DROP TABLE IF EXISTS `foo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foo` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foo`
--

LOCK TABLES `foo` WRITE;
/*!40000 ALTER TABLE `foo` DISABLE KEYS */;
INSERT INTO `foo` VALUES (1,'Tim'),(2,'Jochen');
/*!40000 ALTER TABLE `foo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-19 19:33:24
