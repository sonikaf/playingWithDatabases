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
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
  `City_Country_Name` varchar(15) NOT NULL,
  `City_Name` varchar(20) NOT NULL,
  `Latitude` int(11) DEFAULT NULL,
  `Longitude` int(11) DEFAULT NULL,
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
  CONSTRAINT `city_ibfk_4` FOREIGN KEY (`City_Reviewable_ID`) REFERENCES `Reviewable` (`ReviewableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
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
  CONSTRAINT `country_ibfk_2` FOREIGN KEY (`Country_Reviewable_ID`) REFERENCES `Reviewable` (`ReviewableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `Address` varchar(30) NOT NULL,
  `Location_Country_Name` varchar(15) NOT NULL,
  `Location_City_Name` varchar(20) NOT NULL,
  `Cost` int(11) DEFAULT NULL,
  `Type` char(15) DEFAULT NULL,
  `Name` char(20) DEFAULT NULL,
  `Student_Discount` int(11) DEFAULT NULL,
  `Location_Reviewable_ID` int(11) DEFAULT NULL,
  `Location_N_Username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Address`,`Location_Country_Name`,`Location_City_Name`),
  KEY `Location_Country_Name` (`Location_Country_Name`,`Location_City_Name`),
  KEY `Location_N_Username` (`Location_N_Username`),
  KEY `Location_Reviewable_ID` (`Location_Reviewable_ID`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`Location_Country_Name`, `Location_City_Name`) REFERENCES `City` (`City_Country_Name`, `City_Name`),
  CONSTRAINT `location_ibfk_2` FOREIGN KEY (`Location_N_Username`) REFERENCES `NormalUser` (`N_Username`),
  CONSTRAINT `location_ibfk_3` FOREIGN KEY (`Location_Reviewable_ID`) REFERENCES `Reviewable` (`ReviewableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
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
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Review_Reviewable_ID`) REFERENCES `Reviewable` (`ReviewableID`)
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
-- Table structure for table `Reviewable`
--

DROP TABLE IF EXISTS `Reviewable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reviewable` (
  `ReviewableID` int(11) NOT NULL,
  PRIMARY KEY (`ReviewableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviewable`
--

LOCK TABLES `Reviewable` WRITE;
/*!40000 ALTER TABLE `Reviewable` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reviewable` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-20 10:56:34
