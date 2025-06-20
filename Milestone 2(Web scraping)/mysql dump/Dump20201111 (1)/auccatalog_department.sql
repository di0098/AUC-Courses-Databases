-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auccatalog
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dcode` varchar(4) NOT NULL,
  PRIMARY KEY (`Dcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('ACCT'),('AIAS'),('ALIN'),('ALIS'),('ALNG'),('ALWT'),('AMST'),('ANTH'),('APLN'),('ARCH'),('ARIC'),('ARTV'),('BADM'),('BIOL'),('BIOT'),('BUSC'),('CEMS'),('CENG'),('CHEM'),('CORE'),('CREL'),('CSCE'),('DSCI'),('DSGN'),('ECLT'),('ECNG'),('ECON'),('EDUC'),('EGPT'),('ELIN'),('EMBA'),('ENGL'),('ENGR'),('ENTR'),('ENVE'),('FILM'),('FINC'),('GHHE'),('GREN'),('GWST'),('HIST'),('INTB'),('JRMC'),('LALT'),('LAW'),('LING'),('MACT'),('MENG'),('MEST'),('MGMT'),('MKTG'),('MOIS'),('MRS'),('MUSC'),('NANO'),('OPMG'),('PENG'),('PHDE'),('PHDS'),('PHIL'),('PHYS'),('POLS'),('PPAD'),('PSYC'),('RCSS'),('RHET'),('SCI'),('SEMR'),('SOC'),('TEAL'),('THTR'),('TRST'),('TVDJ');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11 22:38:12
