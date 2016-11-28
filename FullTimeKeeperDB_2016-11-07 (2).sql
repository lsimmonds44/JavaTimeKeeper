CREATE DATABASE  IF NOT EXISTS `timekeeperdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `timekeeperdb`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: timekeeperdb
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The unique identifier for Person.',
  `FirstName` varchar(126) CHARACTER SET utf8 NOT NULL COMMENT 'The first name of the person.',
  `LastName` varchar(125) CHARACTER SET utf8 NOT NULL COMMENT 'The last name (surname) of the person.',
  `Password` varchar(125) CHARACTER SET utf8 NOT NULL COMMENT 'The password for the Person.',
  `SecurityRole` varchar(125) CHARACTER SET utf8 NOT NULL COMMENT 'The security role assigned to this person.  References Secur',
  PRIMARY KEY (`ID`),
  KEY `SecurityRole` (`SecurityRole`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`SecurityRole`) REFERENCES `securityrole` (`Role`)
) ENGINE=InnoDB AUTO_INCREMENT=1100044 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='This table contains person data.  Currently it is assumed that all persons are employees.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1100034,'Joaquin','Apple','*E9C014F3457EE3A4DAF2F774D740CE8D8F94ECD1','EMPLOYEE'),(1100035,'Isabella','Grapefruit','*AD3ADAF45AA29B98635023064D912D20A4012606','EMPLOYEE'),(1100036,'Enrik','Tangerine','*81D40F0C480343DAF356E0E94B1A4F6D5D4AE130','EMPLOYEE'),(1100037,'Sara','Apricot','*012C58B5E22E47D2CC51896F0332EEAF61E511EF','MANAGER'),(1100038,'Noah','Guava','*4AC207E3F0D0056F3C9555732D646C6BB366C00F','EMPLOYEE'),(1100039,'Ava','Papaya','*8216BB33DEF949E1F5345B67448268992A759826','EMPLOYEE'),(1100040,'Joe','Test','*9D88E8F0395B7CD4288CB6B74AE44CE5F080B600','EMPLOYEE'),(1100041,'Joe','Test','*9D88E8F0395B7CD4288CB6B74AE44CE5F080B600','EMPLOYEE'),(1100042,'Joe','Test','*9D88E8F0395B7CD4288CB6B74AE44CE5F080B600','EMPLOYEE'),(1100043,'Joe','Test','*9D88E8F0395B7CD4288CB6B74AE44CE5F080B600','EMPLOYEE');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier (surrogate key) for Projects.',
  `ActiveFlag` char(1) CHARACTER SET utf8 NOT NULL DEFAULT 'A' COMMENT 'A flag to denote the state of the Project.  References Proje',
  `Name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'The name of the Project.  There can only be one active proje',
  `Description` text CHARACTER SET utf8 COMMENT 'A free-form text description of the project.',
  PRIMARY KEY (`ID`),
  KEY `ActiveFlag` (`ActiveFlag`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`ActiveFlag`) REFERENCES `projectstate` (`Flag`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='This table stores data regarding specific projects.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (100,'A','Clown Simulator','This is a software project to simulate the effects of a clown.'),(101,'A','Fluffy Bunny','This is a robotic weapons project designed for world domination.'),(102,'A','Basic Accounting','This is basic accounting software.'),(103,'A','Criminal Accounting','This is accounting software designed to manage two sets of books to help hide criminal activity.'),(104,'I','Humanitarian Support','A program for making the world a better place out of the goodness of our hearts.'),(105,'A','Game of Awesomeness','The most awesome game ever.'),(106,'A','Test','A Test Project'),(107,'I','Test','A Test Project');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectstate`
--

DROP TABLE IF EXISTS `projectstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectstate` (
  `Flag` char(1) CHARACTER SET utf8 NOT NULL COMMENT 'The flag character to be used in other tables.',
  `Description` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'A human-readable description of the meaning of the flag.',
  PRIMARY KEY (`Flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Holds the allowed values for Project States.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectstate`
--

LOCK TABLES `projectstate` WRITE;
/*!40000 ALTER TABLE `projectstate` DISABLE KEYS */;
INSERT INTO `projectstate` VALUES ('A','Active'),('I','Inactive');
/*!40000 ALTER TABLE `projectstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securityrole`
--

DROP TABLE IF EXISTS `securityrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securityrole` (
  `Role` varchar(125) CHARACTER SET utf8 NOT NULL COMMENT 'The name of the Role.  This is the primary key.',
  `Description` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'This is a human-readable description of the Role.',
  PRIMARY KEY (`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='A list of allowed roles for the software.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securityrole`
--

LOCK TABLES `securityrole` WRITE;
/*!40000 ALTER TABLE `securityrole` DISABLE KEYS */;
INSERT INTO `securityrole` VALUES ('EMPLOYEE','The general role for all persons employed by the organization.'),('MANAGER','A form of employee who has managerial responsibilities.');
/*!40000 ALTER TABLE `securityrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timerecord`
--

DROP TABLE IF EXISTS `timerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timerecord` (
  `ProjectID` int(11) NOT NULL COMMENT 'References Peroject.ID.',
  `PersonID` int(11) NOT NULL COMMENT 'References Person.ID',
  `TypeCode` char(1) CHARACTER SET utf8 NOT NULL COMMENT 'References TimeRecordType.TypeCode.',
  `RecordTime` datetime NOT NULL COMMENT 'The date and time associated with this record.',
  PRIMARY KEY (`ProjectID`,`PersonID`,`TypeCode`,`RecordTime`),
  KEY `PersonID` (`PersonID`),
  KEY `TypeCode` (`TypeCode`),
  CONSTRAINT `timerecord_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ID`),
  CONSTRAINT `timerecord_ibfk_2` FOREIGN KEY (`PersonID`) REFERENCES `person` (`ID`),
  CONSTRAINT `timerecord_ibfk_3` FOREIGN KEY (`TypeCode`) REFERENCES `timerecordtype` (`TypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table for denoting the start and stop times of a person work';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timerecord`
--

LOCK TABLES `timerecord` WRITE;
/*!40000 ALTER TABLE `timerecord` DISABLE KEYS */;
INSERT INTO `timerecord` VALUES (100,1100034,'E','2016-08-15 14:00:12'),(100,1100035,'E','2016-08-15 20:13:44'),(100,1100034,'S','2016-08-15 15:37:48'),(100,1100034,'S','2016-11-06 22:24:03'),(100,1100035,'S','2016-08-15 14:02:23'),(100,1100036,'S','2016-08-15 14:03:22'),(100,1100036,'S','2016-08-15 21:45:12'),(106,1100034,'S','2016-11-06 22:13:58'),(106,1100034,'S','2016-11-06 22:14:24'),(106,1100034,'S','2016-11-06 22:15:09');
/*!40000 ALTER TABLE `timerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timerecordtype`
--

DROP TABLE IF EXISTS `timerecordtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timerecordtype` (
  `TypeCode` char(1) CHARACTER SET utf8 NOT NULL COMMENT 'A letter designating the time record type.  This is the prim',
  `Description` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'A short, human-readable description of this time record type',
  PRIMARY KEY (`TypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Provides a list of the types of time records available.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timerecordtype`
--

LOCK TABLES `timerecordtype` WRITE;
/*!40000 ALTER TABLE `timerecordtype` DISABLE KEYS */;
INSERT INTO `timerecordtype` VALUES ('E','End'),('S','Start');
/*!40000 ALTER TABLE `timerecordtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'timekeeperdb'
--

--
-- Dumping routines for database 'timekeeperdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `tsp_AddPerson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_AddPerson`(
	IN p_first_name VARCHAR(126)
    , IN p_last_name VARCHAR(125)
    , IN p_password VARCHAR(125)
    , IN p_security_role VARCHAR(125)
)
    COMMENT 'Adds a new Person records to the database and returns the new ID value.'
BEGIN
	INSERT INTO Person(
		FirstName
        , LastName
        , Password
        , SecurityRole
    )
    VALUES(
		p_first_name
        , p_last_name
        , PASSWORd(p_password)
        , p_security_role
    )
    ;
    
    SELECT last_insert_id() AS 'PersonId';


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_AddProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_AddProject`(
	IN p_active_flag CHAR(1)
    , IN p_name VARCHAR(100)
    , IN p_description TEXT
)
    COMMENT 'Adds a new project to the database and returns a result set containing the ID of the new project record.'
BEGIN

	-- Make sure that we have no active projects with the supplied name 
    DECLARE var_activeProjectCount INT;
    SELECT COUNT(DISTINCT name) INTO var_activeProjectCount
    FROM project 
    WHERE ActiveFlag = 'A'
    AND name = p_name
    ;
    
    IF var_activeProjectCount > 0 THEN 
		BEGIN
			SIGNAL SQLSTATE '99999'
            SET MESSAGE_TEXT = 'An active project with that name already exists.';
		END;
    END IF;
    
	-- Survived the check of the business rule, so continue with the insert.
    -- Note that otehr errors may still occur
	INSERT INTO project(ActiveFlag, Name, Description)
    VALUES (p_active_flag, p_name, p_description);
    
    -- Return the new ID value
    SELECT LAST_INSERT_ID() AS 'Project_ID';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_AddTimeRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_AddTimeRecord`(
	IN p_project_id INT 
    , IN p_person_id INT
    , In p_type_code CHAR(1)
)
    COMMENT 'Adds a new time record and returns the time and date assigned.  The type code parameter is S for start or E for end.'
BEGIN
	-- Establish the time and date 
	DECLARE var_record_time DATETIME;
    SET var_record_time = now();
    
    -- Insert the new record, including the time and date
    INSERT INTO timerecord (
		ProjectID
        , PersonID
        , TypeCode
        , RecordTime
    )
    VALUES(p_project_id, p_person_id, p_type_code, var_record_time);
    
    -- Return the time and date
    SELECT var_record_time AS 'Time_And_Date_Assigned';
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_GetActiveProjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_GetActiveProjects`()
    COMMENT 'Returns the data for all active projects, ordered by project name.'
BEGIN
	SELECT 
		ID
        , ActiveFlag
        , Name
        , Description
    FROM project
    WHERE ActiveFlag = 'A'
    ORDER BY Name
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_GetAllPersons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_GetAllPersons`()
    COMMENT 'This procedure returns a list of Person records, without the password.  The records are in alphabetical order by last name, then first name.'
BEGIN
SELECT 
	ID
    , LastName
    , FirstName
    , SecurityRole
FROM Person
ORDER BY
	LastName
    ,FirstName
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_GetAllProjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_GetAllProjects`()
    COMMENT 'Returns all projects,  regardless of whether they are active, ordered by project name.'
BEGIN
	SELECT 
		ID
        , ActiveFlag
        , Name
        , Description
    FROM project
    ORDER BY Name
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_GetPersonById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_GetPersonById`(IN p_id int)
    COMMENT 'Returns the person record where the ID matches.  Note that it does not return the password.'
BEGIN
	SELECT
		ID
		, LastName
		, FirstName
		, SecurityRole
    FROM person
    WHERE ID = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_GetPersonByIdAndPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_GetPersonByIdAndPassword`(
	IN p_id INT 
    , IN p_password VARCHAR(125)
)
    COMMENT 'Returns the matching person record (without password).  This is used for user verification.'
BEGIN
	SELECT
		ID
		, LastName
		, FirstName
		, SecurityRole
    FROM person
    WHERE ID = p_id
    AND PASSWORD(p_password) = person.password
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_GetProjectById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_GetProjectById`(
	IN p_project_id int
)
    COMMENT 'Returns the specified project, or an empty result set if there is no match to the ID.'
BEGIN
	SELECT 
		ID
        , ActiveFlag
        , Name
        , Description
    FROM project
    WHERE ID = p_project_id
    ORDER BY Name
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_GetTimeRecordsByPersonId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_GetTimeRecordsByPersonId`(
	IN p_person_id INT
)
    COMMENT 'Returns all the time records for the specified person, in project order then chronological order, earliest to lateset.'
BEGIN
	SELECT
		ProjectID
        , PersonID
        , TypeCode 
        , RecordTime
    FROM timerecord
    WHERE PersonID = p_person_id
    ORDER BY 
		ProjectID
		, RecordTime
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_GetTimeRecordsByProjectId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_GetTimeRecordsByProjectId`(
	IN p_project_id INT
)
    COMMENT 'Returns all the time records for the specified project, in chronological order, earliest to lateset.'
BEGIN
	SELECT
		ProjectID
        , PersonID
        , TypeCode 
        , RecordTime
    FROM timerecord
    WHERE ProjectID = p_project_id
    ORDER BY RecordTime
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_MarkProjectAsActive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_MarkProjectAsActive`(
	IN p_project_id INT
)
    COMMENT 'Marks the specified project as Active.  It is an error if there is already an active project with the same name.'
BEGIN

	-- Check for an existing active project with the same name 
    DECLARE var_count INT;
    
    SELECT COUNT(name) INTO var_count
    FROM project 
    WHERE ActiveFlag = 'A' 
    AND name IN (
		SELECT name 
        FROM project 
        WHERE ID = p_project_id
    );

	IF var_count > 0 THEN 
		BEGIN
			SIGNAL SQLSTATE '99999'
            SET MESSAGE_TEXT = 'An active project with that name already exists.';
        END;
    END IF;

	-- Update the record
    UPDATE project
    SET ActiveFlag = 'A'
    WHERE ID = p_project_id
    ;
    
	-- Return the number of rows affected
	SELECT ROW_COUNT() AS 'Rows_Affected';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tsp_MarkProjectAsInactive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tsp_MarkProjectAsInactive`(
	IN p_project_id INT
)
    COMMENT 'Sets the ActiveFlag as inactive for the project specified and returns the number of rows affected.'
BEGIN
	UPDATE project 
    SET ActiveFlag = 'I' 
    WHERE ID = p_project_id;
    
    SELECT ROW_COUNT() AS 'Rows_Affected';
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-07 10:49:26

-- Add the database user for Java II
use timekeeperdb;

-- Create the user for the software that is allowed to talk to the database
CREATE USER IF NOT EXISTS 'timekeeper_client'@'%'
IDENTIFIED BY 'let_me_in';

-- Let the user see the needed parts of the timekeeperdb database
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_AddPerson TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_AddProject TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_AddTimeRecord TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_GetActiveProjects TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_GetAllPersons TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_GetAllProjects TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_GetPersonById TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_GetPersonByIdAndPassword TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_GetProjectById TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_GetTimeRecordsByPersonId TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_GetTimeRecordsByProjectId TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_MarkProjectAsActive TO 'timekeeper_client'@'%';
GRANT EXECUTE ON PROCEDURE timekeeperdb.tsp_MarkProjectAsInactive TO 'timekeeper_client'@'%';

-- Let JDBC see the needed data about stored procedures
GRANT SELECT ON mysql.proc TO  'timekeeper_client'@'%';

-- *****************************************************************************
--                              END OF SCRIPT
-- *****************************************************************************

