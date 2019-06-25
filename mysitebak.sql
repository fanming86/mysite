-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add post',8,'add_post'),(23,'Can change post',8,'change_post'),(24,'Can delete post',8,'delete_post'),(25,'Can add tag',9,'add_tag'),(26,'Can change tag',9,'change_tag'),(27,'Can delete tag',9,'delete_tag'),(28,'Can add photos',10,'add_photos'),(29,'Can change photos',10,'change_photos'),(30,'Can delete photos',10,'delete_photos'),(31,'Can add one day',11,'add_oneday'),(32,'Can change one day',11,'change_oneday'),(33,'Can delete one day',11,'delete_oneday'),(34,'Can add com',12,'add_com'),(35,'Can change com',12,'change_com'),(36,'Can delete com',12,'delete_com');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$X0Yp8gmxb9go$bra4V60qLN1sZumP5oY/xW0zGeJGyCuF4qi1c0Ay6Ik=','2019-06-25 07:57:21',1,'fanming','','','',1,1,'2019-06-25 03:59:20');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_com`
--

DROP TABLE IF EXISTS `comment_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_com` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `content` longtext NOT NULL,
  `ttt` varchar(10) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_com_lft_be4a85d7` (`lft`),
  KEY `comment_com_rght_f2fc6c1c` (`rght`),
  KEY `comment_com_tree_id_fdd65a0a` (`tree_id`),
  KEY `comment_com_level_c40bf758` (`level`),
  KEY `comment_com_parent_id_0cb01618` (`parent_id`),
  CONSTRAINT `comment_com_parent_id_0cb01618_fk_comment_com_id` FOREIGN KEY (`parent_id`) REFERENCES `comment_com` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_com`
--

LOCK TABLES `comment_com` WRITE;
/*!40000 ALTER TABLE `comment_com` DISABLE KEYS */;
INSERT INTO `comment_com` VALUES (3,0,'代青武','984650736@qq.com','hi','','2018-11-05 13:46:27',1,2,22,0,NULL),(4,0,'代青武','984650736@qq.com','建议樊老师 禁止复制文章内容，背景添加个音乐，','','2018-11-06 12:37:06',1,2,21,0,NULL),(5,0,'博主','admin@qq.com','「1万小时定律」是作家格拉德威尔在《异类》一书中指出的，就是要成为某个领域的专家，需要10000小时，按比例计算就是：如果每天工作八个小时，一周工作五天，那么成为一个领域的专家至少需要五年，是不是感觉1万小时是个遥不可及的事情。  如果你觉得1万小时太长，那么你还可以按照1000小时定律来做，就是以1000小时为一个阶梯，当你完成1个阶梯的时候就可以入门了，3个阶梯达到中级水平，5个阶梯达到高级水平，10个阶梯你就是专家。1000小时意味着什么？如果你每天花一个小时来学编程，那么需要花3年时间才能学会，如果想在一年内完成入门，每天至少要花三个小时。所以，如果你只坚持学习了两三个月发现没任何效果的时候太正常不过了。   那有没有速成宝典？有，但你需要有强烈的动机，例如每天花8个小时，10个小时来学习，脱产培训就是这样模式，4个月毕业。但是他们花的时间也远远超过了1000小时，全天候浸在学习中。  学 Python 你有超过1000个小时吗？  人与人之的差距都是从下班之后拉开的，你在玩游戏、刷抖音的时候他在学习。 最后，周末愉快。','','2018-11-10 11:36:37',1,2,20,0,NULL),(10,0,'博主','admin@163.com','The One Who Wants to Wear a Crown Must Bear the Weight. 欲戴王冠 必承其重','','2018-11-22 11:03:48',1,2,19,0,NULL),(14,0,'Sāng','1360350674@qq.com','1','','2019-02-27 02:08:13',1,6,15,0,NULL),(15,26,'Sāng','1360350674@qq.com','1','','2019-02-27 02:09:07',1,2,14,0,NULL),(16,0,'王老大','1287422696@qq.com','你真好','','2019-03-05 04:58:26',1,2,13,0,NULL),(17,0,'Sāng','1360350674@qq.com','231','','2019-03-07 04:13:40',2,5,15,1,14),(18,0,'Sāng','1360350674@qq.com','gfdsdf','','2019-03-07 08:03:35',3,4,15,2,17),(19,0,'fanming','fanming04@gmail.com','看看有没有邮件通知','','2019-03-18 05:53:17',1,6,12,0,NULL),(43,26,'fanming','969756850@qq.com','试试','','2019-04-27 07:33:35',1,4,11,0,NULL);
/*!40000 ALTER TABLE `comment_com` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-06-25 08:48:37','1','com object (1)',3,'',12,1),(2,'2019-06-25 08:48:59','44','com object (44)',3,'',12,1),(3,'2019-06-25 08:49:08','45','com object (45)',3,'',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'comment','com'),(5,'contenttypes','contenttype'),(7,'myApp1','category'),(11,'myApp1','oneday'),(10,'myApp1','photos'),(8,'myApp1','post'),(9,'myApp1','tag'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-06-25 03:58:10'),(2,'auth','0001_initial','2019-06-25 03:58:11'),(3,'admin','0001_initial','2019-06-25 03:58:11'),(4,'admin','0002_logentry_remove_auto_add','2019-06-25 03:58:11'),(5,'contenttypes','0002_remove_content_type_name','2019-06-25 03:58:11'),(6,'auth','0002_alter_permission_name_max_length','2019-06-25 03:58:11'),(7,'auth','0003_alter_user_email_max_length','2019-06-25 03:58:11'),(8,'auth','0004_alter_user_username_opts','2019-06-25 03:58:11'),(9,'auth','0005_alter_user_last_login_null','2019-06-25 03:58:11'),(10,'auth','0006_require_contenttypes_0002','2019-06-25 03:58:11'),(11,'auth','0007_alter_validators_add_error_messages','2019-06-25 03:58:11'),(12,'auth','0008_alter_user_username_max_length','2019-06-25 03:58:11'),(13,'auth','0009_alter_user_last_name_max_length','2019-06-25 03:58:11'),(14,'comment','0001_initial','2019-06-25 03:58:11'),(15,'myApp1','0001_initial','2019-06-25 03:58:11'),(16,'myApp1','0002_photos','2019-06-25 03:58:11'),(17,'myApp1','0003_oneday','2019-06-25 03:58:11'),(18,'myApp1','0004_auto_20181013_1840','2019-06-25 03:58:11');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('zn17c5nl69epm5m6u4sg291ignrnjmfh','N2M3ZDhlMTNhZDFlOWUyMGFmYjZhNDBlOWYyMWNhMDE0NjlmNmVmNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZjM5OGVkZWY4ZDE0ZGNhMjNjMDIxNzIyOGQzZDRlNjI0MWNiM2MwIn0=','2019-07-09 07:57:21');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myApp1_category`
--

DROP TABLE IF EXISTS `myApp1_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myApp1_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myApp1_category`
--

LOCK TABLES `myApp1_category` WRITE;
/*!40000 ALTER TABLE `myApp1_category` DISABLE KEYS */;
INSERT INTO `myApp1_category` VALUES (4,'linux'),(5,'windows'),(6,'python'),(7,'运维');
/*!40000 ALTER TABLE `myApp1_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myApp1_oneday`
--

DROP TABLE IF EXISTS `myApp1_oneday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myApp1_oneday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` date NOT NULL,
  `content` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myApp1_oneday`
--

LOCK TABLES `myApp1_oneday` WRITE;
/*!40000 ALTER TABLE `myApp1_oneday` DISABLE KEYS */;
INSERT INTO `myApp1_oneday` VALUES (1,'2019-06-25','Rudeness is merely the expression of fear. People fear they won\'t get what they want. The most dreadful and unattractive person only needs to be loved, and they will open up like a flower.','粗鲁只是恐惧的表现。人们恐惧无法得到所期望的。最可怕的、不招人喜爱的人也只是需要被爱，那么他们便会像花儿般绽放。');
/*!40000 ALTER TABLE `myApp1_oneday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myApp1_photos`
--

DROP TABLE IF EXISTS `myApp1_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myApp1_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `disc` longtext NOT NULL,
  `url` varchar(200) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myApp1_photos`
--

LOCK TABLES `myApp1_photos` WRITE;
/*!40000 ALTER TABLE `myApp1_photos` DISABLE KEYS */;
INSERT INTO `myApp1_photos` VALUES (79,'加勒比海上空的积云 (© F. M. Kearney/plainpicture)','如果我们能潜到壁纸中那些快乐的小云层下面那湛蓝海水中，就会看到地球上第二大的贝里斯堡礁（仅次于大堡礁），这个加勒比珊瑚礁系统覆盖了620英里的海底，是世界上最大的海牛种群的家园，这里还生活着世界上最大的鱼类之一：鲸鲨。','https://bing.ioliu.cn//photo/CumulusCaribbean_ZH-CN4884493707?force=home_1','upload/bing/20190226.png','2019-02-26'),(80,'哈德逊湾的北极熊，加拿大 (© Ralph A. Clevenger/Tandem Stills + Motion)','摆脱晚冬的低迷，今天与我们一起庆祝国际北极熊日。这些北极地区的大熊并非濒危，但已被认为是脆弱的物种。由于海洋温度升高，北极海冰覆盖范围不断缩小，北极熊种群面临着栖息地迅速萎缩的问题。北极熊的狩猎范围很大，它们依靠北极冰来四处游走。作为北极地区的顶级捕食者，北极熊是其独特生态系统中自然平衡的关键一环。如果海冰消失，它们可能很快就会灭绝。','https://bing.ioliu.cn//photo/PolarBearDay_ZH-CN5185516722?force=home_1','upload/bing/20190227.png','2019-02-27'),(82,'1986年由太空探测器旅行者2号拍摄的天王星照片 (© NASA)','xxx','https://bing.ioliu.cn//photo/Uranus_ZH-CN9689723562?force=home_1','upload/bing/20190314.png','2019-03-14'),(84,'圆形农田，科罗拉多州摩根县 (© Jim Wark/Getty Images)','xxx','https://bing.ioliu.cn//photo/AgriculturalPi_ZH-CN9754138523?force=home_1','upload/bing/20190315.png','2019-03-15'),(85,'古罗马广场上的塞维鲁凯旋门 (© Pietro Canali/eStock Photo)','xxx','https://bing.ioliu.cn//photo/SeptimiusSeverus_ZH-CN0799811992?force=home_1','upload/bing/20190316.png','2019-03-16'),(86,'黎明时分薄雾草原上的白斑鹿，印度中央邦坎哈国家公园 (© Pete Oxford/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/ChitalDawn_ZH-CN0851079165?force=home_1','upload/bing/20190317.png','2019-03-17'),(87,'为圣帕特里克节亮灯的国总理府，爱尔兰都柏林 (© David Soanes Photography/Getty Images)','xxx','https://bing.ioliu.cn//photo/TaoiseachDept_ZH-CN0902989482?force=home_1','upload/bing/20190318.png','2019-03-18'),(88,'一只蜂鸟盘旋在盛开的芦荟花丛中，加利福尼亚拉古纳海滩 (© Aurora Photos/Offset)','xxx','https://bing.ioliu.cn//photo/BloomingAloe_ZH-CN8209855003?force=home_1','upload/bing/20190428.png','2019-04-28'),(89,'荒地国家公园城堡小径附近的草原和尖塔石山 (© Danita Delimont/Getty Images)','xxx','https://bing.ioliu.cn//photo/SpringBadlands_ZH-CN8280871661?force=home_1','upload/bing/20190429.png','2019-04-29'),(90,'棕色褐喉树懒幼崽与妈妈，哥斯达黎加树懒保护区 (© Suzi Eszterhas/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/BabySloth_ZH-CN8329403615?force=home_1','upload/bing/20190430.png','2019-04-30'),(91,'苏格兰格伦芬南高架桥 (© Jon Arnold/DanitaDelimont.com)','xxx','https://bing.ioliu.cn//photo/GlenfinnanViaduct_ZH-CN8400951216?force=home_1','upload/bing/20190501.png','2019-05-01'),(92,'【今日劳动节】 (© Katvic/Shutterstock)','xxx','https://bing.ioliu.cn//photo/may1_ZH-CN8582006115?force=home_1','upload/bing/20190502.png','2019-05-02'),(93,'挪威瓦朗厄尔半岛上一只展示翎颌的雄性涉禽 (© Winfried Wisniewski/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/RuffLek_ZH-CN8485019267?force=home_1','upload/bing/20190503.png','2019-05-03'),(94,'玛格丽特河附近葡萄园的黎明，澳大利亚 (© Nick Rains/Corbis NX/Getty Images)','xxx','https://bing.ioliu.cn//photo/MargaretRiverVineyards_ZH-CN8547374435?force=home_1','upload/bing/20190504.png','2019-05-04'),(95,'斯凯利格群岛（由斯凯利格·迈克尔岛和小斯凯利格岛组成），爱尔兰 (© Design Pics/DanitaDelimont.com)','xxx','https://bing.ioliu.cn//photo/SkelligMichael_ZH-CN8635121409?force=home_1','upload/bing/20190505.png','2019-05-05'),(96,'圣米格尔·德阿连德，墨西哥 (© ferrantraite/Getty Images)','xxx','https://bing.ioliu.cn//photo/AmericanCulturalCapital_ZH-CN8717487767?force=home_1','upload/bing/20190506.png','2019-05-06'),(97,'华盛顿州北瀑布国家公园中的柳兰 (© Danita Delimont/Getty Images)','xxx','https://bing.ioliu.cn//photo/NCFireweed_ZH-CN8827671063?force=home_1','upload/bing/20190507.png','2019-05-07'),(98,'冰川国家公园里的圣玛丽瀑布，蒙大拿 (© Pung/Shutterstock)','xxx','https://bing.ioliu.cn//photo/StMaryFalls_ZH-CN8917284967?force=home_1','upload/bing/20190508.png','2019-05-08'),(99,'黄昏时佩吉海湾的灯塔，加拿大新斯科舍省 (© Darwin Wiggett/Offset)','xxx','https://bing.ioliu.cn//photo/LightHouseNS_ZH-CN9060766128?force=home_1','upload/bing/20190509.png','2019-05-09'),(100,'塞伦盖蒂国家公园里的斑马群，坦桑尼亚 (© pchoui/Getty Images)','xxx','https://bing.ioliu.cn//photo/SerengetiZebra_ZH-CN9007197602?force=home_1','upload/bing/20190510.png','2019-05-10'),(101,'圣克鲁斯岛上的一只岛屿灰狐，加利福尼亚州海峡群岛国家公园 (© Ian Shive/Tandem Motion + Stills)','xxx','https://bing.ioliu.cn//photo/ChannelIslandFox_ZH-CN5568101953?force=home_1','upload/bing/20190511.png','2019-05-11'),(102,'荷兰阿姆斯特丹附近赞瑟斯汉斯村里古老的风车 (© Matt Cooper/Gallery Stock)','xxx','https://bing.ioliu.cn//photo/ZaanseSchans_ZH-CN5665496862?force=home_1','upload/bing/20190512.png','2019-05-12'),(103,'琼斯海滩岛上的笛鸻和它的幼崽 (© Vicki Jauron/Getty Images)','xxx','https://bing.ioliu.cn//photo/PipingPlover_ZH-CN0992806167?force=home_1','upload/bing/20190513.png','2019-05-13'),(104,'松木国家森林，佛罗里达州 (© plainpicture/Cavan Images)','xxx','https://bing.ioliu.cn//photo/PineLogSP_ZH-CN1105763820?force=home_1','upload/bing/20190514.png','2019-05-14'),(105,'戛纳，法国 (© Manjik Photography/Alamy)','xxx','https://bing.ioliu.cn//photo/BlueCannes_ZH-CN1811852585?force=home_1','upload/bing/20190515.png','2019-05-15'),(106,'松树上的一只美国黑熊幼崽，加拿大贾斯珀国家公园 (© Donald M. Jones/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/JasperCub_ZH-CN4314891686?force=home_1','upload/bing/20190516.png','2019-05-16'),(107,'来自人工智能的画作《思念》 (© 微软小冰)','xxx','https://bing.ioliu.cn//photo/xiaoicepainting_ZH-CN8581660984?force=home_1','upload/bing/20190517.png','2019-05-17'),(108,'the Pura Meduwe Karang神庙中雕刻艺术家W.O.J.Nieuwenkamp的作品，印度尼西亚巴厘岛 (© John Elk III/Getty Images)','xxx','https://bing.ioliu.cn//photo/BicycleRelief_ZH-CN4483533362?force=home_1','upload/bing/20190518.png','2019-05-18'),(109,'山毛榉树林里的蓝铃花，英国赫特福德郡 (© Dan Tucker/Alamy)','xxx','https://bing.ioliu.cn//photo/BluebellBeech_ZH-CN8269343251?force=home_1','upload/bing/20190519.png','2019-05-19'),(110,'Ghyakar村，尼泊尔上木斯塘 (© Frank Bienewald/Alamy)','xxx','https://bing.ioliu.cn//photo/Ghyakar_ZH-CN4631836915?force=home_1','upload/bing/20190520.png','2019-05-20'),(111,'一只身上粘满南瓜花粉的蜜蜂，德国 (© Konrad Wothe/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/BeeWeek_ZH-CN4917222816?force=home_1','upload/bing/20190521.png','2019-05-21'),(112,'圣伊莱亚斯国家公园中的铜河三角洲，阿拉斯加 (© Frans Lanting/plainpicture)','xxx','https://bing.ioliu.cn//photo/CRDelta_ZH-CN5088201492?force=home_1','upload/bing/20190522.png','2019-05-22'),(113,'澳大利亚太平洋海岸的海崖大桥 (© Nick Fox/Alamy)','xxx','https://bing.ioliu.cn//photo/SeaCliffBridge_ZH-CN5362667487?force=home_1','upload/bing/20190523.png','2019-05-23'),(114,'库拉索普拉亚格兰迪海滩附近的绿海龟和沙丁鱼 (© yfhishinuma/Getty Images Plus)','xxx','https://bing.ioliu.cn//photo/CuracaoTurtle_ZH-CN5468901173?force=home_1','upload/bing/20190524.png','2019-05-24'),(115,'麦克米伦省级公园里的神殿林，加拿大不列颠哥伦比亚省 (© Robert Postma/Shutterstock)','xxx','https://bing.ioliu.cn//photo/MacmillanForest_ZH-CN5295176479?force=home_1','upload/bing/20190525.png','2019-05-25'),(116,'春天里的一只雄性开普梅莺 (© JZHunt/Getty Images Plus)','xxx','https://bing.ioliu.cn//photo/CapeMayWarbler_ZH-CN5148312890?force=home_1','upload/bing/20190526.png','2019-05-26'),(117,'圣米歇尔山 (© Leroy Francis/Getty Images)','xxx','https://bing.ioliu.cn//photo/MarathonduMont_ZH-CN5049722437?force=home_1','upload/bing/20190527.png','2019-05-27'),(118,'彭布鲁克郡海岸国家公园中的Pitting Gales Point，西威尔士 (© Sebastian Wasek/Getty Images)','xxx','https://bing.ioliu.cn//photo/PittingGalesPoint_ZH-CN4893591142?force=home_1','upload/bing/20190528.png','2019-05-28'),(119,'沿海的雾，加拿大纽芬兰 (© Scott Leslie/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/NFLDfog_ZH-CN4846953507?force=home_1','upload/bing/20190529.png','2019-05-29'),(120,'草地上的罂粟和矢车菊，德国北莱茵-威斯特法伦州 (© imageBROKER/Alamy)','xxx','https://bing.ioliu.cn//photo/BlumenwieseNRW_ZH-CN4774429225?force=home_1','upload/bing/20190530.png','2019-05-30'),(122,'俄勒冈州Zumwalt Prairie的草原土墩 (© Michael Durham/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/ZumwaltPrairie_ZH-CN4572430876?force=home_1','upload/bing/20190601.png','2019-06-01'),(124,'摩洛哥扎戈拉附近的椰枣树林 (© Frans Lemmens/Getty Images)','xxx','https://bing.ioliu.cn//photo/VastPalmGrove_ZH-CN4145018538?force=home_1','upload/bing/20190605.png','2019-06-05'),(125,'吉利群岛上生长着珊瑚的人工珊瑚礁，印度尼西亚 (© fenkieandreas/Getty Images Plus)','xxx','https://bing.ioliu.cn//photo/Biorocks_ZH-CN7851264095?force=home_1','upload/bing/20190609.png','2019-06-09'),(126,'蓝翅黄森莺，加拿大安大略省 (© Bill Coster/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/OntWarbler_ZH-CN7999782156?force=home_1','upload/bing/20190610.png','2019-06-10'),(128,'富士山与丛生福禄考花田，日本山梨县 (© Srinil/shutterstock)','xxx','https://bing.ioliu.cn//photo/FujiSakura_ZH-CN8005792871?force=home_1','upload/bing/20190612.png','2019-06-12'),(129,'位于大本德国家公园的格兰德河和卡门山脉，得克萨斯州 (© Grant Ordelheide/Tandem Stills + Motion)','xxx','https://bing.ioliu.cn//photo/RioGrande_ZH-CN8091224199?force=home_1','upload/bing/20190613.png','2019-06-13'),(130,'塞尚山，法国普罗旺斯艾克斯 (© travelview/iStock)','xxx','https://bing.ioliu.cn//photo/SainteVictoireCezanneBirthday_ZH-CN8216109812?force=home_1','upload/bing/20190614.png','2019-06-14'),(131,'大叶绣球花上的一对日本树蛙，日本滋贺 (© Mitsuhiko Imamori/Minden)','xxx','https://bing.ioliu.cn//photo/TreeFrog_ZH-CN9016355758?force=home_1','upload/bing/20190615.png','2019-06-15'),(132,'大沙丘上的日落，加拿大萨斯喀彻温省 (© Robert Postma/plainpicture)','xxx','https://bing.ioliu.cn//photo/SaskFlowers_ZH-CN9497517721?force=home_1','upload/bing/20190616.png','2019-06-16'),(133,'南非卡拉哈迪跨界公园的雄性非洲狮和它的幼崽 (© Richard Du Toit/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/PantheraLeoDad_ZH-CN9580668524?force=home_1','upload/bing/20190617.png','2019-06-17'),(134,'安克雷奇的秃鹰，阿拉斯加 (© Ron Niebrugge/Alamy)','xxx','https://bing.ioliu.cn//photo/AlaskaEagle_ZH-CN9957205086?force=home_1','upload/bing/20190618.png','2019-06-18'),(135,'勃艮第蜗牛，也称为食用蜗牛 (© Heidi and Hans-Juergen Koch/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/HelixPomatia_ZH-CN9785223494?force=home_1','upload/bing/20190619.png','2019-06-19'),(136,'格伦德根花园的樱桃月桂树迷宫鸟瞰图，英国康沃尔 (© Richard Cooke/Alamy)','xxx','https://bing.ioliu.cn//photo/CherryLaurelMaze_ZH-CN9887470516?force=home_1','upload/bing/20190620.png','2019-06-20'),(137,'一种常见茅膏菜（圆叶茅膏菜）的粘性叶片，法国孚日省 (© Christophe Sidamon-Pesson/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/CommonSundewVosges_ZH-CN0507660055?force=home_1','upload/bing/20190621.png','2019-06-21'),(138,'Dardanup郡的小矮人村，澳大利亚 (© Amanda Hughes/Alamy)','xxx','https://bing.ioliu.cn//photo/Gnomesville_ZH-CN4402652527?force=home_1','upload/bing/20190624.png','2019-06-24'),(139,'吕宋岛上的萤火虫环绕着榄仁树，菲律宾南甘马粦省 (© Jurgen Freund/Minden Pictures)','xxx','https://bing.ioliu.cn//photo/PhilippinesFirefly_ZH-CN4519927697?force=home_1','upload/bing/20190625.png','2019-06-25');
/*!40000 ALTER TABLE `myApp1_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myApp1_post`
--

DROP TABLE IF EXISTS `myApp1_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myApp1_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `body` longtext NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `excerpt` varchar(200) NOT NULL,
  `views` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myApp1_post_author_id_f8714f02_fk_auth_user_id` (`author_id`),
  KEY `myApp1_post_category_id_efff89ac_fk_myApp1_category_id` (`category_id`),
  CONSTRAINT `myApp1_post_category_id_efff89ac_fk_myApp1_category_id` FOREIGN KEY (`category_id`) REFERENCES `myApp1_category` (`id`),
  CONSTRAINT `myApp1_post_author_id_f8714f02_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myApp1_post`
--

LOCK TABLES `myApp1_post` WRITE;
/*!40000 ALTER TABLE `myApp1_post` DISABLE KEYS */;
INSERT INTO `myApp1_post` VALUES (5,'centos环境下使用uwsgi&nginx部署flask','1. 安装Python虚拟环境\r\n		在centos中，系统已经集成了Python环境，直接可以使用，不用手动安装。\r\n\r\n			1）pip install virtualenv             进行这一步要保证pip可以使用\r\n			若在此报错gcc，则需要安装python-devel\r\n			2）virtualenv   name    ——————创建虚拟环境\r\n			3）source name/activate ————激活虚拟环境\r\n			4）根据flask项目中需要的Python包安装\r\n\r\n 2. 安装uwsgi\r\n\r\n		1）pip install uwsgi\r\n		2）在项目的根目录创建文件名为config.ini文件，用于启动uwsgi\r\n	```\r\n	[uwsgi]\r\n	\r\n	socket = 127.0.0.1:5001     //启动程序时所使用的地址和端口，通常在本地运行flask项目，\r\n	                            //地址和端口是127.0.0.1:5000,\r\n	                            //不过在服务器上是通过uwsgi设置端口，通过uwsgi来启动项目，\r\n	                            //也就是说启动了uwsgi，也就启动了项目。\r\n	chdir = /root/pyenv/AjaxExample    //项目目录\r\n	\r\n	wsgi-file = run.py      //flask程序的启动文件，通常在本地是通过运行  \r\n	                        //python run.py 来启动项目的\r\n	                        \r\n	callable = app      //程序内启用的application变量名\r\n	\r\n	processes = 4     //处理器个数\r\n	\r\n	threads = 2     //线程个数\r\n	\r\n	stats = 127.0.0.1:9191      //获取uwsgi统计信息的服务地址 用于和nginx通信\r\n	```\r\n\r\n 3. 安装nginx\r\n\r\n			*nginx的一些命令\r\n			*启动： nginx\r\n			*停止： nginx -s -stop\r\n			*强制停止： pkill -9 nginx\r\n			*查看nginx是否应用配置文件: nginx -t\r\n			*查看版本： nginx -v\r\n			\r\n		 1）nginx 可以使用yum直接安装\r\n				 yum install yum-fastestmirror————安装源\r\n				 yum install nginx\r\n				 \r\n		 2）配置nginx\r\n				 配置文件默认在/etc/nginx/nginx.conf\r\n				 \r\n\r\n```\r\nuser nginx;\r\nworker_processes auto;\r\nerror_log /var/log/nginx/error.log;     //错误日志\r\npid /run/nginx.pid;\r\ninclude /usr/share/nginx/modules/*.conf;\r\nevents {\r\n    worker_connections 1024;\r\n}\r\nhttp {\r\n    log_format  main  \'$remote_addr - $remote_user [$time_local] \"$request\" \'\r\n                      \'$status $body_bytes_sent \"$http_referer\" \'\r\n                      \'\"$http_user_agent\" \"$http_x_forwarded_for\"\';\r\n    access_log  /var/log/nginx/access.log  main;\r\n    sendfile            on;\r\n    tcp_nopush          on;\r\n    tcp_nodelay         on;\r\n    keepalive_timeout   65;\r\n    types_hash_max_size 2048;\r\n    include             /etc/nginx/mime.types;\r\n    default_type        application/octet-stream;\r\n    # Load modular configuration files from the /etc/nginx/conf.d directory.\r\n    # See http://nginx.org/en/docs/ngx_core_module.html#include\r\n    # for more information.\r\n    include /etc/nginx/conf.d/*.conf;\r\n    server {\r\n        listen       80 default_server;  //web服务端口\r\n        listen       [::]:80 default_server;  \r\n        server_name  39.106.56.137;  //公网ip\r\n        root         /usr/share/nginx/html;\r\n        # Load configuration files for the default server block.\r\n        include /etc/nginx/default.d/*.conf;\r\n        location / {\r\n		include        uwsgi_params;\r\n                uwsgi_pass     127.0.0.1:5001;    //需要和uwsgi的配置文件里socket项的地址\r\n                                                  //相同,否则无法让uwsgi接收到请求。\r\n                uwsgi_param UWSGI_PYHOME /root/pyenv;  //python的位置(虚拟环境下)\r\n                uwsgi_param UWSGI_CHDIR /root/pyenv/AjaxExample;   //项目根目录\r\n                uwsgi_param UWSGI_SCRIPT run:app;    //启动项目的主程序(在本地上运行\r\n                                                     //这个主程序可以在flask内置的\r\n                                                     //服务器上访问你的项目)\r\n        }\r\n        error_page 404 /404.html;\r\n            location = /40x.html {\r\n        }\r\n        error_page 500 502 503 504 /50x.html;\r\n            location = /50x.html {\r\n        }\r\n    }\r\n}\r\n\r\n```\r\n\r\n 至此，各项配置已经完成，不出意外的话，你就可以在浏览器中访问你的网站了','2016-04-13 03:25:00','2018-05-01 03:25:00','',131,1,4),(6,'nagios监控（一）之centos7安装nagios监控服务','**1. nagios简介**\r\n---------------\r\n\r\n \r\n		Nagios是一款开源的免费网络监视工具，能有效监控Windows、Linux和Unix的主机状态，交换机路由器等网络设置，打印机等。在系统或服务状态异常时发出邮件或短信报警第一时间通知网站运维人员，在状态恢复后发出正常的邮件或短信通知。\r\n		    \r\n		Nagios 可以监控的功能有：\r\n		1、监控网络服务（SMTP、POP3、HTTP、NNTP、PING等）； \r\n		2、监控主机资源（处理器负荷、磁盘利用率等）；\r\n		3、简单地插件设计使得用户可以方便地扩展自己服务的检测方法；\r\n		4、并行服务检查机制；\r\n		5、具备定义网络分层结构的能力，用\"parent\"主机定义来表达网络主机间的关系，这种关系可被用来发现和明晰主机宕机或不可达状态；\r\n		6、当服务或主机问题产生与解决时将告警发送给联系人（通过EMail、短信、用户定义方式）；\r\n		7、具备定义事件句柄功能，它可以在主机或服务的事件发生时获取更多问题定位；\r\n		8、自动的日志回滚；\r\n		9、可以支持并实现对主机的冗余监控；\r\n		10、可选的WEB界面用于查看当前的网络状态、通知和故障历史、日志文件等。\r\n		\r\n\r\n**2. 安装Nagios基础支持套件和添加用户**\r\n--------------------------\r\n\r\n1).安装套件\r\n```\r\n yum install gcc glibc glibc-common gd gd-devel xinetd openssl-devel\r\n```\r\n2).创建nagios用户和用户组(先进行该步骤，不然编译nagios时会报错)\r\n```\r\nuseradd -s /sbin/nologin nagios   #创建nagios用户，设置该用户无法登录\r\nmkdir /usr/local/nagios   \r\nchown -R nagios.nagios /usr/local/nagios   #设置目录权限\r\n```\r\n3).安装httpd和php\r\n```\r\nyum install httpd*    ##安装Web服务器Apache相关服务,nagios提供了web监控界面，通过web界面可以看到被监控主机运行状态\r\nyum install php*      ##安装PHP相关服务\r\n```\r\n\r\n\r\n**3. 下载并编译安装Nagios**\r\n--------------------\r\n\r\n1).下载并解压nagios\r\n可以前往 https://www.nagios.org 获取最新的软件包，这里以 Nagios 核心 3.4.3 为例：\r\n```\r\nwget https://assets.nagios.com/downloads/nagioscore/releases/nagios-3.4.3.tar.gz \r\ntar -zxvf nagios-3.4.3.tar.gz \r\ncd nagios   #编译安装nagios\r\n```\r\n2).编译安装nagios\r\n```\r\n./configure --prefix=/usr/local/nagios\r\nmake all   ##中间如有选择，直接A\r\nmake install    ##安装主程序，CGI和HTML文件\r\nmake install-init   ##在/etc/rc.d/init.d安装启动脚本\r\nmake install-config    ##安装示例配置文件\r\nmake install-commandmode    ##配置目录权限\r\n```\r\n3).配置自启动\r\n```\r\nchkconfig --add nagios   ##增加nagios为系统服务\r\nchkconfig --level 35 nagios on  ##设置nagios在运行级别3、5的情况下为开启状态\r\nchkconfig --list nagios   ##列出nagios服务设置详情\r\n```\r\n4).验证程序是否配置正确\r\n```\r\n/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg\r\n```\r\n![这里写图片描述](http://img.blog.csdn.net/20180123112026072?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n \r\n\r\n**4. 安装Nagios插件**\r\n-----------------\r\n\r\n1).下载nagios-plugins\r\n可以前往 https://www.nagios.org 获取最新的软件包，这里以 插件 2.0.3 为例：\r\n```\r\nwget http://nagios-plugins.org/download/nagios-plugins-2.0.3.tar.gz  ##下载nagios-plugins\r\ntar -zxvf nagios-plugins-2.0.3.tar.gz   ##解压nagios-plugins\r\ncd nagios-plugins-2.0.3\r\n```\r\n2).编译安装nagios-plugins\r\n\r\n```\r\n./configure --prefix=/usr/local/nagios\r\nmake\r\nmake install\r\n```\r\n3).下载nagios-snmp-plugins\r\n\r\n```\r\nwget http://nagios.manubulon.com/nagios-snmp-plugins.1.1.1.tgz \r\ntar -zxvf nagios-snmp-plugins.1.1.1.tgz \r\ncd nagios-plugins-2.0.3/\r\n```\r\n4).编译安装nagios-snmp-plugins\r\n\r\n```\r\nyum install perl-CPAN   ##yum安装Perl-CPAN，CPAN是Perl软件收藏库，收集了大量有用的Perl模块(modules)及其相关的文件。nagios-snmp-plugins是一套用Perl编写的通过SNMP方式监控主机的插件程序，因此需要先安装perl-CPAN\r\nperl -MCPAN -e shell\r\ncpan[1]> install Net::SNMP\r\n```\r\n\r\n**5. 配置httpd**\r\n--------------\r\n\r\n 1).	\r\n\r\n```\r\nvi /etc/httpd/conf/httpd.conf\r\n将\r\nUser apache \r\nGroup apache\r\n```\r\n	修改为如下内容：\r\n![这里写图片描述](http://img.blog.csdn.net/20180123104741286?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n\r\n\r\n2).在如下位置添加index.php\r\n![fanming.shop](http://img.blog.csdn.net/20180123104930999?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n\r\n3).配置nagios.conf\r\n```\r\ncd nagios/       #nagios 解压后的目录\r\nmake install-webconf    ##安装nagios的web接口,会在/etc/httpd/conf.d目录中创建nagios.conf文件\r\nvim /etc/httpd/conf.d/nagios.conf\r\n```\r\n	将22行和39行附近的htpasswd.user改为htpasswd（注:也可不进行更改，但在下部中要加全路径名）\r\n![fanming.shop](http://img.blog.csdn.net/20180123105742740?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n\r\n4).创建nagios验证文件\r\n```\r\nhtpasswd -c /usr/local/nagios/etc/htpasswd admin  ##创建nagios登录web界面的用户名和密码\r\ncat /usr/local/nagios/etc/htpasswd    ##查看认证文件的内容\r\n```\r\n5).关闭SELinux和防火墙：\r\n```\r\na、临时关闭（不用重启机器）：\r\nsetenforce 0    ##设置SELinux 成为permissive模式  （关闭SELinux）\r\nsetenforce 1    ##设置SELinux 成为enforcing模式    (开启SELinux）\r\nb、修改配置文件需要重启机器：\r\nvi /etc/selinux/config\r\n将SELINUX=enforcing 改为SELINUX=disabled\r\n需重启机器\r\nc、可自己做策略开放相应端口，这里我直接关闭:\r\nsystemctl status firewalld.service       ##查看防火墙状态\r\nsystemctl stop firewalld.service         ##关闭防火墙\r\n```\r\n6).启用服务并进入nagios\r\n```\r\nsystemctl start httpd.service\r\nsystemctl start snmpd.service\r\nsystemctl start nagios.service\r\n```\r\n\r\n**至此，就可以访问http://localhost/nagios 访问web界面了**','2017-06-05 22:34:45','2018-05-01 03:28:52','',66,1,4),(7,'nagios监控（二）之监控windows server服务器','**摘要**\r\n本文介绍了如何使用nagios通过nsclient监控windows主机。\r\n此次实验环境基于[上篇文章](http://fanming.shop/2017/06/05/centos7InstallNagios/)，监控端在Linux环境下，Windows服务器使用的时windows server 2012。\r\n\r\n\r\n**1. 安装NSClient++**\r\n访问http://nsclient.org/nscp/ 下载NSClient++，这里我使用的是NSCP-0.4.3.143-x64的msi安装包。下载之后直接安装，过程中会提示输入Nagios监控服务器地址和密码。地址填写正确，密码不用设置。Nagios监控服务器事先在监控Linux服务器时候已经搭建好。\r\n\r\n\r\n**2.配置NSClient++**\r\n在 NSClient++ 的安装目录打开 nsclient.ini，将监控服务器的IP地址加到 allowed hosts 指令后面。\r\n![这里写图片描述](http://img.blog.csdn.net/20180125175521714?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n然后检查下12489端口是否正常监听\r\nnetstat -an | more\r\n\r\n因为安装时候需要的模块已经勾选了，所以配置文件中不用再作设置。否则可以通过去掉每个模块前的;来启用该模块。\r\n\r\n到这里即完成了Windows Server 2012上的配置。接下来我们设置Nagios监控服务器。\r\n\r\n\r\n**3.Nagios监控服务器设置**\r\nvi /usr/local/nagios/etc/nagios.cfg\r\n搜索找到：\r\nDefinitions for monitoring a Windows machine\r\ncfg_file=/usr/local/nagios/etc/objects/windows.cfg\r\n将第二行的#去掉打开Nagios监控的Windows模块，然后保存。\r\n![这里写图片描述](http://img.blog.csdn.net/20180125180434354?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n\r\n接着编辑\r\n找到并设置监控的服务器：\r\n设置被监控主机名和被监控的Windows服务器地址。\r\n**此地址为Linux服务端的ip地址**\r\n```\r\nvi /usr/local/nagios/etc/objects/windows.cfg\r\ndefine host{\r\nuse windows-server ; Inherit default values from a template\r\nhost_name winserver ; The name we\'re giving to this host\r\nalias My Windows Server ; A longer name associated with the host\r\naddress 192.168.0.2 ; IP address of the host\r\n}\r\n```\r\n![这里写图片描述](http://img.blog.csdn.net/20180126090631955?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n\r\n接下来搜索各种监控的服务并设置：\r\n\r\n```\r\n#监控NSClient版本。\r\nCreate a service for monitoring the version of NSCLient++ that is installed\r\nChange the host_name to match the name of the host you defined above\r\n\r\ndefine service{\r\nuse generic-service\r\nhost_name winserver\r\nservice_description NSClient++ Version\r\ncheck_command check_nt!CLIENTVERSION\r\n}\r\n\r\n#监控服务器在线时间。\r\nCreate a service for monitoring the uptime of the server\r\nChange the host_name to match the name of the host you defined above\r\n\r\ndefine service{\r\nuse generic-service\r\nhost_name winserver\r\nservice_description Uptime\r\ncheck_command check_nt!UPTIME\r\n}\r\n\r\n\r\n#监控服务器CPU负载。\r\nCreate a service for monitoring CPU load\r\nChange the host_name to match the name of the host you defined above\r\n\r\ndefine service{\r\nuse generic-service\r\nhost_name winserver\r\nservice_description CPU Load\r\ncheck_command check_nt!CPULOAD!-l 20,30,50\r\n}\r\n\r\n\r\n#监控服务器的内存占用。\r\n Create a service for monitoring memory usage\r\n Change the host_name to match the name of the host you defined above\r\n\r\ndefine service{\r\nuse generic-service\r\nhost_name winserver\r\nservice_description Memory Usage\r\ncheck_command check_nt!MEMUSE!-w 80 -c 90\r\n}\r\n\r\n\r\n#监控系统C盘的磁盘占用。\r\nCreate a service for monitoring C:\\ disk usage\r\nChange the host_name to match the name of the host you defined above\r\n\r\ndefine service{\r\nuse generic-service\r\nhost_name winserver\r\nservice_description C:\\ Drive Space\r\ncheck_command check_nt!USEDDISKSPACE!-l c -w 80 -c 90\r\n}\r\n```\r\n\r\n进入目录 /usr/local/nagios/libexec/\r\n在nagios监控端验证是否可以监控到windows主机，用命令./check_nt -H 192.168.13.132 -p 12489 -v UPTIME可以检测到Windows服务器已经启动的时长，也表示可以从Windows服务器拿到数据了。\r\n![这里写图片描述](http://img.blog.csdn.net/20180126093055560?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n\r\n\r\n现在就可以登录到nagios的web界面，查看你的监控信息了\r\n![这里写图片描述](http://img.blog.csdn.net/20180126093303518?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)','2017-06-10 03:31:04','2018-05-01 03:31:06','',88,1,5),(8,'redhat7部署ftp服务器','## 前言  \r\n ----\r\n> FTP 是File Transfer Protocol（文件传输协议）的英文简称。  \r\n> 用于Internet上的控制文件的双向传输。  \r\n> 同时，它也是一个应用程序（Application）。  \r\n> 基于不同的操作系统有不同的FTP应用程序，而所有这些应用程序都遵守同一种协议以传输文件。  \r\n-------\r\n### vsftp提供了以下三种登陆方式  \r\n#### 匿名用户登陆anonymous  \r\n> 使用anonymous是应用广泛的一种FTP服务器.如果用户在FTP服务器上没有帐号,那么用户可以以anonymous为用户名,以自己的电子邮件地址为密码进行登录.当匿名用户登录FTP服务器后,其登录目录为匿名FTP服务器的根目录/var/ftp.为了减轻FTP服务器的负载,一般情况下,应关闭匿名帐号的上传功能.  \r\n\r\n#### 虚拟用户登陆guest    \r\n> 如果用户在FTP服务器上拥有帐号,但此帐号只能用于文件传输服务,那么该帐号就是guest,guest是真实帐号的一种形式,它们的不同之处在于,geust登录FTP服务器后,不能访问除宿主目录以外的内容.  \r\n\r\n#### 本地用户登陆real    \r\n> real也称为本地帐号,就是以真实的用户名和密码进行登录,但前提条件是用户在FTP服务器上拥有自己的帐号.用真实帐号登录后,其登录的目录为用户自己的目录,该目录在系统建立帐号时系统就自动创建/etc/passwd文件中的用户\r\n\r\n----\r\n\r\n### 1、安装vsftpd  \r\n```bash\r\n#安装vsftpd\r\n[root@client /]# yum install vsftpd -y\r\n#启动vsftpd\r\n[root@client /]# systemctl start vsftpd\r\n#设置开机启动\r\n[root@client /]# systemctl enable vsftpd\r\n#开放防火墙规则\r\n[root@client /]# firewall-cmd --add-service=ftp --permanent\r\n[root@client /]# firewall-cmd --reload\r\n```\r\n##### 在本机进行测试，使用匿名用户登录测试\r\n此服务正常启动后，可以打开浏览器并在地址栏中输入：ftp://localhost；此时应该可以看到共享的目录 pub ；默认情况下共享目录为/var/ftp。\r\n\r\n### 2、配置文件中的公共配置\r\n主配置文件：vim /etc/vsftpd/vsftpd.conf   \r\n\r\n```bash\r\nwrite_enable=YES	 	#是否允许用户具有在FTP服务器文件中执行写的权限,默认是no\r\ndownload_enable=YES 	#设置用户是否有下载的权限，默认yes\r\ndirmessage_enable=YES 	#激活目录信息,当远程用户更改目录时,将出现提示信息\r\nxferlog_enable=YES 		#启用上传和下载日志功能\r\nxferlog_file=/var/log/xferlog	#设置日志存放的位置\r\nlisten_port=4449	#修改服务端口\r\n```\r\n\r\n### 3、针对匿名用户的配置   \r\n/var/ftp 目录作为匿名用户访问的目录  \r\n```bash\r\nanonymous_enable=YES 　　　　      #	#是否允许匿名访问  \r\nanon_upload_enable=NO   　　　　   #上传  \r\nanon_mkdir_write_enable=NO  　　  #创建  \r\nanon_other_write_enable=NO        #删除  \r\nanon_root=/var/ftp 　　　　　　　　 #匿名访问目录  \r\nlocal_root=/home/vsftp            #本地用户访问目录  \r\nlocal_enable=YES      　　　　    # 允许使用本地帐户进行FTP用户登录验证  \r\n```\r\n### 4、针对本地用户的配置\r\n1）创建一个系统本地用户，并使其不能登录  \r\n```bash\r\n#创建用户 \r\n[root@client /]# useradd -s /sbin/nologin ftpuser  \r\n#设置密码\r\n[root@client /]# passwd ftpuser       \r\n#在根目录下创建目录public，用来共享\r\n[root@client /]# mkdir /public       \r\n```\r\n2）更改配置文件\r\n这里我们使用/public 目录作为本地用户访问的共享目录  \r\n\r\n```bash\r\nlocal_enable=YES      #是否允许使用本地帐户登录 \r\nlocal_root=/public    #本地用户访问目录  \r\nlocal_umask=022   　　#设置本地用户默认文件掩码022　　　\r\nchroot_local_user=YES #可以将用户锁定在共享目录中　　　　\r\n```\r\n\r\n### 5、重启ftp服务，便可以访问ftp服务器了\r\n\r\n##### 使用本地用户登录 [ftp://user:password@192.168.13.128](ftp://user:password@192.168.13.128) #在浏览器中使用本地用户登录\r\n\r\n![](https://ws1.sinaimg.cn/large/006h9k0Tly1fwkmoued00j30g503uq37.jpg)\r\n\r\n\r\n##### 使用匿名用户登录  [ftp://192.168.13.128](ftp://192.168.13.128) #匿名用户访问，直接访问地址即可\r\n\r\n![](https://ws1.sinaimg.cn/large/006h9k0Tly1fwkmqdxf3hj30g803zaac.jpg)','2018-01-27 07:40:00','2018-05-01 03:34:00','',104,1,4),(9,'linux中使用touch修改文件的时间','liunx中使用touch命令更改文件的时间\r\n------------------------\r\n\r\n 1. 首先介绍下Linux系统中文件的三个时间\r\n\r\n		1）modification time (mtime,修改时间)：这个时间指的是文件内容修改的时间，而不是文件属性的修改，当数据内容修改时，这个时间就会改变，用命令ls -l默认显示的就是这个时间。\r\n		    \r\n		2）status time （ctime,状态时间）：当一个文件的状态改变时，这个时间就会改变，例如更改了文件的权限与属性等，它就会改变。\r\n		\r\n		3）access time （atime,访问时间）：当读取文件内容时，就会更改这个时间，例如使用cat 去读取/etc/man.config,那么该文件的atime就会改变。\r\n\r\n 2. touch的用法为：\r\n\r\n	     touch [-actmd] 文件\r\n	\r\n	     参数：\r\n	\r\n	     -a:仅修改access time\r\n	\r\n	     -c:仅修改时间而不建立文件\r\n	\r\n	     -t:后面可以接时间，格式为：[[CC]YY]MMDDhhmm [.SS]\r\n				     *该参数修改的是访问时间和修改时间*\r\n\r\n				CC - 年份的前两位 \r\n				YY - 年份的后两位 \r\n				MM - 月份 [01-12]\r\n				DD - 日期 [01-31]\r\n				hh - 时 [00-23]\r\n				mm - 分 [00-59]\r\n				SS - 秒 [00-61]\r\n\r\n	\r\n	     -m:仅修改mtime\r\n	\r\n	     -d:后面可以接日期，也可以使用--date=\"日期或时间\"','2017-04-20 19:04:11','2018-05-01 03:35:58','',61,1,4),(10,'Linux bash shell （一）','---\r\n\r\ndate: 2016-12-20 15:50:23\r\ntitle: Linux bash shell 基础知识\r\ntags: Linux\r\ncategories: linux\r\n\r\n---\r\n\r\n**一、Shell基础知识**\r\n Shell是一个命令行解释器，它为用户提供了一个面向Linux内核发送请求以便运行程序的界面系统级程序，用户可以用Shell来启动、挂起、停止甚至是编写一些程序； \r\n  Shell还是一个功能相当强大的编程语言，易编写，易调试，灵活性较强，Shell是解释执行的脚本语言，在Shell中可以直接调用Linux系统命令\r\n\r\necho [选项] [输出内容] # 输出命令 # -e 支持反斜线控制的字符转换\r\n第一个脚本 \r\n```\r\n#vi hello.sh\r\n#!/bin/bash\r\n#  The first program\r\necho -e \"\\e[1; 34m hello world. \\e[0m\"  #打印带颜色的内容   \r\n```\r\n执行脚本 \r\na. 赋予执行权限，直接运行\r\n\r\n```\r\nchmod 755 hello.sh\r\n./hello.sh\r\n```\r\n\r\nb. 通过Bash调用执行脚本\r\n\r\n```\r\nbash hello.sh\r\n```\r\n\r\n二、Bash的基本功能\r\n\r\n```\r\n命令别名与快捷键 \r\n临时添加或删除别名 \r\ni. alias #查看系统中所有所有的命令别名 \r\nii. alias 别名=‘原命令’ #设定命令别名 \r\niii. unalias 别名 #删除别名\r\n别名永久生效 \r\ni. vi ~/.bashrc #写入环境变量配置文件，重启后生效 \r\nii. source .bashrc #重新加载配置文件后，立即生效\r\n常用快捷键 \r\ni. ctrl+c 强制终止当前命令 \r\nii. ctrl+l 清屏 （等同于clear） \r\niii. ctrl+a 光标移动到命令行首 \r\niv. ctrl+e 光标移动到命令行尾 \r\nv. ctrl+u 从光标所在位置删除到行首 \r\nvi. ctrl+z 把命令放入后台 \r\nvii. ctrl+r 在历史命令中搜索\r\n历史命令：history [选项] [历史命令保存文件] \r\n-c 清空历史命令 \r\n-w 把缓存中的历史命令写入历史命令保存文件 ~/.bash_history \r\n历史命令的调用： \r\n● 使用上、下箭头调用以前的历史命令 \r\n● 使用“!n”重复执行第n条历史命令 \r\n● 使用”!!”重复执行上一条命令 \r\n● 使用”!字串”重复执行最后一条以该字串开头的命令\r\n输出重定向\r\n\r\n标准输出重定向： \r\ni. 命令 > 文件 #以覆盖的方式，把命令的正确输出输出到指定的文件或设备当中 \r\nii. 命令 >> 文件 #以追加的方式，把命令的正确输出输出到指定的文件或设备当中\r\n标准错误输出重定向： \r\ni. 错误命令 2>文件 #以覆盖的方式，把命令的错误输出输出到指定的文件或设备当中 \r\nii. 错误命令 2 >>文件 #以追加的方式，把命令的错误输出输出到指定的文件或设备当中\r\n正确输出和错误输出同时保存 \r\ni. 命令 > 文件 2 >&1 #以覆盖的方式，把正确输出和错误输出都保存在同一个文件当中 \r\nii. 命令 >> 文件 2 >&1 #以追加的方式，把正确输出和错误输出都保存在同一个文件当中 \r\niii. 命令 &>文件 #以覆盖的方式，把正确输出和错误输出都保存在同一个文件当中 \r\niv. 命令 &>>文件 #以追加的方式，把正确输出和错误输出都保存在同一个文件当中 \r\nv. 命令 >>文件1 2 >>文件2 #以追加的方式，把正确输出追加到文件1中，把错误的输出追加到文件2中\r\n输入重定向：wc [选项] [文件名] \r\n-c 统计字节数 \r\n-w 统计单词数 \r\n-l 统计行数 \r\nwc 直接输入内容，ctrl+d退出\r\n```\r\n\r\n多命令执行 \r\n\r\n```\r\na. ； 命令1;命令2 #多命令顺序执行，命令之间没有任何逻辑联系 \r\nb. && 命令1&&命令2 #逻辑与，只有当命令1正确执行，命令2才会执行 \r\nc. || 命令1||命令2 #逻辑或，只有当命令1执行不正确，命令2才会执行 \r\nd. 管道符： 命令1 | 命令2 #命令1的正确输出作为命令2的操作对象，例： \r\ni. ls -lh /etc | more 分屏显示ls查询的结果 \r\nii. netstat -an | grep ESTABLISHED | wc -l #查询有多少个网络与服务器建立了连接\r\n通配符 \r\na. ？ 匹配一个任意字符 \r\nb. * 匹配0个或任意多个任意字符，也就是可以匹配任何内容 \r\nc. [] 匹配中括号中任意一个字符。例如：[abc]代表一定匹配一个字符，或者是a,或者是b，或者是c。 \r\nd. [-] 匹配括号中任意一个字符，-代表一个范围。例如：[a-z]代表匹配一个小写字母 \r\ne. [^] 逻辑非，表示匹配不是中括号内的一个字符。例如：[^0-9]代表匹配一个不是数字的字符\r\n其它特殊符号 \r\na. ‘ 单引号。在单引号中所有的特殊符号，如“$” 和”`”（反引号）都没有特殊含义 \r\nb. “” 双引号。在双引号中特殊符号都没有特殊含义，但是“$”、”`”、和”\\”是例外，拥有”调用变量的值“、”引用命令“和”转义符“的特殊含义。 \r\nc. “ 反引号。反引号括起来的内容是系统命令，在Bash中会先执行它。和$()作用一样，不过推荐使用$(),因为反引号非常容易看错 \r\nd. $() 和反引号的作用一样，用来引用系统命令 \r\ne. # 在Shell脚本中，#开头的行代表注释 \r\nf. $ 用于调用变量的值，如需要调用变量name的值时，需要用$name的方式得到变量的值 \r\ng. \\ 转义符，跟在\\之后的特殊符号将失去特殊含义，变为普通字符。如$将输出”$“符号，而不是当作是变量引用。\r\n```','2016-12-20 15:50:23','2018-05-01 03:37:36','',63,1,4),(11,'python中的可变对象和不可变对象','python中可变对象和不可变对象的理解\r\n\r\n在python中字符串，元组，数字，都是不可修改的对象。\r\n可变的对象有：列表，字典，\r\n\r\n在理解python数据类型不可变的时候有点理解不深，特写此文，来提醒自己\r\n\r\npython中字符串是不可变的对象，可以理解为：如果修改了字符串以及不可变的对象，则会开辟新的内存空间，id()是最好的证明：\r\n\r\n1.不可变对象（这里以字符串为例）\r\n---------------\r\n\r\n字符串是没有修改的方法的，如果说一定有，那么肯定会有赋值的过程，例如：\r\n\r\n    In [10]: sr = \'hello world\'\r\n    \r\n    In [11]: sr\r\n    Out[11]: \'hello world\'\r\n    \r\n    In [12]: sr + \'HELO\'\r\n    Out[12]: \'hello worldHELO\'\r\n    \r\n    In [13]: sr\r\n    Out[13]: \'hello world\'\r\n    \r\n字符串拼接的方法并没有更改原来的字符串。他是产生了一个新的字符串。\r\n再看：replace方法\r\n\r\n    In [14]: sr\r\n    Out[14]: \'hello world\'\r\n    \r\n    In [15]: sr.replace(\'h\',\'H\')\r\n    Out[15]: \'Hello world\'\r\n    \r\n    In [16]: sr\r\n    Out[16]: \'hello world\'\r\n\r\n这个例子同样也是产生新的字符串，字符串sr本身并没有发生改变。\r\n\r\n再看下面这个例子：\r\n\r\n    In [17]: sr += \'HHH\'\r\n    \r\n    In [18]: sr\r\n    Out[18]: \'hello worldHHH\'\r\n这里尽管说字符串sr发生了改变，我们来看看他的id，\r\n\r\n    In [26]: sr = \'hello world\'\r\n    \r\n    In [27]: sr\r\n    Out[27]: \'hello world\'\r\n    \r\n    In [28]: id(sr)\r\n    Out[28]: 117969520L     #对比此处的id\r\n    \r\n    In [29]: sr += \'HHH\'\r\n    \r\n    In [30]: sr\r\n    Out[30]: \'hello worldHHH\'\r\n    \r\n    In [31]: id(sr)\r\n    Out[31]: 117970768L     #id发生了变化\r\n\r\n2.可变对象（这里以列表为例）\r\n---------------\r\n\r\n    In [32]: li = [1,2,3,\'hello\',\'world\']\r\n    \r\n    In [33]: li\r\n    Out[33]: [1, 2, 3, \'hello\', \'world\']\r\n    \r\n    In [34]: id(li)\r\n    Out[34]: 120335944L         #######\r\n    \r\n    In [35]: li.append(\'HHHHH\')\r\n    \r\n    In [36]: li\r\n    Out[36]: [1, 2, 3, \'hello\', \'world\', \'HHHHH\']\r\n    \r\n    In [37]: id(li)\r\n    Out[37]: 120335944L         #######\r\n    \r\n    In [38]: li += \'11111\'\r\n    \r\n    In [39]: li\r\n    Out[39]: [1, 2, 3, \'hello\', \'world\', \'HHHHH\', \'1\', \'1\', \'1\', \'1\', \'1\']\r\n    \r\n    In [40]: id(li)\r\n    Out[40]: 120335944L         #######\r\n这里列表无论怎么操作，都不会改变他的id。','2017-05-20 18:34:12','2018-05-01 03:39:05','',50,1,6),(12,'Python和微信之获取好友昵称并制作wordcloud','最近看到网上有人用Python获取微信的一些信息，感觉挺有意思，对于我一个Python刚入门的人来说，正需要一些代码片段来激起我的兴趣，所以自己也写了一些，废话不多说，直接上代码！！！\r\n\r\n```\r\n\r\ncoding:utf-8\r\n微信好友昵称WordCloud\r\nimport itchat\r\nimport re\r\nimport os\r\nimport matplotlib.pyplot as plt\r\nfrom wordcloud import WordCloud, ImageColorGenerator\r\nimport numpy as np\r\nimport PIL.Image as Image\r\nimport jieba\r\nimport time\r\n#以上是我用到的一些库，这些根据个人不同需要安装某些库\r\n\r\n#运行到此处会自动生成一个二维码，打开手机微信，扫一扫即可登录\r\nitchat.login()	\r\nfriends = itchat.get_friends(update=True)[0:]\r\ntList = []\r\n\r\n\r\nfor i in friends:\r\n	#用正则表达式过滤掉 span ，class，emoji。NickName表示微信好友的昵称；\r\n	signature = i[\"\"NickName\"\"].strip().replace(\"\"span\"\",\"\"\"\").replace(\"\"class\"\",\"\"\"\").replace(\"\"emoji\"\",\"\"\"\")\r\n	rep = re.compile(\"\"1f\\d.+\"\")\r\n	signature = rep.sub(\"\"\"\",signature)\r\n	print signature\r\n	tList.append(signature)\r\n\r\n\r\n#拼接字符串\r\ntext = \"\"\"\".join(tList)\r\n\r\n#jieba分词\r\nwordlist_jieba = jieba.cut(text,cut_all=True)\r\nwl_space_split = \"\" \"\".join(wordlist_jieba)\r\n\r\n#wordcloud\r\nd = os.path.dirname(__file__)\r\nalice_coloring = np.array(Image.open(os.path.join(d,\"\"hot.png\"\")))	#设置一个背景图片，文章中会附上\r\nmy_wordcloud = WordCloud(background_color=\"\"white\"\",max_words=2000,mask=alice_coloring,max_font_size=37, random_state=42,\r\nfont_path=\"\"./handan.ttf\"\").generate(wl_space_split)	\r\n#此处使用的字体一定是支持中文的字体，当然，如果你确定你好友的昵称都是英文，那么请忽略，字体的路径可以是相对路径，也可以是你的系统字体\r\n\r\nimage_colors = ImageColorGenerator(alice_coloring)\r\nplt.imshow(my_wordcloud.recolor(color_func=image_colors))\r\nplt.imshow(my_wordcloud)\r\nplt.axis(\"\"off\"\")\r\nplt.show()\r\ntime.sleep(3)\r\nplt.close()	#图片关闭后将图片发送至手机,保存图片，并发送至手机\r\nmy_wordcloud.to_file(os.path.join(d, \"\"wechat_cloud.png\"\"))\r\nitchat.send_image(\"\"wechat_cloud.png\"\", \'filehelper\')\r\n```\r\n至此，打开你的手机，进入到文件传输助手，你会收到一张图片，这就是使用微信好友昵称制作的词云，下面附上一张我本人的\r\n![这里写图片描述](http://img.blog.csdn.net/20170721154128645?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\r\n![这里写图片描述](http://img.blog.csdn.net/20170721154156691?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMzU2MjYyNQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)','2017-07-01 21:55:22','2018-05-01 03:41:27','',65,1,6),(13,'vim 常用命令以及快捷键','今天整理了一个Linux中编辑文件的神器（vim）的一个快捷键以及操作命令。\r\n\r\n**快捷方式**\r\n\r\n```\r\nCtrl+\r\n    a //将光标移至命令行的开始位置；\r\n    e   //将光标移至命令行的末尾；\r\n    u //删除光标前的命令；\r\n    k //删除光标后的命令；\r\n    左箭头/右箭头 //以一个词为单位移动光标；\r\n    c //终止当前命令；\r\n    d //退出\r\n    l（clear） //清空当前页面；\r\n```\r\n\r\n \r\n**vim快捷键**\r\n*命令模式：*\r\n```\r\ndd     删除光标所在行\r\ndw     删除一个字(word)\r\nx     删除当前字符\r\nX     删除前一个字符\r\nD     删除到行末\r\nyy     复制一行，此命令前可跟数字，标识复制多行，如6yy，表示从当前行开始复制6行\r\nyw     复制一个字\r\ny$     复制到行末\r\np     粘贴粘贴板的内容到当前行的下面\r\nP     粘贴粘贴板的内容到当前行的上面\r\n]p     有缩进的粘贴，vim会自动调节代码的缩进\r\n\"\"a     将内容放入/存入a寄存器，可以支持多粘贴板\r\n```\r\n\r\n \r\n**移动光标**\r\n*在vim中移动光标跟其他的编辑器中有很大的区别，不过一旦学会了，就会飞速的在文本中移动了。* \r\n\r\n```\r\nh,j,k,l   上，下，左，右 \r\nctrl-f   上翻一页 \r\nctrl-b 下翻一页 \r\n% 跳到与当前括号匹配的括号处，如当前在{，则跳转到与之匹配的}处\r\nw 跳到下一个字首，按标点或单词分割 \r\nW 跳到下一个字首，长跳，如end-of-line被认为是一个字 e 跳到下一个字尾\r\nE 跳到下一个字尾，长跳 \r\nb 跳到上一个字 \r\nB 跳到上一个字，长跳 \r\n0 跳至行首，不管有无缩进，就是跳到第0个字符 \r\n^ 跳至行首的第一个字符 \r\n$ 跳至行尾 \r\ngg    跳至文件的第一行 \r\ngd    跳至当前光标所在的变量的声明处\r\n[N]G  跳到第N行，如0G，就等价于gg，100G就是第100行 \r\nfx  在当前行中找x字符，找到了就跳转至\r\n;   重复上一个f命令，而不用重复的输入\r\nfx tx  与fx类似，但是只是跳转到x的前一个字符处 Fx 跟fx的方向相反\r\n),(   跳转到上/下一个语句 * 查找光标所在处的单词，向下查找\r\n#     查找光标所在处的单词，向上查找 \r\n`.    跳转至上次编辑位置\r\nr    替换一个字符\r\nJ      将下一行和当前行连接为一行\r\nxp     交换当前字符和下一个字符\r\nu      撤销\r\nctrl+r     重做\r\n.       重复上一个编辑命令\r\n~     切换大小写，当前字符\r\ng~iw     切换当前字的大小写\r\ngUiw     将当前字变成大写\r\nguiw     将当前字变成小写\r\n>>     将当前行右移一个单位\r\n<<     将当前行左移一个单位(一个tab符)\r\n==     自动缩进当前行\r\nZZ 保存退出；\r\nZQ 不保存退出；\r\n```\r\n\r\n**插入模式**\r\n\r\n```\r\ni     从当前光标处进入插入模式\r\nI     进入插入模式，并置光标于行首\r\na     追加模式，置光标于当前光标之后\r\nA     追加模式，置光标于行末\r\no     在当前行之下新加一行，并进入插入模式\r\nO     在当前行之上新加一行，并进入插入模式\r\ncc     删除当前行并进入编辑模式\r\ncw     删除当前字，并进入编辑模式\r\nc$     擦除从当前位置至行末的内容，并进入编辑模式\r\ns     删除当前字符并进入编辑模式\r\nS     删除光标所在行并进入编辑模式\r\nEsc     退出插入模式\r\n```\r\n**末行模式**\r\n\r\n```\r\nshift+：  //进入末行模式；\r\nw //保存；\r\nq //不保存退出； \r\n wq！ //强制保存退出；\r\n！ //强制；\r\nn //查找下一个； \r\nN //查找上一个； \r\n1,5s/cat/dog/[g] //用dog替换1-5行首次出现[所有]的cat； \r\n%s/cat/dog/g[/i] //用cat替换所有行首次出现[所有]的dog；\r\nset nu  //带行号查看；\r\nset nonu  //取消带行号查看；\r\n```','2016-12-12 16:59:00','2018-05-01 03:46:00','',65,1,4),(14,'django文件上传','通过django的admin后台上传文件\r\n\r\n\r\n	setting.py文件中配置文件上传的路径：\r\n		MEDIA_ROOT=os.path.join(BASE_DIR,\'media\')           #项目的根路径下的media文件夹\r\n		MEDIA_URL=\'/media/\'\r\n		\r\n		\r\n	models.py文件中，配置数据库的字段类型为图片\r\n		class TestData(models.Model):\r\n			name=models.CharField(max_length=200)\r\n			#upload表示上传的路径，此目录是在media目录的下一级目录\r\n			image=models.ImageField(upload_to=\"upload/\",default=\'media/shipin4.jpg\')\r\n		\r\n	配置以上两项后，可在django后台管理页面上传图片，（上传文件则改为FileField）\r\n\r\n\r\n通过前端页面上传文件\r\n\r\n	**以上不变\r\n\r\n\r\n	在models.py文件中创建form表单，models.py中添加以下内容：\r\n		class UploadFileForm(ModelForm):\r\n			class Meta:\r\n				model=TestData       #TestData为数据库中的一个表名\r\n				fields=[\'name\',\'file\']        #只使用上传文件的表单，若需要上传图片，添加image即可\r\n		\r\n	视图文件：\r\n		from django.shortcuts import render,HttpResponse\r\n		\r\n		from .models import TestData\r\n		from .models import UploadFileForm\r\n		\r\n		def upload_file(request):\r\n			if request.method==\'POST\':\r\n				form=UploadFileForm(request.POST,request.FILES)\r\n				if form.is_valid():#表单数据如果合法\r\n				upload_from=TestData()\r\n				upload_from.name=form.cleaned_data[\'name\']\r\n				upload_from.file=form.cleaned_data[\'file\']\r\n				upload_from.save()#处理上传来的文件\r\n				return HttpResponse(\'文件上传成功！\')\r\n			elif request.method==\'GET\':\r\n				form=UploadFileForm()\r\n				return render(request,\'uploadFiles.html\',{\'form\':form})\r\n		\r\n	模板文件：\r\n		<form method=\"post\" enctype=\"multipart/form-data\".>\r\n		{%csrf_token%}\r\n		{{form}}\r\n		<input type=\"submit\" value=\"submit\"/>\r\n		</form>\r\n		\r\n		只有当request方法是POST，且发送request的<form>有属性enctype=\"multipart/form-data\"时，request.FILES中才包含文件数据，否则request.FILES为空。\r\n	\r\n	\r\n	\r\n前端页面读取图片\r\n\r\n\r\n	urls.py文件中：\r\n		from django.conf.urls.static import static\r\n		from django.conf import settings\r\n		\r\n		urlpatterns=[\r\n			#此处省略n行。。。\r\n			]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)\r\n\r\n\r\n	在模板中直接使用 MEDIA_URL 变量.\r\n		<imgsrc=\"{{MEDIA_URL}}{{data.image}}\">\r\n		#data为读取数据库获得的对象\r\n	\r\n\r\n	访问页面时，图片的路径为：src=\"/media/upload/timg.jpg\"\r\n	\r\n	setting文件\r\n		TEMPLATES=[\r\n			{\r\n				\'BACKEND\':\'django.template.backends.django.DjangoTemplates\',\r\n				#\'DIRS\':[],\r\n				\'DIRS\':[BASE_DIR+\"/templates\",],\r\n				\'APP_DIRS\':True,\r\n				\'OPTIONS\':{\r\n					\'context_processors\':[\r\n						#省略n行\r\n						\'django.template.context_processors.media\',#添加一个上下文环境,这个会自动的把MEDIA_URL注册到前端的模板中\r\n					],\r\n				},\r\n			},\r\n		]','2018-09-23 03:38:00','2018-09-23 03:38:00','',118,1,6),(15,'centos7部署kickstart','## 1、安装必要的软件\r\n\r\nxinetd  --tftpd的守护进程\r\n\r\ntftp  ---用于共享开机引导文件，（一般系统中自带）\r\n\r\nnfs  ---用于共享系统资源\r\n\r\nsyslinux  ---生成pxelinux.0文件\r\n\r\ndhcpd  ----自动分配ip\r\n\r\n## 2、几个必要的目录\r\n\r\n**tftpboot** ---一般为tftp的默认路径 /var/lib/tftpboot\r\n\r\n此路径存放用于引导的文件：initrd.img  pxelinux.0  vmlinuz  pxelinux.cfg\r\n\r\n**/centos**  ----此目录名称可以随意，只用于nfs共享iso镜像\r\n\r\n可以直接将iso镜像挂载至此\r\n\r\n    mount /dev/sr0 /centos\r\n\r\n**/ksdir**  ----用来放置ks.cfg文件\r\n\r\n*这两个目录都需要共享出去，nfs共享的配置为：\r\n\r\n    #cat /etc/exports\r\n    \r\n    /centos *(ro,sync)\r\n    \r\n    /ksdir *(ro,sync)\r\n\r\n## 3、几个必要的文件\r\n\r\n**ks.cfg** ----此文件是Linux系统自动安装的脚本文件，可以通过图形化工具kickstart来生成，此文件必须让开机时可以找到\r\n\r\n安装图形化工具：  \r\n**yum -y install system-config-kickstart**\r\n#### pxelinux.0  ----\r\n\r\n    yum install -y syslinux\r\n    rpm -qa | grep syslinux\r\n    rpm -ql syslinux | grep \"\"pxelinux.0\"\"\r\n    cp /usr/share/syslinux/pxelinux.0 /var/lib/tftpboot\r\n    pxelinux.cfg/default  ----此文件是iso镜像文件中/centos/isolinux/isolinux.cfg文件\r\n    mkdir /var/lib/tftpboot/pxelinux.cfg && cp /mnt/isolinux/isolinux.cfg /tftpboot/pxelinux.cfg/default\r\n\r\n **vmlinuz**\r\n**initrd.img**  ----这两个文件在iso镜像中可以找到，\r\n\r\n    cp /centos/images/pxeboot/{vmlinuz,initrd.img} /var/lib/tftpboot\r\n\r\n**最后，/var/lib/tftpboot 目录下的文件结构为：**\r\n\r\n    [root@localhost tftpboot]# tree\r\n    .\r\n    ├── initrd.img\r\n    ├── pxelinux.0\r\n    ├── pxelinux.cfg\r\n    │  └── default\r\n    └── vmlinuz\r\n\r\n***default文件内容大致包含以下内容：***\r\n\r\n    display boot.msg\r\n    menu background splash.png\r\n    menu title Welcome to CentOS 7.3 x86_64!\r\n    default linux\r\n    label linux\r\n    menu label ^Install CentOS Linux 7 x86_64\r\n\r\n**menu default** #注意，这里设置默认启动***（貌似在centos7中不起作用，所以在上方添加了 default linux）\r\n\r\n**kernel vmlinuz**  # 指定要启动的内核。同样要注意路径，默认是/tftpboot目录。\r\n\r\n**append initrd=initrd.img ks=nfs://192.168.92.128/centos/ks.cfg**  # 指定追加给内核的参数，initrd.img是一个最小的linux系统\r\n\r\nks文件中可以使用不同的文件共享服务器来进行配置，详细参考以下地址：\r\n\r\n[https://access.redhat.com/documentation/zh-cn/red_hat_enterprise_linux/6/html/installation_guide/sn-automating-installation](https://access.redhat.com/documentation/zh-cn/red_hat_enterprise_linux/6/html/installation_guide/sn-automating-installation)\r\n\r\nks文件：','2018-11-02 04:05:00','2018-11-02 04:05:00','',119,1,4),(16,'Linux计划任务（一）之一次性计划任务 at','- 计划任务\r\n	* 1. 什么是计划任务\r\n	* 2. 为什么要使用计划任务\r\n	* 3. 一次性计划任务和永久性计划任务\r\n\r\n### 1、计划任务  \r\n举个简单的例子：\r\n	闹钟，都用过把。例如在每天早上的七点半播放一段音乐来叫醒你。我们就可以把闹钟看成一个计划任务，在每天的七点半执行一个任务。这个任务是我们在事先设定好了的，让他在指定的时间执行某个任务，像这种为未来的某个时间制定一个任务的形式，我们就可以称之为计划任务。  \r\n	\r\n### 2、为什么要使用计划任务     \r\n可以在指定的时间执行想要执行的任务，例如在深夜重启机器，而我们人又不想在深夜守着机器，这个时候就可以利用计划任务，在深夜某个时间点执行重启任务。  \r\n\r\n### 3、两种计划任务  \r\n计划任务分为两类，一类是一次性的，只能执行一次。还有一种是可以执行多次的，我们叫他永久性的计划任务。  \r\n\r\n##### 1）一次性计划任务\r\n***一次性计划任务的服务名称***：atd\r\n创建一次性计划任务前，要保证此服务是运行的状态：\r\n\r\n    systemclt start atd			#启动服务\r\n    systemctl enable atd		#将此服务设置为开机启动\r\n    systemctl status atd		#查看此服务的状态，确定是启动的状态\r\n\r\n***创建一次性计划任务，使用命令*** `at`\r\n\r\n	[root@www Desktop]# date	#查看当前时间\r\n	Mon Nov  5 16:48:44 CST 2018	\r\n	[root@www Desktop]# at 16:50	#创建一个计划任务在两分钟后\r\n	at> echo hello world > output.txt	#计划任务的内容，将hell world 写入output.txt文件\r\n	at> <EOT>		#按ctrl+d结束输入\r\n	job 4 at Mon Nov  5 16:50:00 2018		#提示创建了一个计划任务\r\n	\r\n	两分钟后。。。 \r\n	\r\n	[root@www Desktop]# ll \r\n	total 4\r\n	-rw-r--r--. 1 root root 12 Nov  5 16:50 output.txt\r\n	[root@www Desktop]# \r\n	[root@www Desktop]# \r\n	[root@www Desktop]# cat output.txt \r\n	hello world\r\n\r\n\r\nat命令的用法：\r\n**-l 选项**：	可以查看系统中所有用户的计划任务\r\n\r\n    [root@www Desktop]# at -l\r\n    5	Mon Nov  5 17:00:00 2018 a root\r\n    \r\n    5：任务号\r\n    Mon Nov  5 17:00:00 2018 ： 该任务执行的时间\r\n    root ： 执行改任务的身份\r\n\r\n**-d  选项**： 删除某个计划任务\r\n\r\n    [root@www Desktop]# at -d 5		#删除任务号为5的任务\r\n    [root@www Desktop]# \r\n    [root@www Desktop]# at -l		#在查看一次，可以发现刚才的计划任务已经没有了\r\n    [root@www Desktop]# \r\n\r\n\r\n### at 指定时间的方法有很多\r\n-----------\r\n```\r\n> 1）hh:mm小时:分钟(当天，如果时间已过，则在第二天执行)\r\n> 2）midnight(深夜),noon(中午),teatime(下午茶时间，下午4点),today,tomorrow等\r\n> 3）12小时计时制，时间后加am(上午)或pm(下午) \r\n> 4）指定具体执行日期mm/dd/yy(月/日/年)或dd.mm.yy(日.月.年)\r\n> 5）相对计时法now + n units，now是现在时刻，n为数字，units是单位(minutes、hours、days、weeks)\r\n```\r\n例如：设置一个 明天下午2：20 的计划任务\r\n\r\n    [root@www Desktop]# at 02:20pm tomorrow\r\n    at> touch hello.py\r\n    at> <EOT>\r\n    job 6 at Tue Nov  6 14:20:00 2018\r\n\r\n可以使用 -f 选项或管道符来从文件中获取任务\r\n例如：\r\n\r\n	#创建一个11月19日的计划任务\r\n    [root@www Desktop]# echo \'touch hello.txt\'  > test_at.txt\r\n    [root@www Desktop]# cat test_at.txt | at 18:20 11/19/18\r\n    job 7 at Mon Nov 19 18:20:00 2018\r\n    \r\n    #创建一个两天后的计划任务\r\n    [root@www Desktop]# at -f test_at.txt 18:30 +2 days\r\n    job 8 at Wed Nov  7 18:30:00 2018','2018-11-05 09:35:00','2018-11-05 09:35:00','',145,1,4),(17,'redhat7中安装python3','## Redhat7安装python3\r\n1. 安装编译环境\r\n		首先要保证yum仓库好使！！ ！\r\n		关于yum仓库的配置，请移步我的[另一篇博文](http://www.fanming.shop/post/18/)\r\n```bash\r\n[root@host ~]#yum install gcc  \r\n```\r\n2. 下载源码包，并解压  \r\n```bash\r\n[root@host ~]# wget --no-check-certificate https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz  \r\n```\r\n<table><tr><td bgcolor=orange>在这里如果报错: \"\"-bash: wget: command not found\"\"	 没有此错误请忽略	<br>\r\n请先使用yum安装wget： yum install wget	<br>\r\n然后在执行上述命令\r\n</td></tr></table>\r\n\r\n```bash\r\n[root@host ~]# tar -xzvf Python-3.6.0.tgz  \r\n[root@host ~]# cd Python-3.6.0  \r\n```\r\n3. 执行安装配置，指定安装路径  \r\n```bash\r\n[root@host Python-3.6.0]# ./configure --prefix=/usr/local/python3 \r\n```\r\n5. build和安装  \r\n```bash\r\n[root@host Python-3.6.0]# make  \r\n[root@host Python-3.6.0]# make install\r\n```\r\n\r\n<table><tr><td bgcolor=orange>在这里遇到一个错误，报错如下：<br>\r\nzipimport.ZipImportError: can\'t decompress data; zlib not available   <br>\r\n解决方法：\r\nyum install zlib*  <br>\r\n然后在次执行 make install	</td></tr></table>\r\n\r\n6. 安装后建立一个链接，这样我们可以用python3直接运行程序，和python2区别开来。\r\n```bash\r\n[root@host Python-3.6.0]# ln -s /usr/local/python3/bin/python3 /usr/bin/python3\r\n```\r\n\r\n***特别提醒：建议不要将python3设置为系统中默认的python，设置后，yum仓库可能出问题。。。***\r\n\r\n## 安装pip\r\n\r\n1. 下载并解压\r\n```bash\r\n[root@host ~]# wget --no-check-certificate https://github.com/pypa/pip/archive/9.0.1.tar.gz  \r\n[root@host ~]# tar -zvxf 9.0.1 -C pip-9.0.1    # 解压文件  \r\n[root@host ~]# cd pip-9.0.1  \r\n```\r\n2. 使用 Python 3 安装\r\n```bash\r\n[root@host pip-9.0.1]# python3 setup.py install \r\n```\r\n3.  将pip变成全局命令\r\n```bash\r\n[root@host ~]# ln -s /usr/local/python3/bin/pip /usr/bin/pip3\r\n接下来，你就可以使用pip3来安装python3的第三方库了。。。\r\n```','2017-12-22 10:49:00','2018-11-07 10:49:00','',128,1,6),(18,'redhat7配置本地yum仓库','此教程环境为：Redhat7.3系统，使用VMware虚拟机14  \r\n\r\n### 1、第一步，加载iso镜像到VMware虚拟机上  \r\n1）为虚拟机指定一个ISO磁盘镜像文件  \r\n![](https://ws1.sinaimg.cn/large/006h9k0Tly1fwzqcg0kpoj30ye0pajtj.jpg){:height=\"\"300px\"\" width=\"\"500px\"\"}\r\n\r\n2）然后，查看右下角的磁盘图标有没有亮，如果没有亮（亮的状态为右下角有绿色的小点），则右击磁盘图标---->连接  \r\n![](https://ws1.sinaimg.cn/large/006h9k0Tly1fwzqte5atbj308702k0so.jpg)\r\n\r\n至此，镜像已经加载到虚拟机中了，相当于将光盘插入了光驱\r\n\r\n### 2、将光盘挂在到系统中\r\n```bash\r\n*刚刚加载的光盘镜像在系统中被识别为/dev/sr0，若要使用此光盘中的文件，一定要挂在才可以。*\r\n\r\n[root@www ~]# mount /dev/sr0 /mnt\r\nmount: /dev/sr0 is write-protected, mounting read-only\r\n```\r\n\r\n### 3、编辑配置文件，yum仓库的配置文件\r\n```bash\r\n[root@www ~]# cd /etc/yum.repos.d/	#yum仓库配置文件所在的目录  \r\n```\r\n   **此目录在Redhat7中默认为空。然后创建一个新的文件，文件名随意，但一定要以 .repo 结尾**\r\n```bash\r\n[root@www yum.repos.d]# vim myrepo.repo  \r\n```\r\n    \r\n-----\r\n**文件内容如下：**\r\n```bash\r\n[name]		#仓库的名称\r\nname=myrepo		#此仓库的描述\r\nbaseurl=file:///mnt		#安装包存放的地址，这里使用的本地源，所以指向本地路径，即光盘挂在的路径\r\ngpgcheck=0		#不校验安装包\r\n```\r\n    \r\n**最后测试一下**\r\n```bash\r\n[root@www yum.repos.d]# yum clean all	 清除yum缓存  \r\n[root@www yum.repos.d]# yum makecache 	缓存本地yum源    \r\n[root@www yum.repos.d]# yum list 	测试  \r\n```','2017-04-22 12:12:00','2018-11-07 12:12:00','',73,1,4),(19,'nfs网络文件共享','redhat7中使用nfs 来共享文件\r\n\r\n## NFS概述\r\n\r\nNFS 是Network File System的缩写，即网络文件系统。\r\n\r\n一种使用于分散式文件系统的协定，由Sun公司开发，于1984年向外公布。\r\n\r\n功能是通过网络让不同的机器、不同的操作系统能够彼此分享个别的数据，让应用程序在客户端通过网络访问位于服务器磁盘中的数据，是在类Unix系统间实现磁盘文件共享的一种方法。\r\n\r\nNFS 的基本原则是”容许不同的客户端及服务端通过一组RPC分享相同的文件系统”，它是独立于操作系统，容许不同硬件及操作系统的系统共同进行文件的分享。\r\n\r\nNFS在文件传送或信息传送过程中依赖于RPC协议。\r\n\r\nRPC，远程过程调用 (Remote Procedure Call) 是能使客户端执行其他系统中程序的一种机制。\r\n\r\n\r\n\r\n\r\n## **、在做文件共享之前，需要做一下准备工作\r\n**此实验环境使用的是： \r\nLinux（客户端）-Linux（服务端）Linux系统为Redhat7**  \r\n\r\n- 1）保证客户端机器和服务端机器网络的连通\r\n	服务端使用的ip为  192.168.247.128\r\n	Linux客户端ip为  192.168.247.130\r\n- 2）确保安装了nfs-utils  软件包，（两台机器）\r\n\r\n	    rpm -qa | grep nfs			#查看是否安装过nfs-utils\r\n\r\n	若没有安装，使用yum即可安装：[yum仓库配置方法](http://www.fanming.shop/post/18/)\r\n\r\n	    yum install nfs-utils\r\n	    \r\n\r\n- 3）为了消除防火墙对服务的影响，这里直接关闭防火墙  （两台机器）\r\n\r\n		systemctl stop firewalld\r\n\r\n- 4） 相关命令：  \r\n	**1、exportfs**\r\n\r\n	> 如果我们在启动了NFS之后又修改了/etc/exports，是不是还要重新启动nfs呢？这个时候我们就可以用exportfs 命令来使改动立刻生效，该命令格式如下：\r\n\r\n\r\n		# exportfs [-aruv]  \r\n\r\n		-a     # 全部挂载或卸载 /etc/exports中的内容  \r\n		-r     #重新读取/etc/exports 中的信息 ，并同步更新/etc/exports、/var/lib/nfs/xtab  \r\n		-u     #卸载单一目录（和-a一起使用为卸载所有/etc/exports文件中的目录）  \r\n		-v     #在export的时候，将详细的信息输出到屏幕上。  \r\n\r\n	**2、showmount**\r\n\r\n	> -a 	显示已经于客户端连接上的目录信息    \r\n	-e IP或者hostname  	显示此IP地址分享出来的目录    \r\n	最后注意两点，虽然通过权限设置可以让普通用户访问，但是挂载的时候默认情况下只有root可以去挂载，普通用户可以执行sudo。  \r\n\r\n## 1、Linux（客户端）---Linux（服务端）配置\r\n- ### 1）服务端配置\r\n	- a 、服务按装完成后，直接启动nfs服务：\r\n		\r\n			systemctl start nfs\r\n	- b、创建共享文件夹：\r\n	\r\n			mkdir /public \r\n	- c、创建共享，编辑以下配置文件，此文件默认为空\r\n\r\n		    vim /etc/exports		\r\n		    \r\n		此文件格式如下：		\r\n\r\n		    共享的目录名 （目录必须存在）	共享给哪些用户 （相应权限）\r\n		\r\n	    示例：\r\n		    \r\n		    /public 	* (ro)\r\n		   \r\n\r\n		> 括号中的部分选项\r\n			ro	 只读  \r\n			rw 	只写  \r\n			root_squash 	当NFS客户端以root管理员身份访问时，映射为NFS服务器的匿名用户。  \r\n			no_root_squash 	当NFS客户端以root管理员身份访问时，映射为NFS服务器root管理员。  \r\n			all_squash 	无论NFS客户端使用什么账号访问，均映射为NFS服务器的匿名用户。  \r\n			sync 	同时将数据写入到内存与硬盘当中，保证数据不丢失。  \r\n			async 	先将数据保存到内存，然后再写入磁盘；这样效率更加高，但是可能会丢失数据。  \r\n					\r\n	- d、编辑好此文件后，保存退出。并重启nfs服务\r\n		\r\n			systemctl restart nfs\r\n\r\n	**至此，服务端配置完成**\r\n\r\n- ### 2）Linux客户端配置\r\n	- 查看服务端共享的目录\r\n\r\n			showmount -e 192.168.247.128\r\n			\r\n			执行结果如下：\r\n			[root@example-com /]# showmount -e 192.168.247.128\r\n			Export list for 192.168.247.128:\r\n			/public *\r\n\r\n\r\n	- 挂载共享目录\r\n			\r\n			#先创建挂载点\r\n			mkdir /public_mount\r\n			\r\n			#将服务器共享的目录挂载在本地的/public_mount目录下\r\n			mount -t nfs 192.168.247.128:/public /public_mount/\r\n	 - 测试挂载\r\n		使用df命令查看挂载情况：\r\n		\r\n\r\n		    [root@example-com /]# df -TH\r\n			文件系统                类型      容量  已用  可用 已用% 挂载点\r\n			........\r\n			192.168.247.128:/public nfs4       19G  3.5G   15G   19% /public_mount\r\n\r\n		可以看到public目录已经挂载成功！\r\n		\r\n		***尝试在挂载的目录创建文件***\r\n	\r\n\r\n			[root@example-com public_mount]# touch hello.py\r\n			touch: 无法创建\"\"hello.py\"\": 只读文件系统\r\n\r\n		提示只读文件系统！！！\r\n		因为我们在服务器共享的时候，给的权限为 ro  。（应该记得我说的是哪里把，不记得的话就往上看看）\r\n		解决方法：\r\n		将共享文件时的权限改为rw  \r\n		\r\n		    root@www /]# vim /etc/exports\r\n\r\n		    /public         *(rw)\r\n\r\n		    [root@www /]# exportfs -r 		#刷新exports文件\r\n\r\n		***改完后，再次尝试创建文件***  \r\n		\r\n		    [root@example-com public_mount]# touch hello.py\r\n		    touch: 无法创建\"\"hello.py\"\": 权限不够\r\n\r\n		依然报错，但是错误与上次不同。！！！\r\n		导致这个错误的原因是共享的文件夹对其他人没有写权限。\r\n		查看服务端共享文件夹的权限：  \r\n		\r\n		    [root@www /]# ll -d /public/\r\n		    drwxr-xr-x. 2 root root 6 11月  8 18:43 /public/\r\n		解决方法：\r\n		\r\n		    [root@www /]# chmod o+w /public/\r\n			#再次查看权限\r\n	    	[root@www /]# ll -d /public/\r\n	    	drwxr-xrwx. 2 root root 6 11月  8 18:43 /public/\r\n\r\n		\r\n		**再一次创建文件：**  \r\n		\r\n		    [root@example-com public_mount]# touch hello.py\r\n		    [root@example-com public_mount]# ll\r\n		    总用量 0\r\n		    -rw-r--r--. 1 nfsnobody nfsnobody 0 11月  8 19:04 hello.py\r\n		    [root@example-com public_mount]# \r\n\r\n		创建成功！！！\r\n		至此，即可以在客户端操作共享文件夹里面的内容了','2018-11-08 11:21:00','2018-11-08 11:21:00','',130,1,4),(20,'Redhat7中配置网络','在Redhat7系列系统中配置网络，此教程适用于cento7。此实验环境使用VMware虚拟机安装的Redhat7.\r\n\r\n\r\n\r\n由于使用的时VMware虚拟机，我们直接使用虚拟机的默认设置：  \r\n![](https://ws1.sinaimg.cn/large/006h9k0Tly1fx21obxaljj30a30ckmxj.jpg)\r\n\r\n关于VMware中的几个连接模式，此文不做过多介绍。如果需要连接互联网，请使用nat模式或者桥接模式。这里我使用nat模式实验\r\n\r\n## 1、进到系统后，可以使用命令 `ifconfig`来查看此机器的网卡和IP信息\r\n![](https://ws1.sinaimg.cn/large/006h9k0Tly1fx223fqhdgj30ni0e9wg7.jpg){:height=\"\"400px\"\" width=\"\"500px\"\"}  \r\n  \r\n默认情况下应该能看到这三个网卡，其中，ens33是我们要使用的以太网卡，lo是本地回环地址，virbr0是用于和虚拟机通讯的（此虚拟机指Linux系统中的虚拟机）\r\n\r\n<table><tr><td bgcolor=orange>这里如果没有ifconfig这条命令，可以使用：yum install net-tools  来解决</td></tr></table>\r\n\r\n## 2、下面正式配置网络地址\r\n### 2.1关于网卡的配置文件的目录：\r\n```bash\r\n/etc/sysconfig/network-scripts\r\n```\r\n---\r\n```bash\r\n[root@localhost ~]# cd  /etc/sysconfig/network-scripts/\r\n[root@localhost network-scripts]# ls\r\nifcfg-ens33  ...(此处省略若干条)\r\n```\r\n可以在这个目录下可以看到很多ifcfg开头的文件，这个目录就是存放网络配置的地方。`ifcfg-ens33`这个文件就是我们要配置的网卡的配置文件。\r\n\r\n如果之前没有修改过网卡配置文件，默认情况下，原文件应该是这样的：\r\n```bash\r\nTYPE=Ethernet\r\nBOOTPROTO=dhcp		#表示此网卡获取IP地址的方式\r\nDEFROUTE=yes\r\nIPV4_FAILURE_FATAL=no\r\nIPV6INIT=yes\r\nIPV6_AUTOCONF=yes\r\nIPV6_DEFROUTE=yes\r\nIPV6_FAILURE_FATAL=no\r\nIPV6_ADDR_GEN_MODE=stable-privacy\r\nNAME=ens33			#此网卡的名称\r\nUUID=4c0cc561-8aa7-4739-a796-641dae82614f	#此网卡的uid号\r\nDEVICE=ens33	\r\nONBOOT=no			#启动此网卡的时候使用这个配置文件\r\nIPV6_PEERDNS=yes\r\nIPV6_PEERROUTES=yes\r\n```\r\n*关于ONBOOT这一项，网上好多人说是为了开机加载。实际上，如果这一项为NO的话，无论怎么重启网络服务，你的ip都不会使用此配置文件的设置。所以，要想网卡使用这一份配置文件，请保持这一项为yes*\r\n\r\n### 2.2网络的配置有两种方式，可以直接修改这个配置文件，也可以使用网络管理工具nmcli\r\n#### 2.2.1我们先看修改配置文件的方式：\r\n直接用vim打开上述网卡配置文件：\r\n```bash\r\n[root@localhost network-scripts]#vim ifcfg-ens33\r\n```\r\n1）第一个需要修改的地方就是ONBOOT，原因上面已经说过，不再赘述。\r\n```bash\r\nONBOOT=yes\r\n```\r\n2）如果使用DHCP服务器自动分配的地址，那么就可以保存退出，去重启网络服务了。这里演示手动配置的ip。将以下内容写入上述配置文件尾部，注意用大写字母。\r\n```bash\r\nDNS1=192.168.1.1		#dns地址\r\nIPADDR=192.168.1.121	#IP地址\r\nNETMASK=255.255.255.0 	#子网掩码(也可以写PREFIX=24 )\r\nGATEWAY=192.168.1.1		#网关地址\r\n```\r\n3）至此，网络的配置已经完毕。接下来就是从其网络服务了\r\n```bash\r\n[root@localhost network-scripts]# systemctl restart network \r\n```\r\n\r\n### 2.2.2 使用nmcli命令行工具配置网络\r\n\r\nRedhat7之前的网络管理是通过ifcfg文件配置管理接口(device)，而现在是通过NetworkManager服务管理连接(connection)。\r\n\r\n一个接口(device)可以有多个连接(connection)，但是同时只允许一个连接(connection)处于激活（active）状态。\r\n\r\n简单理解就是，一个连接就是(connection)就是/etc/sysconfig/network-scripts/目录下的一个配置文件，接口(device)是物理设备，一个物理设置可以拥有多个配置文件，但只能有一个配置文件属于使用(active)状态；配置文件的生成与使用状态均由NetworkManager控制。\r\n\r\n在使用nmcli命令行工具前，一定要保证NetworkManager服务为开启的状态，如果没有开启此服务，会出现以下错误：\r\n```bash\r\n#尝试添加一个新的连接\r\n[root@localhost network-scripts]# nmcli connection add type ethernet ifname ens33 con-name ens33 \r\nError: NetworkManager is not running.\r\n#开启此服务\r\n[root@localhost network-scripts]# systemctl start NetworkManager\r\n#再次重试\r\n[root@localhost network-scripts]# nmcli connection add type ethernet ifname ens33 con-name ens33 \r\nConnection \'ens33\' (0a6e7ff9-1a31-4cbc-a606-c10954bababa) successfully added.\r\n```\r\n\r\n\r\n\r\n创建连接\r\n```bash\r\nnmcli connection add type ethernet con-name 链接名 ifname 设备名\r\nnmcli connection add type ethernet con-name 链接名 ifname 设备名 ip4 IP地址 gw4 网关地址\r\n```\r\n<table><tr><td bgcolor=orange>注意：这里的设备名指的是网卡的名称，而连接名指的是配置文件的名称。可以不一致，为了便于对应，通常设为一致。</td></tr></table>\r\n\r\n修改连接\r\n```bash\r\nnmcli connection modify ens33 ipv4.addresses 192.168.80.88/24	#修改IP地址和子网掩码\r\nlnmcli connection modify eno1 ipv4.gateway 192.168.88.1		#修改网关\r\nlnmcli connection modify eno1 ipv4.dns 192.168.88.1			#修改dns地址\r\nlnmcli connection modify eno1 ipv4.method manual		#将获取ip的方式设置为手动\r\nlnmcli connection modify eno1 autoconnect yes		#让网卡使用此配置文件，也就是上面说的ONBOOT那个位置\r\n```\r\n操作的说明\r\n```bash\r\nconnection #对网络连接的操作\r\nmodify		#修改操作\r\nens33		#设备名称\r\nipv4.addresses	#ipv4的地址（后面可以跟上子网掩码范围从1-32）\r\nipv4.gateway	#网关地址\r\nipv4.dns		#dns地址\r\nipv4.method		#获取地址的方式，auto/manual\r\nautoconnect		#是否使用此配置，yes/no\r\n```\r\n\r\n最后不要忘了重启网络服务。\r\n\r\n\r\n以上，就是在Redhat7中手动配置静态ip的两种方式。','2018-11-09 13:38:00','2018-11-09 13:38:00','',132,1,4),(21,'Redhat7 安装DNS服务器','在互联网中传输数据的时候，需要使用IP地址。否则，数据包不知道会被发送到哪里去。\r\n\r\n目前互联网中所用的是tcp/ip协议，其中IP为第四版的IPv4。不过，这是由32位组成，为了适应人们的习惯，已经将他转为十进制的数字了。\r\n\r\n然而，人们对这种数字的记忆，实在不能记忆太多。但上互联网，又必须要使用ip，怎么办？？？\r\n\r\n为了应付这个问题，有人提出意见，使用特定的文件，用来将主机名和ip做一个对应。如此一来，我们只用记住主机名就可以实现互联网的通讯了。这就是早期的 /etc/hosts文件。。\r\n\r\n当后来计算机得到普及，上网的人更多了。这个文件就不能满足人们的需求了。这是伯克利大学发展出另一套阶层管理主机名ip对应的系统，bind\r\n\r\n直到现在，我们都是在使用的这一套管理系统，这也是世界上目前使用最广泛的域名系统。\r\n\r\n## 关键词：\r\n\r\nFQDN：(Fully Qualified Domain Name)全限定域名：同时带有主机名和域名的名称。（通过符号“.”）\r\n\r\n例如：主机名是bigserver,域名是mycompany.com,那么FQDN就是bigserver.mycompany.com。\r\n\r\n（摘抄自百度百科  [https://baike.baidu.com/item/FQDN](https://baike.baidu.com/item/FQDN)）\r\n\r\n## DNS查询有两种类型\r\n\r\n	迭代查询\r\n\r\n	递归查询\r\n\r\n关于迭代查询和递归查询方式的区别，这个段子表现的淋漓尽致，知乎的大神真是多啊，哈哈哈：\r\n\r\n你想知道某个一起上法律课的女孩的电话，并且你偷偷拍了她的照片，回到寝室告诉一个很仗义的哥们儿，这个哥们儿二话没说，拍着胸脯告诉你，甭急，我替你查(此处完成了一次递归查询，即，问询者的角色更替)。然后他拿着照片问了学院大四学长，学长告诉他，这姑娘是xx系的；然后这哥们儿马不停蹄又问了xx系的办公室主任助理同学，助理同学说是xx系yy班的，然后很仗义的哥们儿去xx系yy班的班长那里取到了该女孩儿电话。(此处完成若干次迭代查询，即，问询者角色不变，但反复更替问询对象)最后，他把号码交到了你手里。完成整个查询过程。\r\n\r\n作者：Tanswer\r\n链接：https://www.zhihu.com/question/53882349/answer/449572966\r\n来源：知乎\r\n\r\n## 1、DNS协议的实现---bind\r\n\r\n	dns：协议\r\n	bind：dns协议的一种实现\r\n	named：bind程序运行的进程名\r\n	\r\n	用户发起请求连接用的是UDP 53 端口\r\n	从服务器 刷新数据的时候用的 TCP 53 端口\r\n\r\n#### 1.1 安装bind所需要的软件包：\r\n\r\nbind-libs：被bind和bind-utils包中的程序共同用到的库文件；  \r\nbind-utils：bind客户端程序集，例如dig, host, nslookup等；  \r\nbind：提供的dns server程序、以及几个常用的测试程序；  \r\nbind-chroot：选装，让named运行于jail模式下；  \r\n\r\n#### 1.2 启动named服务\r\n```sh\r\nsystemctl start named  \r\nsystemctl enable named  \r\n```\r\n#### 1.3 开放防火墙规则\r\n```bash\r\nfirewall-cmd --add-service=dns --permanent  \r\nfirewall-cmd --reload  \r\n```\r\n## 2、配置文件\r\n\r\n	/etc/named.conf ：主配置文件  \r\n	/var/named/ ：数据库档案默认放置在这个目录  \r\n	/etc/rfc1912.zones ：区域配置文件  \r\n\r\n#### 2.1 编辑配置：\r\n```bash\r\nvim  /etc/named.conf\r\n\r\noptions {\r\n	listen-on port 53  { any; };  #可不设定，代表全部接受\r\n	directory  \"\"/var/named\"\"; #数据库默认放置的目录所在\r\n	dump-file  \"\"/var/named/data/cache_dump.db\"\"; #一些统计信息\r\n	statistics-file  \"\"/var/named/data/named_stats.txt\"\";\r\n	memstatistics-file \"\"/var/named/data/named_mem_stats.txt\"\";\r\n	allow-query  { any; };  #可不设定，代表全部接受\r\n	recursion yes;  #将自己视为客户端的一种查询模式\r\n	forward only;  #可暂时不设定\r\n};  #最终记得要结尾符号！\r\n```\r\n\r\n#### 2.2 编辑区域配置：\r\n```bash\r\nvim  /etc/rfc1912.zones\r\n\r\n#添加一个正向解析的区域\r\nzone \"\"example.com\"\" IN { // 这个 zone 的名称\r\n	type master; // 是什么类型\r\n	file \"\"named.example.com\"\";  // 正向解析的配置文件名，默认在/var/named/下\r\n};\r\n\r\n#添加一个逆向解析的区域\r\nzone \"\"100.168.192.in-addr.arpa\"\" IN {\r\n	type master;\r\n	file \"\"named.192.168.100\"\";\r\n};\r\n```\r\n\r\n#### 2.3  编辑正向解析的配置文件：\r\n\r\n#在/var/named目录下，复制一个文件做为样板：\r\n```bash\r\ncp -p named.localhost named.example.com\r\nvim named.example.com\r\n\r\n#配置文件示例如下：\r\n$TTL 1D\r\n@  IN SOA example.com root.example.com. (\r\n							0  ; serial\r\n							1D  ; refresh\r\n							1H  ; retry\r\n							1W  ; expire\r\n							3H )  ; minimum\r\n@  IN  NS  ns.example.com. # DNS 服务器名称\r\nns  IN  A  192.168.66.128 # DNS 服务器 IP\r\nfan  IN  A  192.168.66.129 # 相关的正向解析\r\nAAAA  ::1\r\n```\r\n## 3、配置文件详解\r\n\r\n序列号：serial，也即是数据库版本号；主服务器数据库内容发生变化时，其版本号递增；  \r\n刷新时间间隔：refresh，从服务器每多久到从服务器检查序列号更新情况；  \r\n重试时间间隔：retry，从服务器从主服务器请求同步解析失败时，再次发起请求尝试的时间间隔  \r\n过期时长：expire，从服务器始终联系不到主服务器时，多久之后放弃主服务器同步；停止提供服务。  \r\n\r\n#####  3.1资源记录类型\r\nSOA：Start Of Authority，其实授权记录()额区域解析库有且只能有一个SOA记录，而且必须放在第一条  \r\nNS： Name Service，区域名-->FQDN 也成为名称服务器  （NS 和 A 记录要  一起出现）；一个区域解析库可以有多个NS记录；其中一个为主的  \r\nA：  Address，地址记录，FQDN –> IPV4  \r\nAAAA：地址记录， FQDN –> IPv6   \r\nCNAME：Canonical Name，别名记录  \r\nPTR：Pointer，反向指针记录：IP –> FQDN  \r\nMX： Mail eXchanger，邮件交换器  \r\n优先级：0-99，数字越小优先级越高\r\n\r\n##### 3.2 以下几点需要注意：\r\n\r\n(1) TTL可以从全局继承；  \r\n(2) @表示当前区域的名称；  \r\n(3) 相邻的两条记录其name相同时，后面的可省略；  \r\n(4) 对于正向区域来说，各MX，NS等类型的记录的value为FQDN，此FQDN应该有一个A记录；  \r\n\r\n\r\n\r\n## 4、测试\r\n```bash\r\nnamed-checkconf  /etc/named.conf  #可以经检查配置文件的语法错误\r\nsystemctl restart named  #重启服务\r\n```\r\n重启服务后，若发现服务无法正常启动，可以查看日志文件 /var/log/messages 进行排错\r\n\r\n#### 客户端配置\r\n\r\n/etc/resolv.conf #在客户端配置DNS服务器地址\r\n\r\nnslookup命令可用于正向解析的测试\r\ndig  可用于逆向解析的测试','2018-11-14 08:40:00','2018-11-14 08:40:00','',91,1,4),(22,'Redhat7 部署iSCSI服务器--服务端配置','## 前言\r\n\r\n>取得外部磁盘容量的做法，主要所有 NAS 和 SAN 两大类的方式。\r\nNAS 可以想成时一台已经定制化的服务器，主要提供 nfs 、smb 等网络文件系统\r\nSAN 则是一种外接式存储设备，可以通过 san 取得外部的磁盘设备（非文件系统）\r\nSAN 早期使用光纤通道，由于以太网络的发展，近来使用iSCSI协议在 tcp/ip 架构上工作\r\niSCSI 协议主要分为iSCSI target （提供磁盘设备）和iSCSI initiator （访问target 磁盘）\r\n以上内容，均摘抄自《鸟哥的Linux私房菜--服务器架设篇（第三版）》\r\n\r\n\r\n此实验我们将使用两个虚拟机，分别作为服务器和客户端。\r\n>服务端：rhel7  ip：192.168.0.252\r\n>客户端：rhel7  ip：192.168.0.253\r\n\r\n\r\n## 服务端配置\r\n\r\n### 1. 安装iscsi target服务\r\n```bash\r\n[root@server ~]# yum install -y targetcli\r\n```\r\n### 2. 设置为开机启动\r\n```bash\r\n[root@server ~]# systemctl enable target\r\n```\r\n### 3. 配置 iSCSI target ，大多数目标配置是通过targetcli命令以交互方式完成的。\r\n#### 3.1 进入target命令行工具\r\n```bash\r\n[root@server ~]# targetcli \r\nWarning: Could not load preferences file /root/.targetcli/prefs.bin.\r\ntargetcli shell version 2.1.fb41\r\nCopyright 2011-2013 by Datera, Inc and others.\r\nFor help on commands, type \'help\'.\r\n\r\n/> ls\r\no- / ................................................................[...]\r\n  o- backstores .....................................................[...]\r\n  | o- block .........................................[Storage Objects: 0]\r\n  | o- fileio ........................................[Storage Objects: 0]\r\n  | o- pscsi ........................................ [Storage Objects: 0]\r\n  | o- ramdisk ...................................... [Storage Objects: 0]\r\n  o- iscsi .................................................. [Targets: 0]\r\n  o- loopback ............................................... [Targets: 0]\r\n/> \r\n```\r\n#### 3.2 创建共享设备块，可以使用 /dev/sdb 之类的块设备或以前创建的逻辑卷\r\n```bash\r\n/> cd backstores/block \r\n/backstores/block> ls\r\no- block ........................................... [Storage Objects: 0] \r\n/backstores/block> create share_disk /dev/sdb\r\nCreated block storage object share_disk using /dev/sdb.\r\n/backstores/block> \r\n```\r\n#### 3.3 创建iqn，使用名为 target 的目标创建名为 iqn.2018-11.com.example 的 IQN (Iscsi Qualified Name)，并获取关联的 TPG (Target Portal Group)\r\n> 从Red Hat Enterprise Linux 7.1开始，无论何时创建目标，都会创建默认 portal。\r\n\r\n**IQN (Iscsi Qualified Name)**：iSCSI有一套自己共享target文件名的定义，基本上通过iSCSI共享的文件名都是以 iqn 开头，通常情况下 iqn 的写法为：\r\n>iqn.yyyy-mm.< reversed domain name >:identifier\r\n>iqn.年份-月	  .  域名的反写						:共享的 target 名称\r\n\r\n```bash\r\n/> cd /iscsi \r\n/iscsi> ls\r\no- iscsi .................................................. [Targets: 0]\r\n```\r\n---\r\n```bash\r\n/iscsi> create iqn.2018-11.com.example:target\r\nCreated target iqn.2018-11.com.example:target.\r\nCreated TPG 1.\r\nGlobal pref auto_add_default_portal=true\r\nCreated default portal listening on all IPs (0.0.0.0), port 3260.\r\n/iscsi> \r\n```\r\n---\r\n```bash\r\n/iscsi> ls\r\no- iscsi .......................................... [Targets: 1]\r\n| o- iqn.2018-11.com.example:target .................. [TPGs: 1]\r\n|   o- tpg1 ............................. [no-gen-acls, no-auth]\r\n|     o- acls ........................................ [ACLs: 0]\r\n|     o- luns ........................................ [LUNs: 0]\r\n|     o- portals .................................. [Portals: 1]\r\n|       o- 0.0.0.0:3260 ................................... [OK]\r\n```\r\n\r\n- 在tpg1下面，定义了三个对象：  \r\n	* acls（访问控制列表：限制对资源的访问），  \r\n	* luns（逻辑单元号：定义导出的资源），  \r\n	* portals（定义到达导出资源的方式;包含成对的IP地址和端口）。\r\n\r\n#### 3.4  创建LUN\r\n\r\n**LUN （ Logical Unit Number ）:**  共享设备块的编号（逻辑单位区号）\r\n\r\n在该iqn下创建lun0，这样就跟上文创建的磁盘文件 share_disk  关联起来\r\n```bash\r\n/> cd /iscsi/iqn.2018-11.com.example:target/tpg1/luns \r\n/iscsi/iqn.20...get/tpg1/luns> ls\r\no- luns .................................................. [LUNs: 0]\r\n/iscsi/iqn.20...get/tpg1/luns> \r\n/iscsi/iqn.20...get/tpg1/luns> create /backstores/block/share_disk \r\nCreated LUN 0.\r\n```\r\n\r\n#### 3.5  创建ACL\r\n\r\n然后在该iqn下创建acls访问控制条目，允许客户端的iqn访问该磁盘文件\r\n```bash\r\n/> cd /iscsi/iqn.2018-11.com.example:target/tpg1/acls \r\n/iscsi/iqn.20...get/tpg1/acls> \r\n/iscsi/iqn.20...get/tpg1/acls> create iqn.2018-11.com.example:target\r\nCreated Node ACL for iqn.2018-11.com.example:target\r\nCreated mapped LUN 0.\r\n```\r\n\r\n\r\n#### 3.6  创建PORTAL\r\n\r\n最后在该iqn下创建门户IP\r\n\r\n```bash\r\n/iscsi/iqn.20...get/tpg1/acls> cd ../portals/\r\n/iscsi/iqn.20.../tpg1/portals> ls\r\no- portals ................................................. [Portals: 1]\r\n  o- 0.0.0.0:3260 .................................................. [OK]\r\n/iscsi/iqn.20.../tpg1/portals> create 192.168.0.252 3260	#直接创建时，报错\r\nUsing default IP port 3260\r\nCould not create NetworkPortal in configFS\r\n/iscsi/iqn.20.../tpg1/portals> \r\n/iscsi/iqn.20.../tpg1/portals> delete 0.0.0.0 3260	#先将原来的删除掉\r\nDeleted network portal 0.0.0.0:3260\r\n/iscsi/iqn.20.../tpg1/portals> \r\n/iscsi/iqn.20.../tpg1/portals> create 192.168.0.252 3260	#在创建，成功\r\nUsing default IP port 3260\r\nCreated network portal 192.168.0.252:3260.\r\n/iscsi/iqn.20.../tpg1/portals> \r\n```\r\n#### 3.7 配置完成，退出命令行工具\r\n```bash\r\n/iscsi/iqn.20.../tpg1/portals> exit\r\nGlobal pref auto_save_on_exit=true\r\nLast 10 configs saved in /etc/target/backup.\r\nConfiguration saved to /etc/target/saveconfig.json\r\n```\r\n\r\n#### 3.8 配置防火墙，开放target服务\r\n```bash\r\n[root@server ~]# firewall-cmd --add-service=iscsi-target --permanent\r\n[root@server ~]# firewall-cmd --reload\r\n```\r\n#### 3.9 检查端口是否被监听\r\n```bash\r\n[root@server ~]# netstat -lantup | grep 3260\r\ntcp        0      0 192.168.0.252:3260      0.0.0.0:*               LISTEN      -  \r\n```','2018-11-20 07:31:00','2018-11-20 07:31:00','',111,1,4),(23,'Redhat7 部署iSCSI服务器--客户端配置','## 客户端配置\r\n\r\n### 1. 客户端安装 iscsi-initiator-utils\r\n```bash\r\n[root@client ~]# yum install iscsi-initiator-utils -y\r\n```\r\n\r\n### 2. 编辑文件 \r\n```bash\r\n[root@client ~]# vim /etc/iscsi/initiatorname.iscsi \r\n#将iqn改为服务端允许连接的iqn\r\nInitiatorName=iqn.2018-11.com.example:target\r\n```\r\n### 3. 客户端发现\r\n```bash\r\n[root@client ~]# iscsiadm --mode discoverydb --type sendtargets --portal 192.168.0.252 --discover\r\n192.168.0.252:3260,1 iqn.2018-11.com.example:target\r\n#发现服务端的target\r\n```\r\n\r\n### 4. 客户端登录\r\n```bash\r\n[root@client ~]# iscsiadm --mode node --targetname iqn.2018-11.com.example:target --portal 192.168.0.252:3260 --login\r\nLogging in to [iface: default, target: iqn.2018-11.com.example:target, portal: 192.168.0.252,3260] (multiple)\r\nLogin to [iface: default, target: iqn.2018-11.com.example:target, portal: 192.168.0.252,3260] successful.\r\n# 看到最后的 successful  那就是登录成功了！！！\r\n```\r\n\r\n登录后，就可以在自己电脑本地看到多了一块磁盘。fdisk -l  可以查看本地磁盘和分区。可以像操作本地磁盘一样，可以进行分区，可以格式化，也可以挂载！！！\r\n\r\n### 查看本地磁盘\r\n```bash\r\n[root@client ~]# fdisk -l	\r\n（。。。省略n行）\r\n磁盘 /dev/sdb：21.5 GB, 21474836480 字节，41943040 个扇区\r\nUnits = 扇区 of 1 * 512 = 512 bytes\r\n扇区大小(逻辑/物理)：512 字节 / 512 字节\r\nI/O 大小(最小/最佳)：512 字节 / 4194304 字节\r\n\r\n#我这里的sdb 就是iSCSI共享设备\r\n```\r\n\r\n### 分区\r\n```bash\r\n[root@client /]# fdisk /dev/sdb\r\n#我这里分了两个区，分区的步骤省略掉了，分完区，不要忘了刷新分区表！！！\r\n[root@client /]# partprobe \r\n[root@client /]# fdisk -l /dev/sdb		#查看sdb的分区情况\r\n\r\n磁盘 /dev/sdb：21.5 GB, 21474836480 字节，41943040 个扇区\r\nUnits = 扇区 of 1 * 512 = 512 bytes\r\n扇区大小(逻辑/物理)：512 字节 / 512 字节\r\nI/O 大小(最小/最佳)：512 字节 / 4194304 字节\r\n磁盘标签类型：dos\r\n磁盘标识符：0x6dbe5335\r\n\r\n   设备 Boot      Start         End      Blocks   Id  System\r\n/dev/sdb1            8192    10493951     5242880   83  Linux\r\n/dev/sdb2        10493952    14688255     2097152   83  Linux\r\n\r\n```\r\n\r\n### 格式化\r\n```bash\r\n[root@client pub]# mkfs.xfs /dev/sdb1\r\nmeta-data=/dev/sdb1              isize=512    agcount=4, agsize=327680 blks\r\n         =                       sectsz=512   attr=2, projid32bit=1\r\n         =                       crc=1        finobt=0, sparse=0\r\ndata     =                       bsize=4096   blocks=1310720, imaxpct=25\r\n         =                       sunit=0      swidth=0 blks\r\nnaming   =version 2              bsize=4096   ascii-ci=0 ftype=1\r\nlog      =internal log           bsize=4096   blocks=2560, version=2\r\n         =                       sectsz=512   sunit=0 blks, lazy-count=1\r\nrealtime =none                   extsz=4096   blocks=0, rtextents=0\r\n```\r\n\r\n### 挂载\r\n```bash\r\n[root@client pub]# mkdir /pub/disk1 -p		#创建挂载点\r\n[root@client pub]# mount /dev/sdb1 /pub/disk1	#挂载\r\n```','2018-11-20 07:53:00','2018-11-20 07:53:00','',107,1,4),(24,'lvs简介','## lvs简介 \r\n	中文文档：http://www.linuxvirtualserver.org/zh/index.html\r\n\r\n当网站后端服务器承受不住访问的压力，提高服务器性能的解决方案会极大的增加成本时，于是就出现了横向扩展的解决方案。即增加一台或几台服务器，提供相同的服务，通过前端调度器将访问请求分配到后台服务器上。这种多台服务器组成的数组集合就叫做集群。\r\n\r\n>LVS是Linux Virtual Server的简写，意思就是Linux虚拟服务器，是一个虚拟的服务器集群系统，可以在UNIX/LINUX平台下实现负载均衡集群功能。该项目在1998年5月由章文嵩博士组织成立，是中国国内最早出现的自由软件项目之一。现在已经被收到linux2.6以上的内核版本中，不需要对系统打补丁就可以轻松实现\r\n\r\n>LVS负载均衡调度技术是在Linux内核中实现的，因此，被称之为Linux虚拟服务器（Linux Virtual Server）。我们使用该软件配置LVS时候，不能直接配置内核中的ipvs，而需要使用ipvs的管理工具ipvsadm进行管理。\r\n\r\n>LVS工作于IOS七层模型的第四层-传输层，通过对TCP, UDP, AH, EST, AH_EST, SCTP等工作在四层的协议的支持，根据目标地址和端口做出转发与否的决策，根据调度算法做出转发至哪一个端口的解决方案\r\n\r\n>LVS集群采用IP负载均衡技术和基于内容请求分发技术\r\n\r\n>IPVS: 称之为IP虚拟服务器(IP Virtual Server，简写为IPVS),是运行在LVS下的提供负载均衡功能的一种技术\r\n\r\n>LVS采用的IP负载均衡技术是在负载调度器的实现技术中效率最高的。目前有三种IP负载均衡技术, 八种调度算法。\r\n\r\n### 简单术语\r\n\r\n	术语简写	术语含义\r\n	CIP		客户端的IP地址，client ip\r\n	DIP		负载均衡器对应的实际IP地址\r\n	VIP		需在均衡器提供服务的地址，虚拟地址\r\n	RIP		提供服务的节点地址\r\n	LB		负载均衡服务器\r\n	RS		节点服务器，Real   Server\r\n\r\n	\r\n\r\n### LVS有三种负载平衡方式\r\n\r\n	NAT（Network Address Translation）\r\n	DR（Direct Routing）\r\n	IP Tunneling\r\n\r\n\r\n### 三种方式：\r\n#### 1、Virtual Server via Network Address Translation NAT（VS/NAT）\r\n>通过网络地址转换，调度器重写请求报文的目标地址，根据预设的调度算法，将请求分派给后端的真实服务器；真实服务器的响应报文通过调度器时，报文的源地址被重写，再返回给客户，完成整个负载调度过程。\r\n\r\n	\r\n#### Virtual Server via IP Tunneling(VS/TUN)\r\n>采用NAT技术时，由于请求和响应报文都必须经过调度器地址重写，当客户请求越来越多时，调度器的处理能力将成为瓶颈。为了解决这个问题，调度器把请求报 文通过IP隧道转发至真实服务器，而真实服务器将响应直接返回给客户，所以调度器只处理请求报文。由于一般网络服务应答比请求报文大许多，采用 VS/TUN技术后，集群系统的最大吞吐量可以提高10倍。\r\n\r\n\r\n#### Virtual Server via Direct Routing(VS/DR)\r\n>VS/DR通过改写请求报文的MAC地址，将请求发送到真实服务器，而真实服务器将响应直接返回给客户。同VS/TUN技术一样，VS/DR技术可极大地 提高集群系统的伸缩性。这种方法没有IP隧道的开销，对集群中的真实服务器也没有必须支持IP隧道协议的要求，但是要求调度器与真实服务器都有一块网卡连 在同一物理网段上。\r\n\r\n\r\n	\r\n### 八种算法\r\n#### 1、轮叫（Round Robin）\r\n>调度器通过\"\"轮叫\"\"调度算法将外部请求按顺序轮流分配到集群中的真实服务器上，它均等地对待每一台服务器，而不管服务器上实际的连接数和系统负载。\r\n\r\n#### 2、加权轮叫（Weighted Round Robin）\r\n>调度器通过\"\"加权轮叫\"\"调度算法根据真实服务器的不同处理能力来调度访问请求。这样可以保证处理能力强的服务器处理更多的访问流量。调度器可以自动问询真实服务器的负载情况，并动态地调整其权值。\r\n\r\n#### 3、最少链接（Least Connections）\r\n>调度器通过\"\"最少连接\"\"调度算法动态地将网络请求调度到已建立的链接数最少的服务器上。如果集群系统的真实服务器具有相近的系统性能，采用\"\"最小连接\"\"调度算法可以较好地均衡负载。\r\n\r\n#### 4、加权最少链接（Weighted Least Connections）\r\n>在集群系统中的服务器性能差异较大的情况下，调度器采用\"\"加权最少链接\"\"调度算法优化负载均衡性能，具有较高权值的服务器将承受较大比例的活动连接负载。调度器可以自动问询真实服务器的负载情况，并动态地调整其权值。\r\n\r\n#### 5、基于局部性的最少链接（Locality-Based Least Connections）\r\n>\"\"基于局部性的最少链接\"\" 调度算法是针对目标IP地址的负载均衡，目前主要用于Cache集群系统。该算法根据请求的目标IP地址找出该目标IP地址最近使用的服务器，若该服务器 是可用的且没有超载，将请求发送到该服务器；若服务器不存在，或者该服务器超载且有服务器处于一半的工作负载，则用\"\"最少链接\"\"的原则选出一个可用的服务 器，将请求发送到该服务器。\r\n\r\n#### 6、带复制的基于局部性最少链接（Locality-Based Least Connections with Replication）\r\n>\"\"带复制的基于局部性最少链接\"\"调度算法也是针对目标IP地址的负载均衡，目前主要用于Cache集群系统。它与LBLC算法的不同之处是它要维护从一个 目标IP地址到一组服务器的映射，而LBLC算法维护从一个目标IP地址到一台服务器的映射。该算法根据请求的目标IP地址找出该目标IP地址对应的服务 器组，按\"\"最小连接\"\"原则从服务器组中选出一台服务器，若服务器没有超载，将请求发送到该服务器，若服务器超载；则按\"\"最小连接\"\"原则从这个集群中选出一 台服务器，将该服务器加入到服务器组中，将请求发送到该服务器。同时，当该服务器组有一段时间没有被修改，将最忙的服务器从服务器组中删除，以降低复制的 程度。\r\n\r\n#### 7、目标地址散列（Destination Hashing）\r\n>\"\"目标地址散列\"\"调度算法根据请求的目标IP地址，作为散列键（Hash Key）从静态分配的散列表找出对应的服务器，若该服务器是可用的且未超载，将请求发送到该服务器，否则返回空。\r\n\r\n#### 8、源地址散列（Source Hashing）\r\n>\"\"源地址散列\"\"调度算法根据请求的源IP地址，作为散列键（Hash Key）从静态分配的散列表找出对应的服务器，若该服务器是可用的且未超载，将请求发送到该服务器，否则返回空。\r\n	\r\n#### 参考文档：\r\n	http://www.linuxvirtualserver.org/zh/lvs1.html','2018-12-06 04:55:00','2018-12-06 04:55:00','',41,1,7),(25,'lvs DR模式实现httpd的负载均衡','## 简介\r\n关于lvs的介绍就不多说了，可以移步我的另外一篇博文：[lvs简介](https://www.ifanm.com/post/24/)\r\n\r\n在DR模式的群集中，LVS负载调度器作为群集的访问入口，但不作为网关使用；服务器池中的所有节点都各自接入internet，发送给客户端的WEB响应数据包不需要经过LVS负载调度器。如图所示\r\n\r\n|  节点  |    真实IP  |   虚拟IP (vip)  |\r\n|:------:|  ------  |  ---------:|\r\n|调度器  |  192.168.0.253  | 192.168.0.250 |\r\n|webserver1--lvs1 |	192.168.0.100  |  192.168.0.250\r\n|webserver2--lvs2	|   192.168.0.104  |  192.168.0.250\r\n\r\n\r\n## 调度器配置\r\n### 1、先停掉防火墙，关闭selinux\r\n\r\nsystemctl stop firewalld\r\nsetenforce 0\r\n\r\n### 2、设置虚拟IP\r\n```bash\r\n[root@client ~]# cd /etc/sysconfig/network-scripts/\r\n[root@client network-scripts]# cp ifcfg-ens33 ifcfg-ens33:0\r\n```\r\n\r\n在此文件中添加或修改以下内容：\r\n```bash\r\nDEVICE=ens33:0\r\nNM_CONTROLLED=no\r\nONBOOT=yes\r\nIPADDR=192.168.0.250\r\nNETMASK=255.255.255.0\r\n```\r\n\r\n修改完成后重启网络，查看IP：\r\n```bash\r\n[root@client network-scripts]# systemctl restart network\r\n[root@client network-scripts]# ifconfig ens33:0\r\nens33:0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500\r\ninet 192.168.0.250  netmask 255.255.255.0  broadcast 192.168.0.255\r\nether 00:0c:29:7b:85:8b  txqueuelen 1000  (Ethernet)\r\n```\r\n### 3、开启路由转发功能\r\n```bash\r\n[root@client ~]# echo \'1\' > /proc/sys/net/ipv4/ip_forward\r\n\r\n或者直接修改配置文件\r\n\r\n[root@client ~]# vim /etc/sysctl.conf\r\nnet.ipv4.ip_forward=1\r\n\r\n[root@client ~]# sysctl -p  #使配置文件立即生效\r\n```\r\n### 4、安装和启动ipvsadm\r\n```bash\r\nyum install ipvsadm -y\r\nsystemctl start ipvsadm\r\n```\r\n<table><tr><td bgcolor=orange>\r\n<h5>ipvsadm启动时报错： </h5>\r\nDec  3 19:10:52 client bash: /bin/bash: /etc/sysconfig/ipvsadm: 没有那个文件或目录  <br>\r\n<h5> 解决：</h5>\r\nipvsadm --save > /etc/sysconfig/ipvsadm\r\n</td></tr></table>\r\n\r\n### 5、添加虚拟服务器 和真实服务器\r\n```bash\r\n#添加虚拟服务器\r\nipvsadm -A -t 192.168.0.250:80 -s wrr\r\n\r\n#参数说明：\r\n-A：--add-service，表示添加一个虚拟服务器\r\n-t：--tcp-service，指定这是一个tcp的虚拟服务器\r\n-u：--udp-service，指定这是一个udp的虚拟服务器\r\n192.168.0.250:80：表示提供服务的ip地址以及端口号\r\n-s：--scheduler，指定调度器，“rr|wrr|lc|wlc|lblc|lblcr|dh|sh|sed|nq”选择一种，默认是wlc\r\n\r\n#删除服务器：\r\nipvsadm -d -t 192.168.0.250:80 -r 192.168.0.101:80\r\n\r\n# 为此虚拟服务器添加真实服务器：\r\nipvsadm -a -t 192.168.0.250:80 -r 192.168.0.100:80 -g -w 1\r\nipvsadm -a -t 192.168.0.250:80 -r 192.168.0.104:80 -g -w 1\r\n192.168.0.100\r\n192.168.0.104\r\n以上两个ip为httpd服务所在的两个机器\r\n```\r\n\r\n##### 查看已经添加的真实服务器：\r\nipvsadm -L\r\n```bash\r\n[root@client network-scripts]# ipvsadm -L\r\nIP Virtual Server version 1.2.1 (size=4096)\r\nProt LocalAddress:Port Scheduler Flags\r\n-> RemoteAddress:Port  Forward Weight ActiveConn InActConn\r\nTCP  client.example.com:http wrr\r\n-> 192.168.0.100:http  Route  1  0  0\r\n-> 192.168.0.104:http  Route  1  0  0\r\n```\r\n\r\n## webserver配置\r\n\r\nweb服务器的配置以下为一台机器中的，若在环境中有多台机器，则更改对应的真实IP即可，虚拟IP都一样\r\n\r\n### 1、配置ip\r\n```bash\r\n[root@lvs1 ~]# cd /etc/sysconfig/network-scripts/\r\n[root@lvs1 network-scripts]# cp ifcfg-lo ifcfg-lo:0\r\n[root@lvs1 network-scripts]# vim ifcfg-lo:0\r\n```\r\n\r\n##### 配置文件内容如下：\r\n```bash\r\n#此处的子网掩码为四个1\r\n\r\nDEVICE=lo:0\r\nIPADDR=192.168.0.250\r\nNETMASK=255.255.255.255\r\nNAME=loopback\r\nONBOOT=yes\r\n```\r\n\r\n##### 重启网络，查看IP\r\n```bash\r\n[root@lvs1 network-scripts]# systemctl restart network\r\n[root@lvs1 network-scripts]# ifconfig lo:0\r\nlo:0: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536\r\ninet 192.168.0.250  netmask 255.255.255.255\r\nloop  txqueuelen 1  (Local Loopback)\r\n```\r\n\r\n### 2、抑制arp\r\n```bash\r\necho \"\"1\"\" > /proc/sys/net/ipv4/conf/lo/arp_ignore\r\necho \"\"2\"\" > /proc/sys/net/ipv4/conf/lo/arp_announce\r\necho \"\"1\"\" > /proc/sys/net/ipv4/conf/all/arp_ignore\r\necho \"\"2\"\" > /proc/sys/net/ipv4/conf/all/arp_announce\r\n```\r\n\r\n##### arp_ignore用来定义网卡在  响应外部ARP请求时的响应  级别。\r\n>0: 默认值， 任何网络接口收到ARP请求后， 如果本机的任意接口有该MAC, 则予以响应。\r\n1: 某个网络接口收到ARP请求后， 判断请求的MAC地址是否是本接口， 是则回应， 否则不回应。LvS调度器会将客户请求转发给真实服务器的ethO接口， 而真实服务器 的VIP地址配置在本地回环设备上。\r\n\r\n##### arp _ announce用来定义网卡广播ARP包时的级别。\r\n>0: 默认值， 任何网络接口接收到ARP请求后， 如果本机的任意接口有该MAC, 则 予以响应。\r\n1: 尽量避免响应MAC地址非本网络接口MAC地址的ARP请求。\r\n2: 不响应MAC地址非本网络接口MAC地址的ARP请求。\r\n\r\n##### 配置脚本  临时配置忽略arp 临时添加虚拟IP  \r\n	(可以将以下内容写入文件中，然后用bash shell执行)\r\n```bash\r\nvip=192.168.1.250\r\nifconfig lo:0 $vip broadcast $vip netmask 255.255.255.255 up\r\necho \'1\' > /proc/sys/net/ipv4/conf/lo/arp_ignore\r\necho \'1\' > /proc/sys/net/ipv4/conf/all/arp_ignore\r\necho \'2\' > /proc/sys/net/ipv4/conf/lo/arp_announce\r\necho \'2\' > /proc/sys/net/ipv4/conf/all/arp_announce\r\n```\r\n\r\n### 3、安装httpd\r\n\r\nyum install httpd\r\n\r\n### 4、创建测试页面\r\n\r\ncd /var/www/html/\r\necho \'lvs1.example.com\' > index.html\r\n\r\n## 测试\r\n\r\n另外找一台主机使用curl  可以测试，测试结果如下：\r\n```bash\r\n[root@client2 ~]# curl 192.168.0.250:80\r\nlvs1.example.com\r\n[root@client2 ~]# curl 192.168.0.250:80\r\nlvs2.example.com\r\n[root@client2 ~]# curl 192.168.0.250:80\r\nlvs1.example.com\r\n[root@client2 ~]# curl 192.168.0.250:80\r\nlvs2.example.com\r\n[root@client2 ~]# curl 192.168.0.250:80\r\nlvs1.example.com\r\n[root@client2 ~]# curl 192.168.0.250:80\r\nlvs2.example.com\r\n```','2018-12-06 05:44:00','2018-12-06 05:44:00','',82,1,7),(26,'django部署计划任务','### django-crontab安装：\r\n```bash\r\npip install django-crontab\r\n```\r\n\r\n### 将django-crontab加入setting.py \r\n\r\n只需要将django-crontab加入到settings.py的INSTALLED_APPS即可。如下代码：\r\n```python\r\nINSTALLED_APPS = (\r\n\'django_crontab\',\r\n...\r\n)\r\n```\r\n\r\n### settings.py中加入了django-crontab的命令：\r\n\r\n== 计划任务，每天爬取图片，只能在Linux中使用 ==\r\n```python\r\nCRONJOBS = [\r\n# 表示每天1：01执行\r\n(\'01 1 * * *\', \'myApp1.bingPhoto.main\')\r\n]\r\n```\r\n\r\n- 应用.python程序.类\r\n- bingPhoto为myApp1应用下的一个py文件\r\n- main为bingPhoto文件中的函数名\r\n\r\n### 命令\r\n\r\n查看一下系统中已有的计划任务\r\n```bash\r\npython manage.py crontab show \r\n```\r\n\r\n如果要移除所有的任务，则运行\r\n```bash\r\npython manage.py crontab remove\r\n```\r\n当你修改了任务，需要再次运行\r\n```bash\r\npython manage.py crontab add\r\n```','2019-02-15 10:01:00','2019-02-15 10:01:00','',97,1,6);
/*!40000 ALTER TABLE `myApp1_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myApp1_post_tags`
--

DROP TABLE IF EXISTS `myApp1_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myApp1_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myApp1_post_tags_post_id_tag_id_3cedecf6_uniq` (`post_id`,`tag_id`),
  KEY `myApp1_post_tags_tag_id_67d457ff_fk_myApp1_tag_id` (`tag_id`),
  CONSTRAINT `myApp1_post_tags_tag_id_67d457ff_fk_myApp1_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `myApp1_tag` (`id`),
  CONSTRAINT `myApp1_post_tags_post_id_8e4b4183_fk_myApp1_post_id` FOREIGN KEY (`post_id`) REFERENCES `myApp1_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myApp1_post_tags`
--

LOCK TABLES `myApp1_post_tags` WRITE;
/*!40000 ALTER TABLE `myApp1_post_tags` DISABLE KEYS */;
INSERT INTO `myApp1_post_tags` VALUES (10,5,12),(11,5,13),(12,5,14),(13,5,15),(14,6,16),(15,6,17),(16,6,18),(17,7,16),(18,7,17),(19,7,19),(20,8,16),(21,8,20),(45,8,29),(22,9,16),(23,9,21),(24,10,16),(25,10,22),(26,11,14),(28,12,23),(27,12,24),(29,13,25),(31,14,14),(30,14,26),(32,15,16),(33,16,16),(34,16,27),(37,17,14),(35,17,16),(36,17,28),(38,18,16),(39,18,29),(40,19,29),(41,20,16),(42,20,29),(43,21,16),(44,21,29),(46,22,16),(47,22,29),(48,23,16),(49,23,29),(50,24,29),(51,24,30),(52,25,29),(53,25,30),(56,26,14),(54,26,16),(55,26,26);
/*!40000 ALTER TABLE `myApp1_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myApp1_tag`
--

DROP TABLE IF EXISTS `myApp1_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myApp1_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myApp1_tag`
--

LOCK TABLES `myApp1_tag` WRITE;
/*!40000 ALTER TABLE `myApp1_tag` DISABLE KEYS */;
INSERT INTO `myApp1_tag` VALUES (12,'flask'),(13,'uwsgi'),(14,'python'),(15,'nginx'),(16,'centos7'),(17,'nagios'),(18,'httpd'),(19,'windows'),(20,'ftp'),(21,'touch'),(22,'bash'),(23,'wordcloud'),(24,'itchat'),(25,'vim'),(26,'django'),(27,'crond'),(28,'python3'),(29,'Redhat'),(30,'lvs');
/*!40000 ALTER TABLE `myApp1_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-25 16:55:51
