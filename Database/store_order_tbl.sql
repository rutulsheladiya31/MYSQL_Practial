-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order_tbl`
--

DROP TABLE IF EXISTS `order_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tbl` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `order_tbl_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl`
--

LOCK TABLES `order_tbl` WRITE;
/*!40000 ALTER TABLE `order_tbl` DISABLE KEYS */;
INSERT INTO `order_tbl` VALUES (1,1,'delivered','2023-04-28 16:29:06','2023-05-05'),(2,7,'Undelivered','2023-04-28 16:29:06','2023-05-04'),(3,8,'delivered','2023-04-28 16:29:06','2023-05-03'),(4,4,'delivered','2023-04-28 16:29:06','2023-04-30'),(5,5,'Undelivered','2023-04-28 16:29:06','2023-04-30'),(6,4,'delivered','2023-04-28 16:29:06','2023-04-30'),(7,1,'Undelivered','2023-04-28 16:29:06','2023-05-01'),(8,1,'Undelivered','2023-04-28 16:29:06','2023-05-02'),(9,4,'delivered','2023-04-28 16:29:06','2023-05-03'),(10,2,'Undelivered','2023-04-28 18:56:13','2023-05-08'),(11,3,'delivered','2023-04-28 18:56:41','2023-05-05'),(12,6,'delivered','2023-04-28 18:56:56','2023-04-30'),(13,8,'delivered','2023-04-28 19:09:10','2023-04-29'),(14,8,'delivered','2023-04-28 19:09:20','2023-05-02'),(15,8,'delivered','2023-04-28 19:09:39','2023-05-17'),(16,5,'delivered','2023-04-28 19:10:26','2023-05-01'),(17,5,'delivered','2023-04-28 19:10:31','2023-05-05'),(18,5,'delivered','2023-04-28 19:10:42','2023-05-13'),(19,5,'delivered','2023-04-28 19:11:46','2023-05-07'),(20,8,'delivered','2023-04-28 19:11:56','2023-05-01'),(21,8,'delivered','2023-04-28 19:12:14','2023-05-02'),(22,4,'delivered','2023-04-28 19:12:33','2023-05-04');
/*!40000 ALTER TABLE `order_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 14:49:09
