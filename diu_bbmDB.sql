-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for blood_bank
CREATE DATABASE IF NOT EXISTS `blood_bank` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `blood_bank`;

-- Dumping structure for table blood_bank.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.auth_group: ~2 rows (approximately)
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(2, 'DONOR'),
	(1, 'PATIENT');

-- Dumping structure for table blood_bank.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.auth_group_permissions: ~0 rows (approximately)

-- Dumping structure for table blood_bank.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.auth_permission: ~44 rows (approximately)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add stock', 7, 'add_stock'),
	(26, 'Can change stock', 7, 'change_stock'),
	(27, 'Can delete stock', 7, 'delete_stock'),
	(28, 'Can view stock', 7, 'view_stock'),
	(29, 'Can add blood request', 8, 'add_bloodrequest'),
	(30, 'Can change blood request', 8, 'change_bloodrequest'),
	(31, 'Can delete blood request', 8, 'delete_bloodrequest'),
	(32, 'Can view blood request', 8, 'view_bloodrequest'),
	(33, 'Can add donor', 9, 'add_donor'),
	(34, 'Can change donor', 9, 'change_donor'),
	(35, 'Can delete donor', 9, 'delete_donor'),
	(36, 'Can view donor', 9, 'view_donor'),
	(37, 'Can add blood donate', 10, 'add_blooddonate'),
	(38, 'Can change blood donate', 10, 'change_blooddonate'),
	(39, 'Can delete blood donate', 10, 'delete_blooddonate'),
	(40, 'Can view blood donate', 10, 'view_blooddonate'),
	(41, 'Can add patient', 11, 'add_patient'),
	(42, 'Can change patient', 11, 'change_patient'),
	(43, 'Can delete patient', 11, 'delete_patient'),
	(44, 'Can view patient', 11, 'view_patient');

-- Dumping structure for table blood_bank.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.auth_user: ~3 rows (approximately)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$180000$c5aFH0zfHhkm$3sqoyhY/1PV6g2CUrXquAcklO8k4hsUjl0izmRTv0gg=', '2023-03-11 15:32:45.200170', 1, 'itskmhasan', '', '', 'itskmhasan@gmail.com', 1, 1, '2023-02-03 03:51:34.650276'),
	(2, 'pbkdf2_sha256$180000$UClGrkx01Kpu$6d4Zu+aZ6IxTHE1EI1NKBxNY1luN33ZLpFkt/R829A4=', '2023-02-03 04:07:35.862510', 0, 'islfashion', 'Qazi Lamia', 'Ahona', '', 0, 1, '2023-02-03 03:56:21.029818'),
	(3, 'pbkdf2_sha256$180000$h6phD3irBaSS$8jZ650Xt62fB8fDgummVo9cmvDvCL1uZrihXAGsfxoA=', '2023-03-11 15:54:16.171799', 0, 'shajeebhaider', 'Kazi', 'Hasan', '', 0, 1, '2023-02-03 04:07:14.313141');

-- Dumping structure for table blood_bank.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.auth_user_groups: ~2 rows (approximately)
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 2, 1),
	(2, 3, 2);

-- Dumping structure for table blood_bank.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.auth_user_user_permissions: ~0 rows (approximately)

-- Dumping structure for table blood_bank.blood_bloodrequest
CREATE TABLE IF NOT EXISTS `blood_bloodrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(30) NOT NULL,
  `patient_age` int(10) unsigned NOT NULL,
  `reason` varchar(500) NOT NULL,
  `bloodgroup` varchar(10) NOT NULL,
  `unit` int(10) unsigned NOT NULL CHECK (`unit` >= 0),
  `status` varchar(20) NOT NULL,
  `request_by_donor_id` int(11) DEFAULT NULL,
  `request_by_patient_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blood_bloodrequest_request_by_donor_id_356e443f_fk_donor_don` (`request_by_donor_id`),
  KEY `blood_bloodrequest_request_by_patient_i_f651be1d_fk_patient_p` (`request_by_patient_id`),
  CONSTRAINT `blood_bloodrequest_request_by_donor_id_356e443f_fk_donor_don` FOREIGN KEY (`request_by_donor_id`) REFERENCES `donor_donor` (`id`),
  CONSTRAINT `blood_bloodrequest_request_by_patient_i_f651be1d_fk_patient_p` FOREIGN KEY (`request_by_patient_id`) REFERENCES `patient_patient` (`id`),
  CONSTRAINT `blood_bloodrequest_patient_age_9c39f309_check` CHECK (`patient_age` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.blood_bloodrequest: ~3 rows (approximately)
INSERT INTO `blood_bloodrequest` (`id`, `patient_name`, `patient_age`, `reason`, `bloodgroup`, `unit`, `status`, `request_by_donor_id`, `request_by_patient_id`, `date`, `mobile`) VALUES
	(1, 'Jahid', 22, 'bloood need', 'O-', 1, 'Approved', NULL, 1, '2023-02-03', NULL),
	(2, 'fdsdf', 4, 'safdf', 'O-', 1, 'Pending', 1, NULL, '2023-03-08', NULL),
	(3, 'Hasan', 10, 'Fever', 'A+', 1, 'Pending', 1, NULL, '2023-03-08', NULL),
	(4, 'Shajeeeb', 32, 'Bllod', 'A+', 1, 'Pending', 1, NULL, '2023-03-10', '01867504087'),
	(5, 'Toha', 20, 'Fever', 'A+', 2, 'Pending', 1, NULL, '2023-03-11', '01987465783');

-- Dumping structure for table blood_bank.blood_stock
CREATE TABLE IF NOT EXISTS `blood_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bloodgroup` varchar(10) NOT NULL,
  `unit` int(10) unsigned NOT NULL CHECK (`unit` >= 0),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.blood_stock: ~8 rows (approximately)
INSERT INTO `blood_stock` (`id`, `bloodgroup`, `unit`) VALUES
	(1, 'A+', 4),
	(2, 'A-', 0),
	(3, 'B+', 0),
	(4, 'B-', 0),
	(5, 'AB+', 0),
	(6, 'AB-', 0),
	(7, 'O+', 0),
	(8, 'O-', 9);

-- Dumping structure for table blood_bank.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.django_admin_log: ~0 rows (approximately)

-- Dumping structure for table blood_bank.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.django_content_type: ~11 rows (approximately)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(8, 'blood', 'bloodrequest'),
	(7, 'blood', 'stock'),
	(5, 'contenttypes', 'contenttype'),
	(10, 'donor', 'blooddonate'),
	(9, 'donor', 'donor'),
	(11, 'patient', 'patient'),
	(6, 'sessions', 'session');

-- Dumping structure for table blood_bank.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.django_migrations: ~24 rows (approximately)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2023-02-03 03:50:56.896816'),
	(2, 'auth', '0001_initial', '2023-02-03 03:50:57.109643'),
	(3, 'admin', '0001_initial', '2023-02-03 03:50:57.784888'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-03 03:50:57.894004'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-03 03:50:57.904750'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-03 03:50:57.967094'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-03 03:50:58.026518'),
	(8, 'auth', '0003_alter_user_email_max_length', '2023-02-03 03:50:58.051518'),
	(9, 'auth', '0004_alter_user_username_opts', '2023-02-03 03:50:58.059516'),
	(10, 'auth', '0005_alter_user_last_login_null', '2023-02-03 03:50:58.104523'),
	(11, 'auth', '0006_require_contenttypes_0002', '2023-02-03 03:50:58.108516'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-03 03:50:58.117518'),
	(13, 'auth', '0008_alter_user_username_max_length', '2023-02-03 03:50:58.137516'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-03 03:50:58.154493'),
	(15, 'auth', '0010_alter_group_name_max_length', '2023-02-03 03:50:58.173367'),
	(16, 'auth', '0011_update_proxy_permissions', '2023-02-03 03:50:58.183364'),
	(17, 'patient', '0001_initial', '2023-02-03 03:50:58.227529'),
	(18, 'donor', '0001_initial', '2023-02-03 03:50:58.337260'),
	(19, 'blood', '0001_initial', '2023-02-03 03:50:58.419098'),
	(20, 'blood', '0002_bloodrequest', '2023-02-03 03:50:58.451098'),
	(21, 'blood', '0003_auto_20210213_1053', '2023-02-03 03:50:58.687925'),
	(22, 'blood', '0004_bloodrequest_date', '2023-02-03 03:50:58.717720'),
	(23, 'donor', '0002_auto_20210213_1602', '2023-02-03 03:50:58.793551'),
	(24, 'sessions', '0001_initial', '2023-02-03 03:50:58.903926'),
	(25, 'blood', '0005_bloodrequest_mobile', '2023-03-10 16:00:49.842237');

-- Dumping structure for table blood_bank.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.django_session: ~1 rows (approximately)

-- Dumping structure for table blood_bank.donor_blooddonate
CREATE TABLE IF NOT EXISTS `donor_blooddonate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disease` varchar(100) NOT NULL,
  `age` int(10) unsigned NOT NULL CHECK (`age` >= 0),
  `bloodgroup` varchar(10) NOT NULL,
  `unit` int(10) unsigned NOT NULL CHECK (`unit` >= 0),
  `status` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `donor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `donor_blooddonate_donor_id_ac968d26_fk_donor_donor_id` (`donor_id`),
  CONSTRAINT `donor_blooddonate_donor_id_ac968d26_fk_donor_donor_id` FOREIGN KEY (`donor_id`) REFERENCES `donor_donor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.donor_blooddonate: ~0 rows (approximately)
INSERT INTO `donor_blooddonate` (`id`, `disease`, `age`, `bloodgroup`, `unit`, `status`, `date`, `donor_id`) VALUES
	(1, 'Nothing', 25, 'O-', 1, 'Pending', '2023-03-11', 1);

-- Dumping structure for table blood_bank.donor_donor
CREATE TABLE IF NOT EXISTS `donor_donor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(100) DEFAULT NULL,
  `bloodgroup` varchar(10) NOT NULL,
  `address` varchar(40) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `donor_donor_user_id_f97e4cc8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.donor_donor: ~0 rows (approximately)
INSERT INTO `donor_donor` (`id`, `profile_pic`, `bloodgroup`, `address`, `mobile`, `user_id`) VALUES
	(1, 'profile_pic/Donor/304079481_473416344693671_4267555442696886026_n-removebg-preview-remov_biRy4BB.png', 'O-', 'West Sewrapara, 757/1, Kafrul, Dhaka, Dh', '+8801518397792', 3);

-- Dumping structure for table blood_bank.patient_patient
CREATE TABLE IF NOT EXISTS `patient_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(100) DEFAULT NULL,
  `age` int(10) unsigned NOT NULL CHECK (`age` >= 0),
  `bloodgroup` varchar(10) NOT NULL,
  `disease` varchar(100) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `address` varchar(40) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `patient_patient_user_id_40c1c82a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table blood_bank.patient_patient: ~0 rows (approximately)
INSERT INTO `patient_patient` (`id`, `profile_pic`, `age`, `bloodgroup`, `disease`, `doctorname`, `address`, `mobile`, `user_id`) VALUES
	(1, 'profile_pic/Patient/DALLE_2022-12-09_14.36.50_-_Complete_this_image.png', 30, 'O-', 'N/a', 'N/a', 'House:100/101,Flat:2A Jams anshi, road:', '01624605464', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
