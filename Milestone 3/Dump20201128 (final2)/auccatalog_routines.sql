CREATE DATABASE  IF NOT EXISTS `auccatalog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `auccatalog`;
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
-- Temporary view structure for view `prefff2`
--

DROP TABLE IF EXISTS `prefff2`;
/*!50001 DROP VIEW IF EXISTS `prefff2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prefff2` AS SELECT 
 1 AS `pref2code`,
 1 AS `pref2Depart`,
 1 AS `pref2Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `preffff1`
--

DROP TABLE IF EXISTS `preffff1`;
/*!50001 DROP VIEW IF EXISTS `preffff1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `preffff1` AS SELECT 
 1 AS `pref1Code`,
 1 AS `pref1Depart`,
 1 AS `pref1Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prefff1`
--

DROP TABLE IF EXISTS `prefff1`;
/*!50001 DROP VIEW IF EXISTS `prefff1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prefff1` AS SELECT 
 1 AS `pref1Code`,
 1 AS `pref1Depart`,
 1 AS `pref1Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prefffff1`
--

DROP TABLE IF EXISTS `prefffff1`;
/*!50001 DROP VIEW IF EXISTS `prefffff1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prefffff1` AS SELECT 
 1 AS `pref1Code`,
 1 AS `pref1Depart`,
 1 AS `pref1Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prefffff2`
--

DROP TABLE IF EXISTS `prefffff2`;
/*!50001 DROP VIEW IF EXISTS `prefffff2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prefffff2` AS SELECT 
 1 AS `pref2code`,
 1 AS `pref2Depart`,
 1 AS `pref2Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `preff2`
--

DROP TABLE IF EXISTS `preff2`;
/*!50001 DROP VIEW IF EXISTS `preff2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `preff2` AS SELECT 
 1 AS `pref2code`,
 1 AS `pref2Depart`,
 1 AS `pref2Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `preff1`
--

DROP TABLE IF EXISTS `preff1`;
/*!50001 DROP VIEW IF EXISTS `preff1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `preff1` AS SELECT 
 1 AS `pref1Code`,
 1 AS `pref1Depart`,
 1 AS `pref1Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pref1`
--

DROP TABLE IF EXISTS `pref1`;
/*!50001 DROP VIEW IF EXISTS `pref1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pref1` AS SELECT 
 1 AS `CCode`,
 1 AS `Fk_DeptCode`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pref2`
--

DROP TABLE IF EXISTS `pref2`;
/*!50001 DROP VIEW IF EXISTS `pref2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pref2` AS SELECT 
 1 AS `CCode`,
 1 AS `Fk_DeptCode`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `prefff2`
--

/*!50001 DROP VIEW IF EXISTS `prefff2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prefff2` AS select `course`.`CCode` AS `pref2code`,`course`.`Fk_DeptCode` AS `pref2Depart`,`course`.`Name` AS `pref2Name` from (((`course` join `coursesemesteroffered` on(((`course`.`CCode` = `coursesemesteroffered`.`Fks_CourseNo`) and (`course`.`CCode` = `coursesemesteroffered`.`Fks_CourseDept`)))) join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) left join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) where (((`studentcoursescompleted`.`Fkc_CourseDept` is null) and (`studentcoursescompleted`.`Fkc_CourseNo` is null) and (`coursesemesteroffered`.`Semester` = 'Spring')) or (`coursesemesteroffered`.`Semester` = 'NA')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `preffff1`
--

/*!50001 DROP VIEW IF EXISTS `preffff1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `preffff1` AS select `course`.`CCode` AS `pref1Code`,`course`.`Fk_DeptCode` AS `pref1Depart`,`course`.`Name` AS `pref1Name` from (((`course` join `coursesemesteroffered` on(((`course`.`CCode` = `coursesemesteroffered`.`Fks_CourseNo`) and (`course`.`CCode` = `coursesemesteroffered`.`Fks_CourseDept`)))) join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prefff1`
--

/*!50001 DROP VIEW IF EXISTS `prefff1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prefff1` AS select `course`.`CCode` AS `pref1Code`,`course`.`Fk_DeptCode` AS `pref1Depart`,`course`.`Name` AS `pref1Name` from (((`course` join `coursesemesteroffered` on(((`course`.`CCode` = `coursesemesteroffered`.`Fks_CourseNo`) and (`course`.`CCode` = `coursesemesteroffered`.`Fks_CourseDept`)))) join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) where ((`coursesemesteroffered`.`Semester` = 'Spring') or (`coursesemesteroffered`.`Semester` = 'NA')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prefffff1`
--

/*!50001 DROP VIEW IF EXISTS `prefffff1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prefffff1` AS select `course`.`CCode` AS `pref1Code`,`course`.`Fk_DeptCode` AS `pref1Depart`,`course`.`Name` AS `pref1Name` from (((`course` join `coursesemesteroffered` on(((`course`.`CCode` = `coursesemesteroffered`.`Fks_CourseNo`) and (`course`.`Fk_DeptCode` = `coursesemesteroffered`.`Fks_CourseDept`)))) join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) where ((`coursesemesteroffered`.`Semester` = 'Spring') or (`coursesemesteroffered`.`Semester` = 'NA')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prefffff2`
--

/*!50001 DROP VIEW IF EXISTS `prefffff2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prefffff2` AS select `course`.`CCode` AS `pref2code`,`course`.`Fk_DeptCode` AS `pref2Depart`,`course`.`Name` AS `pref2Name` from (((`course` join `coursesemesteroffered` on(((`course`.`CCode` = `coursesemesteroffered`.`Fks_CourseNo`) and (`course`.`Fk_DeptCode` = `coursesemesteroffered`.`Fks_CourseDept`)))) join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) left join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) where (((`studentcoursescompleted`.`Fkc_CourseDept` is null) and (`studentcoursescompleted`.`Fkc_CourseNo` is null) and (`coursesemesteroffered`.`Semester` = 'Spring')) or (`coursesemesteroffered`.`Semester` = 'NA')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `preff2`
--

/*!50001 DROP VIEW IF EXISTS `preff2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `preff2` AS select `course`.`CCode` AS `pref2code`,`course`.`Fk_DeptCode` AS `pref2Depart`,`course`.`Name` AS `pref2Name` from ((`course` join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) left join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) where ((`studentcoursescompleted`.`Fkc_CourseDept` is null) and (`studentcoursescompleted`.`Fkc_CourseNo` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `preff1`
--

/*!50001 DROP VIEW IF EXISTS `preff1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `preff1` AS select `course`.`CCode` AS `pref1Code`,`course`.`Fk_DeptCode` AS `pref1Depart`,`course`.`Name` AS `pref1Name` from ((`course` join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pref1`
--

/*!50001 DROP VIEW IF EXISTS `pref1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pref1` AS select `course`.`CCode` AS `CCode`,`course`.`Fk_DeptCode` AS `Fk_DeptCode`,`course`.`Name` AS `Name` from ((`course` join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pref2`
--

/*!50001 DROP VIEW IF EXISTS `pref2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pref2` AS select `course`.`CCode` AS `CCode`,`course`.`Fk_DeptCode` AS `Fk_DeptCode`,`course`.`Name` AS `Name` from ((`course` join `courseprereq` on(((`course`.`Fk_DeptCode` = `courseprereq`.`Fk_CourseDept`) and (`course`.`CCode` = `courseprereq`.`Fk_CourseNo`)))) left join `studentcoursescompleted` on(((`courseprereq`.`Fk_PreCourseDept` = `studentcoursescompleted`.`Fkc_CourseDept`) and (`courseprereq`.`Fk_PreCourseNo` = `studentcoursescompleted`.`Fkc_CourseNo`) and (`studentcoursescompleted`.`Fkc_studentID` = '900161697')))) where ((`studentcoursescompleted`.`Fkc_CourseDept` is null) and (`studentcoursescompleted`.`Fkc_CourseNo` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'auccatalog'
--

--
-- Dumping routines for database 'auccatalog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-28 22:48:18
