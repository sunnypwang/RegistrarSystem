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
  `Sector` varchar(10) NOT NULL,
  PRIMARY KEY (`Bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('ENG10','Engineer_Building_10','1'),('ENG11','Engineer_Building_11','1'),('ENG20','Engineer_Building_20','2'),('ENG31','Engineer_Building_31','3');
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
INSERT INTO `certificate` VALUES ('Certname1','2001-01-01','Fcode1',1),('Certname2','2002-02-02','Fcode2',2),('Certname3','2003-03-03','Fcode3',3),('Certname4','2004-04-04','Fcode4',4);
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
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`) REFERENCES `section` (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('Whatever',10,10,'2001-01-01',0,1110000021,1,1010101,2560,1,'ABC'),('Prog D-',2,2,'2002-02-02',1,2147483647,2,2121212,2559,2,'DEF'),('DB DATABASE',6,9,'2003-03-03',2,2147483647,3,3232323,2560,1,'ABC'),('Prog D-',2,2,'2002-02-02',3,2147483647,4,4343434,2559,2,'DEF'),('SA Super Busy',7,6,'2005-05-05',4,2147483647,5,5454545,2558,3,'GHI'),('DB DATABASE',6,9,'2003-03-03',5,2147483647,6,6565656,2560,1,'ABC');
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
INSERT INTO `course` VALUES (1010101,'WHA THE HELL',101,2560,2,'ABC'),(2121212,'WHA THE HELL II',202,2559,1,'DEF'),(3232323,'WHA THE SA',101,2558,2,'ABC'),(4343434,'WHA THE SA II',202,2560,2,'ABC'),(5454545,'WHA THE DB',101,2555,1,'DEF'),(6565656,'WHA THE DB II',202,2557,2,'DEF');
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
INSERT INTO `curriculum` VALUES ('B.Eng.CP','Code1',4,2560,'CP','ENG'),('B.Eng.ME','Code2',2,2555,'DF','Engineer2'),('B.Eng.CE','Code3',2,2557,'DE','Engineer3'),('B.Eng.EE','Code4',4,2550,'CD','Engineer4'),('M.Eng.CP','Code5',4,2559,'CP','ENG');
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
  `InstID` int(11) DEFAULT NULL,
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
INSERT INTO `department` VALUES ('AB','Computer','Com Com Com','Engineer1',2147483647),('CD','Metal','Metal Eng','Engineer4',2147483647),('CP','Computer Engineering','Department of Computer Engineering','ENG',NULL),('DE','Secu','Security','Engineer3',2147483647),('DF','Elec','Elec Elec','Engineer2',2147483647);
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
  `day` date NOT NULL,
  `startTime` time(4) NOT NULL,
  `endTime` time(4) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  PRIMARY KEY (`Type`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `CourseID` (`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  CONSTRAINT `examination_ibfk_1` FOREIGN KEY (`CourseID`, `Year`, `SemesterNo`, `ProgramCode`) REFERENCES `course` (`CourseID`, `Year`, `SemesterNo`, `ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES ('TypeA','2560-01-01','00:11:00.0000','00:14:00.0000',1,2560,2,'Code1'),('TypeA','2558-04-05','00:15:00.0000','00:18:00.0000',3,2558,1,'Code3'),('TypeA','2560-02-20','00:13:00.0000','00:14:00.0000',4,2560,2,'Code4'),('TypeB','2557-02-02','00:14:00.0000','00:16:00.0000',2,2557,1,'Code2');
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
  CONSTRAINT `examroom_ibfk_1` FOREIGN KEY (`Type`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`) REFERENCES `examination` (`Type`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`),
  CONSTRAINT `examroom_ibfk_2` FOREIGN KEY (`RoomNo`, `Bcode`) REFERENCES `room` (`RoomNo`, `Bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examroom`
--

LOCK TABLES `examroom` WRITE;
/*!40000 ALTER TABLE `examroom` DISABLE KEYS */;
INSERT INTO `examroom` VALUES ('TypeA',1,2560,2,'Code1',101,'ENG1'),('TypeB',2,2557,1,'Code2',202,'ENG2'),('TypeB',2,2557,1,'Code2',303,'ENG3'),('TypeB',2,2557,1,'Code2',404,'ENG1');
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
INSERT INTO `faculty` VALUES ('Faculty of Engineering','ENG','Faculty of Engineering'),('Engineer','Engineer1','EEEEEEE'),('Engineer','Engineer2','DDDDDDD'),('Engineer','Engineer3','CCCCCCC');
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
INSERT INTO `instructor` VALUES ('B','A','Doctor','M','2560-01-01','A@gmail.com',110000021,123456789,'A_Street','1_Sub_Distict',' A_Province',10000,'AB','Engineer1','1111'),('D','C','A_Doctor','F','2560-01-01','D@gmail.com',220000021,123456789,'B_Street','1_Sub_Distict',' B_Province',10000,'DF','Engineer2','1111'),('F','E','Doctor','M','2560-01-01','F@gmail.com',330000021,123456789,'C_Street','1_Sub_Distict',' C_Province',10000,'DE','Engineer3','1111');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `registerResult` tinyint(1) NOT NULL,
  `grade` varchar(1) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `SecNo` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  PRIMARY KEY (`StudentID`,`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `SecNo` (`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `register_ibfk_2` FOREIGN KEY (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`) REFERENCES `section` (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (1,'A',0,1,1100000002,2560,2,'Code'),(1,'C',0,1,2147483647,2557,1,'Code'),(2,'B',1,1,1100000002,2560,2,'Code'),(3,'A',2,1,1100000002,2560,2,'Code');
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
INSERT INTO `room` VALUES (101,1,'ENG10'),(111,1,'ENG11'),(211,1,'ENG21'),(301,1,'ENG30');
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
  CONSTRAINT `secroom_ibfk_1` FOREIGN KEY (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`) REFERENCES `section` (`SecNo`, `CourseID`, `Year`, `SemesterNo`, `ProgramCode`),
  CONSTRAINT `secroom_ibfk_2` FOREIGN KEY (`RoomNo`, `Bcode`) REFERENCES `room` (`RoomNo`, `Bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secroom`
--

LOCK TABLES `secroom` WRITE;
/*!40000 ALTER TABLE `secroom` DISABLE KEYS */;
INSERT INTO `secroom` VALUES (1,1100000002,2560,2,'Code1',101,'ENG10'),(2,2147483647,2557,1,'Code2',211,'ENG21'),(3,2147483647,2558,2,'Code3',301,'ENG30');
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
  `startTime` time(4) NOT NULL,
  `endTime` time(4) NOT NULL,
  `day` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `SemesterNo` int(11) NOT NULL,
  `ProgramCode` varchar(6) NOT NULL,
  `InstID` int(11) NOT NULL,
  PRIMARY KEY (`SecNo`,`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `CourseID` (`CourseID`,`Year`,`SemesterNo`,`ProgramCode`),
  KEY `InstID` (`InstID`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`CourseID`, `Year`, `SemesterNo`, `ProgramCode`) REFERENCES `course` (`CourseID`, `Year`, `SemesterNo`, `ProgramCode`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`InstID`) REFERENCES `instructor` (`InstID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (30,1,'00:08:00.0000','00:11:00.0000',20,2147483647,2555,2,'Code2',987654321),(50,2,'00:13:00.0000','00:16:00.0000',30,1100000002,2560,2,'Code1',123456789),(45,2,'00:13:00.0000','00:18:00.0000',10,2147483647,2557,2,'Code3',123456789);
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
INSERT INTO `semester` VALUES (2500,2,'Code1'),(2550,1,'Code2'),(2555,3,'Code3'),(2560,2,'Code4');
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
  KEY `student_ibfk_2_idx` (`ProgramCode`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Dcode`, `Fcode`) REFERENCES `department` (`Dcode`, `Fcode`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`ProgramCode`) REFERENCES `curriculum` (`ProgramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (0,'John','Doe','Mr','1997-01-01','M','johndoe@aaa.com',1234567890,'4/20 Phayathai','Phayathai','Bangkok',10200,'CP','ENG','1234','Code1'),(1,'1','2','Mr.','2560-02-20','M','1@gmail.com',1,'1Street','1Sub','1Pro',10000,'CP','ENG','1','Code1'),(2,'3','4','Ms.','2560-02-22','F','1@gmail.com',2,'2Street','2Sub','2Pro',10001,'DF','Engineer2','2','Code2'),(3,'5','6','Mr.','2560-02-24','M','1@gmail.com',3,'3Street','3Sub','3Pro',10002,'CD','Engineer4','3','Code4'),(5,'7','8','Ms.','2560-02-26','F','1@gmail.com',4,'4Street','4Sub','4Pro',10003,'CD','Engineer4','4','Code4');
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

-- Dump completed on 2018-04-25 10:06:53
