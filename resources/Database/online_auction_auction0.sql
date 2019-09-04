-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: online_auction
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auction` (
  `auctionId` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) DEFAULT NULL,
  `itemName` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `startPrice` double DEFAULT NULL,
  `currentPrice` double DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `bDescription` varchar(150) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `shippingAndDelivery` varchar(1000) DEFAULT NULL,
  `returnPolicy` varchar(100) DEFAULT NULL,
  `image1` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`auctionId`),
  UNIQUE KEY `auctionId_UNIQUE` (`auctionId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,1,'Nova 3i','electronic',300,570,'2019-05-20','Huawei nova 3i Android smartphone. Announced Jul 2018.','Dual Nano-SIM (4G + 4G) ; 3G WCDMA B1 / B5 / B8 ; 4G LTE B1 / B3 / B5 / B7 / B8 / B28 / B38 / B40 / B41 ; 4G LTE does not work in the US ; 3G may not work in the US ; DOES NOT work with Sprint, Verizon, U.S. Cellular and all other CDMA carriers ; LTE compatibility: This is international stock, varies per carrier (ensure to check with your carrier before purchase)\r\nHisilicon Kirin 710 Octa-core (4x2.2 GHz Cortex-A73 & 4x1.7 GHz Cortex-A53) CPU ; 128GB ROM, 4GB RAM ; Supports microSD, up to 256 GB (uses SIM 2 slot) ; 3340 mAh battery.\r\nMain Camera: Dual: 16 MP (f/2.2, PDAF) + 2 MP ; Front Camera: Dual: 24 MP (f/2.0) + 2 MP.\r\n6.3 inches, IPS LCD capacitive touchscreen, 16M colors.\r\nPackage Content : Huawei nova 3i (INE-LX2) , Charger , Micro USB cable , Headset , Eject pin , Protective case , Quick Start Guide (if any, may come in foreign language). PLEASE NOTE: This is an international version of the phone that comes with no warranty in the US.','Worldwide','Reuturn Accepted','product1.jpg'),(2,2,'Ever-Pretty','fashion',200,250,'2019-05-25','Ever-Pretty Sleeveless V-Neck Semi-Formal Maxi Evening Dress','100%Polyester\r\nSheer chiffon fabric in outside layer and fully lined in polyester\r\nSexy plunging \"V\" shaped neckline in both front and back ,with a Lace camisole inside\r\nUnder bust area is ruched to place emphasis on curves\r\nConcealed back zip to do up\r\nLing:Yes','WorldWide','Return accepted','WEDDING_DRESS_TRENDS-1024x768.jpg'),(3,8,'Cristal Neclace','jewellery',1000,1000,'2019-05-25','Youfir Bridal Austrian Crystal Necklace and Earrings ','1.Youfir is a senior jewelry manufacturer,our exquisite workmanship to ensure the design style popular and high-quality.\r\n2.Adjustable chain length:39cm (15.35 Inch)-45cm (17.72 Inch) . Earring Size: 5cm (1.97 Inch)\r\n3.With a fabulous design and solid construction. It features crystal which will make a timeless accessory to any jewelry collection. The jewelry can be worn with classy casual or formal attire.\r\n4.Intended Use: Wedding/Mother\'s Day/Christmas/Halloween/Valentines-day/Anniversary/Birthday/Party/Event/Prom.\r\n5.Wrapping: Come with some spare crystals(if necessary), and a box printed with \"YOUFIR\" logo or favor bag (depend on product size). If you need assistance please contact us','Only to Asia','Not Accepted','Jewelry_Stones_Brilliant_Black_background_549625_1024x768.jpg'),(4,4,'Honda Civic','vehicle',5000,5000,'2019-05-25','2018 Honda Civic Touring Manual Transmission, Championship White','The 2018 Civic carries over unchanged from last year\'s model. For 2017, the Civic Si returned after a two-year hiatus, following on the heels of Honda\'s complete redesign of the Civic for the 2016 model year. Noteworthy changes include the ousting of the VTEC, the addition of turbo, and the expansion of interior room. [Editor\'s note: the vehicle reviewed here is a 2017 Honda Civic Si]','Only to Sri Lanka','Not Accepted','18bc0524a799ce3bbcaa641d5b4feed6.jpg'),(5,2,'Iphone XS','electronic',1000,1000,'2019-05-25','Apple iPhone XS (64GB) - Space Gray - [works exclusively]','5. 8-inch Super Retina display (OLED) with HDR\r\nIP68 dust and water resistant (maximum depth of 2 meters up to 30 minutes)\r\n12MP dual cameras with dual OIS and 7MP True Depth front cameraPortrait mode, Portrait Lighting, Depth Control, and Smart HDR\r\nFace ID for secure authentication and Apple Pay &#8308;\r\nA12 Bionic with next-generation Neural Engine\r\nWireless chargingworks with Qi chargers ²\r\niOS 12 with Emoji, Screen Time, Siri Shortcuts, and Group FaceTime','Worldwide','Not Accepted','iphonexsmax-1024x768.jpg');
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21 19:28:04
