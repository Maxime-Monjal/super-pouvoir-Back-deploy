CREATE DATABASE  IF NOT EXISTS `power` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `power`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: power
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `catégorie`
--

DROP TABLE IF EXISTS `catégorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catégorie` (
  `idcatégorie` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcatégorie`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catégorie`
--

LOCK TABLES `catégorie` WRITE;
/*!40000 ALTER TABLE `catégorie` DISABLE KEYS */;
INSERT INTO `catégorie` VALUES (1,'inutile'),(2,'environnementale'),(3,'corporel'),(4,'classique'),(5,'flippant');
/*!40000 ALTER TABLE `catégorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_pouvoir`
--

DROP TABLE IF EXISTS `super_pouvoir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_pouvoir` (
  `idsuper_pouvoir` int NOT NULL AUTO_INCREMENT,
  `stock` int NOT NULL,
  `prix` int NOT NULL,
  `description_meta` varchar(255) DEFAULT NULL,
  `contenu_produit` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL COMMENT '\n',
  `catégorie_idcatégorie` int NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idsuper_pouvoir`,`catégorie_idcatégorie`),
  KEY `fk_table1_catégorie_idx` (`catégorie_idcatégorie`),
  CONSTRAINT `fk_table1_catégorie` FOREIGN KEY (`catégorie_idcatégorie`) REFERENCES `catégorie` (`idcatégorie`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_pouvoir`
--

LOCK TABLES `super_pouvoir` WRITE;
/*!40000 ALTER TABLE `super_pouvoir` DISABLE KEYS */;
INSERT INTO `super_pouvoir` VALUES (1,12,100,'Manger des cailloux','Manger des cailloux','Cailloux man','cailloux','20',1,'https://www.welovebuzz.com/wp-content/uploads/2014/04/31.jpg'),(2,22,150,'Voyager dans le temps','Voyager dans le temps','Voyage man','voyage','10',4,'https://cdn.radiofrance.fr/s3/cruiser-production/2017/01/e0587c01-295a-4e50-997a-9474363cb782/838_machine_1961.jpg'),(3,25,200,'Invisible man','Etre invisible','Invisible man','invisible','4',4,'https://i.skyrock.net/3648/60013648/pics/3121021305_1_3_6jOA2SCe.jpg'),(4,57,40,'Fort man','Etre super fort','Fort man','force','3',3,'https://image.freepik.com/photos-gratuite/homme-fort-ses-bras-leves_158538-8457.jpg'),(5,14,400,'Télépathe man','Etre télépathe','Telepathe man','telepathie','2',2,'https://cdn-www.konbini.com/fr/images/files/2014/11/telepathie.jpg'),(6,98,500,'Vole man','Pouvoir voler','Vole man','voler','100',2,'https://viago.ca/wp-content/uploads/2017/09/2-homme-qui-vole-768x432.jpg'),(7,2,100,'Télékinésie man','Etre télékinésique','Telekinesie man','telekinesie','55',2,'https://i.skyrock.net/2727/93852727/pics/3251498596_1_3_fc9wek0O.jpg'),(8,1900,40,'Garde robe','Avoir un garde robe infinie','Garde robe','garde-robe','100',1,'https://i.pinimg.com/originals/93/2e/05/932e05a4cee51949961fb007d663ece1.jpg'),(9,500,250,'Métamorphose','Pouvoir se métamorphoser','Metamorphose','metamorphose','29',3,'https://media.paperblog.fr/i/343/3432897/x-men-first-class-1-x-men-casting-L-1.jpeg'),(10,6000,99,'Mémoire','Avoir un super mémoire','Memoire','memoire','50',4,'https://resize.prod.docfr.doc-media.fr/img/var/doctissimo/storage/images/media/multimedia/fr/www/bon-memoire-art/7820208-1-fre-FR/bon-memoire-art.jpg'),(11,120,59,'Jeunesse éternelle','Avoir la jeunesse éternelle','Jeunesse eternelle','jeunesse-eternelle','89',3,'https://img.src.ca/2012/04/10/635x357/120410_0s0qr_betcie_visages-vieillissement_sn635.jpg'),(12,20,49,'Hacker','Pouvoir tout hacker','Hacker','hacker','99',1,'https://img.aws.la-croix.com/2017/08/04/1200867768/En-general-hackers-toujours-ligne-crete_0_729_486.jpg'),(13,39,1000,'Lire l\'avenir','Etre capable de lire l\'avenir','Lire l\'avenir','don-voyance','20',5,'https://www.signesetsens.com/astuces-conseils-citations/lire-lavenir1.jpg'),(14,49,399,'Parler toute les langues','Pouvoir parler toutes les langues','Parler toutes les langues','polyglotte','1000',1,'https://www.dieu-en-ligne.com/images/langues.jpg'),(15,69,69,'Prendre des photos avec ses yeux','Pouvoir prendre des photos avec ses yeux','Prendre des photos avec ses yeux','photos-avec-yeux','99',1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfWa9B7JPKSZKvuX_oMipg5g1ZKmIIp5sWRA&usqp=CAU'),(16,19,40,'Super vision','Avoir une super vision','Super vision','super-vision','56',5,'https://miro.medium.com/max/713/1*cGsmoTNF2Y3yu-3LyJUmtg.png'),(17,200,199,'Marcher sur l\'eau','Pouvoir marcher sur l\'eau','Marcher sur l\'eau','marcher-sur-eau','199',2,'https://lh3.googleusercontent.com/proxy/6qhSyc5AddPf6fYbcqKiIYn97GHFpVuoMd7qcE2W-TKTY_lcG_C7dVxXBxbO8N-Y10NttQ6N2i1cSn674CT8exljuF24Ga_1qypgMcAZxO393C6ItrHc6wTUibuxxXCjgrOQWYewnPvBe0c4m1I1KptFEK0YEMFwyUgdwqk'),(18,1,999,'Transformer l\'eau en vin','Pouvoir tansformer l\'eau en vin','Transformer l\'eau en vin','eau-en-vin','2000',2,'https://i.ytimg.com/vi/bKxMOqwkHwk/hqdefault.jpg'),(19,214,59,'Respirer sous l\'eau','Pouvoir respirer sous l\'eau','Respirer sous l\'eau','respirer-sous-eau','400',3,'https://www.terresacree.org/actualites/fichiers/images/2014-10/1412857002-j4X.jpg');
/*!40000 ALTER TABLE `super_pouvoir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Loïc','Bodolec','lbodolec@gmail.com','$2b$10$9I1IUTILT3I68qEOoWSZZ.g0ab9B8fWa4qzK4YQdqCrdcE5e4bKf2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'power'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-14 22:58:11
