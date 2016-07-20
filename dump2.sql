-- MySQL dump 10.13  Distrib 5.7.13, for osx10.11 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Table structure for table `CityLanguage`
--

DROP TABLE IF EXISTS `CityLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CityLanguage` (
  `CityLanguage_Country_Name` varchar(15) NOT NULL,
  `CityLanguage_City_Name` varchar(20) NOT NULL,
  `City_Lang_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`CityLanguage_Country_Name`,`CityLanguage_City_Name`,`City_Lang_Name`),
  KEY `City_Lang_Name` (`City_Lang_Name`),
  CONSTRAINT `citylanguage_ibfk_1` FOREIGN KEY (`CityLanguage_Country_Name`, `CityLanguage_City_Name`) REFERENCES `City` (`City_Country_Name`, `City_Name`),
  CONSTRAINT `citylanguage_ibfk_2` FOREIGN KEY (`City_Lang_Name`) REFERENCES `Languages` (`Lang_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CityLanguage`
--

LOCK TABLES `CityLanguage` WRITE;
/*!40000 ALTER TABLE `CityLanguage` DISABLE KEYS */;
INSERT INTO `CityLanguage` VALUES ('Spain','Barcelona','Catalan'),('Belgium','Brussels','Dutch'),('Ireland','Dublin','English'),('Belgium','Brussels','French'),('France','Paris','French'),('Monaco','Monaco','French'),('Ireland','Dublin','Gaelic'),('Spain','Barcelona','Spanish'),('Spain','Madrid','Spanish'),('Spain','Valencia','Spanish'),('Spain','Valencia','Valencian');
/*!40000 ALTER TABLE `CityLanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `Country_Name` varchar(15) NOT NULL,
  `Population` int(11) DEFAULT NULL,
  `Country_Reviewable_ID` int(11) DEFAULT NULL,
  `Country_N_Username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Country_Name`),
  UNIQUE KEY `Country_Name` (`Country_Name`),
  KEY `Country_N_Username` (`Country_N_Username`),
  KEY `Country_Reviewable_ID` (`Country_Reviewable_ID`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`Country_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `country_ibfk_2` FOREIGN KEY (`Country_Reviewable_ID`) REFERENCES `Reviewable` (`reviewableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES ('Belgium',11323973,NULL,NULL),('France',66553766,NULL,NULL),('Ireland',4892305,NULL,NULL),('Monaco',37731,NULL,NULL),('Spain',48146134,NULL,NULL);
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CountryLanguage`
--

DROP TABLE IF EXISTS `CountryLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CountryLanguage` (
  `CountryLanguage_Country_Name` varchar(15) NOT NULL,
  `Lang_Name` varchar(15) NOT NULL,
  PRIMARY KEY (`CountryLanguage_Country_Name`,`Lang_Name`),
  KEY `Lang_Name` (`Lang_Name`),
  CONSTRAINT `countrylanguage_ibfk_1` FOREIGN KEY (`CountryLanguage_Country_Name`) REFERENCES `Country` (`Country_Name`),
  CONSTRAINT `countrylanguage_ibfk_2` FOREIGN KEY (`Lang_Name`) REFERENCES `Languages` (`Lang_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CountryLanguage`
--

LOCK TABLES `CountryLanguage` WRITE;
/*!40000 ALTER TABLE `CountryLanguage` DISABLE KEYS */;
INSERT INTO `CountryLanguage` VALUES ('Belgium','Dutch'),('Ireland','English'),('Belgium','French'),('France','French'),('Monaco','French'),('Ireland','Gaelic'),('Belgium','German'),('Spain','Spanish');
/*!40000 ALTER TABLE `CountryLanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Languages`
--

DROP TABLE IF EXISTS `Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Languages` (
  `Lang_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Lang_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
INSERT INTO `Languages` VALUES ('Basque'),('Catalan'),('Dutch'),('English'),('Euskara'),('French'),('Gaelic'),('Galician'),('German'),('Greek'),('Italian'),('Portuguese'),('Spanish'),('Valencian');
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manager` (
  `M_Username` varchar(20) NOT NULL,
  `M_Email` varchar(30) NOT NULL,
  PRIMARY KEY (`M_Username`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`M_Username`) REFERENCES `User` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NormalUser`
--

DROP TABLE IF EXISTS `NormalUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NormalUser` (
  `N_Username` varchar(20) NOT NULL,
  `N_Email` varchar(30) NOT NULL,
  PRIMARY KEY (`N_Username`),
  CONSTRAINT `normaluser_ibfk_1` FOREIGN KEY (`N_Username`) REFERENCES `User` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NormalUser`
--

LOCK TABLES `NormalUser` WRITE;
/*!40000 ALTER TABLE `NormalUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `NormalUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Review` (
  `Date` int(11) NOT NULL,
  `Review_N_Username` varchar(20) NOT NULL,
  `Review_Reviewable_ID` int(11) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Date`,`Review_N_Username`,`Review_Reviewable_ID`),
  KEY `Review_N_Username` (`Review_N_Username`),
  KEY `Review_Reviewable_ID` (`Review_Reviewable_ID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Review_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Review_Reviewable_ID`) REFERENCES `Reviewable` (`reviewableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Types`
--

DROP TABLE IF EXISTS `Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Types` (
  `LocationType` varchar(15) NOT NULL,
  PRIMARY KEY (`LocationType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Types`
--

LOCK TABLES `Types` WRITE;
/*!40000 ALTER TABLE `Types` DISABLE KEYS */;
INSERT INTO `Types` VALUES ('Church'),('Memorial'),('Museum'),('Other'),('Park'),('Plaza'),('Restaurant'),('Stadium');
/*!40000 ALTER TABLE `Types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `Username` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `EventCategories` varchar(20) NOT NULL,
  PRIMARY KEY (`EventCategories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('Concert'),('Festival'),('Presentation'),('Race'),('Sports Match');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `City_Country_Name` varchar(15) NOT NULL,
  `City_Name` varchar(20) NOT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `City_Reviewable_ID` int(11) DEFAULT NULL,
  `City_N_Username` varchar(20) DEFAULT NULL,
  `City_M_Username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`City_Country_Name`,`City_Name`),
  KEY `City_N_Username` (`City_N_Username`),
  KEY `City_M_Username` (`City_M_Username`),
  KEY `City_Reviewable_ID` (`City_Reviewable_ID`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`City_Country_Name`) REFERENCES `Country` (`Country_Name`),
  CONSTRAINT `city_ibfk_2` FOREIGN KEY (`City_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `city_ibfk_3` FOREIGN KEY (`City_M_Username`) REFERENCES `Manager` (`M_Username`),
  CONSTRAINT `city_ibfk_4` FOREIGN KEY (`City_Reviewable_ID`) REFERENCES `Reviewable` (`reviewableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('Belgium','Brussels','50 51 N','4 21 E',NULL,NULL,NULL),('France','Paris','48 52 N','2 20 E',NULL,NULL,NULL),('Ireland','Dublin','53 20 N','6 15 W',NULL,NULL,NULL),('Monaco','Monaco','43 43 N','7 25 E',NULL,NULL,NULL),('Spain','Barcelona','41 23 N','2 11 E',NULL,NULL,NULL),('Spain','Madrid','40 24 N','3 41 W',NULL,NULL,NULL),('Spain','Valencia','39 28 N','0 23 W',NULL,NULL,NULL);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `name` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `StartTime` time NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Event_Country_Name` varchar(15) NOT NULL,
  `Event_City_Name` varchar(20) NOT NULL,
  `Cost` int(11) DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `studentdiscount` tinyint(1) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `Event_Reviewable_ID` int(11) DEFAULT NULL,
  `Event_N_Username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`name`,`Date`,`StartTime`,`Address`,`Event_Country_Name`,`Event_City_Name`),
  KEY `Address` (`Address`,`Event_Country_Name`,`Event_City_Name`),
  KEY `Event_N_Username` (`Event_N_Username`),
  KEY `Event_Reviewable_ID` (`Event_Reviewable_ID`),
  KEY `Category` (`category`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`Address`, `Event_Country_Name`, `Event_City_Name`) REFERENCES `Location` (`Address`, `Location_Country_Name`, `Location_City_Name`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`Event_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `event_ibfk_3` FOREIGN KEY (`Event_Reviewable_ID`) REFERENCES `Reviewable` (`reviewableid`),
  CONSTRAINT `event_ibfk_4` FOREIGN KEY (`category`) REFERENCES `Categories` (`EventCategories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('Animating Finding Dory','2016-08-01','19:30:00','109 Disney Way','Spain','Barcelona',0,NULL,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Presentation',NULL,NULL),('Beauty and the Beast Sing Along','2016-04-25','18:00:00','106 Disney Way','Spain','Barcelona',15,'20:30:00',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Concert',NULL,NULL),('Beauty and the Beast Sing Along','2016-07-01','20:00:00','106 Disney Way','Spain','Barcelona',15,'22:30:00',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Concert',NULL,NULL),('Brother Bear Live','2016-05-06','15:00:00','110 Disney Way','Spain','Barcelona',20,'17:00:00',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Concert',NULL,NULL),('Brother Bear Live','2016-06-01','15:00:00','114 Disney Way','France','Paris',20,'17:00:00',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Concert',NULL,NULL),('Disney Convention','2016-01-25','19:00:00','112 Disney Way','France','Paris',35,'23:00:00',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Festival',NULL,NULL),('Olaf vs Sven','2016-07-03','20:00:00','107 Disney Way','Spain','Barcelona',30,'23:00:00',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Sports Match',NULL,NULL),('Race to Defeat the Huns','2016-05-09','12:00:00','111 Disney Way','France','Paris',40,NULL,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Race',NULL,NULL),('Race to See the Floating Lanterns','2016-03-22','06:00:00','111 Disney Way','France','Paris',50,'12:00:00',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Race',NULL,NULL),('Why Jane Is A Boss','2016-06-09','17:30:00','109 Disney Way','Spain','Barcelona',5,NULL,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Presentation',NULL,NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `Address` varchar(30) NOT NULL,
  `Location_Country_Name` varchar(15) NOT NULL,
  `Location_City_Name` varchar(20) NOT NULL,
  `Cost` int(11) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `student_discount` tinyint(1) DEFAULT NULL,
  `Location_Reviewable_ID` int(11) DEFAULT NULL,
  `Location_N_Username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Address`,`Location_Country_Name`,`Location_City_Name`),
  KEY `Location_Country_Name` (`Location_Country_Name`,`Location_City_Name`),
  KEY `Location_N_Username` (`Location_N_Username`),
  KEY `Type` (`Type`),
  KEY `Location_Reviewable_ID` (`Location_Reviewable_ID`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`Location_Country_Name`, `Location_City_Name`) REFERENCES `City` (`City_Country_Name`, `City_Name`),
  CONSTRAINT `location_ibfk_2` FOREIGN KEY (`Location_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `location_ibfk_3` FOREIGN KEY (`Type`) REFERENCES `Types` (`LocationType`),
  CONSTRAINT `location_ibfk_4` FOREIGN KEY (`Location_Reviewable_ID`) REFERENCES `Reviewable` (`reviewableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('101 Disney Way','Spain','Madrid',0,'Park','Retiro Park',0,NULL,NULL),('102 Disney Way','Spain','Madrid',15,'Museum','The Prado',1,NULL,NULL),('103 Disney Way','Spain','Madrid',13,'Museum','Royal Palace',1,NULL,NULL),('104 Disney Way','Spain','Madrid',0,'Other','Opera House',0,NULL,NULL),('105 Disney Way','Spain','Madrid',17,'Museum','Reina Sofia',1,NULL,NULL),('106 Disney Way','Spain','Barcelona',0,'Other','Arc d\'Triomf',0,NULL,NULL),('107 Disney Way','Spain','Barcelona',0,'Stadium','Camp Nou',0,NULL,NULL),('108 Disney Way','Spain','Barcelona',15,'Church','Sagrada Familia',1,NULL,NULL),('109 Disney Way','Spain','Barcelona',8,'Park','Parc Guell',0,NULL,NULL),('110 Disney Way','Spain','Barcelona',0,'Other','Teatre Apolo',0,NULL,NULL),('111 Disney Way','France','Paris',14,'Other','Eiffel Tower',1,NULL,NULL),('112 Disney Way','France','Paris',25,'Museum','Louvre',1,NULL,NULL),('113 Disney Way','France','Paris',0,'Church','Notre Dame',0,NULL,NULL),('114 Disney Way','France','Paris',0,'Restaurant','Moulin Rouge',0,NULL,NULL);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewable`
--

DROP TABLE IF EXISTS `reviewable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewable` (
  `reviewableid` int(11) NOT NULL,
  PRIMARY KEY (`reviewableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewable`
--

LOCK TABLES `reviewable` WRITE;
/*!40000 ALTER TABLE `reviewable` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-20 20:12:13
