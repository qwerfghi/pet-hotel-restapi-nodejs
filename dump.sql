CREATE DATABASE  IF NOT EXISTS `hostel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hostel`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hostel
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `idaddress` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(45) NOT NULL,
  `locality` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `house_num` tinyint(4) unsigned NOT NULL,
  `apartment_num` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`idaddress`),
  UNIQUE KEY `idaddress_UNIQUE` (`idaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (9,'Минская','Смолевичи','Центральная',34,1),(16,'asda','sdas','dasda',123,123),(43,'asd','asd','asd',12,12);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal` (
  `idanimal` smallint(6) unsigned NOT NULL,
  `idowner` smallint(6) unsigned NOT NULL,
  `animal_name` varchar(40) NOT NULL,
  `animal_kind` enum('собака','кот','хомяк','черепаха','змея') NOT NULL,
  `age` tinyint(3) unsigned NOT NULL,
  `vet_inspection` bit(1) DEFAULT NULL,
  `zootaxi` bit(1) DEFAULT NULL,
  `cut` bit(1) DEFAULT NULL,
  `notice` text,
  PRIMARY KEY (`idanimal`),
  UNIQUE KEY `idanimal_UNIQUE` (`idanimal`),
  KEY `fk_pass_idx` (`idowner`),
  CONSTRAINT `fk_owner` FOREIGN KEY (`idowner`) REFERENCES `owner` (`idowner`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,10,'Летти','собака',1,'','','','Отличный пес'),(19,17,'sad','собака',123,'\0','\0','\0','asdasdasfd'),(20,17,'sad','собака',123,'\0','\0','\0','asdasdasfd'),(21,10,'asd','хомяк',123,'\0','\0','\0','asd');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (15),(15);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('default',45);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `idowner` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(45) NOT NULL,
  `owner_last_name` varchar(45) NOT NULL,
  `owner_patronymic` varchar(45) NOT NULL,
  `passport` varchar(10) NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `email` varchar(45) NOT NULL,
  `discount` enum('0%','5%','10%','20%') NOT NULL,
  `idaddress` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`idowner`),
  UNIQUE KEY `passport_UNIQUE` (`passport`),
  UNIQUE KEY `idowner_UNIQUE` (`idowner`),
  UNIQUE KEY `idaddress_UNIQUE` (`idaddress`),
  CONSTRAINT `fk_address` FOREIGN KEY (`idaddress`) REFERENCES `address` (`idaddress`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (10,'Павел','Лобанок','Андреевич','МС2580843','+375295055393','pavellobanok@gmail.com','5%',9),(17,'dasda','sdasd','asdads','asdas','asda','sdasd','0%',16),(44,'asdasd','asdas','asdasd','asdasd','asdasd','asdafs@mail.ru','0%',43);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privileges` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (1,'moderator','moder_pass'),(2,'user','user_pass');
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recall`
--

DROP TABLE IF EXISTS `recall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recall` (
  `idrecall` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `mark` tinyint(4) unsigned NOT NULL,
  `recall` text NOT NULL,
  PRIMARY KEY (`idrecall`),
  UNIQUE KEY `idrecall_UNIQUE` (`idrecall`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recall`
--

LOCK TABLES `recall` WRITE;
/*!40000 ALTER TABLE `recall` DISABLE KEYS */;
INSERT INTO `recall` VALUES (2,'pavellobanok@gmail.com',9,'Отличное заведение, реккомендую!'),(3,'sdasdasdad',7,'Норм.'),(25,'DAFFGSFDGA',4,'AEFEGWERSHSETG');
/*!40000 ALTER TABLE `recall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `idrooms` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `idowner` smallint(6) unsigned DEFAULT NULL,
  `number` smallint(6) unsigned NOT NULL,
  `animal_type` enum('DOG','CAT','HAMSTER','TURTLE','SNAKE') NOT NULL,
  `date_beg` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `cost` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`idrooms`),
  UNIQUE KEY `number_UNIQUE` (`number`),
  UNIQUE KEY `idrooms_UNIQUE` (`idrooms`),
  KEY `fk_idguest_idx` (`idowner`),
  CONSTRAINT `fk_idowner` FOREIGN KEY (`idowner`) REFERENCES `owner` (`idowner`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (14,NULL,1,'DOG',NULL,NULL,100),(15,NULL,2,'CAT',NULL,NULL,100),(16,NULL,3,'DOG',NULL,NULL,200),(17,NULL,5,'DOG','2017-09-15','2017-09-14',100),(18,NULL,6,'DOG',NULL,NULL,150),(19,NULL,4,'DOG','2016-12-21','2016-12-25',170),(20,NULL,7,'HAMSTER',NULL,NULL,150);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `idstaff` smallint(6) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(45) NOT NULL,
  `employee_last_name` varchar(45) NOT NULL,
  `employee_patronymic` varchar(45) NOT NULL,
  `date_rec` date NOT NULL,
  `passport` char(9) NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `email` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  PRIMARY KEY (`idstaff`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'asd','asd','asd','2018-02-14','mc1233212','+375295763813','asd@mail.ru','asd');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `privilege_id` tinyint(3) NOT NULL,
  `idowner` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`iduser`),
  UNIQUE KEY `idowner_UNIQUE` (`idowner`),
  KEY `fk_privilege_id_idx` (`privilege_id`),
  CONSTRAINT `fk_owner_id` FOREIGN KEY (`idowner`) REFERENCES `owner` (`idowner`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_privilege_id` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (18,'asdasd','asdas',2,17),(27,'qwerfghi','ASDFGHJKL',2,10),(29,'admin','admin',1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-03  0:51:26
