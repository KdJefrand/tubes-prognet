/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - tubes_prognet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tubes_prognet` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `tubes_prognet`;

/*Table structure for table `agamas` */

DROP TABLE IF EXISTS `agamas`;

CREATE TABLE `agamas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `agamas` */

insert  into `agamas`(`id`,`agama`,`created_at`,`updated_at`) values 
(1,'Islam',NULL,NULL),
(2,'Hindu',NULL,NULL),
(3,'Protestan',NULL,NULL),
(4,'Kalolik',NULL,NULL),
(5,'Buddha',NULL,NULL),
(6,'Khonghucu',NULL,NULL);

/*Table structure for table `anggotakks` */

DROP TABLE IF EXISTS `anggotakks`;

CREATE TABLE `anggotakks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kk_id` bigint(20) unsigned NOT NULL,
  `penduduk_id` bigint(20) unsigned NOT NULL,
  `hubungankk_id` bigint(20) unsigned NOT NULL,
  `statusaktif` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penduduk_id` (`penduduk_id`),
  KEY `hubungankk_id` (`hubungankk_id`),
  KEY `kk_id` (`kk_id`),
  CONSTRAINT `anggotakks_ibfk_1` FOREIGN KEY (`penduduk_id`) REFERENCES `penduduks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `anggotakks_ibfk_2` FOREIGN KEY (`hubungankk_id`) REFERENCES `hubungankks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `anggotakks_ibfk_3` FOREIGN KEY (`kk_id`) REFERENCES `kks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `anggotakks` */

insert  into `anggotakks`(`id`,`kk_id`,`penduduk_id`,`hubungankk_id`,`statusaktif`,`created_at`,`updated_at`) values 
(1,1,1,3,1,NULL,NULL),
(2,2,2,3,1,NULL,NULL),
(3,3,3,3,1,NULL,NULL),
(4,4,4,3,1,NULL,NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `hubungankks` */

DROP TABLE IF EXISTS `hubungankks`;

CREATE TABLE `hubungankks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hubungankk` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hubungankks` */

insert  into `hubungankks`(`id`,`hubungankk`,`created_at`,`updated_at`) values 
(1,'Kepala Keluarga',NULL,NULL),
(2,'Isteri',NULL,NULL),
(3,'Anak',NULL,NULL);

/*Table structure for table `kks` */

DROP TABLE IF EXISTS `kks`;

CREATE TABLE `kks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nokk` varchar(255) NOT NULL,
  `statusaktif` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `kks` */

insert  into `kks`(`id`,`nokk`,`statusaktif`,`created_at`,`updated_at`) values 
(1,'5103060000000001',1,NULL,NULL),
(2,'5103060000000002',1,NULL,NULL),
(3,'5103060000000003',1,NULL,NULL),
(4,'5103060000000004',1,NULL,NULL),
(5,'5103060000000005',1,NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2019_12_14_000001_create_personal_access_tokens_table',1),
(2,'2023_11_29_144724_create_penduduks_table',1),
(3,'2023_11_29_144730_create_kks_table',1),
(4,'2023_11_29_144829_create_agamas_table',1),
(5,'2023_11_29_145219_create_hubungankks_table',1),
(6,'2023_11_29_145803_create_anggotakks_table',1),
(7,'2014_10_12_000000_create_users_table',2),
(8,'2014_10_12_100000_create_password_reset_tokens_table',2),
(9,'2019_08_19_000000_create_failed_jobs_table',2);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `penduduks` */

DROP TABLE IF EXISTS `penduduks`;

CREATE TABLE `penduduks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `lahir` date NOT NULL,
  `agama_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agama_id` (`agama_id`),
  CONSTRAINT `penduduks_ibfk_1` FOREIGN KEY (`agama_id`) REFERENCES `agamas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `penduduks` */

insert  into `penduduks`(`id`,`nik`,`nama`,`alamat`,`lahir`,`agama_id`,`created_at`,`updated_at`) values 
(1,'5103020000000001','Bagus','Jalan Mentari No. 123, Kelurahan Bahagia, Kota Ceria','2023-12-01',2,NULL,NULL),
(2,'5103020000000002','Srihatia','Perumahan Bintang Indah Blok C2/15, Desa Sejati, Kecamatan Damai','2023-12-02',2,NULL,NULL),
(3,'5103020000000003','Athaya','Gang Makmur 17, RT 05/RW 08, Kampung Bahagia, Kabupaten Damai','2023-12-03',1,NULL,NULL),
(4,'5103020000000004','Jefrand','Komplek Harmoni 3, Blok A2, Kota Sejahtera, Provinsi Damai','2023-12-04',2,NULL,NULL);

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values 
(1,'App\\Models\\User',1,'User login','951d49a7a5a71fa075c813f0a9910027c11d62b2d1d5b66f9610c09858b46d43','[\"*\"]','2023-12-12 23:37:00',NULL,'2023-12-12 23:36:32','2023-12-12 23:37:00'),
(2,'App\\Models\\User',1,'User login','9a9ba6fa3bbacd4bd9df93b05961c1eb984d29c3cf544b8e3449168fabdcd9c1','[\"*\"]',NULL,NULL,'2023-12-13 01:27:35','2023-12-13 01:27:35');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'jefrand','jefrand@gmail.com',NULL,'$2y$10$tbo065N./TiKOK/pAjRu4uDlvk9wyqxCZk6jvl59tgCnlumccieDe',NULL,'2023-12-12 23:36:22','2023-12-12 23:36:22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
