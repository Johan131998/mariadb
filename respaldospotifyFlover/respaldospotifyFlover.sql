-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: spotifyFlover
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Artistas`
--

DROP TABLE IF EXISTS `Artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artistas` (
  `Id_Artista` int(11) NOT NULL AUTO_INCREMENT,
  `Nomb_Artista` varchar(50) DEFAULT NULL,
  `Apell_Artista` varchar(50) DEFAULT NULL,
  `Nomb_Artisto` varchar(100) DEFAULT NULL,
  `Fech_Nacimi` date DEFAULT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Num_aficionados` int(11) NOT NULL,
  `Foto` blob NOT NULL,
  PRIMARY KEY (`Id_Artista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artistas`
--

LOCK TABLES `Artistas` WRITE;
/*!40000 ALTER TABLE `Artistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CD`
--

DROP TABLE IF EXISTS `CD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CD` (
  `Id_CD` int(11) NOT NULL AUTO_INCREMENT,
  `Nomb_CD` varchar(50) DEFAULT NULL,
  `Num_Musicas` int(11) DEFAULT NULL,
  `Id_Artista` int(11) NOT NULL,
  `Fech_Lansamiento` date DEFAULT NULL,
  `Descr_CD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_CD`),
  KEY `Id_Artista` (`Id_Artista`),
  CONSTRAINT `Id_Artista` FOREIGN KEY (`Id_Artista`) REFERENCES `Artistas` (`Id_Artista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CD`
--

LOCK TABLES `CD` WRITE;
/*!40000 ALTER TABLE `CD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccion`
--

DROP TABLE IF EXISTS `Inspeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccion` (
  `Id_Inspeccion` int(11) NOT NULL AUTO_INCREMENT,
  `Procedimi` varchar(50) DEFAULT NULL,
  `Entrad` time DEFAULT NULL,
  `Sali` time DEFAULT NULL,
  PRIMARY KEY (`Id_Inspeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccion`
--

LOCK TABLES `Inspeccion` WRITE;
/*!40000 ALTER TABLE `Inspeccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inspeccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `Id_Login` int(11) NOT NULL AUTO_INCREMENT,
  `Correo_Electronico` varchar(50) DEFAULT NULL,
  `Password_U` varchar(50) DEFAULT NULL,
  `Reset_Password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musica`
--

DROP TABLE IF EXISTS `Musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Musica` (
  `Id_Musica` int(11) NOT NULL AUTO_INCREMENT,
  `Nomb_Musica` varchar(50) DEFAULT NULL,
  `Num_Visitas` int(11) NOT NULL,
  `Duraci_Musica` int(11) NOT NULL,
  `Descr_Musica` varchar(50) DEFAULT NULL,
  `Id_CD` int(11) NOT NULL,
  PRIMARY KEY (`Id_Musica`),
  KEY `Id_CD` (`Id_CD`),
  CONSTRAINT `Id_CD` FOREIGN KEY (`Id_CD`) REFERENCES `CD` (`Id_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Musica`
--

LOCK TABLES `Musica` WRITE;
/*!40000 ALTER TABLE `Musica` DISABLE KEYS */;
/*!40000 ALTER TABLE `Musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musica_Favorito`
--

DROP TABLE IF EXISTS `Musica_Favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Musica_Favorito` (
  `Id_Musica_Favorito` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int(11) NOT NULL,
  `Id_Musica` int(11) NOT NULL,
  PRIMARY KEY (`Id_Musica_Favorito`),
  KEY `Id_Usuario` (`Id_Usuario`),
  KEY `Id_Musica` (`Id_Musica`),
  CONSTRAINT `Id_Musica` FOREIGN KEY (`Id_Musica`) REFERENCES `Musica` (`Id_Musica`),
  CONSTRAINT `Id_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Musica_Favorito`
--

LOCK TABLES `Musica_Favorito` WRITE;
/*!40000 ALTER TABLE `Musica_Favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Musica_Favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recomendacion_Musicas`
--

DROP TABLE IF EXISTS `Recomendacion_Musicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recomendacion_Musicas` (
  `Id_Recomendacion` int(11) NOT NULL AUTO_INCREMENT,
  `Nomb_Recomendacion` varchar(60) DEFAULT NULL,
  `Id_Registro` int(11) NOT NULL,
  `Id_Musica` int(11) NOT NULL,
  PRIMARY KEY (`Id_Recomendacion`),
  KEY `Id_Registro` (`Id_Registro`),
  KEY `Id_MusicaS` (`Id_Musica`),
  CONSTRAINT `Id_MusicaS` FOREIGN KEY (`Id_Musica`) REFERENCES `Musica` (`Id_Musica`),
  CONSTRAINT `Id_Registro` FOREIGN KEY (`Id_Registro`) REFERENCES `Registro_Reproduccion` (`Id_Registro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recomendacion_Musicas`
--

LOCK TABLES `Recomendacion_Musicas` WRITE;
/*!40000 ALTER TABLE `Recomendacion_Musicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recomendacion_Musicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registro_Reproduccion`
--

DROP TABLE IF EXISTS `Registro_Reproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registro_Reproduccion` (
  `Id_Registro` int(11) NOT NULL AUTO_INCREMENT,
  `Nomb_Registro` varchar(50) DEFAULT NULL,
  `Id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Registro`),
  KEY `Id_User` (`Id_Usuario`),
  CONSTRAINT `Id_User` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registro_Reproduccion`
--

LOCK TABLES `Registro_Reproduccion` WRITE;
/*!40000 ALTER TABLE `Registro_Reproduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Registro_Reproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restricion`
--

DROP TABLE IF EXISTS `Restricion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Restricion` (
  `Id_Restricion` int(11) NOT NULL AUTO_INCREMENT,
  `Nomb_Restricion` varchar(50) DEFAULT NULL,
  `Descr_Restricion` varchar(100) DEFAULT NULL,
  `Id_Rol` int(11) NOT NULL,
  PRIMARY KEY (`Id_Restricion`),
  KEY `Id_Rol` (`Id_Rol`),
  CONSTRAINT `Id_Rol` FOREIGN KEY (`Id_Rol`) REFERENCES `Rol` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restricion`
--

LOCK TABLES `Restricion` WRITE;
/*!40000 ALTER TABLE `Restricion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Restricion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rol` (
  `Id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Nomb` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salario`
--

DROP TABLE IF EXISTS `Salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Salario` (
  `Id_Salario` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int(11) NOT NULL,
  `Nomb_SalTarj` varchar(100) DEFAULT NULL,
  `Num_Tarj` varchar(20) DEFAULT NULL,
  `Fech_Vencim` date DEFAULT NULL,
  `codg_Seguri_` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Id_Salario`),
  KEY `Id_Users` (`Id_Usuario`),
  CONSTRAINT `Id_Users` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salario`
--

LOCK TABLES `Salario` WRITE;
/*!40000 ALTER TABLE `Salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seguidor`
--

DROP TABLE IF EXISTS `Seguidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seguidor` (
  `Id_Seguidor` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Seguidor`),
  KEY `Id_Usuarios` (`Id_Usuario`),
  CONSTRAINT `Id_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seguidor`
--

LOCK TABLES `Seguidor` WRITE;
/*!40000 ALTER TABLE `Seguidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Seguidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nomb_Usuario` varchar(50) DEFAULT NULL,
  `Apell_Usuario` varchar(50) DEFAULT NULL,
  `Fech_Creacion` date DEFAULT NULL,
  `Id_Rol` int(11) NOT NULL,
  `Foto` blob NOT NULL,
  `Id_Login` int(11) NOT NULL,
  PRIMARY KEY (`Id_Usuario`),
  KEY `Id_Rols` (`Id_Rol`),
  KEY `Id_Login` (`Id_Login`),
  CONSTRAINT `Id_Login` FOREIGN KEY (`Id_Login`) REFERENCES `Login` (`Id_Login`),
  CONSTRAINT `Id_Rols` FOREIGN KEY (`Id_Rol`) REFERENCES `Rol` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-30  6:22:42
