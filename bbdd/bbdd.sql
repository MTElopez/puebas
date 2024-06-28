-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: juegos
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `consola`
--

DROP TABLE IF EXISTS `consola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consola` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consola` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consola`
--

LOCK TABLES `consola` WRITE;
/*!40000 ALTER TABLE `consola` DISABLE KEYS */;
INSERT INTO `consola` VALUES (1,'GBA'),(2,'Nintendo GameCube'),(3,'Super Nintendo'),(4,'Nintendo Switch'),(5,'Nintendo 64'),(6,'Playstation One'),(7,'Playstation 2'),(8,'Playstation 3'),(9,'Playstation 4'),(10,'Playstation 5'),(11,'Computadora');
/*!40000 ALTER TABLE `consola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Sandbox'),(2,'Battle Royal'),(3,'Aventura'),(4,'ARPG'),(5,'RPG'),(6,'Deporte'),(7,'Supervivencia'),(8,'Acción'),(9,'Simracing'),(10,'Shooter'),(11,'Terror');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos_juegos`
--

DROP TABLE IF EXISTS `generos_juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos_juegos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_genero` int(11) DEFAULT NULL,
  `id_juego` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_genero` (`id_genero`),
  KEY `id_juego` (`id_juego`),
  CONSTRAINT `generos_juegos_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `generos_juegos_ibfk_2` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos_juegos`
--

LOCK TABLES `generos_juegos` WRITE;
/*!40000 ALTER TABLE `generos_juegos` DISABLE KEYS */;
INSERT INTO `generos_juegos` VALUES (35,7,17),(36,2,18),(37,7,18),(38,10,18),(39,1,19),(40,7,19),(41,3,20),(42,4,20),(43,8,20),(44,1,21),(45,3,21),(46,7,21),(47,8,21),(48,4,22);
/*!40000 ALTER TABLE `generos_juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen_juego`
--

DROP TABLE IF EXISTS `imagen_juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagen_juego` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_juego` int(11) NOT NULL,
  `url_imagen` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_juego` (`id_juego`),
  CONSTRAINT `imagen_juego_ibfk_1` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen_juego`
--

LOCK TABLES `imagen_juego` WRITE;
/*!40000 ALTER TABLE `imagen_juego` DISABLE KEYS */;
INSERT INTO `imagen_juego` VALUES (1,17,'https://mtelopez.github.io/Computadora/imgprueba/rust1.png'),(2,18,'https://mtelopez.github.io/Computadora/imgprueba/pubg1.png'),(3,19,'https://mtelopez.github.io/Computadora/imgprueba/Minecraft.png'),(4,20,'https://mtelopez.github.io/Computadora/imgprueba/witcher1.jpg'),(5,21,'https://mtelopez.github.io/Computadora/imgprueba/terraria1.png'),(6,22,'https://mtelopez.github.io/Computadora/imgprueba/diablo3.png');
/*!40000 ALTER TABLE `imagen_juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juegos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_consola` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_consola` (`id_consola`),
  CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`id_consola`) REFERENCES `consola` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (17,11,'Rust','Rust es un juego de supervivencia creado por Facepunch Studios. La inspiración del videojuego viene de múltiples juegos del género de supervivencia. Su lanzamiento oficial se produjo el 8 de febrero de 2018, aunque estuvo en acceso anticipado desde 2013. Rust también está disponible en consolas como Xbox One y PlayStation 4 desde el 21 de mayo de 2021 en colaboración con Double Eleven.'),(18,11,'PlayerUnknown\'s Battlegrounds','PUBG: Battlegrounds (anteriormente PlayerUnknown\'s Battlegrounds) es un videojuego de batalla en línea multijugador masivo desarrollado por PUBG Corporation (actual PUBG Studios) y publicado por Bluehole (actual Krafton) para Microsoft Windows, Xbox One, PlayStation 4, Android e iOS, estos dos últimos con ayuda de Tencent Games. El juego era una beta battle royale de ARMA 3 que salió en 2015. Se basa en el estilo Battle Royale de los mods previamente desarrollados por Brendan Playerunknown Greene para otros juegos, pero ampliado independientemente bajo la dirección creativa de él mismo. En el juego, cien jugadores saltan en paracaídas desde un avión a una isla, donde tienen la libertad de moverse hacia un lugar determinado que ellos mismos elijan y buscan armas y equipamiento para matar a otros jugadores mientras evitan ser asesinados. El área segura disponible del mundo del juego disminuye en tamaño durante la partida, dirigiendo a los jugadores sobrevivientes a áreas más reducidas y forzando enfrentamientos. El último jugador o equipo en pie gana la partida.'),(19,11,'Minecraft','Minecraft es un videojuego de construcción de tipo mundo abierto o en inglés sandbox creado originalmente por el sueco Markus Persson (conocido comúnmente como «Notch»), que creo posteriormente Mojang Studios (actualmente parte de Microsoft). Fue lanzado el 17 de mayo de 2009, y después de numerosos cambios, su primera versión estable 1.0 fue publicada el 18 de noviembre de 2011. Es un juego formado por bloques, criaturas y comunidades. Los bloques se pueden utilizar para rediseñar el mundo o construir creaciones fantásticas. Las criaturas pueden ser tus amigas o puede que tengas que luchar contra ellas, dependiendo de tu estilo de juego.'),(20,11,'The Witcher 3: Wild Hunt','The Witcher 3: Wild Hunt es un videojuego de rol desarrollado y publicado por la compañía polaca CD Projekt RED. Esta compañía es la desarrolladora mientras que la distribución corre a cargo de la Warner Bros. Interactive, en el caso de Norteamérica y Bandai Namco para Europa. Fue anunciado en febrero de 2013 y su lanzamiento tuvo lugar a nivel mundial el 19 de mayo de 2015 para PlayStation 4, Xbox One, Microsoft Windows para después llegar a Nintendo Switch el 15 de octubre del 2019. El juego es la tercera parte de la saga, precedido por The Witcher y The Witcher 2: Assassins of Kings, las cuales están basadas en la saga literaria de Geralt de Rivia escrita por Andrzej Sapkowski.Es un juego de perspectiva en tercera persona, el jugador controla al protagonista Geralt de Rivia, un cazador de monstruos conocido como Lobo Blanco, es un brujo, el cual emprende un largo viaje a través de Los reinos del norte. El jugador lucha contra el peligroso mundo mediante magia y espadas, mientras interactúa con los NPC y completa tanto misiones secundarias como la misión principal de la historia, La cual es encontrar a la hija adoptiva de Geralt, Ciri, y detener la profecía del invierno blanco.El juego ha sido aclamado por la crítica y ha obtenido un éxito financiero, vendiendo más de 6 millones de copias en seis semanas. También ha ganado múltiples premios al mejor juego del año, otorgado por diversas revistas especializadas, por críticos y por galas de premios, incluyendo el Golden Joystick Awards, The Game Awards y Game Developers Choice Awards.'),(21,11,'Terraria','Terraria es un videojuego de acción, aventura y de sandbox producido de forma independiente por el estudio Re-Logic. Tiene características tales como la exploración, la artesanía, la construcción de estructuras y el combate. Se lanzó el 16 de mayo de 2011. Hasta la fecha lleva más de 45 000 000 de copias vendidas entre sus diversas plataformas.Se estima que el juego vendió alrededor de 50 000 copias el día del lanzamiento, con más de 17 000 jugadores en línea al mismo tiempo. En asociación con la productora 505 Games el juego fue lanzado para las plataformas Xbox 360, PlayStation 3 y PlayStation Vita, pero estas se dejaron de actualizar. Sus ventas totales se estiman alrededor de un millón de copias. El juego también fue lanzado para los sistemas Android e iOS alcanzando en estas plataformas 8,9 millones de copias descargadas.'),(22,11,'Diablo 3','Diablo III es un videojuego de rol de acción (ARPG), desarrollado por Blizzard Entertainment. Ésta es la continuación de Diablo II y la tercera parte de la serie que fue creada por la compañía estadounidense Blizzard. Su temática es de fantasía oscura y terrorífica. Su aparición fue anunciada el 28 de junio de 2008 en el Blizzard Entertainment Worldwide Invitational en París, Francia. Blizzard anunció que el lanzamiento se realizaría el 15 de mayo de 2012. Fue uno de los lanzamientos más importantes de un videojuego en la historia, vendiendo una cifra de 3.5 millones de copias en 24 horas y 6.3 millones en una semana. Su secuela Diablo IV se anunció en 2019.');
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisitos_pc`
--

DROP TABLE IF EXISTS `requisitos_pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requisitos_pc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `juego_pc_id` int(11) DEFAULT NULL,
  `es_minimo` tinyint(4) DEFAULT NULL,
  `so` varchar(100) DEFAULT NULL,
  `procesador` varchar(100) DEFAULT NULL,
  `interfaz_grafica` varchar(100) DEFAULT NULL,
  `memoria_ram` int(11) DEFAULT NULL,
  `espacio_hd` int(11) DEFAULT NULL,
  `directx` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `juego_pc_id` (`juego_pc_id`),
  CONSTRAINT `requisitos_pc_ibfk_1` FOREIGN KEY (`juego_pc_id`) REFERENCES `juegos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisitos_pc`
--

LOCK TABLES `requisitos_pc` WRITE;
/*!40000 ALTER TABLE `requisitos_pc` DISABLE KEYS */;
INSERT INTO `requisitos_pc` VALUES (1,17,0,'Windows 10 64bit','Intel Core i7-3770 /','670 2GB / AMD R9 280',10,25,11),(2,17,1,'Windows 11 64bit','Intel Core i7-4790K ','GTX 980 / AMD R9 Fur',16,25,12),(3,18,0,'64-bit Windows 7, Wi','Intel Core i5-4430 /','NVIDIA GeForce GTX 9',8,40,11),(4,18,1,'64-bit Windows 7, Wi','Intel Core i5-6600K ','NVIDIA GeForce GTX 1',16,50,11),(5,19,0,'Windows 7 o posterio','Intel Core i3-3210 o','Intel HD Graphics 40',4,24,11),(6,19,1,'Windows 10 (May 2020','Intel Core i5-4690 o','NVIDIA GeForce GTX 7',8,24,12),(7,20,0,'64-bit Windows 7, 64','Intel CPU Core i5-25','Nvidia GPU GeForce G',6,50,11),(8,20,1,'64-bit Windows 10/11','Intel Core i5-7400 /','Nvidia GTX 1070 / Ra',8,50,12),(9,21,0,'Windows XP / Vista /','1.6 GHz','Shader Model 1.1 con',2,1,9),(10,21,1,'Windows 7, 8/8.1, 10','Dual Core 3.0 Ghz','Memoria de vídeo de ',4,1,9),(15,22,0,'Windows® 7 / Windows® 8 / Windows® 10 (con el último Service Pack)','Intel® Core™ 2 Duo o AMD Athlon™ 64 X2','NVIDIA® GeForce® 8800GT o ATI Radeon™ HD 2900 XT o Intel® HD Graphics 4000',4,25,NULL),(16,22,1,'Windows® 10 64-bit','Intel® Core™ 2 Duo 2.4 GHz o AMD Athlon™ 64 X2 5600+ 2.8GHz','NVIDIA® GeForce® GTX™ 260 o ATI Radeon™ HD 4870 o superior',6,25,NULL);
/*!40000 ALTER TABLE `requisitos_pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (7,'matias','lopez',27,'pepepe@gmail.com','13asdf23asdf123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 19:40:17
