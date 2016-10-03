-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(8) DEFAULT NULL,
  `chart_id` int(4) NOT NULL,
  `type_id` int(3) DEFAULT NULL,
  `debit` decimal(30,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(30,2) NOT NULL DEFAULT '0.00',
  `balances` decimal(30,2) NOT NULL DEFAULT '0.00',
  `currency_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_accounts_chart_id_idx` (`chart_id`),
  KEY `FK_accounts_currency_code_idx` (`currency_code`),
  KEY `FK_accounts_type_id_idx` (`type_id`),
  KEY `FK_accounts_user_id_idx` (`client_id`),
  CONSTRAINT `fk_account_chart` FOREIGN KEY (`chart_id`) REFERENCES `account_chart` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_account_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_account_currency` FOREIGN KEY (`currency_code`) REFERENCES `currency` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `fk_account_type` FOREIGN KEY (`type_id`) REFERENCES `account_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7327000000010 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1010000000002,NULL,1010,NULL,0.00,0.00,0.00,'BYR'),(7327000000009,NULL,7327,NULL,100000000000.00,-100000000000.00,0.00,'BYR');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_activity`
--

DROP TABLE IF EXISTS `account_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_activity` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_activity`
--

LOCK TABLES `account_activity` WRITE;
/*!40000 ALTER TABLE `account_activity` DISABLE KEYS */;
INSERT INTO `account_activity` VALUES (1,'Active'),(2,'Passive'),(3,'Active-Passive');
/*!40000 ALTER TABLE `account_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_chart`
--

DROP TABLE IF EXISTS `account_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_chart` (
  `id` int(4) NOT NULL,
  `name` varchar(150) NOT NULL,
  `activity_id` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_charts_actitvity_idx` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_chart`
--

LOCK TABLES `account_chart` WRITE;
/*!40000 ALTER TABLE `account_chart` DISABLE KEYS */;
INSERT INTO `account_chart` VALUES (1010,'Bank cash',1),(2400,'The credit score of an individual',1),(3014,'Current account of an individual',2),(7327,'Bank development fund',2);
/*!40000 ALTER TABLE `account_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_credit`
--

DROP TABLE IF EXISTS `account_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_account_id` bigint(13) unsigned NOT NULL,
  `percentage_account_id` bigint(13) unsigned NOT NULL,
  `credit_id` int(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_credit_credit_idx` (`credit_id`),
  KEY `fk_account_credit_account_idx` (`main_account_id`),
  KEY `fk_account_deposit_perc_account_idx` (`percentage_account_id`),
  CONSTRAINT `fk_account_credit_credit` FOREIGN KEY (`credit_id`) REFERENCES `credit` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_account_credit_main_account` FOREIGN KEY (`main_account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_account_credit_perc_account` FOREIGN KEY (`percentage_account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_credit`
--

LOCK TABLES `account_credit` WRITE;
/*!40000 ALTER TABLE `account_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_deposit`
--

DROP TABLE IF EXISTS `account_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_account_id` bigint(13) unsigned NOT NULL,
  `percentage_account_id` bigint(13) unsigned NOT NULL,
  `deposit_id` int(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_deposit_idx` (`main_account_id`),
  KEY `fk_account_deposit_deposit_idx` (`deposit_id`),
  KEY `fk_account_deposit_perc_account_idx` (`percentage_account_id`),
  CONSTRAINT `fk_account_deposit_deposit` FOREIGN KEY (`deposit_id`) REFERENCES `deposit` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_account_deposit_main_account` FOREIGN KEY (`main_account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_account_deposit_perc_account` FOREIGN KEY (`percentage_account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_deposit`
--

LOCK TABLES `account_deposit` WRITE;
/*!40000 ALTER TABLE `account_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1,'main'),(2,'percentage');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citizenship`
--

DROP TABLE IF EXISTS `citizenship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citizenship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizenship`
--

LOCK TABLES `citizenship` WRITE;
/*!40000 ALTER TABLE `citizenship` DISABLE KEYS */;
INSERT INTO `citizenship` VALUES (1,'Republic of Belarus');
/*!40000 ALTER TABLE `citizenship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Minsk'),(3,'Gomel'),(4,'Borisov'),(5,'Soligorsk'),(6,'Molodechno'),(7,'Zhodino'),(8,'Slutsk'),(9,'Vileyka'),(10,'Dzerzhinsk'),(11,'Mar’ina Gorka'),(12,'Stolbtsy'),(13,'Smolevichi'),(14,'Zaslavl'),(15,'Nesvizh'),(16,'Logoysk'),(17,'Volozhin'),(18,'Krupki'),(19,'Vitebsk'),(20,'Orsha'),(21,'Novopolotsk'),(22,'Polotsk'),(23,'Postavy'),(24,'Glubokoye'),(25,'Braslav'),(26,'Chashniki'),(27,'Verkhnedvinsk'),(28,'Mogilev'),(29,'Bobruysk'),(30,'Gorki'),(31,'Osipovichi'),(32,'Krichev'),(33,'Bykhov'),(34,'Klimovichi'),(35,'Shklov'),(37,'Brest'),(38,'Cherikov'),(39,'Dobrush'),(40,'Zhinkovichi'),(41,'Turov'),(42,'Baranovichi'),(43,'Pinsk'),(44,'Kobrin'),(45,'Luninets'),(46,'Ivatsevichi'),(47,'Pruzhany'),(48,'Kamenets'),(49,'Kossovo'),(50,'Grodno'),(51,'Lida'),(52,'Slonim'),(53,'Volkovysk'),(54,'Smorgon'),(55,'Novogrudok'),(56,'Oshmyany');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `patronymic` varchar(40) NOT NULL,
  `info_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `passport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `passport_id_UNIQUE` (`passport_id`),
  UNIQUE KEY `info_id_UNIQUE` (`info_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_client_client_info1_idx` (`info_id`),
  KEY `fk_client_job1_idx` (`job_id`),
  KEY `fk_client_passport1_idx` (`passport_id`),
  CONSTRAINT `fk_client_client_info` FOREIGN KEY (`info_id`) REFERENCES `client_info` (`info_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_client_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`c_job_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_client_passport` FOREIGN KEY (`passport_id`) REFERENCES `passport` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bank`.`client_AFTER_DELETE` 
AFTER DELETE ON `client` 
FOR EACH ROW
begin
	DELETE FROM `passport` WHERE id = OLD.passport_id ; 
	DELETE FROM `client_info` WHERE info_id = OLD.info_id ;
	DELETE FROM `job` WHERE c_job_id = OLD.job_id ;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `client_card`
--

DROP TABLE IF EXISTS `client_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `password` varchar(4) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `account_id` bigint(13) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id_UNIQUE` (`account_id`),
  KEY `fk_client_card_client_id_idx` (`client_id`),
  CONSTRAINT `fk_client_card_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_client_card_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_card`
--

LOCK TABLES `client_card` WRITE;
/*!40000 ALTER TABLE `client_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_info`
--

DROP TABLE IF EXISTS `client_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date NOT NULL,
  `birthplace` varchar(200) NOT NULL,
  `residence_city_id` int(11) NOT NULL,
  `address` varchar(150) NOT NULL,
  `home_tel` varchar(20) DEFAULT NULL,
  `mobile_tel` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `marital_status_id` int(11) NOT NULL,
  `pensioner` tinyint(1) NOT NULL,
  `disability_id` int(11) NOT NULL,
  PRIMARY KEY (`info_id`),
  UNIQUE KEY `info_id_UNIQUE` (`info_id`),
  KEY `fk_client_info_disability1_idx` (`disability_id`),
  KEY `fk_client_info_marital_status1_idx` (`marital_status_id`),
  KEY `fk_client_info_city1_idx` (`residence_city_id`),
  CONSTRAINT `fk_client_info_city1` FOREIGN KEY (`residence_city_id`) REFERENCES `city` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_client_info_disability1` FOREIGN KEY (`disability_id`) REFERENCES `disability` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_client_info_marital_status1` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_info`
--

LOCK TABLES `client_info` WRITE;
/*!40000 ALTER TABLE `client_info` DISABLE KEYS */;
INSERT INTO `client_info` VALUES (10,'2015-12-22','2',1,'Gracheva 9-12','+37517 171-15-10','+37517 677-92-90','ex@gmail.com',1,0,1),(11,'2015-12-15','2',1,'12','+37517 111-15-11','+37517 177-92-92','example1@gmail.com',1,0,1);
/*!40000 ALTER TABLE `client_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL,
  `rate_id` int(2) NOT NULL,
  `start_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `period_num` int(11) DEFAULT NULL,
  `amount` decimal(30,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_credit_client_idx` (`user_id`),
  KEY `fk_credit_rate_idx` (`rate_id`),
  CONSTRAINT `fk_credit_client` FOREIGN KEY (`user_id`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_credit_rate` FOREIGN KEY (`rate_id`) REFERENCES `credit_rate` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_rate`
--

DROP TABLE IF EXISTS `credit_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `term` int(5) unsigned NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_credit_rates_type_id_idx` (`type_id`),
  KEY `FK_credit_rates_currency_code_idx` (`currency_id`),
  CONSTRAINT `fk_creadit_rate_credit_type` FOREIGN KEY (`type_id`) REFERENCES `credit_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_credit_rate_currency` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_rate`
--

LOCK TABLES `credit_rate` WRITE;
/*!40000 ALTER TABLE `credit_rate` DISABLE KEYS */;
INSERT INTO `credit_rate` VALUES (5,1,'Спрынтар',1,24,39.50),(6,2,'Дабрабыт',1,24,39.00);
/*!40000 ALTER TABLE `credit_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_type`
--

DROP TABLE IF EXISTS `credit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_type` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_type`
--

LOCK TABLES `credit_type` WRITE;
/*!40000 ALTER TABLE `credit_type` DISABLE KEYS */;
INSERT INTO `credit_type` VALUES (1,'Annuity'),(2,'Standard');
/*!40000 ALTER TABLE `credit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'BYR','Belarusian ruble'),(2,'EUR','Euro'),(3,'RUR','Russian ruble'),(4,'USD','Dollar');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `days_num` int(11) NOT NULL,
  `amount` decimal(30,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deposit_client_idx` (`client_id`),
  KEY `fk_deposit_rate_idx` (`rate_id`),
  CONSTRAINT `fk_deposit_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_deposit_rate` FOREIGN KEY (`rate_id`) REFERENCES `deposit_rate` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_rate`
--

DROP TABLE IF EXISTS `deposit_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `term` int(5) unsigned DEFAULT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deposit_rate_currency_idx` (`currency_id`),
  KEY `fk_deposit_rate_deposit_type_idx` (`type_id`),
  CONSTRAINT `fk_deposit_rate_currency` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_deposit_rate_deposit_type` FOREIGN KEY (`type_id`) REFERENCES `deposit_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_rate`
--

LOCK TABLES `deposit_rate` WRITE;
/*!40000 ALTER TABLE `deposit_rate` DISABLE KEYS */;
INSERT INTO `deposit_rate` VALUES (1,2,'Выгодный',1,36,5.50),(9,1,'Зручны дэпазіт',1,0,7.00),(16,2,'Персона',1,12,25.00);
/*!40000 ALTER TABLE `deposit_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_type`
--

DROP TABLE IF EXISTS `deposit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_type` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_type`
--

LOCK TABLES `deposit_type` WRITE;
/*!40000 ALTER TABLE `deposit_type` DISABLE KEYS */;
INSERT INTO `deposit_type` VALUES (1,'Term'),(2,'Call');
/*!40000 ALTER TABLE `deposit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disability`
--

DROP TABLE IF EXISTS `disability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disability`
--

LOCK TABLES `disability` WRITE;
/*!40000 ALTER TABLE `disability` DISABLE KEYS */;
INSERT INTO `disability` VALUES (1,'None'),(2,'I'),(3,'II'),(4,'III');
/*!40000 ALTER TABLE `disability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `c_job_id` int(11) NOT NULL AUTO_INCREMENT,
  `employment_place` varchar(100) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `monthly_income` double DEFAULT NULL,
  PRIMARY KEY (`c_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (12,'EPAM','',NULL),(13,'IBA','',NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marital_status`
--

DROP TABLE IF EXISTS `marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marital_status`
--

LOCK TABLES `marital_status` WRITE;
/*!40000 ALTER TABLE `marital_status` DISABLE KEYS */;
INSERT INTO `marital_status` VALUES (1,'Single'),(2,'Married'),(3,'Divorced'),(4,'Widowed');
/*!40000 ALTER TABLE `marital_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passport`
--

DROP TABLE IF EXISTS `passport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id_number` varchar(15) NOT NULL,
  `p_series` varchar(5) NOT NULL,
  `p_number` varchar(10) NOT NULL,
  `p_authority` varchar(100) NOT NULL,
  `p_issue_date` date NOT NULL,
  `citizenship_id` int(11) NOT NULL,
  `registration_city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `p_series_number` (`p_series`,`p_number`),
  UNIQUE KEY `p_id_number_UNIQUE` (`p_id_number`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_passport_citizenship1_idx` (`citizenship_id`),
  KEY `fk_passport_city1_idx` (`registration_city_id`),
  CONSTRAINT `fk_passport_citizenship1` FOREIGN KEY (`citizenship_id`) REFERENCES `citizenship` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_passport_city1` FOREIGN KEY (`registration_city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passport`
--

LOCK TABLES `passport` WRITE;
/*!40000 ALTER TABLE `passport` DISABLE KEYS */;
INSERT INTO `passport` VALUES (15,'12345678919110','MP','2021216','Minskoe ROUS','2015-12-29',1,1),(16,'22245678919110','MP','2021210','Minskoe ROUS','2015-12-01',1,1),(17,'11111111111111','qq','2222222','qq','2015-12-01',1,1),(18,'12345678919666','qq','1234565','1','2015-12-16',1,18);
/*!40000 ALTER TABLE `passport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bank'
--

--
-- Dumping routines for database 'bank'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-12 17:14:28
