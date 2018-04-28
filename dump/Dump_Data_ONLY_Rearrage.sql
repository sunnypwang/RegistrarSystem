LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES 
	('ENG10','Engineer_Building_10'),
	('ENG11','Engineer_Building_11'),
    ('ENG20','Engineer_Building_20'),
    ('ENG30','Engineer_Building_30'),
    ('ENG31','Engineer_Building_31'),
    ('ENG32','Engineer_Building_32');
    /*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES 
	('Faculty of Engineering','ENG','Faculty of Engineering'),
    ('Faculty of Art','ART','Faculty of Art'),
    ('Faculty of Science','SCI','Faculty of Science'),
    ('Faculty of Medical','MED','Faculty of Medical');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES 
	(101,1,'ENG10'),
    (102,1,'ENG10'),
    (103,1,'ENG10'),
    (201,2,'ENG10'),
    (202,2,'ENG10'),
    (203,2,'ENG10'),
    (301,3,'ENG10'),
    (302,3,'ENG10'),
    (303,3,'ENG10'),
    (304,3,'ENG10'),

	(101,1,'ENG11'),
    (102,1,'ENG11'),
    (103,1,'ENG11'),
    (201,2,'ENG11'),
    (202,2,'ENG11'),
    (203,2,'ENG11'),
    (301,3,'ENG11'),
    (302,3,'ENG11'),
    (303,3,'ENG11'),
    (304,3,'ENG11'),
    
    (101,1,'ENG20'),
    (102,1,'ENG20'),
    (103,1,'ENG20'),
    (201,2,'ENG20'),
    (202,2,'ENG20'),
    (203,2,'ENG20'),
    (301,3,'ENG20'),
    (302,3,'ENG20'),
    (303,3,'ENG20'),
    (304,3,'ENG20'),
    
    (101,1,'ENG30'),
    (102,1,'ENG30'),
    (103,1,'ENG30'),
    
    (101,1,'ENG31'),
    (102,1,'ENG31'),
    (103,1,'ENG31'),
    
    (101,1,'ENG32'),
    (102,1,'ENG32'),
    (103,1,'ENG32')
    ;
    
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES 
	('CP','Computer Engineering','Department of Computer Engineering','ENG',NULL),
	('EE','Electical Engineering','Department of Computer Engineering','ENG',NULL),
    ('ME','Material Engineering','Department of Computer Engineering','ENG',NULL)
   ;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES 
	('a','A','PROFESSOR','M','2530-01-01','Aa@gmail.com',110000021,0811111111,
		'A_Street','1_Sub_Distict',' a_Province',10100,'CP','ENG','1111'),
    ('b','B','ASST PROF','F','2525-02-02','Bb@gmail.com',220000021,0822222222,
		'B_Street','2_Sub_Distict',' b_Province',10200,'CP','ENG','2222'),
    ('c','C','PROFESSOR','M','2520-03-03','Cc@gmail.com',330000021,0833333333,
		'C_Street','3_Sub_Distict',' c_Province',10300,'EE','ENG','3333'),
	('d','D','PROFESSOR','F','2515-04-04','Dd@gmail.com',440000021,0844444444,
		'D_Street','4_Sub_Distict',' d_Province',10400,'ME','ENG','4444'),
	('e','E','ASST PROF','M','2510-05-05','Ee@gmail.com',550000021,0855555555,
		'E_Street','5_Sub_Distict',' e_Province',10500,'CP','ENG','5555');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;


UPDATE department
SET InstID = 110000021 
WHERE Dcode = 'CP';

UPDATE department
SET InstID = 330000021 
WHERE Dcode = 'EE';

UPDATE department
SET InstID = 440000021 
WHERE Dcode = 'ME';

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES 
	('CP.Eng.2014','CP2014',10,2014,'CP','ENG'),
	('CP.Eng.2018','CP2018',20,2018,'CP','ENG'),
    ('EE.Eng.2014','EE2014',30,2014,'EE','ENG'),
    ('ME.Eng.2018','ME2018',40,2018,'ME','ENG')
    ;
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES 
	(58311111,'John','Doe','Mr','1997-01-01','M','johndoe@aaa.com',1234567890,
    '4/20 Phayathai','Phayathai','Bangkok',10200,'CP','ENG','1111','CP2014'),
    (58322222,'Kirby','Star','Mr.','1995-02-20','M','Kirby@gmail.com',2,
    '9/45 Samutprakarn','Samutprakarn C','Samutprakarn',10210,'CP','ENG','2222','CP2014'),
    (58333333,'Lara','Crof','Ms.','1996-02-12','F','Larara@gmail.com',3,
    '2/2 Phugat','Phugat','Phugat',10220,'CP','ENG','3333','CP2014'),
    (58344444,'Noc','tis','Mr.','1998-06-24','M','Lucis@gmail.com',4,
    '3Street','3Sub','3Pro',10230,'CP','ENG','4444','CP2014'),
    (58355555,'Ruby','Red','Ms.','1999-04-10','F','RWBY@gmail.com',5,
    '4Street','4Sub','4Pro',10240,'CP','ENG','5555','CP2014'),
    (58366666,'Noc','gar','Mr.','2000-01-24','M','Fishing@gmail.com',6,
    '3Street','3Sub','3Pro',10250,'CP','ENG','6666','CP2018');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
INSERT INTO `certificate` VALUES 
	('Certname1','2001-01-01','ENG',58311111),
	('Certname2','2002-02-02','ENG',58322222),
	('Certname3','2003-03-03','ENG',58333333),
    ('Certname4','2004-04-04','ENG',58344444),
    ('Certname5','2005-05-05','ENG',58311111),
	('Certname6','2006-06-06','ENG',58355555),
	('Certname7','2007-07-07','ENG',58366666),
    ('Certname8','2008-08-08','ART',58366666),
    ('Certname9','2009-09-09','SCI',58366666);
/*!40000 ALTER TABLE `certificate` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES 
	(2019,2,'CP2014'),
    (2018,1,'CP2014'),
    (2018,2,'CP2014'),
    (2018,3,'CP2018'),
    (2019,2,'EE2014'),
    (2018,1,'ME2018'),
    (2018,2,'ME2018'),
    (2018,3,'EE2014');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES 
	(2110111,'SYS ANAL I',101,2019,2,'CP2014'),
    (2110222,'SYS ANAL II',202,2019,2,'CP2014'),
    (2110333,'DATA BASE I',303,2018,1,'CP2014'),
    (2110444,'DATA BASE II',404,2018,1,'CP2014'),
    (2110555,'DIS SYS I',505,2018,1,'CP2014'),
    (2110666,'DIS SYS II',606,2018,2,'CP2014'),
    (2110777,'TECH WRITE',707,2018,3,'CP2018'),
    (2110888,'GAME PROG',808,2018,3,'CP2018'),
    (2110999,'COM NET',909,2018,3,'CP2018');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES 
	('MID','2017-01-01','00:11:00.0000','00:14:00.0000',2110111,2019,2,'CP2014'),
    ('FINAL','2019-04-05','00:15:00.0000','00:18:00.0000',2110111,2019,2,'CP2014'),
    ('MID','2018-01-01','00:11:00.0000','00:14:00.0000',2110222,2019,2,'CP2014'),
    
    ('MID','2020-02-20','00:13:00.0000','00:14:00.0000',2110333,2018,1,'CP2014'),
    ('FINAL','2018-02-02','00:14:00.0000','00:16:00.0000',2110444,2018,1,'CP2014'),
    ('FINAL','2018-04-05','00:15:00.0000','00:18:00.0000',2110555,2018,1,'CP2014'),
    ('MID','2019-02-20','00:13:00.0000','00:14:00.0000',2110666,2018,2,'CP2014'),
    ('NID','2017-02-02','00:14:00.0000','00:16:00.0000',2110777,2018,3,'CP2018');
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `examroom` WRITE;
/*!40000 ALTER TABLE `examroom` DISABLE KEYS */;
INSERT INTO `examroom` VALUES 
	('MID',2110111,2019,2,'CP2014',101,'ENG10'),
    ('FINAL',2110111,2019,2,'CP2014',102,'ENG10'),
    ('MID',2110222,2019,2,'CP2014',201,'ENG11'),
    ('MID',2110333,2018,1,'CP2014',303,'ENG11'),
    ('FINAL',2110444,2018,1,'CP2014',103,'ENG11'),
    ('FINAL',2110555,2018,1,'CP2014',304,'ENG20'),
    ('MID',2110666,2018,2,'CP2014',103,'ENG30'),
    ('MID',2110777,2018,3,'CP2018',101,'ENG30')
    ;
/*!40000 ALTER TABLE `examroom` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES 
	(30,1,'00:08:00.0000','00:11:00.0000',20,2110111,
    2019,2,'CP2014',110000021),
    (50,2,'00:13:00.0000','00:16:00.0000',30,2110111,
    2019,2,'CP2014',110000021),
    (40,1,'00:11:00.0000','00:14:00.0000',30,2110222,
    2019,2,'CP2014',220000021),
    (100,1,'00:13:00.0000','00:16:00.0000',30,2110333,
    2018,1,'CP2014',330000021),
    (100,1,'00:13:00.0000','00:16:00.0000',30,2110444,
    2018,1,'CP2014',330000021),
    (20,2,'00:10:00.0000','00:12:00.0000',30,2110555,
    2018,1,'CP2014',330000021),
    (100,1,'00:13:00.0000','00:16:00.0000',30,2110666,
    2018,2,'CP2014',440000021),
    (75,2,'00:13:00.0000','00:15:00.0000',30,2110777,
    2018,3,'CP2018',550000021)
    ;
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES 
	('Whatever',10,10,'2001-01-01',58311111,110000021,1,2110111,2019,2,'CP2014'),
    ('Whatever 2',5,5,'2001-01-01',58311111,220000021,1,2110111,2019,2,'CP2014'),
    ('Prog D-',2,2,'2002-02-02',58322222,220000021,2,2110111,2019,2,'CP2014'),
    ('DB DATABASE',6,9,'2003-03-03',58333333,330000021,1,2110222,2019,2,'CP2014'),
    ('Prog D-',2,2,'2002-02-02',58344444,440000021,1,2110222,2019,2,'CP2014'),
    ('SA Super Busy',7,6,'2005-05-05',58355555,440000021,1,2110333,2018,1,'CP2014'),
    ('DB DATABASE',6,9,'2003-03-03',58366666,550000021,1,2110333,2018,1,'CP2014');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES 
	(1,'A',58311111,1,2110111,2019,2,'CP2014'),
    (0,'D',58311111,1,2110222,2019,2,'CP2014'),
    (1,'A',58322222,2,2110111,2019,2,'CP2014'),
    (1,'C',58333333,1,2110666,2018,2,'CP2014'),
    (1,'A',58344444,1,2110333,2018,1,'CP2014'),
    (0,'B',58355555,2,2110777,2018,3,'CP2018'),
    (1,'B',58366666,1,2110444,2018,1,'CP2014'),
    (1,'A',58366666,2,2110555,2018,1,'CP2014');
    

/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `secroom` WRITE;
/*!40000 ALTER TABLE `secroom` DISABLE KEYS */;
INSERT INTO `secroom` VALUES 


	(1,2110111,2019,2,'CP2014',101,'ENG10'),
	(2,2110111,2019,2,'CP2014',201,'ENG11'),
    (1,2110222,2019,2,'CP2014',301,'ENG20'),
    (1,2110333,2018,1,'CP2014',102,'ENG31'),
	(1,2110666,2018,2,'CP2014',102,'ENG10'),
    (1,2110444,2018,1,'CP2014',301,'ENG20'),
    (2,2110555,2018,1,'CP2014',101,'ENG30')
	;
/*!40000 ALTER TABLE `secroom` ENABLE KEYS */;
UNLOCK TABLES;
