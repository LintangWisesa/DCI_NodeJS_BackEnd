-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ptdci
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept` varchar(10) NOT NULL,
  `fulldept` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'AD','Administrator'),(2,'MK','Marketing'),(3,'HR','Human Resources'),(4,'ac','acounting'),(5,'dl','delivery'),(6,'eg','engineering'),(7,'ga','general affair');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisi`
--

DROP TABLE IF EXISTS `divisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `divisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kodediv` varchar(2) DEFAULT NULL,
  `namadiv` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisi`
--

LOCK TABLES `divisi` WRITE;
/*!40000 ALTER TABLE `divisi` DISABLE KEYS */;
INSERT INTO `divisi` VALUES (1,'ad','administrasi'),(2,'tk','teknik'),(3,'wh','warehouse');
/*!40000 ALTER TABLE `divisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jabat` varchar(2) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jabatan`
--

LOCK TABLES `jabatan` WRITE;
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` VALUES (1,'sp','supervisor'),(2,'op','operator'),(3,'ad','administrator'),(4,'am','assistant manager'),(5,'av','advisor'),(6,'dd','driver delivery'),(7,'do','driver office'),(8,'ds','dies setter');
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kodekate` varchar(2) DEFAULT NULL,
  `namakate` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'dr','direct'),(2,'in','indirect'),(3,'sd','semi direct');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jabat` varchar(2) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master`
--

DROP TABLE IF EXISTS `master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `master` (
  `nip` varchar(4) NOT NULL,
  `staff` enum('staff','non-staff') DEFAULT NULL,
  `level` varchar(2) NOT NULL,
  `kelamin` enum('l','p') DEFAULT NULL,
  `nama` varchar(60) NOT NULL,
  `jabatan` varchar(2) NOT NULL,
  `dept` varchar(2) NOT NULL,
  `divisi` enum('teknik','administrasi') DEFAULT NULL,
  `seksi` varchar(2) NOT NULL,
  `sseksi` varchar(2) NOT NULL,
  `status` enum('kawin','tidak kawin') DEFAULT NULL,
  `kategori` enum('direct','indirect','semi direct') DEFAULT NULL,
  `latar` enum('dci','aj','wps','mardizu') DEFAULT NULL,
  `didik` varchar(60) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_awal` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `tgl_lahir` date NOT NULL,
  `stat_peg` enum('tetap','kontrak','honor','outsourcing') DEFAULT NULL,
  `agama` varchar(10) NOT NULL,
  `jml_anak` int(3) DEFAULT '0',
  `lahir` varchar(30) NOT NULL,
  `npwp` varchar(30) NOT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `emergency` varchar(20) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `alamat1` varchar(100) DEFAULT NULL,
  `nama_pasangan` varchar(30) DEFAULT NULL,
  `no_rek` varchar(30) NOT NULL,
  `no_rekp` varchar(30) NOT NULL,
  `no_ktp` varchar(30) NOT NULL,
  `no_kpj` varchar(30) NOT NULL,
  `sim` varchar(30) NOT NULL,
  `ibu_kandung` varchar(60) NOT NULL,
  `spsi` enum('anggota','non-anggota') DEFAULT NULL,
  `sisa_cuti` int(2) DEFAULT '12',
  `catatan` varchar(255) DEFAULT NULL,
  `file1` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file3` varchar(255) DEFAULT NULL,
  `file4` varchar(255) DEFAULT NULL,
  `file5` varchar(255) DEFAULT NULL,
  `file6` varchar(255) DEFAULT NULL,
  `file7` varchar(255) DEFAULT NULL,
  `file8` varchar(255) DEFAULT NULL,
  `file9` varchar(255) DEFAULT NULL,
  `file10` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master`
--

LOCK TABLES `master` WRITE;
/*!40000 ALTER TABLE `master` DISABLE KEYS */;
INSERT INTO `master` VALUES ('1234','staff','c1','l','Andi','sp','hr','teknik','ac','bp','kawin','direct','dci','S1 Arsitektur','2000-02-02','2000-02-02','2018-12-29','1980-02-01','tetap','islam',2,'jakarta','kodenpwp12345','021123456','021123456','Gg. Duku 05/VI Beji','Depok','Rini','12345','12345','12345','12345','12345','Sari','anggota',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1235','non-staff','c2','l','Budi','op','mk','administrasi','wh','sm','kawin','indirect','wps','S1 Ekonomi','2001-02-02','2001-02-02','2017-12-29','1981-12-01','kontrak','buddha',1,'semarang','kodenpwp12345','021123456','021123456','Gg. Salak 04/III Cikal','Jakarta Selatan','Alina','12345','12345','12345','12345','12345','Narti','non-anggota',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1236','non-staff','c2','l','Budi','op','mk','administrasi','wh','sm','kawin','indirect','mardizu','D3 Akuntansi','2002-02-02','2002-02-02','2016-12-29','1988-12-01','honor','kristen',0,'bandung','kodenpwp12345','021123456','021123456','Gg. Manggis 09/IX Tunas','Jakarta Timur','Denny','12345','12345','12345','12345','12345','Maria','anggota',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submenu` varchar(100) NOT NULL,
  `menu` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Master Karyawan','Master File'),(2,'Master Karyawan Resign','Master File'),(3,'Tabel Skala Upah','Master File'),(4,'Data Hari Libur','Master File'),(5,'File Tabel','Master File'),(6,'File User','Master File'),(7,'Parameter','Master File'),(8,'Performance Karyawan','Master File'),(9,'Pajak Karyawan','Master File'),(10,'Karyawan Shift 2','Master File'),(11,'Karyawan Resign','Master File'),(12,'Rapel Gaji Karyawan','Master File'),(13,'Restore Absensi','Mutasi'),(14,'Data Absensi','Mutasi'),(15,'Karyawan Tidak Hadir','Mutasi'),(16,'Cuti Karyawan','Mutasi'),(17,'Karyawan Lembur','Mutasi'),(18,'Koreksi Upah','Mutasi'),(19,'Koperasi Karyawan','Mutasi'),(20,'Laporan BPJS Kesehatan','Mutasi'),(21,'Laporan BPJS Ketenagakerjaan','Mutasi'),(22,'Laporan THR Karyawan','Mutasi'),(23,'Laporan Absensi & Lembur','Laporan'),(24,'Laporan Jam Kerja','Laporan'),(25,'Laporan Daftar Gaji','Laporan'),(26,'Daftar Rekening Karyawan','Laporan'),(27,'Rincian Gaji Karyawan','Laporan'),(28,'Laporan Pajak','Laporan'),(29,'Laporan 2','Laporan');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seksi`
--

DROP TABLE IF EXISTS `seksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jabat` varchar(2) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seksi`
--

LOCK TABLES `seksi` WRITE;
/*!40000 ALTER TABLE `seksi` DISABLE KEYS */;
INSERT INTO `seksi` VALUES (1,'ac','accounting'),(2,'wh','warehouse');
/*!40000 ALTER TABLE `seksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subseksi`
--

DROP TABLE IF EXISTS `subseksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subseksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jabat` varchar(2) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subseksi`
--

LOCK TABLES `subseksi` WRITE;
/*!40000 ALTER TABLE `subseksi` DISABLE KEYS */;
INSERT INTO `subseksi` VALUES (1,'bp','big press'),(2,'sp','small press'),(3,'ac','accounting'),(4,'fi','finance'),(5,'ak','analis kimia');
/*!40000 ALTER TABLE `subseksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermenu`
--

DROP TABLE IF EXISTS `usermenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usermenu` (
  `id_user` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermenu`
--

LOCK TABLES `usermenu` WRITE;
/*!40000 ALTER TABLE `usermenu` DISABLE KEYS */;
INSERT INTO `usermenu` VALUES (3,1,'no access'),(3,2,'no access'),(3,3,'no access'),(3,4,'no access'),(3,5,'no access'),(3,6,'no access'),(3,7,'no access'),(3,8,'no access'),(3,9,'no access'),(3,10,'no access'),(3,11,'no access'),(3,12,'no access'),(3,13,'no access'),(3,14,'no access'),(3,15,'no access'),(3,16,'no access'),(3,17,'no access'),(3,18,'no access'),(3,19,'no access'),(3,20,'no access'),(3,21,'no access'),(3,22,'no access'),(3,23,'ok'),(3,24,'ok'),(3,25,'ok'),(3,26,'ok'),(3,27,'ok'),(3,28,'ok'),(4,1,'no access'),(4,2,'ok'),(4,3,'no access'),(4,4,'ok'),(4,5,'no access'),(4,6,'ok'),(4,7,'no access'),(4,8,'ok'),(4,9,'no access'),(4,10,'ok'),(4,11,'no access'),(4,12,'ok'),(4,13,'no access'),(4,14,'ok'),(4,15,'no access'),(4,16,'ok'),(4,17,'no access'),(4,18,'ok'),(4,19,'no access'),(4,20,'ok'),(4,21,'no access'),(4,22,'ok'),(4,23,'no access'),(4,24,'ok'),(4,25,'no access'),(4,26,'ok'),(4,27,'no access'),(4,28,'ok'),(2,1,'ok'),(2,2,'ok'),(2,3,'ok'),(2,4,'ok'),(2,5,'no access'),(2,6,'ok'),(2,7,'no access'),(2,8,'ok'),(2,9,'ok'),(2,10,'ok'),(2,11,'ok'),(2,12,'ok'),(2,13,'ok'),(2,14,'ok'),(2,15,'ok'),(2,16,'ok'),(2,17,'ok'),(2,18,'ok'),(2,19,'ok'),(2,20,'ok'),(2,21,'ok'),(2,22,'ok'),(2,23,'ok'),(2,24,'ok'),(2,25,'ok'),(2,26,'ok'),(2,27,'ok'),(2,28,'ok'),(19,1,'ok'),(19,2,'no access'),(19,3,'no access'),(19,4,'no access'),(19,5,'no access'),(19,6,'ok'),(19,7,'no access'),(19,8,'no access'),(19,9,'no access'),(19,10,'no access'),(19,11,'no access'),(19,12,'no access'),(19,13,'no access'),(19,14,'no access'),(19,15,'no access'),(19,16,'no access'),(19,17,'no access'),(19,18,'no access'),(19,19,'no access'),(19,20,'no access'),(19,21,'no access'),(19,22,'no access'),(19,23,'no access'),(19,24,'no access'),(19,25,'no access'),(19,26,'no access'),(19,27,'ok'),(19,28,'no access');
/*!40000 ALTER TABLE `usermenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL DEFAULT 'Tanpa Nama',
  `password` varchar(10) NOT NULL,
  `dept` varchar(4) NOT NULL,
  `dibuat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `diupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'userdua','abcde','MK','2019-01-26 14:20:24','2019-01-26 14:20:24'),(3,'usertiga','67890','HR','2019-01-26 14:20:24','2019-01-26 14:20:24'),(4,'userempat','fghij','AD','2019-01-26 17:40:29','2019-01-26 17:40:29'),(19,'teske200','teske200','AD','2019-03-11 10:20:29','2019-03-11 10:59:49');
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

-- Dump completed on 2019-04-14 18:38:43
