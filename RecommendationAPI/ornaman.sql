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
  `plant_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_user_id_foreign` (`user_id`),
  KEY `favorite_plant_id_foreign` (`plant_id`),
  CONSTRAINT `favorite_plant_id_foreign` FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES ('fav-05f568','user-c51d80','plant-98e6b4'),('fav-1a618d','user-c51d80','plant-5ee69c'),('fav-28fe76','user-f24f39','plant-973e5d'),('fav-292b8b','user-fb8496','plant-98e6b4'),('fav-299626','user-f24f39','plant-98e6b4'),('fav-476461','user-9b5b67','plant-a644c9'),('fav-5a1115','user-97e049','plant-a644c9'),('fav-9498a1','user-9b5b67','plant-98e6b4'),('fav-a28437','user-97e049','plant-98e6b4'),('fav-a7148a','user-fb8496','plant-903512'),('fav-c07826','user-c51d80','plant-a644c9'),('fav-c8acf7','user-97e049','plant-5dcc15'),('fav-c9e229','user-f24f39','plant-6dad53'),('fav-dc9395','user-9b5b67','plant-6dad53'),('fav-df7373','user-fb8496','plant-6dad53'),('fav-ee3866','user-97e049','plant-973e5d'),('fav-f99853','user-9b5b67','plant-973e5d');
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
  `name_alt` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `desc` varchar(755) NOT NULL,
  `light` varchar(555) NOT NULL,
  `water` varchar(555) NOT NULL,
  `humidity` varchar(555) NOT NULL,
  `temperature` varchar(555) NOT NULL,
  `food` varchar(655) NOT NULL,
  `toxicity` varchar(555) NOT NULL,
  `cares` varchar(555) NOT NULL,
  `fact` varchar(555) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plants`
--

LOCK TABLES `plants` WRITE;
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
INSERT INTO `plants` VALUES 
('plant-460f60','Adiantum Venustum','Suplir','https://storage.googleapis.com/plant-classification-images/plant-f08a910b.jpg','Suplir adalah tanaman pakis yang memiliki daun halus dan indah. Tanaman ini tumbuh hingga ketinggian sekitar 30-60 cm dan memiliki daun hijau muda hingga hijau tua yang lembut dan berkilau. Suplir biasanya digunakan sebagai tanaman hias dalam ruangan atau di taman teduh. Tanaman ini membutuhkan cahaya terfilter dan tanah yang lembab dengan drainase yang baik. Suplir adalah tanaman yang menarik secara visual dan juga dapat membantu memperbaiki kualitas udara di sekitarnya.','Suplir menyukai cahaya tidak langsung yang terang. Tanaman ini tumbuh dengan baik di tempat yang memiliki tingkat cahaya sedang hingga tinggi. Terlalu banyak sinar matahari langsung dapat menyebabkan daun-daunnya yang halus terbakar atau mengering. Menempatkan suplir di dekat jendela yang menghadap utara atau timur seringkali menjadi pilihan yang baik, karena memberikan jumlah kecerahan yang tepat tanpa terpapar sinar matahari langsung. Namun, suplir juga dapat beradaptasi dengan kondisi cahaya yang lebih rendah.','Suplir membutuhkan kelembaban yang cukup tinggi untuk tumbuh dengan baik. Untuk menjaga kelembaban yang optimal, Anda dapat menyemprotkan air pada daun-daun suplir secara teratur, terutama pada musim yang lebih kering atau saat suhu meningkat. Menempatkan tanaman di dekat sumber kelembaban, seperti humidifier atau pebble tray yang berisi air, juga dapat membantu meningkatkan kelembaban sekitar tanaman.','Kelembaban yang optimal bagi tanaman ini adalah sekitar 50-60%. Anda bisa menyemprotkan air secara teratur pada daun-daun suplir untuk meningkatkan kelembaban di sekitarnya. Selain itu, hindari penempatan tanaman suplir di dekat sumber panas yang dapat membuat udara menjadi kering.','Suplir tumbuh baik pada suhu yang sejuk hingga sedang. Suhu optimal untuk tanaman ini berkisar antara 15-25°C (59-77°F).','Pemberian pupuk dapat dilakukan sekitar setiap dua minggu atau sesuai petunjuk yang tertera pada kemasan pupuk yang digunakan. Gunakan pupuk yang dirancang khusus untuk tanaman daun hijau atau paku-pakuan.','Suplir tidak diketahui memiliki tingkat toksisitas yang signifikan terhadap manusia atau hewan peliharaan.','Hindari menyemprotkan air langsung pada daun tanaman, karena daunnya cenderung sensitif dan dapat merusak jika terkena air secara langsung.','Nama \"Adiantum\" berasal dari bahasa Yunani yang berarti \"tanpa debu\". Hal ini mengacu pada daun Suplir yang halus dan memiliki kemampuan mengusir debu dari permukaannya, membuatnya terlihat selalu bersih.'),
('plant-5dcc15','Sansevieria/Snake Plant','Lidah Mertua','https://storage.googleapis.com/plant-classification-images/plant-209ac929.jpg','Sansevieria ditandai dengan daun-daunnya yang tegak, keras, dan berbentuk seperti pedang. Sifat natural mereka membuat mereka menjadi pilihan alami untuk desain interior modern dan kontemporer. Jika Anda baru memulai merawat tanaman atau hanya mencari tanaman hias yang mudah dirawat, Sansevieria adalah pilihan yang tepat untuk Anda. Mereka dapat bertahan di bawah sinar matahari penuh dan mampu bertahan di kondisi cahaya rendah, meskipun mereka akan tumbuh dengan baik di bawah sinar matahari tidak langsung. Dan karena Sansevieria berasal dari padang pasir kering di Afrika Barat, mereka tidak memerlukan banyak air, terutama di musim dingin.','Sansevieria dapat mentolerir berbagai tingkat cahaya. Semakin terang cahaya yang diterimanya, semakin cepat pertumbuhannya. Selalu lakukan penyesuaian selama beberapa minggu jika ingin memindahkan tanaman dari cahaya tidak langsung ke cahaya langsung untuk menghindari terbakarnya daun.','Siram saat volume tanah sudah 100% kering. Lebih baik membiarkan tanah agak kering. Beri air dengan menyeluruh untuk mendorong pertumbuhan sistem akar yang sehat dan buang kelebihan air di alas pot.','Sansevieria lebih menyukai lingkungan yang kering. Tidak perlu disemprotkan air.','Suhu antara 55-85°F (13-29°C) cocok untuk Sansevieria. Suhu yang lebih hangat akan mendorong pertumbuhan yang lebih cepat.','Beri pupuk tanaman indoor sekali setiap enam bulan menggunakan pupuk cair.','Snake Plant beracun bagi manusia dan hewan peliharaan jika dikonsumsi.','Sansevieria berkembang biak dengan cara tumbuhnya tanaman baru (atau \'pups\') di dekat pangkal tanaman induk. Untuk menanam tanaman Sansevieria baru, lepaskan daun dan batang dengan hati-hati ketika mereka tumbuh beberapa inci, kemudian tanamkan mereka ke dalam pot baru.','Sansevieria unik karena mereka melakukan jenis fotosintesis tertentu pada malam hari yang memungkinkan mereka melepaskan oksigen sepanjang malam, berbeda dengan kebanyakan tanaman lain yang hanya melepaskan oksigen selama siang hari.'),
('plant-5ee69c','Alocasia','Kuping Gajah','https://storage.googleapis.com/plant-classification-images/plant-2aa64cb4.jpg','Alocasia adalah tanaman tropis yang menakjubkan dengan daun berbentuk panah. Area hangat dan terang di rumah Anda akan cocok dengan tanaman ini. Alocasia berasal dari daerah tropis di Kepulauan Pasifik Selatan, terutama Filipina. Tanaman Alocasia menyukai kelembaban ekstra yang terdapat di dapur atau kamar mandi.','Alocasia akan berkembang dengan baik di tempat dengan cahaya medium hingga terang yang tidak secara langsung mengenainya. Hindari sinar matahari langsung, karena itu dapat menyebabkan daun Alocasia terbakar. Tanaman ini tidak tahan terhadap kondisi cahaya rendah. Jika Anda tidak memiliki lokasi dengan pencahayaan yang ideal untuk Alocasia, gunakan Lampu sebagai pengganti cahaya.','Siram Alocasia ketika 25-50% volume tanah kering. Alocasia rentan terhadap pembusukan akar, jadi hindari penyiraman berlebihan.','Alocasia lebih suka tempat dengan kelembaban yang cukup. Semprot daun secara teratur menggunakan semprotan air, letakkan pelembab udara di dekatnya, atau gunakan nampan kerikil untuk meningkatkan kelembaban.','Alocasia lebih menyukai suhu hangat antara 65–85°F (18-29°C). Hindari udara dingin dan perubahan suhu yang tiba-tiba.','Berikan pupuk tanaman indoor serbaguna setiap bulan pada musim semi dan musim panas. Tidak perlu memberi pupuk pada bulan-bulan musim gugur dan musim dingin. Sebelum mengaplikasikan, pastikan tanahnya lembab untuk menghindari pembakaran akar.','Alocasia memiliki tingkat toksisitas yang rendah bagi hewan peliharaan dan manusia. Biasanya, jika tertelan, akan menyebabkan iritasi mulut dan perut serta muntah.','Alocasia akan mengalami periode dorman pada bulan-bulan musim dingin. Selama dormansi, simpan Alocasia di tempat yang lebih hangat di rumah. Kurangi frekuensi penyiraman tetapi jangan biarkan media tanamnya benar-benar kering. Tanaman ini secara alami akan keluar dari masa dormansi pada musim semi. Pada saat ini, mulailah memberi air tanaman dengan lebih sering dan berikan aplikasi pupuk musim semi pertamanya. Jika Alocasia perlu dipangkas, bersihkan tanaman menggunakan Gunting Tanaman yang bersih dan tajam.','Tanaman Alocasia tumbuh dari umbi, jadi bahkan jika mereka kehilangan semua daun mereka, energi yang disimpan di dalam umbi mereka memungkinkan mereka tumbuh daun baru dalam kondisi yang tepat.'),
('plant-6dad53','Anthurium/Anthurium Plowmanii','Gelombang Cinta','https://storage.googleapis.com/plant-classification-images/plant-6b709e7e.jpg','Tahukah Anda bahwa \"bunga\" berwarna-warni pada Anthurium sebenarnya adalah daun yang mengalami modifikasi? Bunga sebenarnya dari tanaman ini tumbuh dari struktur tengah yang disebut infloresensi. Ditemukan awalnya di daerah pegunungan Andes di Kolombia dan Ekuador, tanaman ini menyukai tempat hangat dengan sedikit kelembaban ekstra.','Anthurium lebih suka cahaya terang yang tidak langsung. Sinar matahari langsung dapat membakar daunnya. Semakin banyak cahaya yang diterima tanaman, semakin banyak bunga yang akan dihasilkan.','Siram Anthurium ketika 50-75% volume tanah kering. Penyiraman berlebihan menyebabkan ujung daun kuning dan penyiraman kurang menyebabkan ujung daun cokelat.','Anthurium menyukai lingkungan yang lembab. Semprotkan air secara sering atau gunakan nampan kerikil atau pelembab udara selama bulan-bulan musim dingin ketika udara kering.','Anthurium lebih menyukai suhu rata-rata hingga hangat antara 65-80°F (18-27°C). Hindari suhu di bawah 60°F (15°C) dan hindari menempatkan tanaman di dekat ventilasi pemanas, pendingin udara, atau kipas angin.','Berikan pupuk setiap bulan pada musim semi dan musim panas dengan pupuk yang tinggi nitrogen atau yang diformulasikan khusus untuk tanaman Anthurium. Encerkan pupuk menjadi setengah dari yang direkomendasikan, dan pastikan hanya mengaplikasikan pupuk pada tanah yang lembab.','Tanaman ini dianggap beracun bagi hewan peliharaan dan manusia jika tertelan.','Potong bunga yang sudah layu saat muncul. Jika Anthurium tidak berbunga selama musim tumbuh, mungkin tanaman membutuhkan lebih banyak cahaya. Berikan istirahat selama enam minggu pada musim dingin. Suhu yang lebih rendah, cahaya yang lebih sedikit, dan tanah yang lebih kering selama waktu ini akan membantu tanaman menghasilkan lebih banyak bunga pada musim semi dan musim panas.','Anthurium mendapatkan namanya dari kata-kata Yunani \"anthos\" dan \"oura,\" yang berarti \"bunga ekor.\"'),
('plant-903512','Monstera/Monstera Adansonii','Janda Bolong','https://storage.googleapis.com/plant-classification-images/plant-435f9035.jpg','Monstera adalah tanaman hias yang unik dan mudah dirawat dengan daun yang dramatis dan berlubang. Monstera adalah tanaman merambat dan suka menjuntai di sekitar pot atau memanjat di sepanjang tiang atau pagar. Tanaman ini juga tahan saat tidak selalu disiram, sehingga cocok untuk para penyuka tanaman yang tidak berpengalaman.','Monstera lebih suka cahaya tidak langsung yang terang. Tanaman ini dapat bertahan dalam kondisi cahaya rendah, tetapi pertumbuhannya mungkin melambat. Jauhkan dari sinar matahari langsung untuk periode yang lama, karena dapat membakar daun. Jika Anda tidak memiliki lokasi dengan pencahayaan yang ideal untuk Monstera, gunakan Lampu sebagai pengganti cahaya.','Siram Monstera saat 75% bagian atas tanah sudah kering. Jangan biarkan tanaman terendam dalam air atau tanah yang lembab, karena hal ini dapat menyebabkan pembusukan akar dan akhirnya kematian tanaman.','Monstera akan baik-baik saja dengan kelembaban rata-rata di dalam rumah, tetapi akan mendapatkan manfaat lebih dari peningkatan kelembaban. Semprotkan daun secara teratur menggunakan semprotan air, letakkan pelembab udara di dekatnya, atau gunakan nampan kerikil adalah cara yang bagus untuk meningkatkan kelembaban bagi tanaman Monstera.','Suhu normal di dalam ruangan antara 60-80 derajat Fahrenheit (15-27 derajat Celsius) cocok untuk Monstera. Tanaman ini tidak mentolerir suhu di bawah 55 derajat Fahrenheit (13 derajat Celsius) atau penurunan suhu yang tiba-tiba. Hindari udara dingin dan aliran udara langsung dari pemanas selama musim dingin.','Mulai dari musim semi hingga akhir musim panas, beri tanaman pupuk sekali sebulan dengan pupuk umum untuk tanaman hias yang telah diencerkan menjadi setengah dari yang direkomendasikan.','Monstera memiliki tingkat toksisitas sedang bagi hewan peliharaan dan manusia, dan dapat menyebabkan pembengkakan, muntah, atau iritasi. Ini bukan tanaman yang ramah terhadap hewan peliharaan.','Tanaman ini suka merambat dan memanjat. Jika Anda menginginkan Monstera untuk tumbuh merambat, Anda dapat menyediakan media seperti tiang/dinding yang dibantu dengan ikatan taman atau kait sebagai guide Monstera untuk tumbuh sesuai dengan yang diinginkan, Jika Monstera perlu dipangkas, gunakan Gunting Tanaman yang bersih dan tajam untuk membersihkannya.','Tanaman Monstera dikenal dengan pola daun yang khas. Celah dan lubang di daun Monstera disebut fenestrasi.'),
('plant-973e5d','Chlorophytum Comosum/Spider Plant','Lili Paris','https://storage.googleapis.com/plant-classification-images/plant-c249c306.jpg','Lili paris adalah salah satu tanaman hias yang paling mudah beradaptasi dan sangat mudah untuk tumbuh. lili paris yang ramah hewan juga dikenal karena kualitas penyaring udaranya, menjadikannya tambahan yang sehat untuk rumah Anda. Berasal dari daerah tropis dan selatan Afrika, lili paris memiliki reputasi sebagai tanaman yang sangat tahan terhadap situasi apapun. Ketika tanaman ini dewasa, mereka akan menghasilkan \"spiderettes\" yang dapat Anda sebarkan untuk menumbuhkan tanaman baru. Tanaman ini adalah pilihan yang tepat untuk pemilik tanaman pemula.','Lili paris dapat ditempatkan di tempat dengan cahaya tidak langsung dengan intensitas rendah hingga cahaya terang. Semakin banyak cahaya yang diterima tanaman, semakin mencolok garis-garisnya. Hati-hati dengan terlalu banyak cahaya langsung karena dapat membakar daun. Jika Anda tidak memiliki lokasi yang ideal untuk Lili paris Anda, gunakan Lampu Pertumbuhan.','Siram Lili paris ketika 50-75% volume tanah sudah kering. Ujung daun yang kering dan renyah sering menunjukkan kekurangan air, sedangkan ujung yang berwarna cokelat tua menunjukkan kelebihan air. Berikan air dengan menyeluruh dan buang kelebihan air di alas pot.','Llili paris akan tumbuh dengan baik dalam kelembaban normal di dalam rumah tetapi akan berkembang lebih baik dengan sedikit lebih banyak kelembaban. Ujung daun yang berwarna cokelat dapat menandakan udara terlalu kering, jadi semprotkan Lili paris Anda secara teratur menggunakan Semprotan.','Lili paris lebih memilih suhu antara 60–80°F (15-27°C).','Beri pupuk sekali setiap bulan selama musim semi dan musim panas dengan pupuk serba guna untuk tanaman indoor.','Lili paris tidak beracun dan aman bagi manusia, anjing, dan kucing.','Lili paris dewasa akan menghasilkan \'spiderettes\' atau \'pups\'. Ini adalah tunas baru dari tanaman induk yang dapat Anda potong dan tanam untuk menghasilkan tanaman baru yang sepenuhnya. Jika Lili paris Anda perlu dipangkas, bersihkan tanaman menggunakan Gunting Tanaman yang bersih dan tajam.','Lili paris dewasa akan menghasilkan \'spiderettes\' (tanaman laba-laba bayi) di ujung batang yang panjang dan kaku. Jika Anda ingin menyebarkan Lili paris Anda, cukup potong tanaman kecil tersebut, tanam dalam pot kecil berisi tanah lembab, dan sirami dengan lembut. Metode lainnya adalah dengan menempelkan spiderette ke dalam gelas berisi air selama 1-2 minggu, kemudian tanam tanaman kecil yang sudah berakar ke dalam pot berisi tanah.'),
('plant-98e6b4','Syzgium Oleana','Pucuk Merah','https://storage.googleapis.com/plant-classification-images/plant-fe6cfe35.jpg','Pucuk merah memiliki batang berkayu dan daun yang rindang, dengan tekstur yang kasar dan tepi yang bergerigi. tanaman ini berasal dari Meksiko. Tanaman ini menarik karena ujung daunnya berwarna merah, merah muda ataupun putih. Tanaman ini menyukai cahaya tidak langsung yang terang dan penyiraman yang tidak terlalu sering.','Pucuk merah menyukai cahaya tidak langsung yang terang, tempatkan tanaman ini di lokasi dengan sinar matahari yang cukup, tetapi hindari paparan sinar matahari langsung yang dapat menyebabkan daun terbakar. Sebaiknya letakkan pucuk merah di dekat jendela yang menghadap ke timur atau barat, di mana tanaman dapat menerima cahaya pagi atau sore hari.','Siram tanaman saat permukaan tanah terasa kering saat disentuh. Penting untuk tidak membiarkan tanah terlalu kering atau terlalu basah, karena kedua kondisi tersebut dapat merusak akar tanaman. Selalu perhatikan kondisi tanah dan sesuaikan pola penyiraman sesuai kebutuhan tanaman, terutama selama musim penghujan atau cuaca yang lebih lembab.','Pucuk merah tidak memerlukan tingkat kelembaban udara yang tinggi. Mereka dapat tumbuh dengan baik dalam kelembaban normal di dalam rumah.','Pucuk merah tumbuh baik pada suhu antara 18°C hingga 24°C (65°F hingga 75°F).','Pucuk merah tidak memerlukan pemupukan yang rutin seperti tanaman lain. Selama masa pertumbuhan aktifnya, biasanya dari musim semi hingga musim panas, pemberian pupuk sekali sebulan sudah cukup. Gunakan pupuk universal yang diencerkan setengah dari dosis yang direkomendasikan. Pastikan untuk memastikan bahwa tanah dalam kondisi lembab sebelum memberikan pupuk, agar akar tidak terbakar. Selama musim gugur dan musim dingin, pucuk merah memasuki periode istirahat, sehingga tidak memerlukan pemupukan tambahan. Jaga agar tanah tetap lembab, tetapi hindari penyiraman berlebihan yang dapat menyebabkan pembusukan akar.','Pucuk merah terkenal karena memiliki reputasi sebagai tanaman yang beracun, terutama bagi hewan peliharaan seperti kucing dan anjing.','Tempatkan tanaman di tempat yang terang namun terhindar dari sinar matahari langsung. Pucuk merah menyukai cahaya terang tetapi tidak mentolerir panas yang berlebihan. Sebaiknya biarkan permukaan tanah sedikit kering sebelum melakukan penyiraman ulang.','Pucuk merah tidak benar-benar memiliki bunga yang merah. Yang sering kita anggap sebagai bunga merah adalah bagian yang disebut sebagai daun penutup (bract) yang memiliki warna mencolok. Bagian bunga sebenarnya terletak di tengah daun penutup dan sangat kecil, berbentuk kuning dan tidak terlalu menonjol.'),
('plant-a644c9','Aglaonema','Sri rezeki','https://storage.googleapis.com/plant-classification-images/plant-82287425.jpeg','Aglaonema merupakan tanaman yang berwarna - warni dengan daun bermotif mencolok. Karena sifatnya yang santai, Aglaonemas sangat cocok untuk ruang tamu atau kantor modern, kamar tidur redup, atau ruang belajar yang nyaman.Karena toleransi Aglaonema terhadap kondisi lembab dan kering, dan fakta bahwa Aglaonema akan tumbuh subur dengan cahaya redup, Aglaonema adalah pilihan yang sempurna untuk kondisi cahaya yang kurang ideal atau pemilik tanaman yang pelupa.','Aglaonema lebih menyukai cahaya tidak langsung yang terang hingga sedang, tetapi juga dapat beradaptasi dengan cahaya redup. Paparan cahaya langsung dalam waktu lama dapat membakar daun. Jika Anda melihat warna memudar pada aglaonema Anda, coba tempatkan tanaman di lokasi yang lebih terang dengan cahaya tidak langsung.','Siram 2-3 kali seminggu,Sirami Aglaonema saat 50% volume tanah menjadi kering. Sirami secara perlahan, biarkan meresap ke dalam tanah, hingga cairan mengalir melalui lubang drainase di bagian bawah pot. Buang semua air yang terkumpul di piring.','Aglaonema tumbuh dengan baik dalam kelembapan rumah rata-rata. Namun, jika udaranya sangat kering, maka dapat Anda dapat melakukan peningkatan kelembapan sesekali dengan menggunakan baki kerikil atau pelembab udara.','Aglaonema Anda lebih menyukai suhu antara 18-23°C. Hindari area berangin dan suhu di bawah 15°F.','Untuk hasil terbaik, beri makan aglaonema kita dengan pelet slow-release atau pupuk cair sebanyak dua kali dalam setahun, tepatnya di awal dan akhir musim tanamnya.','Aglaonema cukup beracun bagi hewan peliharaan dan manusia.','Ganti pot sekali setiap 1-2 tahun. Jaga kebersihan daunnya dengan membersihkan debu secara teratur, yang juga membantu mencegah hama.','Aglaonemas adalah pembersih udara yang luar biasa.');
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;
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

-- Dump completed on 2023-06-12  7:48:10
