-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: phone_directory
-- ------------------------------------------------------
-- Server version	5.6.29

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
-- Current Database: `phone_directory`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phone_directory` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `phone_directory`;

--
-- Table structure for table `directory`
--

DROP TABLE IF EXISTS `directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userPhone` varchar(15) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `work` varchar(15) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `home` varchar(15) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory`
--

LOCK TABLES `directory` WRITE;
/*!40000 ALTER TABLE `directory` DISABLE KEYS */;
INSERT INTO `directory` VALUES (2,'9988776655','2123 adasd das','','Rajapalayam','Tamil Nadu','12312','India','324234412','123121341','12312314234','Subbu Lakshmi','G'),(3,'9988776655','adasdasd','afdfdf','dfasfd','Tamil Nadu','asfaf','India','1313411','134134134','1312312','Gnanavel','VP');
/*!40000 ALTER TABLE `directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Sivanantham G','9988776655','25d55ad283aa400af464c76d713c07ad');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'phone_directory'
--

--
-- Dumping routines for database 'phone_directory'
--

--
-- Current Database: `space_portal`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `space_portal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `space_portal`;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `fname` varchar(15) DEFAULT NULL,
  `lname` varchar(15) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('siva@chargebee.com','Sivananthan','Gnanavel','63 Thirumalai Nagar','Perungudi','Chennai','Tamil Nadu','India','600096','25d55ad283aa400af464c76d713c07ad');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'space_portal'
--

--
-- Dumping routines for database 'space_portal'
--

--
-- Current Database: `sample`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sample` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sample`;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(19) NOT NULL,
  `subject_id` bigint(19) NOT NULL,
  `quarterly` int(11) NOT NULL DEFAULT '0',
  `half_yearly` int(11) NOT NULL DEFAULT '0',
  `annual` int(11) NOT NULL DEFAULT '0',
  `year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `average` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_marks_student_id` (`student_id`),
  CONSTRAINT `fk_marks_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1126 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1001,100001,1,0,79,91,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',56.666666666),(1002,100002,1,35,49,77,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',53.666666666),(1003,100003,1,100,97,95,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',97.333333333),(1004,100004,1,38,38,65,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',47),(1005,100005,1,73,40,100,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',71),(1006,100001,2,0,30,76,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',35.333333333),(1007,100002,2,37,45,87,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',56.333333333),(1008,100003,2,93,91,98,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',94),(1009,100004,2,93,59,63,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',71.666666666),(1010,100005,2,34,89,45,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',56),(1011,100001,3,0,86,89,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',58.333333333),(1012,100002,3,46,76,48,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',56.666666666),(1013,100003,3,46,0,83,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',43),(1014,100004,3,71,74,31,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',58.666666666),(1015,100005,3,34,54,36,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',41.333333333),(1016,100001,4,0,0,80,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',26.666666666),(1017,100002,4,52,43,31,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',42),(1018,100003,4,91,95,99,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',95),(1019,100004,4,46,76,39,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',53.666666666),(1020,100005,4,80,41,94,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',71.666666666),(1021,100001,5,0,31,88,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',39.666666666),(1022,100002,5,33,44,53,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',43.333333333),(1023,100003,5,98,92,90,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',93.333333333),(1024,100004,5,52,63,63,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',59.333333333),(1025,100005,5,56,60,48,2003,6,'2016-02-10 13:11:23','2016-02-10 15:40:32',54.666666666),(1026,100001,1,59,34,57,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',50),(1027,100002,1,47,37,94,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',59.333333333),(1028,100003,1,47,80,97,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',74.666666666),(1029,100004,1,89,43,68,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',66.666666666),(1030,100005,1,72,82,47,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',67),(1031,100001,2,44,54,31,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',43),(1032,100002,2,85,96,89,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',90),(1033,100003,2,84,63,57,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',68),(1034,100004,2,83,97,53,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',77.666666666),(1035,100005,2,53,30,80,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',54.333333333),(1036,100001,3,44,90,54,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',62.666666666),(1037,100002,3,53,36,87,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',58.666666666),(1038,100003,3,64,55,39,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',52.666666666),(1039,100004,3,95,36,54,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',61.666666666),(1040,100005,3,66,87,37,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',63.333333333),(1041,100001,4,31,65,69,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',55),(1042,100002,4,98,30,94,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',74),(1043,100003,4,43,60,83,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',62),(1044,100004,4,76,79,40,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',65),(1045,100005,4,66,43,75,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',61.333333333),(1046,100001,5,58,51,98,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',69),(1047,100002,5,41,92,99,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',77.333333333),(1048,100003,5,86,56,43,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',61.666666666),(1049,100004,5,35,90,92,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',72.333333333),(1050,100005,5,36,35,48,2004,7,'2016-02-10 13:11:23','2016-02-10 15:40:32',39.666666666),(1051,100001,1,96,57,94,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',82.333333333),(1052,100002,1,68,41,50,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',53),(1053,100003,1,60,83,73,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',72),(1054,100004,1,53,81,97,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',77),(1055,100005,1,64,81,39,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',61.333333333),(1056,100001,2,77,82,36,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',65),(1057,100002,2,73,57,52,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',60.666666666),(1058,100003,2,38,35,81,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',51.333333333),(1059,100004,2,69,46,44,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',53),(1060,100005,2,35,95,39,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',56.333333333),(1061,100001,3,32,70,58,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',53.333333333),(1062,100002,3,43,48,65,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',52),(1063,100003,3,81,38,90,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',69.666666666),(1064,100004,3,88,90,92,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',90),(1065,100005,3,34,95,76,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',68.333333333),(1066,100001,4,64,69,87,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',73.333333333),(1067,100002,4,62,38,95,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',65),(1068,100003,4,79,49,86,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',71.333333333),(1069,100004,4,68,33,33,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',44.666666666),(1070,100005,4,72,39,84,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',65),(1071,100001,5,65,77,100,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',80.666666666),(1072,100002,5,82,90,33,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',68.333333333),(1073,100003,5,76,44,55,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',58.333333333),(1074,100004,5,96,76,46,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',72.666666666),(1075,100005,5,50,75,49,2005,8,'2016-02-10 13:11:23','2016-02-10 15:40:32',58),(1076,100001,1,67,84,51,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',67.333333333),(1077,100002,1,63,68,46,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',59),(1078,100003,1,89,96,31,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',72),(1079,100004,1,86,74,82,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',80.666666666),(1080,100005,1,91,49,70,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',70),(1081,100001,2,65,90,67,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',74),(1082,100002,2,77,38,75,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',63.333333333),(1083,100003,2,100,99,95,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',98),(1084,100004,2,100,37,40,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',59),(1085,100005,2,85,69,37,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',63.666666666),(1086,100001,3,0,0,32,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',10.666666666),(1087,100002,3,98,34,31,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',54.333333333),(1088,100003,3,65,83,36,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',61.333333333),(1089,100004,3,82,75,67,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',74.666666666),(1090,100005,3,93,78,39,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',70),(1091,100001,4,83,75,59,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',72.333333333),(1092,100002,4,81,56,30,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',55.666666666),(1093,100003,4,94,60,68,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',74),(1094,100004,4,59,92,47,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',66),(1095,100005,4,76,82,83,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',80.333333333),(1096,100001,5,73,70,87,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',76.666666666),(1097,100002,5,50,52,36,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',46),(1098,100003,5,57,96,88,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',80.333333333),(1099,100004,5,54,77,51,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',60.666666666),(1100,100005,5,86,66,91,2006,9,'2016-02-10 13:11:23','2016-02-10 15:40:32',81),(1101,100001,1,0,0,0,2007,10,'2016-02-10 13:11:23','2016-02-10 15:07:05',0),(1102,100002,1,93,31,79,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',67.666666666),(1103,100003,1,81,92,69,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',80.666666666),(1104,100004,1,32,31,76,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',46.333333333),(1105,100005,1,82,65,87,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',78),(1106,100001,2,62,80,36,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',59.333333333),(1107,100002,2,34,49,87,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',56.666666666),(1108,100003,2,95,89,89,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',91),(1109,100004,2,50,46,76,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',57.333333333),(1110,100005,2,86,87,84,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',85.666666666),(1111,100001,3,91,64,80,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',78.333333333),(1112,100002,3,52,60,94,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',68.666666666),(1113,100003,3,50,81,58,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',63),(1114,100004,3,65,39,46,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',50),(1115,100005,3,44,79,91,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',71.333333333),(1116,100001,4,55,96,55,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',68.666666666),(1117,100002,4,82,67,94,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',81),(1118,100003,4,85,76,47,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',69.333333333),(1119,100004,4,79,89,89,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',85.666666666),(1120,100005,4,72,56,57,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',61.666666666),(1121,100001,5,93,52,41,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',62),(1122,100002,5,42,63,75,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',60),(1123,100003,5,88,31,43,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',54),(1124,100004,5,57,36,67,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',53.333333333),(1125,100005,5,87,99,93,2007,10,'2016-02-10 13:11:23','2016-02-10 15:40:32',93);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medals`
--

DROP TABLE IF EXISTS `medals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medals` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(19) NOT NULL,
  `game_id` bigint(19) NOT NULL,
  `medal_won` varchar(10) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `medal_received` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medals_student_id` (`student_id`),
  CONSTRAINT `fk_medals_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medals`
--

LOCK TABLES `medals` WRITE;
/*!40000 ALTER TABLE `medals` DISABLE KEYS */;
INSERT INTO `medals` VALUES (101,100003,5,'gold',2003,6,'2016-02-10 13:11:24','2016-02-10 15:59:31','gold'),(102,100001,5,'silver',2003,6,'2016-02-10 13:11:24','2016-02-10 15:59:31','silver'),(103,100002,4,'silver',2003,6,'2016-02-10 13:11:24','2016-02-10 15:59:31','silver'),(104,100003,1,'gold',2003,6,'2016-02-10 13:11:24','2016-02-10 15:59:31','gold'),(105,100003,3,'bronze',2004,7,'2016-02-10 13:11:24','2016-02-10 15:59:31','bronze'),(106,100003,4,'silver',2004,7,'2016-02-10 13:11:24','2016-02-10 15:59:31','silver'),(107,100002,2,'silver',2004,7,'2016-02-10 13:11:24','2016-02-10 15:59:31','silver'),(108,100002,4,'bronze',2004,7,'2016-02-10 13:11:24','2016-02-10 15:59:31','bronze'),(109,100002,5,'gold',2004,7,'2016-02-10 13:11:24','2016-02-10 15:59:31','gold'),(110,100003,3,'bronze',2005,8,'2016-02-10 13:11:24','2016-02-10 15:59:31','bronze'),(111,100001,2,'gold',2005,8,'2016-02-10 13:11:24','2016-02-10 15:59:31','gold'),(112,100001,3,'bronze',2005,8,'2016-02-10 13:11:24','2016-02-10 15:59:31','bronze'),(113,100001,4,'bronze',2005,8,'2016-02-10 13:11:24','2016-02-10 15:59:31','bronze');
/*!40000 ALTER TABLE `medals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100007 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (100001,'Thor','2016-02-10 14:59:22','2016-02-10 14:59:50'),(100002,'Hulk','2016-02-10 14:59:22','2016-02-10 14:59:50'),(100003,'Daredevil','2016-02-10 14:59:22','2016-02-10 14:59:50'),(100004,'X Man','2016-02-10 14:59:22','2016-02-10 14:59:50'),(100005,'Ironman','2016-02-10 14:59:22','2016-02-10 14:59:50'),(100006,'Quicksilver','2016-02-10 14:59:22','2016-02-10 14:59:50');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_summary`
--

DROP TABLE IF EXISTS `students_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_summary` (
  `student_id` bigint(19) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `no_of_medals_received` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_summary`
--

LOCK TABLES `students_summary` WRITE;
/*!40000 ALTER TABLE `students_summary` DISABLE KEYS */;
INSERT INTO `students_summary` VALUES (100001,'Thor',2003,84.8,1),(100001,'Thor',2004,61.8,0),(100001,'Thor',2005,75,3),(100001,'Thor',2006,59.2,0),(100001,'Thor',2007,42.4,0),(100002,'Hulk',2003,59.2,1),(100002,'Hulk',2004,92.6,3),(100002,'Hulk',2005,59,0),(100002,'Hulk',2006,43.6,0),(100002,'Hulk',2007,85.8,0),(100003,'Daredevil',2003,93,2),(100003,'Daredevil',2004,63.8,2),(100003,'Daredevil',2005,77,1),(100003,'Daredevil',2006,63.6,0),(100003,'Daredevil',2007,61.2,0),(100004,'X Man',2003,52.2,0),(100004,'X Man',2004,61.4,0),(100004,'X Man',2005,62.4,0),(100004,'X Man',2006,57.4,0),(100004,'X Man',2007,70.8,0),(100005,'Ironman',2003,64.6,0),(100005,'Ironman',2004,57.4,0),(100005,'Ironman',2005,57.4,0),(100005,'Ironman',2006,64,0),(100005,'Ironman',2007,82.4,0),(100006,'Quicksilver',NULL,0,0);
/*!40000 ALTER TABLE `students_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sample'
--

--
-- Dumping routines for database 'sample'
--

--
-- Current Database: `phone`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phone` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `phone`;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `name` varchar(30) DEFAULT NULL,
  `number` varchar(10) NOT NULL,
  `tag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('Sivanantham','7598630402','Home'),('Sivanantham','8489130402','Work'),('SivaGuru','8899776677','Homes'),('Siva','9876543210','Demo'),('Arun','9988771122','Home');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'phone'
--

--
-- Dumping routines for database 'phone'
--

--
-- Current Database: `railway`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `railway` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `railway`;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `bookingRefNo` int(6) NOT NULL,
  `routeId` int(6) DEFAULT NULL,
  `trainNo` int(6) DEFAULT NULL,
  `coachCode` varchar(2) DEFAULT NULL,
  `dataOfJourney` date DEFAULT NULL,
  `dateOfBooking` date DEFAULT NULL,
  `noOfTickets` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookingRefNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (400001,300001,100002,'SL','2016-02-10','2016-01-01',200),(400002,300001,100002,'SL','2016-02-10','2016-01-02',150),(400003,300001,100002,'2A','2016-02-10','2016-01-02',150),(400004,300001,100002,'3A','2016-02-10','2016-01-02',180),(400005,300001,100002,'1A','2016-02-10','2016-01-03',80),(400006,300001,100002,'3A','2016-03-10','2016-02-02',90),(400007,300003,100001,'SL','2016-04-12','2016-02-15',90);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coaches` (
  `coachCode` varchar(2) NOT NULL,
  `costPerKm` double DEFAULT NULL,
  PRIMARY KEY (`coachCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES ('1A',10),('2A',7.5),('3A',5.5),('SL',3.5);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `routeId` int(6) NOT NULL,
  `originStationId` int(6) DEFAULT NULL,
  `destinationStationId` int(6) DEFAULT NULL,
  `distanceInKm` double DEFAULT NULL,
  PRIMARY KEY (`routeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (300001,200001,200004,400),(300002,200001,200003,500),(300003,200001,200002,800),(300004,200004,200002,800),(300005,200004,200001,420);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stations` (
  `stationId` int(6) NOT NULL,
  `stationCode` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`stationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (200001,'MS'),(200002,'RJPM'),(200003,'MYS'),(200004,'BAN');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainCoaches`
--

DROP TABLE IF EXISTS `trainCoaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainCoaches` (
  `trainNo` int(6) DEFAULT NULL,
  `coachCode` varchar(2) DEFAULT NULL,
  `noOfSeats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainCoaches`
--

LOCK TABLES `trainCoaches` WRITE;
/*!40000 ALTER TABLE `trainCoaches` DISABLE KEYS */;
INSERT INTO `trainCoaches` VALUES (100001,'SL',100),(100002,'SL',100),(100002,'3A',100),(100001,'3A',100),(100001,'2A',100),(100002,'2A',100),(100001,'1A',200),(100002,'1A',200);
/*!40000 ALTER TABLE `trainCoaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainRouteMaps`
--

DROP TABLE IF EXISTS `trainRouteMaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainRouteMaps` (
  `routeId` int(6) NOT NULL,
  `trainNo` int(6) NOT NULL,
  `arrivalTime` time DEFAULT NULL,
  `departureTime` time DEFAULT NULL,
  `durationInMins` int(11) DEFAULT NULL,
  PRIMARY KEY (`routeId`,`trainNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainRouteMaps`
--

LOCK TABLES `trainRouteMaps` WRITE;
/*!40000 ALTER TABLE `trainRouteMaps` DISABLE KEYS */;
INSERT INTO `trainRouteMaps` VALUES (300001,100002,'10:00:00','10:35:00',35),(300002,100002,'08:00:00','08:20:00',20),(300003,100001,'20:00:00','20:45:00',45),(300004,100002,'22:00:00','22:10:00',10),(300005,100002,'12:00:00','12:10:00',10);
/*!40000 ALTER TABLE `trainRouteMaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trains` (
  `trainNo` int(6) NOT NULL,
  `trainName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`trainNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES (100001,'POTHIGAI EXPRESS'),(100002,'MYSORE EXPRESS');
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` varchar(15) NOT NULL,
  `loginId` varchar(10) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('901','901','901'),('902','902','902'),('903','903','903'),('904','904','904');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'railway'
--

--
-- Dumping routines for database 'railway'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-23 17:55:14
