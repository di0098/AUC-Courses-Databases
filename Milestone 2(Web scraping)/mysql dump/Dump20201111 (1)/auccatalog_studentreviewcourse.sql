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
-- Table structure for table `studentreviewcourse`
--

DROP TABLE IF EXISTS `studentreviewcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentreviewcourse` (
  `Fkr_studentId` varchar(15) NOT NULL,
  `Fkr_CourseDept` varchar(5) NOT NULL,
  `Fkr_CourseNo` varchar(4) NOT NULL,
  `Rating` int DEFAULT NULL,
  `TextualReview` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Fkr_studentId`,`Fkr_CourseNo`,`Fkr_CourseDept`),
  KEY `fkr_CourseDept_idx` (`Fkr_CourseDept`),
  KEY `fkr_CourseNo_idx` (`Fkr_CourseNo`),
  CONSTRAINT `fkr_CourseDept` FOREIGN KEY (`Fkr_CourseDept`) REFERENCES `course` (`Fk_DeptCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkr_CourseNo` FOREIGN KEY (`Fkr_CourseNo`) REFERENCES `course` (`CCode`),
  CONSTRAINT `fkr_studentid` FOREIGN KEY (`Fkr_studentId`) REFERENCES `aucstudent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentreviewcourse`
--

LOCK TABLES `studentreviewcourse` WRITE;
/*!40000 ALTER TABLE `studentreviewcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentreviewcourse` ENABLE KEYS */;
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
