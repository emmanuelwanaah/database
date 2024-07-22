-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: orgar_phone_shop
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Doe','john.doe@example.com','555-1234','123 Maple St, Springfield, IL'),(2,'Jane','Smith','jane.smith@example.com','555-5678','456 Oak St, Springfield, IL'),(3,'Jim','Brown','jim.brown@example.com','555-8765','789 Pine St, Springfield, IL'),(4,'John','Doe','john.doe@example.com','555-1234','123 Maple St, Springfield, IL'),(5,'Jane','Smith','jane.smith@example.com','555-5678','456 Oak St, Springfield, IL'),(6,'Jim','Brown','jim.brown@example.com','555-8765','789 Pine St, Springfield, IL');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `DeviceID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `IMEI` varchar(20) DEFAULT NULL,
  `Issue_Description` text,
  `Repair_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DeviceID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `device_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,1,'Apple','iPhone 12','123456789012345','Screen cracked','In Progress'),(2,2,'Samsung','Galaxy S21','987654321098765','Battery issue','Completed'),(3,3,'Google','Pixel 5','567890123456789','Software issue','Pending'),(4,1,'Apple','iPhone 12','123456789012345','Screen cracked','In Progress'),(5,2,'Samsung','Galaxy S21','987654321098765','Battery issue','Completed'),(6,3,'Google','Pixel 5','567890123456789','Software issue','Pending');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_inventory`
--

DROP TABLE IF EXISTS `part_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_inventory` (
  `Part_ID` int NOT NULL AUTO_INCREMENT,
  `Part_Name` varchar(100) DEFAULT NULL,
  `Manufacturer` varchar(100) DEFAULT NULL,
  `Compatible_Device` varchar(100) DEFAULT NULL,
  `Part_Cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Part_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_inventory`
--

LOCK TABLES `part_inventory` WRITE;
/*!40000 ALTER TABLE `part_inventory` DISABLE KEYS */;
INSERT INTO `part_inventory` VALUES (1,'iPhone 12 Screen','Apple','iPhone 12',199.99),(2,'Galaxy S21 Battery','Samsung','Galaxy S21',49.99),(3,'Pixel 5 Motherboard','Google','Pixel 5',299.99),(4,'iPhone 12 Screen','Apple','iPhone 12',199.99),(5,'Galaxy S21 Battery','Samsung','Galaxy S21',49.99),(6,'Pixel 5 Motherboard','Google','Pixel 5',299.99);
/*!40000 ALTER TABLE `part_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_inventory_repair`
--

DROP TABLE IF EXISTS `part_inventory_repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part_inventory_repair` (
  `Part_ID` int NOT NULL,
  `Repair_ID` int NOT NULL,
  PRIMARY KEY (`Part_ID`,`Repair_ID`),
  KEY `Repair_ID` (`Repair_ID`),
  CONSTRAINT `part_inventory_repair_ibfk_1` FOREIGN KEY (`Part_ID`) REFERENCES `part_inventory` (`Part_ID`),
  CONSTRAINT `part_inventory_repair_ibfk_2` FOREIGN KEY (`Repair_ID`) REFERENCES `repair` (`RepairID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_inventory_repair`
--

LOCK TABLES `part_inventory_repair` WRITE;
/*!40000 ALTER TABLE `part_inventory_repair` DISABLE KEYS */;
INSERT INTO `part_inventory_repair` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `part_inventory_repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair` (
  `RepairID` int NOT NULL AUTO_INCREMENT,
  `Device_ID` int DEFAULT NULL,
  `Technician_ID` int DEFAULT NULL,
  `Repair_Date` date DEFAULT NULL,
  `Repair_Cost` decimal(10,2) DEFAULT NULL,
  `Parts_Used` text,
  PRIMARY KEY (`RepairID`),
  KEY `Device_ID` (`Device_ID`),
  KEY `Technician_ID` (`Technician_ID`),
  CONSTRAINT `repair_ibfk_1` FOREIGN KEY (`Device_ID`) REFERENCES `device` (`DeviceID`),
  CONSTRAINT `repair_ibfk_2` FOREIGN KEY (`Technician_ID`) REFERENCES `technician` (`TechnicianID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `repair` VALUES (1,1,1,'2024-07-01',249.99,'iPhone 12 Screen'),(2,2,2,'2024-07-02',69.99,'Galaxy S21 Battery'),(3,3,3,'2024-07-03',0.00,'None');
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_history`
--

DROP TABLE IF EXISTS `repair_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_history` (
  `RepairHistoryID` int NOT NULL AUTO_INCREMENT,
  `Device_ID` int DEFAULT NULL,
  `Repair_ID` int DEFAULT NULL,
  `Technician_ID` int DEFAULT NULL,
  `Repair_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RepairHistoryID`),
  KEY `Device_ID` (`Device_ID`),
  KEY `Repair_ID` (`Repair_ID`),
  KEY `Technician_ID` (`Technician_ID`),
  CONSTRAINT `repair_history_ibfk_1` FOREIGN KEY (`Device_ID`) REFERENCES `device` (`DeviceID`),
  CONSTRAINT `repair_history_ibfk_2` FOREIGN KEY (`Repair_ID`) REFERENCES `repair` (`RepairID`),
  CONSTRAINT `repair_history_ibfk_3` FOREIGN KEY (`Technician_ID`) REFERENCES `technician` (`TechnicianID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_history`
--

LOCK TABLES `repair_history` WRITE;
/*!40000 ALTER TABLE `repair_history` DISABLE KEYS */;
INSERT INTO `repair_history` VALUES (1,1,1,1,'InProgress'),(2,2,2,2,'Completed'),(3,3,3,3,'Pending');
/*!40000 ALTER TABLE `repair_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technician` (
  `TechnicianID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`TechnicianID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
INSERT INTO `technician` VALUES (1,'Alice','Johnson','Screen Repairs','alice.johnson@example.com','555-1122'),(2,'Bob','Williams','Battery Replacement','bob.williams@example.com','555-3344'),(3,'Charlie','Davis','Software Troubleshooting','charlie.davis@example.com','555-5566'),(4,'Alice','Johnson','Screen Repairs','alice.johnson@example.com','555-1122'),(5,'Bob','Williams','Battery Replacement','bob.williams@example.com','555-3344'),(6,'Charlie','Davis','Software Troubleshooting','charlie.davis@example.com','555-5566');
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-19  2:52:25
