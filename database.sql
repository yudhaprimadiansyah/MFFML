-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jadwal
-- ------------------------------------------------------
-- Server version	10.3.12-MariaDB-2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dosen`
--

DROP TABLE IF EXISTS `dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosen` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keahlian1` varchar(30) NOT NULL,
  `keahlian2` varchar(30) NOT NULL,
  `kode_dosen` varchar(5) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'aktif',
  `total_menguji` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosen`
--

LOCK TABLES `dosen` WRITE;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` VALUES (1,'Elektronika','IoT','SGO','aktif',11),(2,'Multimedia','Transmisi','SCA','aktif',3),(4,'Elektronika','IoT','USA','aktif',12),(5,'Jaringan','Multimedia','ASM','aktif',3),(6,'Transmisi','Multimedia','TAR','aktif',3),(7,'Jaringan','Transmisi','DYD','aktif',2),(8,'Transmisi','Jaringan','HFD','aktif',2),(9,'Jaringan','IoT','AGD','aktif',1),(10,'IoT','Multimedia','DUM','aktif',2),(12,'Transmisi','Jaringan','TND','aktif',2),(13,'Jaringan','IoT','RMT','aktif',1),(14,'Transmisi','Multimedia','HPT','aktif',2),(15,'Multimedia','Jaringan','YSN','aktif',3),(16,'Multimedia','Transmisi','ATV','aktif',2),(20,'Transmisi','Elektronika','RDL','aktif',10),(21,'Transmisi','Multimedia','DNN','aktif',2),(22,'Multimedia','Jaringan','ISL','aktif',2);
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal` (
  `kode_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `kode_dosen` varchar(5) NOT NULL,
  `hari` char(2) NOT NULL,
  `jam_awal` time NOT NULL,
  `jam_akhir` time NOT NULL,
  PRIMARY KEY (`kode_jadwal`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
INSERT INTO `jadwal` VALUES (217,'RWM','05','09:30:00','11:30:00'),(218,'RWM','04','09:30:00','11:30:00'),(219,'RWM','03','09:30:00','11:30:00'),(220,'RWM','02','09:30:00','11:30:00'),(221,'DYD','03','12:30:00','20:30:00'),(222,'DYD','02','12:30:00','20:30:00'),(223,'DYD','04','08:30:00','10:30:00'),(224,'DUM','06','12:30:00','20:30:00'),(225,'DUM','03','12:30:00','14:30:00'),(226,'DYD','01','10:30:00','18:30:00'),(227,'DYD','04','11:30:00','13:30:00'),(228,'DYD','05','13:30:00','15:30:00'),(229,'RMT','03','16:30:00','19:30:00'),(230,'RMT','04','12:30:00','14:30:00'),(231,'AGD','04','17:30:00','20:30:00'),(232,'AGD','04','07:30:00','09:30:00'),(233,'SCA','02','13:30:00','15:30:00'),(234,'ASM','01','07:30:00','09:30:00'),(235,'ASM','04','17:30:00','20:30:00'),(236,'SCA','02','15:30:00','18:30:00'),(237,'RDL','04','07:30:00','10:30:00'),(238,'ATV','01','08:30:00','11:30:00'),(239,'RDL','04','10:30:00','13:30:00'),(240,'DNN','04','13:30:00','16:30:00'),(241,'ATV','04','13:30:00','16:30:00'),(242,'RGK','03','08:30:00','10:30:00'),(243,'RGK','02','14:30:00','16:30:00'),(244,'RGK','05','13:30:00','19:30:00'),(245,'DUM','02','07:30:00','13:30:00'),(246,'DUM','05','09:30:00','11:30:00'),(247,'DUM','01','06:30:00','12:30:00'),(248,'DUM','05','07:30:00','09:30:00'),(249,'RGK','06','14:30:00','20:30:00'),(250,'HPT','06','14:30:00','20:30:00'),(251,'HPT','04','14:30:00','16:30:00'),(252,'HPT','01','12:30:00','14:30:00'),(253,'HPT','04','06:30:00','12:30:00'),(254,'TND','03','11:30:00','13:30:00'),(255,'TND','05','13:30:00','19:30:00'),(256,'ATV','02','10:30:00','12:30:00'),(257,'ATV','03','10:30:00','16:30:00'),(258,'AGD','03','08:30:00','10:30:00'),(259,'AIM','05','07:30:00','09:30:00'),(260,'ASM','04','10:30:00','12:30:00'),(261,'ASM','01','08:30:00','14:30:00'),(262,'AIM','05','13:30:00','19:30:00'),(263,'AGD','06','07:30:00','13:30:00'),(264,'RMT','05','09:30:00','11:30:00'),(265,'RMT','06','13:30:00','19:30:00'),(266,'SCA','03','13:30:00','15:30:00'),(267,'SRD','03','11:30:00','13:30:00'),(268,'HFD','01','09:30:00','11:30:00'),(269,'TAR','04','13:30:00','15:30:00'),(270,'SCA','01','11:30:00','14:30:00'),(271,'TND','01','08:30:00','11:30:00'),(272,'DNN','03','08:30:00','11:30:00'),(273,'DNN','02','09:30:00','12:30:00'),(274,'YSR','04','10:30:00','13:30:00'),(275,'EYR','05','06:30:00','09:30:00'),(276,'EYR','06','07:30:00','10:30:00'),(277,'EYR','04','06:30:00','09:30:00'),(278,'EYR','05','08:30:00','11:30:00'),(279,'USH','04','13:30:00','16:30:00'),(280,'HNY','02','09:30:00','12:30:00'),(281,'HNY','02','15:30:00','18:30:00'),(282,'HNY','02','12:30:00','15:30:00'),(283,'ASM','04','12:30:00','14:30:00'),(284,'ASM','04','14:30:00','16:30:00'),(285,'HFD','01','11:30:00','13:30:00'),(286,'AGD','05','06:30:00','08:30:00'),(287,'TAR','03','14:30:00','16:30:00'),(288,'ATV','03','12:30:00','14:30:00'),(289,'YSR','02','14:30:00','16:30:00'),(290,'HPT','03','09:30:00','11:30:00'),(291,'HPT','06','08:30:00','14:30:00'),(292,'HPT','05','08:30:00','10:30:00'),(293,'HPT','02','12:30:00','18:30:00'),(294,'DNN','03','08:30:00','14:30:00'),(295,'ATV','06','12:30:00','18:30:00'),(296,'ATV','06','18:30:00','20:30:00'),(297,'DNN','01','14:30:00','16:30:00'),(298,'ATV','04','11:30:00','13:30:00'),(299,'YSR','03','13:30:00','19:30:00'),(300,'RDL','01','14:30:00','16:30:00'),(301,'RDL','05','14:30:00','20:30:00'),(302,'RDL','05','07:30:00','09:30:00'),(303,'RDL','06','07:30:00','13:30:00'),(304,'TND','02','13:30:00','15:30:00'),(305,'YSR','01','14:30:00','16:30:00'),(306,'TND','02','07:30:00','13:30:00'),(307,'DYD','05','09:30:00','11:30:00'),(308,'DYD','06','07:30:00','13:30:00'),(309,'DYD','05','07:30:00','09:30:00'),(310,'DUM','06','06:30:00','12:30:00'),(311,'SCA','04','08:30:00','10:30:00'),(312,'DYD','06','13:30:00','19:30:00'),(313,'DUM','04','10:30:00','12:30:00'),(314,'SCA','01','14:30:00','20:30:00'),(315,'AGD','02','07:30:00','09:30:00'),(316,'RMT','02','11:30:00','17:30:00'),(317,'RMT','02','09:30:00','11:30:00'),(318,'AIM','06','12:30:00','18:30:00'),(319,'RMT','01','12:30:00','18:30:00'),(320,'AIM','03','08:30:00','10:30:00'),(321,'RMT','03','13:30:00','15:30:00'),(322,'AGD','01','06:30:00','12:30:00'),(323,'TND','04','10:30:00','12:30:00'),(324,'TND','01','11:30:00','13:30:00'),(325,'RWM','05','09:30:00','11:30:00'),(326,'RWM','04','09:30:00','11:30:00'),(327,'RWM','03','09:30:00','11:30:00'),(328,'RWM','02','09:30:00','11:30:00'),(329,'DYD','03','12:30:00','20:30:00'),(330,'DYD','02','12:30:00','20:30:00'),(331,'DYD','04','08:30:00','10:30:00'),(332,'DUM','06','12:30:00','20:30:00'),(333,'DUM','03','12:30:00','14:30:00'),(334,'DYD','01','10:30:00','18:30:00'),(335,'DYD','04','11:30:00','13:30:00'),(336,'DYD','05','13:30:00','15:30:00'),(337,'RMT','03','16:30:00','19:30:00'),(338,'RMT','04','12:30:00','14:30:00'),(339,'AGD','04','17:30:00','20:30:00'),(340,'AGD','04','07:30:00','09:30:00'),(341,'SCA','02','13:30:00','15:30:00'),(342,'ASM','01','07:30:00','09:30:00'),(343,'ASM','04','17:30:00','20:30:00'),(344,'SCA','02','15:30:00','18:30:00'),(345,'RDL','04','07:30:00','10:30:00'),(346,'ATV','01','08:30:00','11:30:00'),(347,'RDL','04','10:30:00','13:30:00'),(348,'DNN','04','13:30:00','16:30:00'),(349,'ATV','04','13:30:00','16:30:00'),(350,'RGK','03','08:30:00','10:30:00'),(351,'RGK','02','14:30:00','16:30:00'),(352,'RGK','05','13:30:00','19:30:00'),(353,'DUM','02','07:30:00','13:30:00'),(354,'DUM','05','09:30:00','11:30:00'),(355,'DUM','01','06:30:00','12:30:00'),(356,'DUM','05','07:30:00','09:30:00'),(357,'RGK','06','14:30:00','20:30:00'),(358,'HPT','06','14:30:00','20:30:00'),(359,'HPT','04','14:30:00','16:30:00'),(360,'HPT','01','12:30:00','14:30:00'),(361,'HPT','04','06:30:00','12:30:00'),(362,'TND','03','11:30:00','13:30:00'),(363,'TND','05','13:30:00','19:30:00'),(364,'ATV','02','10:30:00','12:30:00'),(365,'ATV','03','10:30:00','16:30:00'),(366,'AGD','03','08:30:00','10:30:00'),(367,'AIM','05','07:30:00','09:30:00'),(368,'ASM','04','10:30:00','12:30:00'),(369,'ASM','01','08:30:00','14:30:00'),(370,'AIM','05','13:30:00','19:30:00'),(371,'AGD','06','07:30:00','13:30:00'),(372,'RMT','05','09:30:00','11:30:00'),(373,'RMT','06','13:30:00','19:30:00'),(374,'SCA','03','13:30:00','15:30:00'),(375,'SRD','03','11:30:00','13:30:00'),(376,'HFD','01','09:30:00','11:30:00'),(377,'TAR','04','13:30:00','15:30:00'),(378,'SCA','01','11:30:00','14:30:00'),(379,'TND','01','08:30:00','11:30:00'),(380,'DNN','03','08:30:00','11:30:00'),(381,'DNN','02','09:30:00','12:30:00'),(382,'YSR','04','10:30:00','13:30:00'),(383,'EYR','05','06:30:00','09:30:00'),(384,'EYR','06','07:30:00','10:30:00'),(385,'EYR','04','06:30:00','09:30:00'),(386,'EYR','05','08:30:00','11:30:00'),(387,'USH','04','13:30:00','16:30:00'),(388,'HNY','02','09:30:00','12:30:00'),(389,'HNY','02','15:30:00','18:30:00'),(390,'HNY','02','12:30:00','15:30:00'),(391,'ASM','04','12:30:00','14:30:00'),(392,'ASM','04','14:30:00','16:30:00'),(393,'HFD','01','11:30:00','13:30:00'),(394,'AGD','05','06:30:00','08:30:00'),(395,'TAR','03','14:30:00','16:30:00'),(396,'ATV','03','12:30:00','14:30:00'),(397,'YSR','02','14:30:00','16:30:00'),(398,'HPT','03','09:30:00','11:30:00'),(399,'HPT','06','08:30:00','14:30:00'),(400,'HPT','05','08:30:00','10:30:00'),(401,'HPT','02','12:30:00','18:30:00'),(402,'DNN','03','08:30:00','14:30:00'),(403,'ATV','06','12:30:00','18:30:00'),(404,'ATV','06','18:30:00','20:30:00'),(405,'DNN','01','14:30:00','16:30:00'),(406,'ATV','04','11:30:00','13:30:00'),(407,'YSR','03','13:30:00','19:30:00'),(408,'RDL','01','14:30:00','16:30:00'),(409,'RDL','05','14:30:00','20:30:00'),(410,'RDL','05','07:30:00','09:30:00'),(411,'RDL','06','07:30:00','13:30:00'),(412,'TND','02','13:30:00','15:30:00'),(413,'YSR','01','14:30:00','16:30:00'),(414,'TND','02','07:30:00','13:30:00'),(415,'DYD','05','09:30:00','11:30:00'),(416,'DYD','06','07:30:00','13:30:00'),(417,'DYD','05','07:30:00','09:30:00'),(418,'DUM','06','06:30:00','12:30:00'),(419,'SCA','04','08:30:00','10:30:00'),(420,'DYD','06','13:30:00','19:30:00'),(421,'DUM','04','10:30:00','12:30:00'),(422,'SCA','01','14:30:00','20:30:00'),(423,'AGD','02','07:30:00','09:30:00'),(424,'RMT','02','11:30:00','17:30:00'),(425,'RMT','02','09:30:00','11:30:00'),(426,'AIM','06','12:30:00','18:30:00'),(427,'RMT','01','12:30:00','18:30:00'),(428,'AIM','03','08:30:00','10:30:00'),(429,'RMT','03','13:30:00','15:30:00'),(430,'AGD','01','06:30:00','12:30:00'),(431,'TND','04','10:30:00','12:30:00'),(432,'TND','01','11:30:00','13:30:00');
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `id_sidang` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nim` char(10) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `pem1` varchar(5) NOT NULL,
  `pem2` varchar(5) NOT NULL,
  `penguji1` varchar(5) DEFAULT NULL,
  `penguji2` varchar(5) DEFAULT NULL,
  `tanggal` varchar(30) DEFAULT NULL,
  `waktu` varchar(30) DEFAULT NULL,
  `keahlian` varchar(120) DEFAULT NULL,
  `periode_sidang` date DEFAULT NULL,
  `ruangan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_sidang`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (1,'AINUR RIZQI AULIA','6705161141','PERENCANAAN MICROCELL PADA LTE 1800 MHZ MENGGUNAKAN METODE CELL SPLITTING DI WILAYAH 3STORE KARAWANG','HPT','RAK','SCA','TAR','5','08:00-10:00','Transmisi','2019-07-12','Ruang Sidang'),(2,'ALDA NURFAJRINA','6705164168','APLIKASI PEMANTAUAN DAN PENGENDALIAN DC SMART RELAY UNTUK PERANGKAT ELEKTRONIK DENGAN REAL-TIME DATABASE','HFD','DUM','SGO','USA','5','08:00-10:00','Elektronika','2019-07-12','Ruang Sidang'),(3,'AMRI KHURNIAWAN','6705164104','Perancangan dan Implementasi Penghitung Curah Hujan','SCA','DUM','RDL','SGO','5','10:00-12:00','Elektronika','2019-07-12','Ruang Sidang'),(4,'ARFAN JACKY PURWANTO','6705161105','PERANCANGAN DAN IMPLEMENTASI SMART BATHROOM BERBASIS IOT','DYD','AIM','USA','RDL','5','15:00-17:00','Elektronika','2019-07-12','Ruang Sidang'),(5,'ASEP KARYANA','6705161174','DESAIN DAN REALISASI LOW NOISE AMPLIFIER (LNA) UNTUK APLIKASI DIGITAL VIDEO BROADCASTING-SECOND GENERATION TERRESTRIAL (DVB-T2)','YSR','BPY','SGO','RDL','1','08:00-10:00','Elektronika','2019-07-12','Ruang Sidang'),(6,'AZIIZIKHO RAHIM ALIMOTA','6705144089','Perencanaan Indoor Building Coverage LTE Di Apartemen The Jarrdin','HPT','RDL','DYD','HFD','5','10:00-12:00','Transmisi','2019-07-12','Ruang Sidang'),(7,'CHUAN PRATAMA','6705160040','SISTEM INFORMASI PELANGGAR PARKIR DENGAN MENGGUNAKAN ANPR ( AUTOMATIC NUMBER PLATE RECOGNITION) BERBASIS WEBSITE','SCA','DUM','RDL','USA','1','10:00-12:00','Elektronika','2019-07-12','Ruang Sidang'),(8,'DYAN AHADIANSYAH','6705160132','Perancangan Sistem Informasi Mitigasi Bencana Berdasarkan Pergeseran Tanah Menggunakan Konsep Internet of Things','HFD','DUM','ASM','HPT','5','13:00-15:00','Multimedia','2019-07-12','Ruang Sidang'),(9,'FADLI KUSUMA','6705164099','ANALISIS PENERAPAN METODE INTER BAND CARRIER AGGREGATION PADA JARINGAN LTE-ADVANCED UNTUK MENINGKATKAN CAPACITY GAIN USER DI DAERAH BANDUNG TENGAH','HPT','RAK','TND','ATV','5','15:00-17:00','Transmisi','2019-07-12','Ruang Sidang'),(10,'FIQHI ANUGERAH','6705160133','PERENCANAAN MICROCELL PADA JARINGAN LTE 1800 MHZ MENGGUNAKAN METODE CELL SPLITTING DI WILAYAH KEBON KOPI CIMAHI','HPT','RAK','DNN','SCA','5','13:00-15:00','Transmisi','2019-07-12','Ruang Sidang'),(11,'HARNANDITYA MAHENDRA','6705164039','PERANCANGAN DAN PEMBUATAN PROTOTYPE MANAJEMEN SISTEM KOMUNIKASI OPENBTS UNTUK RELAWAN BENCANA ALAM','HPT','RAK','TAR','DNN','1','08:00-10:00','Transmisi','2019-07-12','Ruang Sidang'),(12,'I PUTU SANDY ANDIKA PUTRA','6705144026','Perancangan Dan Analisis Jaringan Voip Pada Mobile Ad Hoc Network Menggunakan Raspberry Pi Sebagai Server','ASM','AGD','RMT','YSN','5','10:00-12:00','Jaringan','2019-07-12','Ruang Sidang'),(13,'IKSAN SAEPUL RAMDAN','6705150001','IMPLEMENTASI SISTEM MONITORING SUHU DAN KELEMBABAN PADA KANDANG UNTUK PENETASAN TELUR BURUNG','TND','AIM','RDL','SGO','1','15:00-17:00','Elektronika','2019-07-12','Ruang Sidang'),(14,'IMSAL YUNUS','6705164044','Sistem Penjadwalan Sidang Proyek Akhir D3 Teknik Telekomunikasi Menggunakan Metode Sekuensial Linier Berbasis Website','ASM','ATV','DUM','ISL','5','15:00-17:00','Multimedia','2019-07-12','Ruang Sidang'),(15,'KRISNA WAHYU MURTI','6705160097','ANALISIS PERBANDINGAN ALGORITMA LOAD BALANCING DYNAMIC RATIO DAN RATIO PADA SERVER','TAR','ASM','AGD','TND','5','08:00-10:00','Jaringan','2019-07-12','Ruang Sidang'),(16,'LARASATI MUSLIKHAH FAMARSARI','6705160001','AIRPORT TECHNOLOGY NETWORK OF SUPPORT (ATNOS) INVENTARIS DIGITAL DI PT ANGKASA PURA I ADISUTJIPTO YOGYAKARTA BERBASIS WEBSITE','TND','DUM','ASM','HPT','1','13:00-15:00','Multimedia','2019-07-12','Ruang Sidang'),(17,'MOHAMAD AJI SAPUTRA','6705142072','IMPLEMENTASI METODE ZERO CROSSING UNTUK MENGATUR SUHU RICE COOKER BERBASIS PID','RMT','DUM','USA','SGO','2','08:00-10:00','Elektronika','2019-07-12','Ruang Sidang'),(18,'MUHAMMAD ARLY GUNAWAN','6705144125','Rancangan Sistem Parkir Cerdas Berbasis Android','ASM','SCA','RDL','SGO','2','10:00-12:00','Elektronika','2019-07-12','Ruang Sidang'),(19,'MUHAMMAD IQBAL','6705164172','PROTOTIPE DETEKTOR PERGESERAN TANAH MENGGUNAKAN DRAW-WIRE DISPLACEMENT SENSOR DENGAN KONSEP INTERNET OF THINGS','HFD','DUM','SGO','RDL','2','13:00-15:00','Elektronika','2019-07-12','Ruang Sidang'),(20,'MUHAMMAD VALIAN MASDANI','6705161134','Perancangan Backend Buku Komunikasi Digital Secara Online Antara Guru dengan Orangtua Siswa Berbasis REST API (Studi Kasus: Sekolah Binekas Bandung))','YSR','RMT','DUM','YSN','1','15:00-17:00','Multimedia','2019-07-12','Ruang Sidang'),(21,'NADYA ZAKIA FITRIA','6705164165','Proyeksi Bangun Ruang Orthogonal menggunakan Augmented Reality sebagai Media Pembelajaran pada Mata Kuliah Bengkel Mekanikal dan Elektrikal','TND','DUM','ATV','ISL','2','15:00-17:00','Multimedia','2019-07-12','Ruang Sidang'),(22,'PUTRI SANDIKA JUWITA','6705160092','Aplikasi Manajemen Parkir dengan Realtime Database Menggunakan Teknologi Internet of Things','TND','DUM',NULL,NULL,NULL,NULL,'Elektronika','2019-07-12','Ruang Sidang'),(23,'RADYA FADHIL','6705160036','PROTOTYPE SENSOR PARKIR MENGGUNAKAN REALTIME DATABASE DENGAN KOMUNIKASI MESSAGE QUEUING TELEMETRY TRANSPORT (MQTT)','TND','DUM',NULL,NULL,NULL,NULL,'Elektronika','2019-07-12','Ruang Sidang'),(24,'RAYMOND YUDHI PURBA','6705164116','Penerapan Augmented Reality Sebagai Media Informasi Bank Baterai di PT. Telkom WITEL Bandung','SCA','RAK','ASM','TAR','1','15:00-17:00','Multimedia','2019-07-12','Ruang Sidang'),(25,'RYAN SETIAGI','6705162130','Desain Dan Implementasi Aplikasi Buku Komunikasi Digital Antar Guru Dengan Orang Tua Siswa Berbasis Android Menggunakan Framework React Native (Studi Kasus Sekolah Binekas)','YSR','RMT','SCA','YSN','5','15:00-17:00','Multimedia','2019-07-12','Ruang Sidang'),(26,'SRI DEWI SARTIKA SYARIFUDDIN','6705164084','Sistem Informasi Penghitung Curah Hujan','SCA','DUM',NULL,NULL,NULL,NULL,'Elektronika','2019-07-15','Ruang Sidang'),(27,'YOSHI MAGDALENA DAELI','6705160148','Perancangan dan Realisasi Wearable Antenna Berbasis Aluminium Foil Tape Pada Frekuensi GPS L1','RDL','RAK','DYD','HFD','1','13:00-15:00','Transmisi','2019-07-12','Ruang Sidang');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (21,'asep','$2y$10$2ANNxCL/xeC2Kzn2nZevc.0fmMq3R5wY8WfAk/Q7UliOZPH7EdEE6'),(22,'gondo','$2y$10$LSXyn2SJ6OfAY/iO0wmzGubVTQdp9ZVCBmyEqOSC2bKhW9/N2j7WO'),(23,'admin','$2y$10$NhY/qSxbzGrb9Xqiznx3reqTvf9eOHuyoIsqsSODWmPFH8gRtN5q.'),(24,'test','$2y$10$eGRrEoRE3JFXj7QXX42VJ.IQubr0WCi921R55oKrbYvDAknEplIAm');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-16  9:23:01
