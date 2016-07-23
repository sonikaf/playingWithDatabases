-- MySQL dump 10.13  Distrib 5.7.13, for osx10.11 (x86_64)
--
-- Host: localhost    Database: db2
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
-- Table structure for table `Capitals`
--

DROP TABLE IF EXISTS `Capitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Capitals` (
  `Country` varchar(15) NOT NULL,
  `Capital_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Capital_Name`),
  UNIQUE KEY `Capital_Name` (`Capital_Name`),
  UNIQUE KEY `alternateKey` (`Country`,`Capital_Name`),
  CONSTRAINT `capitals_ibfk_1` FOREIGN KEY (`Country`, `Capital_Name`) REFERENCES `city` (`city_country_name`, `City_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Capitals`
--

LOCK TABLES `Capitals` WRITE;
/*!40000 ALTER TABLE `Capitals` DISABLE KEYS */;
INSERT INTO `Capitals` VALUES ('Belgium','Brussels'),('France','Paris'),('Ireland','Dublin'),('Monaco','Monaco'),('Spain','Madrid');
/*!40000 ALTER TABLE `Capitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CityLanguage`
--

DROP TABLE IF EXISTS `CityLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CityLanguage` (
  `CityLanguage_City_Name` varchar(20) NOT NULL,
  `City_Lang_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`CityLanguage_City_Name`,`City_Lang_Name`),
  KEY `City_Lang_Name` (`City_Lang_Name`),
  CONSTRAINT `citylanguage_ibfk_1` FOREIGN KEY (`CityLanguage_City_Name`) REFERENCES `City` (`City_Name`),
  CONSTRAINT `citylanguage_ibfk_2` FOREIGN KEY (`City_Lang_Name`) REFERENCES `Languages` (`Lang_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CityLanguage`
--

LOCK TABLES `CityLanguage` WRITE;
/*!40000 ALTER TABLE `CityLanguage` DISABLE KEYS */;
INSERT INTO `CityLanguage` VALUES ('Barcelona','Catalan'),('Brussels','Dutch'),('Dublin','English'),('Brussels','French'),('Monaco','French'),('Paris','French'),('Dublin','Gaelic'),('Barcelona','Spanish'),('Madrid','Spanish'),('Valencia','Spanish'),('Valencia','Valencian');
/*!40000 ALTER TABLE `CityLanguage` ENABLE KEYS */;
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
  KEY `countrylanguage_ibfk_2` (`Lang_Name`),
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
  `city_country_name` varchar(15) NOT NULL,
  `City_Name` varchar(20) NOT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `City_M_Username` varchar(20) DEFAULT NULL,
  `Population` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `City_Name` (`City_Name`),
  UNIQUE KEY `combo` (`city_country_name`,`City_Name`),
  KEY `City_M_Username` (`City_M_Username`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`city_country_name`) REFERENCES `country` (`Country_Name`),
  CONSTRAINT `city_ibfk_2` FOREIGN KEY (`City_M_Username`) REFERENCES `Manager` (`M_Username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('Belgium','Brussels','50 51 N','4 21 E',1,NULL,1830000),('France','Paris','48 52 N','2 20 E',2,NULL,12405426),('Ireland','Dublin','53 20 N','6 15 W',3,NULL,1801040),('Monaco','Monaco','43 43 N','7 25 E',4,NULL,37731),('Spain','Barcelona','41 23 N','2 11 E',5,NULL,5375774),('Spain','Madrid','40 24 N','3 41 W',6,NULL,6489162),('Spain','Valencia','39 28 N','0 23 W',7,NULL,2516818);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `Country_Name` varchar(15) NOT NULL,
  `Population` int(11) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Country_Name` (`Country_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('Belgium',11323973,1),('France',66553766,2),('Ireland',4892305,3),('Monaco',37731,4),('Spain',48146134,5);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `Address` varchar(30) NOT NULL,
  `Event_Country_Name` varchar(15) NOT NULL,
  `Event_City_Name` varchar(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `StartTime` time NOT NULL,
  `Cost` int(11) DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `StudentDiscount` tinyint(1) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL,
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alternateKey` (`Name`,`Date`,`StartTime`,`Address`,`Event_Country_Name`,`Event_City_Name`),
  KEY `event_ibfk_1` (`Address`,`Event_Country_Name`,`Event_City_Name`),
  KEY `event_ibfk_2` (`Category`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`Address`, `Event_Country_Name`, `Event_City_Name`) REFERENCES `Location` (`Address`, `Location_Country_Name`, `Location_City_Name`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`Category`) REFERENCES `Categories` (`EventCategories`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('109 Disney Way','Spain','Barcelona','Animating Finding Dory','2016-08-01','19:30:00',0,NULL,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Presentation',1),('106 Disney Way','Spain','Barcelona','Beauty and the Beast Sing Along','2016-04-25','18:00:00',15,'20:30:00',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Concert',2),('106 Disney Way','Spain','Barcelona','Beauty and the Beast Sing Along','2016-07-01','20:00:00',15,'22:30:00',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Concert',3),('110 Disney Way','Spain','Barcelona','Brother Bear Live','2016-05-06','15:00:00',20,'17:00:00',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Concert',4),('114 Disney Way','France','Paris','Brother Bear Live','2016-06-01','15:00:00',20,'17:00:00',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Concert',5),('112 Disney Way','France','Paris','Disney Convention','2016-01-25','19:00:00',35,'23:00:00',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Festival',6),('107 Disney Way','Spain','Barcelona','Olaf vs Sven','2016-07-03','20:00:00',30,'23:00:00',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Sports Match',7),('111 Disney Way','France','Paris','Race to Defeat the Huns','2016-05-09','12:00:00',40,NULL,0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Race',8),('111 Disney Way','France','Paris','Race to See the Floating Lanterns','2016-03-22','06:00:00',50,'12:00:00',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Race',9),('109 Disney Way','Spain','Barcelona','Why Jane Is A Boss','2016-06-09','17:30:00',5,NULL,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Presentation',10);
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
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alternateKey` (`Address`,`Location_Country_Name`,`Location_City_Name`),
  KEY `location_ibfk_1` (`Location_Country_Name`,`Location_City_Name`),
  KEY `location_ibfk_3` (`Type`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`Location_Country_Name`, `Location_City_Name`) REFERENCES `City` (`city_country_name`, `City_Name`),
  CONSTRAINT `location_ibfk_3` FOREIGN KEY (`Type`) REFERENCES `Types` (`LocationType`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('101 Disney Way','Spain','Madrid',0,'Park','Retiro Park',0,1),('102 Disney Way','Spain','Madrid',2,'Museum','The Prado',1,3),('103 Disney Way','Spain','Madrid',13,'Museum','Royal Palace',1,4),('104 Disney Way','Spain','Madrid',0,'Other','Opera House',0,5),('105 Disney Way','Spain','Madrid',17,'Museum','Reina Sofia',1,6),('106 Disney Way','Spain','Barcelona',0,'Other','Arc d\'Triomf',0,7),('107 Disney Way','Spain','Barcelona',0,'Stadium','Camp Nou',0,8),('108 Disney Way','Spain','Barcelona',15,'Church','Sagrada Familia',1,9),('109 Disney Way','Spain','Barcelona',8,'Park','Parc Guell',0,10),('110 Disney Way','Spain','Barcelona',0,'Other','Teatre Apolo',0,11),('111 Disney Way','France','Paris',14,'Other','Eiffel Tower',1,12),('112 Disney Way','France','Paris',25,'Museum','Louvre',1,13),('113 Disney Way','France','Paris',0,'Church','Notre Dame',0,14),('114 Disney Way','France','Paris',0,'Restaurant','Moulin Rouge',0,15);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewCit`
--

DROP TABLE IF EXISTS `reviewCit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewCit` (
  `Date` date NOT NULL,
  `Review_N_Username` varchar(20) NOT NULL,
  `cityID` mediumint(9) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Date`,`Review_N_Username`,`cityID`),
  KEY `Review_N_Username` (`Review_N_Username`),
  KEY `cityID` (`cityID`),
  CONSTRAINT `reviewcit_ibfk_1` FOREIGN KEY (`Review_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `reviewcit_ibfk_2` FOREIGN KEY (`cityID`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewCit`
--

LOCK TABLES `reviewCit` WRITE;
/*!40000 ALTER TABLE `reviewCit` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewCit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewCountry`
--

DROP TABLE IF EXISTS `reviewCountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewCountry` (
  `Date` date NOT NULL,
  `Review_N_Username` varchar(20) NOT NULL,
  `countryID` mediumint(9) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Date`,`Review_N_Username`,`countryID`),
  KEY `Review_N_Username` (`Review_N_Username`),
  KEY `countryID` (`countryID`),
  CONSTRAINT `reviewcountry_ibfk_1` FOREIGN KEY (`Review_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `reviewcountry_ibfk_2` FOREIGN KEY (`countryID`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewCountry`
--

LOCK TABLES `reviewCountry` WRITE;
/*!40000 ALTER TABLE `reviewCountry` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewCountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewEvent`
--

DROP TABLE IF EXISTS `reviewEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewEvent` (
  `Date` date NOT NULL,
  `Review_N_Username` varchar(20) NOT NULL,
  `eventID` mediumint(9) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Date`,`Review_N_Username`,`eventID`),
  KEY `Review_N_Username` (`Review_N_Username`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `reviewevent_ibfk_1` FOREIGN KEY (`Review_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `reviewevent_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewEvent`
--

LOCK TABLES `reviewEvent` WRITE;
/*!40000 ALTER TABLE `reviewEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewLoc`
--

DROP TABLE IF EXISTS `reviewLoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewLoc` (
  `Date` date NOT NULL,
  `Review_N_Username` varchar(20) NOT NULL,
  `locationID` mediumint(9) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Date`,`Review_N_Username`,`locationID`),
  KEY `Review_N_Username` (`Review_N_Username`),
  KEY `locationID` (`locationID`),
  CONSTRAINT `reviewloc_ibfk_1` FOREIGN KEY (`Review_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `reviewloc_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewLoc`
--

LOCK TABLES `reviewLoc` WRITE;
/*!40000 ALTER TABLE `reviewLoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewLoc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-23 16:09:35
