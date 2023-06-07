-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ornaman
-- ------------------------------------------------------
-- Server version	8.0.26-google

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ornaman`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ornaman` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ornaman`;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `id` varchar(15) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `post_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_user_id_foreign` (`user_id`),
  KEY `favorite_post_id_foreign` (`post_id`),
  CONSTRAINT `favorite_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES ('fav-002ca7','user-97e049','post-111d59'),('fav-08050b','user-9b5b67','post-f1fd80'),('fav-5f1216','user-f24f39','post-111d59'),('fav-955c67','user-97e049','post-e99636');
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plants` (
  `id` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` varchar(555) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plants`
--

LOCK TABLES `plants` WRITE;
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
INSERT INTO `plants` VALUES ('plant-460f60','Suplir','Suplir  (Adiantum formosum) berasal dari Australia dan Selandia Baru dan ditemukan di hutan hujan, aliran air, dan ngarai. Meskipun dedaunannya terlihat halus, tanaman ini adalah tanaman yang keras dan mudah tumbuh, dengan air yang cukup. Tumbuh perlahan dan tidak suka dipindahkan begitu sudah mapan.'),('plant-5dcc15','Lidah Mertua','Lidah mertua (Sansevieria) dapat dianggap sebagai tanaman hias dan pajangan arsitektural karena daunnya yang seperti pedang dengan pola garis tebal, yang khas dan menarik perhatian. Lidah mertua adalah marga tanaman hias yang cukup populer sebagai penghias bagian dalam rumah karena tanaman ini dapat tumbuh dalam kondisi yang sedikit air dan cahaya matahari. Namun, berhati-hatilah dengan tanaman ini karena beracun jika tertelan dan dapat menyebabkan mual, muntah, bahkan pembengkakan tenggorokan dan lidah.'),('plant-5ee69c','Alocasia','Kuping gajah (Alocasia) adalah spesies hibrida antara Alocasia longiloba dan Alocasia sanderiana. Alocasia dikenal karena daunnya yang besar dan beragam kultivar dalam spesiesnya. Kuping Gajah berasal dari Asia tropis dan Australia.'),('plant-6dad53','Gelombang Cinta','Gelombang cinta (Anthurium plowmanii) adalah contoh keserbagunaan. Di habitat aslinya, tanaman tropis dengan dedaunan besar yang menarik ini tumbuh sebagai epifit, paling sering menempel pada pohon. Namun karena ukuran dan berat dedaunannya, ia dapat jatuh ke tanah dan terus tumbuh sebagai tanaman terestrial. Julukan spesifik dari nama Latin, plowmanii, diberikan untuk menghormati ahli etnobotani abad ke-20 yang meninggal secara tragis, Timothy Plowman.'),('plant-903512','Janda Bolong','Janda bolong (Monstera obliqua) adalah spesies tumbuhan asli Amerika Tengah dan Selatan. Monstera obliqua dinamai untuk lubang di daunnya. Spesies ini dianggap mahal untuk dibudidayakan dan juga dianggap sebagai spesies tanaman hias yang langka. Tanaman ini memiliki daun yang khas, yaitu terdapat bolong-bolong di tengah daunnya.'),('plant-973e5d','Lili Paris','Lili paris (Chlorophytum comosum) adalah tanaman abadi hijau dengan daun tipis panjang yang memberinya nama lain, \"tanaman pita\". Tanaman ini telah menyebar jauh dari Afrika asalnya karena mudah dirawat. Karena tanaman Lili paris tumbuh dengan baik di tempat teduh sebagian atau penuh, mereka menjadi tanaman hias yang populer.'),('plant-98e6b4','Pucuk Merah','Pucuk merah (Syzygium myrtifolium) adalah spesies tumbuhan yang dikenal sebagai tanaman hias yang berasal dari genus Syzygium. Warna tunas daun yang baru muncul memiliki warna merah menyala sehingga tumbuhan ini memiliki sebutan Pucuk Merah. Warna daun akan berubah perlahan menjadi hijau seiring berjalannya waktu. Pucuk merah adalah sejenis tanaman perdu yang biasanya dijadikan tanaman hias di pekarangan rumah, perkantoran dan sebagainya serta masih termasuk ke dalam family yang sama dengan tanaman cengkih.'),('plant-a644c9','Agglonema','Agglonema adalah tanaman hias populer dari suku talas-talasan atau Araceae. Genus Aglaonema memiliki sekitar 30 spesies. Mereka berasal dari daerah tropis dan subtropis di Asia dan Nugini. Mereka umumnya dikenal sebagai Chinese evergreens.');
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` varchar(15) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `plant_id` varchar(15) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_plant_id_foreign` (`plant_id`),
  CONSTRAINT `posts_plant_id_foreign` FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('post-111d59','user-9b5b67','plant-5ee69c','https://storage.googleapis.com/plant-classification-images/plant-f3dd819c.jpg'),('post-12f6c8','user-c51d80','plant-973e5d','https://storage.googleapis.com/plant-classification-images/plant-20f7a443.jpeg'),('post-6fe13d','user-fb8496','plant-903512','https://storage.googleapis.com/plant-classification-images/plant-70bfb76a.jpg'),('post-8367db','user-9b5b67','plant-5dcc15','https://storage.googleapis.com/plant-classification-images/plant-a91a05c8.jpeg'),('post-9c7c27','user-9b5b67','plant-6dad53','https://storage.googleapis.com/plant-classification-images/plant-c1bf6dff.jpg'),('post-ccd905','user-fb8496','plant-98e6b4','https://storage.googleapis.com/plant-classification-images/plant-9dc1f90d.jpg'),('post-e99636','user-f24f39','plant-a644c9','https://storage.googleapis.com/plant-classification-images/plant-382e6ee7.jpg'),('post-f1fd80','user-97e049','plant-460f60','https://storage.googleapis.com/plant-classification-images/plant-9b05408d.jpg');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('user-97e049','John','john12@gmail.com','pwd123'),('user-9b5b67','Sully','sully17@gmail.com','pwd123'),('user-c51d80','Stephen','john11@gmail.com','pwd123'),('user-f24f39','Bob','bob02@gmail.com','pwd123'),('user-fb8496','Chris','chris80@gmail.com','pwd123');
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

-- Dump completed on 2023-06-05  1:38:09
