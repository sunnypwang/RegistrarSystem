-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: registrar
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `Bcode` varchar(10) NOT NULL,
  `Bname` varchar(100) NOT NULL,
  PRIMARY KEY (`Bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate`
--

DROP TABLE IF EXISTS `certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate` (
  `Cname` varchar(100) NOT NULL,
  `issuedDate` date NOT NULL,
  `Fcode` varchar(10) NOT NULL,
  `StudentID` int(11) NOT NULL,
  PRIMARY KEY (`Cname`,`Fcode`,`StudentID`),
  KEY `Fcode` (`Fcode`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `certificate_ibfk_1` FOREIGN KEY (`Fcode`) REFERENCES `faculty` (`Fcode`),
  CONSTRAINT `certificate_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate`
--

LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentText` varchar(200) NOT NULL,
  `courseRating` int(11) NOT NULL,
  `instructorRating` int(11) NOT NULL,
  `commentDate` date NOT NULL,
  `StudentID` int(11) NOT NULL,
  `InstID` int(11) NOT NULL,
  `SecNo` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  PRIMARY KEY (`StudentID`,`InstID`,`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `InstID` (`InstID`),
  KEY `SecNo` (`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`InstID`) REFERENCES `instructor` (`InstID`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`) 
	REFERENCES `section` (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL,
  `CourseName` char(100) NOT NULL,
  `Credit` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  PRIMARY KEY (`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `Year` (`Year`,`SemesterNo`,`ProgramCode`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Year`, `SemesterNo`, `ProgramCode`) REFERENCES `semester` (`Year`, `SemesterNo`, `ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `ProgramName` varchar(100) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  `ProgramLength` int(11) NOT NULL,
  `YearApplied` int(11) NOT NULL,
  `Dcode` varchar(2) NOT NULL,
  `Fcode` varchar(10) NOT NULL,
  PRIMARY KEY (`ProgramCode`),
  KEY `Dcode` (`Dcode`,`Fcode`),
  CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`Dcode`, `Fcode`) REFERENCES `department` (`Dcode`, `Fcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Dcode` varchar(2) NOT NULL,
  `Dname` varchar(100) NOT NULL,
  `Ddescription` varchar(100) NOT NULL,
  `Fcode` varchar(10) NOT NULL,
  `InstID` int(11) NULL,
  PRIMARY KEY (`Dcode`,`Fcode`),
  KEY `Fcode` (`Fcode`),
  KEY `department_ibfk_2_idx` (`InstID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Fcode`) REFERENCES `faculty` (`Fcode`),
  CONSTRAINT `department_ibfk_2` FOREIGN KEY (`InstID`) REFERENCES `instructor` (`InstID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*INSERT INTO `department` VALUES ('CP','Computer Engineering','Department of Computer Engineering','ENG',NULL);
*/
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination` (
  `Type` varchar(5) NOT NULL,
  `date` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  PRIMARY KEY (`Type`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `CourseID` (`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  CONSTRAINT `examination_ibfk_1` FOREIGN KEY (`CourseID`, `Year`, `SemesterNo`, `ProgramCode`) 
	REFERENCES `course` (`CourseID`, `Year`, `SemesterNo`, `ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examroom`
--

DROP TABLE IF EXISTS `examroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examroom` (
  `Type` varchar(5) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  `RoomNo` int(11) NOT NULL,
  `Bcode` varchar(10) NOT NULL,
  PRIMARY KEY (`Type`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`,`RoomNo`,`Bcode`),
  KEY `RoomNo` (`RoomNo`,`Bcode`),
  CONSTRAINT `examroom_ibfk_1` FOREIGN KEY (`Type`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`) 
	REFERENCES `examination` (`Type`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`),
  CONSTRAINT `examroom_ibfk_2` FOREIGN KEY (`RoomNo`, `Bcode`) REFERENCES `room` (`RoomNo`, `Bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examroom`
--

LOCK TABLES `examroom` WRITE;
/*!40000 ALTER TABLE `examroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `examroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `Fname` varchar(100) NOT NULL,
  `Fcode` varchar(10) NOT NULL,
  `Fdescription` varchar(100) NOT NULL,
  PRIMARY KEY (`Fcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;

/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `LastName` varchar(30) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `Title` varchar(10) NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `Bdate` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `InstID` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `SubDistict` varchar(30) NOT NULL,
  `Province` varchar(30) NOT NULL,
  `PostalCode` int(11) NOT NULL,
  `Dcode` varchar(2) NOT NULL,
  `Fcode` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`InstID`),
  KEY `Dcode` (`Dcode`,`Fcode`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`Dcode`, `Fcode`) REFERENCES `department` (`Dcode`, `Fcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `registerResult` tinyint(1) DEFAULT 0,
  `grade` varchar(2) DEFAULT 'X',
  `StudentID` int(11) NOT NULL,
  `SecNo` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  PRIMARY KEY (`StudentID`,`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `SecNo` (`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `register_ibfk_2` FOREIGN KEY (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`) 
	REFERENCES `section` (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `RoomNo` int(11) NOT NULL,
  `Floor` int(11) NOT NULL,
  `Bcode` varchar(10) NOT NULL,
  PRIMARY KEY (`RoomNo`,`Bcode`),
  KEY `Bcode` (`Bcode`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Bcode`) REFERENCES `building` (`Bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secroom`
--

DROP TABLE IF EXISTS `secroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secroom` (
  `SecNo` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  `RoomNo` int(11) NOT NULL,
  `Bcode` varchar(10) NOT NULL,
  PRIMARY KEY (`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`,`RoomNo`,`Bcode`),
  KEY `RoomNo` (`RoomNo`,`Bcode`),
  CONSTRAINT `secroom_ibfk_1` FOREIGN KEY (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`) 
	REFERENCES `section` (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`),
  CONSTRAINT `secroom_ibfk_2` FOREIGN KEY (`RoomNo`, `Bcode`) REFERENCES `room` (`RoomNo`, `Bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secroom`
--

LOCK TABLES `secroom` WRITE;
/*!40000 ALTER TABLE `secroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `secroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `MaxStudent` int(11) NOT NULL,
  `SecNo` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `day` int(1) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  `InstID` int(11) NOT NULL,
  PRIMARY KEY (`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `CourseID` (`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `InstID` (`InstID`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`CourseID`, `Year`, `SemesterNo`, `ProgramCode`) 
	REFERENCES `course` (`CourseID`, `Year`, `SemesterNo`, `ProgramCode`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`InstID`) REFERENCES `instructor` (`InstID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  PRIMARY KEY (`Year`,`SemesterNo`,`ProgramCode`),
  KEY `ProgramCode` (`ProgramCode`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`ProgramCode`) REFERENCES `curriculum` (`ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Title` varchar(10) NOT NULL,
  `Bdate` date NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Number` int(11) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `SubDistrict` varchar(30) NOT NULL,
  `Province` varchar(30) NOT NULL,
  `PostalCode` int(11) NOT NULL,
  `Dcode` varchar(2) NOT NULL,
  `Fcode` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `ProgramCode` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `Dcode` (`Dcode`,`Fcode`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Dcode`, `Fcode`) REFERENCES `department` (`Dcode`, `Fcode`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`ProgramCode`) REFERENCES `curriculum` (`ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;

/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-17 20:40:10
