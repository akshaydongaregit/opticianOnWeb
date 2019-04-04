-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: optosoft
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `checkup_info`
--

DROP TABLE IF EXISTS `checkup_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkup_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_name` char(30) DEFAULT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(6) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact_no` bigint(11) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `RE_D_SPH` float(5,2) DEFAULT NULL,
  `RE_D_CYL` float(5,2) DEFAULT NULL,
  `RE_N_SPH` float(5,2) DEFAULT NULL,
  `RE_N_CYL` float(5,2) DEFAULT NULL,
  `LE_D_AXIS` float(5,2) DEFAULT NULL,
  `LE_D_VA` float(5,2) DEFAULT NULL,
  `LE_N_AXIS` float(5,2) DEFAULT NULL,
  `LE_N_VA` float(5,2) DEFAULT NULL,
  `checkup_date` date DEFAULT NULL,
  `optician` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkup_info`
--

LOCK TABLES `checkup_info` WRITE;
/*!40000 ALTER TABLE `checkup_info` DISABLE KEYS */;
INSERT INTO `checkup_info` VALUES (11,'Raj Rajput','36','1996-10-14','male','Gadhinglaj',9846321452,'raj@gmail.com','2017-12-27',2.00,0.00,0.00,0.00,2.00,0.00,0.00,0.00,'2017-12-27','asmita'),(12,'ayush dhokare','24','1991-01-02','male','varanasi',7656432310,'ayush@yahoomail.com','2017-12-12',0.00,0.00,0.50,0.00,0.00,0.00,0.50,0.00,'2017-12-27','Nitesh'),(13,'ananda dhanawade','30','1994-12-06','male','Gargoti',9090998980,'ananda@gmail.com','2017-12-27',1.00,0.00,0.00,0.00,1.00,0.00,0.00,0.00,'2017-12-27','akshay'),(14,'Rani chopra','34','1993-08-06','female','Nippani',9755751548,'ranichopra@gmail.com','2017-12-27',0.00,3.00,0.00,3.00,0.00,0.00,0.00,0.00,'2017-12-27','Nitesh'),(17,'nikita patil','33','2003-06-13','female','chandgad',6778878888,'nikita@gmail.com','2017-12-27',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2018-01-04','akshay'),(18,'ayush dhokare','24','1991-01-02','male','varanasi',7656432310,'ayush@yahoomail.com','2017-12-12',2.00,0.00,1.00,0.00,0.00,0.00,0.00,0.00,'2018-02-09','Nitesh');
/*!40000 ALTER TABLE `checkup_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connected_users`
--

DROP TABLE IF EXISTS `connected_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connected_users` (
  `user_name` varchar(30) DEFAULT NULL,
  `user_password` varchar(30) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connected_users`
--

LOCK TABLES `connected_users` WRITE;
/*!40000 ALTER TABLE `connected_users` DISABLE KEYS */;
INSERT INTO `connected_users` VALUES ('akshay','angmar','abf99ec1d5aff7ba4184fab3e365'),('Nitesh','nit','b37c525140284aef0e589b23519c'),('asmita','1234','b77bf801b10e415ab192d0ff906a'),('Nitesh','nit','65df4acbc759707e7566c8465997');
/*!40000 ALTER TABLE `connected_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT NULL,
  `contact_no` bigint(11) DEFAULT NULL,
  `frame_type` varchar(30) DEFAULT NULL,
  `frame_price` float(8,2) DEFAULT NULL,
  `lens_type` varchar(30) DEFAULT NULL,
  `lens_price` float(8,2) DEFAULT NULL,
  `solution_price` float(6,2) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `advance` float(10,2) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `delivered` date DEFAULT NULL,
  `username` char(30) DEFAULT NULL,
  `deliverded` tinyint(1) DEFAULT '0',
  `delivereded` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (15,'aniket gore',7899879898,'Semi-Rimless',800.00,'Aspheric',600.00,90.00,1490.00,800.00,'2017-12-27',NULL,'asmita',0,NULL),(16,'Ramiz Mujawar',8979798979,'Semi-Rimless',800.00,'Photochromic',700.00,90.00,1590.00,1000.00,'2017-12-29',NULL,'asmita',0,NULL),(17,'pravin shinde',5576586756,'Full Rim',1200.00,'Trivex',500.00,90.00,1790.00,1200.00,'2017-12-29',NULL,'asmita',0,NULL),(18,'aniket dhadam',9071279953,'Rimless',1200.00,'Aspheric',700.00,90.00,1990.00,990.00,'2018-01-04',NULL,'asmita',0,NULL),(19,'aniket dhadam',9071279953,'Rimless',1200.00,'Aspheric',700.00,90.00,1990.00,990.00,'2018-01-11',NULL,'asmita',0,NULL),(20,'Vishu Shinde',7899879898,'Rimless',1200.00,'Polycarbonate',600.00,90.00,1890.00,800.00,'2018-01-14','2018-02-09','asmita',1,NULL),(21,'nikita patil',6778878888,'Full Rim',1200.00,'Polycarbonate',600.00,90.00,1890.00,900.00,'2018-01-14','2018-02-09','Nitesh',1,NULL),(22,'abhinav harer',6776766765,'Rimless',1200.00,'Bifocal',400.00,90.00,1690.00,1200.00,'2018-01-20',NULL,'Nitesh',0,NULL),(23,'Shveta kumari',8879249621,'Half-Eye',600.00,'Trivex',500.00,90.00,1190.00,400.00,'2018-02-01',NULL,'Nitesh',0,NULL),(24,'anil khamkar',6778878888,'Semi-Rimless',900.00,'High-index plastic',1200.00,90.00,2190.00,2000.00,'2018-02-03',NULL,'akshay',0,NULL),(25,'Rani chopra',9755751548,'Full Rim',1200.00,'High-index plastic',1200.00,90.00,2490.00,1500.00,'2018-02-04','2018-01-19','akshay',1,NULL),(26,'Rani Chopra',8975427367,'Semi-Rimless',1200.00,'Photochromic',2000.00,560.00,3760.00,2000.00,'2018-02-09',NULL,'asmita',0,NULL);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(7) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `contact_no` bigint(11) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `arrival` varchar(20) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (24,'ayush dhokare','1991-01-02','male','varanasi',7656432310,'ayush@yahoomail.com','2017-12-12','Nitesh',1),(29,'abhinav harer','1991-12-17','male','mahagaon',9090998980,'ak@gmail.com','2017-12-23','akshay',0),(30,'ananda dhanawade','1994-12-06','male','Gargoti',9090998980,'ananda@gmail.com','2017-12-27','akshay',0),(31,'aniket dhdam','2002-12-09','male','ajara',9071279953,'ani@gmail.com','2018-01-03','akshay',0),(32,'shivaji dorugade','1975-10-02','male','ajara',7808989889,'shivaji@gmail.com','2018-01-15','akshay',0),(33,'nikita patil','2003-06-13','female','chandgad',6778878888,'nikita@gmail.com','2018-01-23','akshay',1),(34,'Rani chopra','1993-08-06','female','Nippani',9755751548,'ranichopra@gmail.com','2018-01-28','Nitesh',0),(35,'Shveta Kumari','1990-01-16','female','Ratnagiri',8879249621,'shveta@gmail.com','2018-01-28','Nitesh',1),(36,'Raj Rajput','1996-10-14','male','Gadhinglaj',9846321452,'raj@gmail.com','2018-02-02','asmita',0),(37,'Vishu  shinde','1997-08-03','male','Gargoti',9512354785,'vishu@gmail.com','2018-02-04','asmita',0),(38,'Maruti kumar','1995-01-21','male','bhadvan',8979798979,'maruti@gmail.com','2018-02-04','asmita',0),(39,'avinash','1995-01-16','male','pune',2345678945,'avi@gmail.com','2018-02-04','akshay',0);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `const_use` tinyint(1) DEFAULT NULL,
  `near_work` tinyint(1) DEFAULT NULL,
  `distance` tinyint(1) DEFAULT NULL,
  `bifocal` varchar(30) DEFAULT NULL,
  `shade` varchar(30) DEFAULT NULL,
  `instructions` varchar(100) DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,31,0,1,0,'','','','2018-01-03'),(2,30,0,0,0,'','','','2018-01-04'),(3,30,0,0,0,'','','','2018-01-04'),(4,30,0,0,0,'','','','2018-01-04'),(5,30,0,0,0,'','','null','2018-01-04'),(6,30,0,0,0,'','','null','2018-01-04'),(7,30,0,0,0,'','','null','2018-01-04'),(8,30,0,0,0,'','','null','2018-01-04'),(9,30,0,0,0,'','','null','2018-01-04'),(10,30,0,0,0,'','','null','2018-01-04'),(11,33,0,0,0,'-','-','null','2018-01-04'),(12,30,0,0,0,'','','null','2018-01-04'),(13,24,0,0,0,'-','-','null','2018-02-09');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` char(30) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(7) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `contact_number` bigint(20) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'akshay','2021-02-17','male','polgaon',8800527878,'akshayak@gmail.com','akshay','angmar'),(2,'akshay','2021-02-17','male','polgaon',8800527878,'akshayak@gmail.com','akshay','angmar'),(3,'akshay','2021-02-17','male','polgaon',8800527878,'akshayak@gmail.com','akshay','angmar'),(4,'ashok','2012-06-04','','ajara',6876,'xcbbc','ashok','1234'),(5,'mayuri maruti patil','1997-09-09','','gond',7758042606,'patilmayurimaruti@gmail.com','mayya',''),(6,'Nitesh Deshawal','1997-04-26','male','At.Post-Khavanewadi',9071279953,'deshawalnitesh@gmail.com','Nitesh','nit'),(7,'asmita patil','2002-07-16','female','atpost-ajara 416505',1234567890,'asmita@gmail.com','asmita','1234'),(8,'asmita patil','2002-07-16','female','atpost-ajara 416505',1234567890,'asmita@gmail.com','asmita','1234'),(9,'Aniket','1995-01-18','','Nippani',8886454534,'ani@gmail.com','ani','aniket123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-05 15:21:20
