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
-- Table structure for table `studentcoursescompleted`
--

DROP TABLE IF EXISTS `studentcoursescompleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentcoursescompleted` (
  `Fkc_studentID` varchar(15) NOT NULL,
  `Fkc_CourseDept` varchar(5) NOT NULL,
  `Fkc_CourseNo` varchar(4) NOT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  `Semester` varchar(15) DEFAULT NULL,
  `YEAR` int DEFAULT NULL,
  PRIMARY KEY (`Fkc_studentID`,`Fkc_CourseNo`,`Fkc_CourseDept`),
  KEY `fkc_CourseDept_idx` (`Fkc_CourseDept`),
  KEY `fkc_CourseNo_idx` (`Fkc_CourseNo`),
  CONSTRAINT `fkc_CourseDept` FOREIGN KEY (`Fkc_CourseDept`) REFERENCES `course` (`Fk_DeptCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkc_CourseNo` FOREIGN KEY (`Fkc_CourseNo`) REFERENCES `course` (`CCode`),
  CONSTRAINT `fkc_studentid` FOREIGN KEY (`Fkc_studentID`) REFERENCES `aucstudent` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentcoursescompleted`
--

LOCK TABLES `studentcoursescompleted` WRITE;
/*!40000 ALTER TABLE `studentcoursescompleted` DISABLE KEYS */;
INSERT INTO `studentcoursescompleted` VALUES ('900161697','CSCE','1001','A-','Fall',2016),('900161697','ENGR','1001','A','Fall',2016),('900161697','CHEM','1005','A','Fall',2018),('900161697','ENGR','1005','B+','Winter',2017),('900161697','CORE','1010','A','Spring',2017),('900161697','RHET','1010','B','Spring',2017),('900161697','PHYS','1011','A','Spring',2017),('900161697','CHEM','1015','A','Fall',2018),('900161697','LALT','1020','P','Fall',2017),('900161697','RHET','1020','A','Fall',2017),('900161697','SCI','1020','A','Fall',2017),('900161697','PHYS','1021','A','Summer',2017),('900161697','ANTH','1099','A-','Spring',2018),('900161697','CSCE','1101','A','Spring',2017),('900161697','MACT','1121','A','Fall',2016),('900161697','MACT','1122','A-','Spring',2017),('900161697','MUSC','2000','A','Fall',2019),('900161697','PHIL','2100','A-','Summer',2018),('900161697','ARIC','2102','B+','Fall',2018),('900161697','ENGR','2102','A-','Fall',2017),('900161697','ENGR','2104','A','Summer',2018),('900161697','MACT','2123','A','Spring',2018),('900161697','MACT','2131','A-','Spring',2018),('900161697','MACT','2132','A','Fall',2019),('900161697','MACT','2141','A','Summer',2019),('900161697','CSCE','2201','A','Fall',2017),('900161697','CSCE','2202','C+','Fall',2018),('900161697','PHYS','2211','A-','Fall',2017),('900161697','PHYS','2213','A-','Fall',2017),('900161697','CSCE','2301','A','Spring',2018),('900161697','CSCE','2302','B+','Spring',2018),('900161697','CSCE','2303','A','Spring',2018),('900161697','ENGR','3202','A-','Spring',2020),('900161697','ENGR','3222','A','Winter',2020),('900161697','MACT','3224','A','Winter',2019),('900161697','CSCE','3301','B+','Fall',2018),('900161697','CSCE','3302','A-','Fall',2018),('900161697','CSCE','3303','A','Spring',2019),('900161697','CSCE','3304','C+','Fall',2019),('900161697','CSCE','3401','B+','Spring',2019),('900161697','CSCE','3611','A-','Spring',2020),('900161697','CSCE','3701','C','Fall',2018),('900161697','CSCE','4301','CR','Spring',2020),('900161697','CSCE','4302','CR','Spring',2020),('900161697','CSCE','4411','B+','Fall',2019);
/*!40000 ALTER TABLE `studentcoursescompleted` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11 22:25:52
