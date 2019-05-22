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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosen`
--

LOCK TABLES `dosen` WRITE;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` VALUES (1,'Elektronika','IoT','SGO'),(2,'Multimedia','Transmisi','SCA'),(3,'Multimedia','Transmisi','YSR'),(4,'Elektronika','IoT','USA'),(5,'Jaringan','Multimedia','ASM'),(6,'Transmisi','Multimedia','TAR'),(7,'Jaringan','Transmisi','DYD'),(8,'Transmisi','Jaringan','HFD'),(9,'Jaringan','IoT','AGD'),(10,'IoT','Multimedia','DUM'),(11,'Transmisi','Jaringan','DNN'),(12,'Transmisi','Jaringan','TND'),(13,'Jaringan','IoT','RMT'),(14,'Transmisi','Multimedia','HPT'),(15,'Multimedia','Jaringan','YSN'),(16,'Multimedia','Transmisi','ATV'),(17,'Transmisi','Jaringan','RDL');
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal_dosen`
--

DROP TABLE IF EXISTS `jadwal_dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal_dosen` (
  `kode_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `kode_dosen` varchar(5) NOT NULL,
  `hari` char(2) NOT NULL,
  `jam_awal` time NOT NULL,
  `jam_akhir` time NOT NULL,
  PRIMARY KEY (`kode_jadwal`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal_dosen`
--

LOCK TABLES `jadwal_dosen` WRITE;
/*!40000 ALTER TABLE `jadwal_dosen` DISABLE KEYS */;
INSERT INTO `jadwal_dosen` VALUES (109,'RWM','05','09:30:00','11:30:00'),(110,'RWM','04','09:30:00','11:30:00'),(111,'RWM','03','09:30:00','11:30:00'),(112,'RWM','02','09:30:00','11:30:00'),(113,'DYD','03','12:30:00','20:30:00'),(114,'DYD','02','12:30:00','20:30:00'),(115,'DYD','04','08:30:00','10:30:00'),(116,'DUM','06','12:30:00','20:30:00'),(117,'DUM','03','12:30:00','14:30:00'),(118,'DYD','01','10:30:00','18:30:00'),(119,'DYD','04','11:30:00','13:30:00'),(120,'DYD','05','13:30:00','15:30:00'),(121,'RMT','03','16:30:00','19:30:00'),(122,'RMT','04','12:30:00','14:30:00'),(123,'AGD','04','17:30:00','20:30:00'),(124,'AGD','04','07:30:00','09:30:00'),(125,'SCA','02','13:30:00','15:30:00'),(126,'ASM','01','07:30:00','09:30:00'),(127,'ASM','04','17:30:00','20:30:00'),(128,'SCA','02','15:30:00','18:30:00'),(129,'RDL','04','07:30:00','10:30:00'),(130,'ATV','01','08:30:00','11:30:00'),(131,'RDL','04','10:30:00','13:30:00'),(132,'DNN','04','13:30:00','16:30:00'),(133,'ATV','04','13:30:00','16:30:00'),(134,'RGK','03','08:30:00','10:30:00'),(135,'RGK','02','14:30:00','16:30:00'),(136,'RGK','05','13:30:00','19:30:00'),(137,'DUM','02','07:30:00','13:30:00'),(138,'DUM','05','09:30:00','11:30:00'),(139,'DUM','01','06:30:00','12:30:00'),(140,'DUM','05','07:30:00','09:30:00'),(141,'RGK','06','14:30:00','20:30:00'),(142,'HPT','06','14:30:00','20:30:00'),(143,'HPT','04','14:30:00','16:30:00'),(144,'HPT','01','12:30:00','14:30:00'),(145,'HPT','04','06:30:00','12:30:00'),(146,'TND','03','11:30:00','13:30:00'),(147,'TND','05','13:30:00','19:30:00'),(148,'ATV','02','10:30:00','12:30:00'),(149,'ATV','03','10:30:00','16:30:00'),(150,'AGD','03','08:30:00','10:30:00'),(151,'AIM','05','07:30:00','09:30:00'),(152,'ASM','04','10:30:00','12:30:00'),(153,'ASM','01','08:30:00','14:30:00'),(154,'AIM','05','13:30:00','19:30:00'),(155,'AGD','06','07:30:00','13:30:00'),(156,'RMT','05','09:30:00','11:30:00'),(157,'RMT','06','13:30:00','19:30:00'),(158,'SCA','03','13:30:00','15:30:00'),(159,'SRD','03','11:30:00','13:30:00'),(160,'HFD','01','09:30:00','11:30:00'),(161,'TAR','04','13:30:00','15:30:00'),(162,'SCA','01','11:30:00','14:30:00'),(163,'TND','01','08:30:00','11:30:00'),(164,'DNN','03','08:30:00','11:30:00'),(165,'DNN','02','09:30:00','12:30:00'),(166,'YSR','04','10:30:00','13:30:00'),(167,'EYR','05','06:30:00','09:30:00'),(168,'EYR','06','07:30:00','10:30:00'),(169,'EYR','04','06:30:00','09:30:00'),(170,'EYR','05','08:30:00','11:30:00'),(171,'USH','04','13:30:00','16:30:00'),(172,'HNY','02','09:30:00','12:30:00'),(173,'HNY','02','15:30:00','18:30:00'),(174,'HNY','02','12:30:00','15:30:00'),(175,'ASM','04','12:30:00','14:30:00'),(176,'ASM','04','14:30:00','16:30:00'),(177,'HFD','01','11:30:00','13:30:00'),(178,'AGD','05','06:30:00','08:30:00'),(179,'TAR','03','14:30:00','16:30:00'),(180,'ATV','03','12:30:00','14:30:00'),(181,'YSR','02','14:30:00','16:30:00'),(182,'HPT','03','09:30:00','11:30:00'),(183,'HPT','06','08:30:00','14:30:00'),(184,'HPT','05','08:30:00','10:30:00'),(185,'HPT','02','12:30:00','18:30:00'),(186,'DNN','03','08:30:00','14:30:00'),(187,'ATV','06','12:30:00','18:30:00'),(188,'ATV','06','18:30:00','20:30:00'),(189,'DNN','01','14:30:00','16:30:00'),(190,'ATV','04','11:30:00','13:30:00'),(191,'YSR','03','13:30:00','19:30:00'),(192,'RDL','01','14:30:00','16:30:00'),(193,'RDL','05','14:30:00','20:30:00'),(194,'RDL','05','07:30:00','09:30:00'),(195,'RDL','06','07:30:00','13:30:00'),(196,'TND','02','13:30:00','15:30:00'),(197,'YSR','01','14:30:00','16:30:00'),(198,'TND','02','07:30:00','13:30:00'),(199,'DYD','05','09:30:00','11:30:00'),(200,'DYD','06','07:30:00','13:30:00'),(201,'DYD','05','07:30:00','09:30:00'),(202,'DUM','06','06:30:00','12:30:00'),(203,'SCA','04','08:30:00','10:30:00'),(204,'DYD','06','13:30:00','19:30:00'),(205,'DUM','04','10:30:00','12:30:00'),(206,'SCA','01','14:30:00','20:30:00'),(207,'AGD','02','07:30:00','09:30:00'),(208,'RMT','02','11:30:00','17:30:00'),(209,'RMT','02','09:30:00','11:30:00'),(210,'AIM','06','12:30:00','18:30:00'),(211,'RMT','01','12:30:00','18:30:00'),(212,'AIM','03','08:30:00','10:30:00'),(213,'RMT','03','13:30:00','15:30:00'),(214,'AGD','01','06:30:00','12:30:00'),(215,'TND','04','10:30:00','12:30:00'),(216,'TND','01','11:30:00','13:30:00');
/*!40000 ALTER TABLE `jadwal_dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keahlian`
--

DROP TABLE IF EXISTS `keahlian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keahlian` (
  `kode_keahlian` int(11) NOT NULL AUTO_INCREMENT,
  `nama_keahlian` varchar(100) NOT NULL,
  PRIMARY KEY (`kode_keahlian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keahlian`
--

LOCK TABLES `keahlian` WRITE;
/*!40000 ALTER TABLE `keahlian` DISABLE KEYS */;
/*!40000 ALTER TABLE `keahlian` ENABLE KEYS */;
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
  `penguji1` varchar(30) DEFAULT NULL,
  `penguji2` varchar(30) DEFAULT NULL,
  `tanggal` varchar(30) DEFAULT NULL,
  `waktu` varchar(30) DEFAULT NULL,
  `keahlian` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_sidang`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_sidang`) REFERENCES `dosen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (11,'Imsal Yunus','6705164044','Sistem Penjadwalan Sidang Proyek Akhir D3 Teknologi Telekomunikasi Menggunakan Metode Sekuensial Linier Berbasis Website','ASM','ATV',NULL,NULL,NULL,NULL,'Multimedia'),(12,'Muhammad Nurfian Aziz','6705164117','Perancangan dan Implementasi Sistem Peminjaman Ruangan Laboratorium Menggunakan Near Field Communication (NFC) berbasis Android (Studi Kasus: Fakultas Ilmu Terapan Universitas Telkom)','RMT','ATV',NULL,NULL,NULL,NULL,'IoT'),(13,'Yoshi Magdalena Daeli','6705160148','Perancangan dan Realisasi Wearable Antenna Berbasis Aluminium Foil Tape pada Frekuensi GPS L1','RDL','PRAK',NULL,NULL,NULL,NULL,'Jaringan'),(14,'Muhammad Dhika Nugroho','6705164033','Perencanaan INdoor Building Coverage (IBC) pada Jaringan LTE FDD 1800MHZ di Gedung Graha Wiyata Cacuk Sudarijianto A Universitas Telkom','HPT','PRAK',NULL,NULL,NULL,NULL,'Jaringan'),(15,'Riska Kemala Ayu','6705160073','Perhitungan Numerical Aperature Secara Otomatis Berbasis Matlab Sebagai Media Pembelajaran Sistem Komunikasi Optik (SKO)','TND','PRAK',NULL,NULL,NULL,NULL,'Jaringan'),(16,'Salsabila','6705164171','Analisis Performansi Quality of Service (Qos) dengan Metode Diffserv dan Intserv pada Jaringan IP dan MPLS untuk layanan Triple Play ','ASM','TAR',NULL,NULL,NULL,NULL,'Transmisi'),(17,'Rizky Ferian Aditia','6705160017','Rancang Bangun Pintu Evakuasi Pintar Berbasis Mikrokontroler Studi Kasus Asrama Mahasiswa Universitas Telkom','ATV','RYJ',NULL,NULL,NULL,NULL,'IoT');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menyidang`
--

DROP TABLE IF EXISTS `menyidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menyidang` (
  `kode_sidang` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `penguji1` varchar(5) NOT NULL,
  `penguji2` varchar(5) NOT NULL,
  PRIMARY KEY (`kode_sidang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menyidang`
--

LOCK TABLES `menyidang` WRITE;
/*!40000 ALTER TABLE `menyidang` DISABLE KEYS */;
/*!40000 ALTER TABLE `menyidang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periode_sidang`
--

DROP TABLE IF EXISTS `periode_sidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periode_sidang` (
  `kode_periode` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`kode_periode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periode_sidang`
--

LOCK TABLES `periode_sidang` WRITE;
/*!40000 ALTER TABLE `periode_sidang` DISABLE KEYS */;
/*!40000 ALTER TABLE `periode_sidang` ENABLE KEYS */;
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
  `hak_akses` varchar(10) NOT NULL,
  `kode_dosen` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (21,'asep','$2y$10$2ANNxCL/xeC2Kzn2nZevc.0fmMq3R5wY8WfAk/Q7UliOZPH7EdEE6','dosen','ASM'),(22,'gondo','$2y$10$LSXyn2SJ6OfAY/iO0wmzGubVTQdp9ZVCBmyEqOSC2bKhW9/N2j7WO','dosen','WEW'),(23,'admin','$2y$10$7wbF/JDeSyKZcR2TBiY5deCNNu2voFHCRPMtGRgSkQGdk/uGQ3RgG','admin','admin');
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

-- Dump completed on 2019-05-22 21:13:27
