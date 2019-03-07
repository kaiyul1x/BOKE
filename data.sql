-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: mysite_db
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `article_article`
--

DROP TABLE IF EXISTS `article_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `last_updated_time` datetime(6) NOT NULL,
  `readed_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_author_id_e6b479f8_fk_auth_user_id` (`author_id`),
  CONSTRAINT `article_article_author_id_e6b479f8_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_article`
--

LOCK TABLES `article_article` WRITE;
/*!40000 ALTER TABLE `article_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add article',7,'add_article'),(26,'Can change article',7,'change_article'),(27,'Can delete article',7,'delete_article'),(28,'Can view article',7,'view_article'),(29,'Can add blog',8,'add_blog'),(30,'Can change blog',8,'change_blog'),(31,'Can delete blog',8,'delete_blog'),(32,'Can view blog',8,'view_blog'),(33,'Can add blog type',9,'add_blogtype'),(34,'Can change blog type',9,'change_blogtype'),(35,'Can delete blog type',9,'delete_blogtype'),(36,'Can view blog type',9,'view_blogtype'),(37,'Can add read num',10,'add_readnum'),(38,'Can change read num',10,'change_readnum'),(39,'Can delete read num',10,'delete_readnum'),(40,'Can view read num',10,'view_readnum'),(41,'Can add read num',11,'add_readnum'),(42,'Can change read num',11,'change_readnum'),(43,'Can delete read num',11,'delete_readnum'),(44,'Can view read num',11,'view_readnum'),(45,'Can add read detail',12,'add_readdetail'),(46,'Can change read detail',12,'change_readdetail'),(47,'Can delete read detail',12,'delete_readdetail'),(48,'Can view read detail',12,'view_readdetail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$sPnSvWXLhiwl$aauZe9FbsmRwm3kURT0YHdccGoNWeaIwh55oYKrVdzo=','2019-03-03 15:18:07.958000',1,'liang','','','laing@213.com',1,1,'2019-03-03 13:26:28.234000'),(2,'pbkdf2_sha256$120000$nK3CgefTL9AP$ZgqyPFIOynUPvyCFqoL3RYHRFNzrTyXWDqcZUKWqhSc=',NULL,0,'jinyong','','','',0,1,'2019-03-03 13:27:48.398000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_updated_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `blog_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (1,'天龙八部','《天龙八部》是根据金庸同名小说改编的古装武侠剧，由张纪中担任总制片人，鞠觉亮、周晓文、于敏、赵箭联合执导，胡军、林志颖、高虎、刘亦菲、陈好、刘涛主演，于2003年12月11日在浙江卫视首播。\r\n该剧以乔峰、段誉和虚竹三人的传奇经历为主线，交织以三人与阿朱、王语嫣、梦姑三段感人至深的缠绵恋情，从而铺陈开一幅气势磅礴的江湖画卷 [1]  。','2019-03-03 13:27:52.197000','2019-03-03 13:27:52.197000',2,1),(2,'钢铁侠','《钢铁侠》（Iron Man）是由美国漫威电影工作室出品的一部科幻冒险电影，改编自同名系列漫画，由乔恩·费儒执导，小罗伯特·唐尼及格温妮斯·帕特洛、杰夫·布里吉斯等主演。','2019-03-03 13:28:59.981000','2019-03-03 13:28:59.981000',1,2),(3,'围城','围城故事发生于1920到1940年代。主角方鸿渐是个从中国南方乡绅家庭走出的青年人，迫于家庭压力与同乡周家女子订亲。但在其上大学期间，周氏患病早亡。准岳父周先生被方所写的唁电感动，资助他出国求学。\r\n方鸿渐在欧洲游学期间，不理学业。为了给家人一个交待，方于毕业前购买了虚构的“克莱登大学”的博士学位证书，并随海外学成的学生回国。在船上与留学生鲍小姐相识并热恋，但被鲍小姐欺骗感情。同时也遇见了大学同学苏文纨。\r\n到达上海后，在已故未婚妻父亲周先生开办的银行任职。此时，方获得了同学苏文纨的青睐，又与苏的表妹唐晓芙一见钟情，整日周旋于苏、唐二人之间，期间并结识了追求苏文纨的赵辛楣。方最终与苏、唐二人感情终结，苏嫁与诗人曹元朗，而赵也明白方并非其情敌，从此与方惺惺相惜。方鸿渐逐渐与周家不和。\r\n抗战开始，方家逃难至上海的租界。在赵辛楣的引荐下，与赵辛楣、孙柔嘉、顾尔谦、李梅亭几人同赴位于内地的三闾大学任教。由于方鸿渐性格等方面的弱点，陷入了复杂的人际纠纷当中。后与孙柔嘉订婚，并离开三闾大学回到上海。在赵辛楣的帮助下，方鸿渐在一家报馆任职，与孙柔嘉结婚。\r\n婚后，方鸿渐夫妇与方家、孙柔嘉姑母家的矛盾暴露并激化。方鸿渐辞职并与孙柔嘉吵翻，逐渐失去了生活的希望','2019-03-03 13:29:52.842000','2019-03-03 13:29:52.842000',1,3),(4,'元尊','开天辟地，一口玄黄气，定可断乾坤。','2019-03-03 13:30:54.451000','2019-03-03 14:09:43.543000',1,4),(5,'啊哈哈哈','这是我的啊哈哈哈哈哈哈嘻嘻嘻嘻','2019-03-03 13:31:12.769000','2019-03-03 13:31:12.769000',1,3),(6,'博客0','这是博客的内容','2019-03-03 14:34:03.308000','2019-03-03 14:34:03.308000',2,1),(7,'博客1','这是博客的内容','2019-03-03 14:34:03.328000','2019-03-03 14:34:03.328000',2,1),(8,'博客2','这是博客的内容','2019-03-03 14:34:03.339000','2019-03-03 14:34:03.339000',2,1),(9,'博客3','这是博客的内容','2019-03-03 14:34:03.349000','2019-03-03 14:34:03.349000',2,1),(10,'博客4','这是博客的内容','2019-03-03 14:34:03.359000','2019-03-03 14:34:03.359000',2,1),(11,'博客5','这是博客的内容','2019-03-03 14:34:03.369000','2019-03-03 14:34:03.369000',2,1),(12,'博客6','这是博客的内容','2019-03-03 14:34:03.379000','2019-03-03 14:34:03.379000',2,1),(13,'博客7','这是博客的内容','2019-03-03 14:34:03.390000','2019-03-03 14:34:03.390000',2,1),(14,'博客8','这是博客的内容','2019-03-03 14:34:03.403000','2019-03-03 14:34:03.403000',2,1),(15,'博客9','这是博客的内容','2019-03-03 14:34:03.414000','2019-03-03 14:34:03.414000',2,1),(16,'博客10','这是博客的内容','2019-03-03 14:34:03.427000','2019-03-03 14:34:03.427000',2,1),(17,'博客11','这是博客的内容','2019-03-03 14:34:03.439000','2019-03-03 14:34:03.439000',2,1),(18,'博客12','这是博客的内容','2019-03-03 14:34:03.452000','2019-03-03 14:34:03.452000',2,1),(19,'博客13','这是博客的内容','2019-03-03 14:34:03.466000','2019-03-03 14:34:03.466000',2,1),(20,'博客14','这是博客的内容','2019-03-03 14:34:03.482000','2019-03-03 14:34:03.482000',2,1),(21,'博客15','这是博客的内容','2019-03-03 14:34:03.496000','2019-03-03 14:34:03.496000',2,1),(22,'博客16','这是博客的内容','2019-03-03 14:34:03.510000','2019-03-03 14:34:03.510000',2,1),(23,'博客17','这是博客的内容','2019-03-03 14:34:03.525000','2019-03-03 14:34:03.525000',2,1),(24,'博客18','这是博客的内容','2019-03-03 14:34:03.542000','2019-03-03 14:34:03.542000',2,1),(25,'博客19','这是博客的内容','2019-03-03 14:34:03.559000','2019-03-03 14:34:03.559000',2,1),(26,'博客20','这是博客的内容','2019-03-03 14:34:03.584000','2019-03-03 14:34:03.584000',2,1),(27,'博客21','这是博客的内容','2019-03-03 14:34:03.609000','2019-03-03 14:34:03.610000',2,1),(28,'博客22','这是博客的内容','2019-03-03 14:34:03.635000','2019-03-03 14:34:03.635000',2,1),(29,'博客23','这是博客的内容','2019-03-03 14:34:03.659000','2019-03-03 14:34:03.659000',2,1),(30,'博客24','这是博客的内容','2019-03-03 14:34:03.685000','2019-03-03 14:34:03.685000',2,1),(31,'博客25','这是博客的内容','2019-03-03 14:34:03.710000','2019-03-03 14:34:03.711000',2,1),(32,'博客26','这是博客的内容','2019-03-03 14:34:03.738000','2019-03-03 14:34:03.738000',2,1),(33,'博客27','这是博客的内容','2019-03-03 14:34:03.763000','2019-03-03 14:34:03.763000',2,1),(34,'博客28','这是博客的内容','2019-03-03 14:34:03.788000','2019-03-03 14:34:03.788000',2,1),(35,'博客29','这是博客的内容','2019-03-03 14:34:03.815000','2019-03-03 14:34:03.815000',2,1);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'武侠'),(2,'科幻'),(3,'文学'),(4,'修仙');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-03-03 13:27:32.970000','1','武侠',1,'[{\"added\": {}}]',9,1),(2,'2019-03-03 13:27:48.759000','2','jinyong',1,'[{\"added\": {}}]',4,1),(3,'2019-03-03 13:27:52.200000','1','<blog:天龙八部>',1,'[{\"added\": {}}]',8,1),(4,'2019-03-03 13:28:43.881000','2','科幻',1,'[{\"added\": {}}]',9,1),(5,'2019-03-03 13:28:59.984000','2','<blog:钢铁侠>',1,'[{\"added\": {}}]',8,1),(6,'2019-03-03 13:29:40.240000','3','文学',1,'[{\"added\": {}}]',9,1),(7,'2019-03-03 13:29:52.844000','3','<blog:围城>',1,'[{\"added\": {}}]',8,1),(8,'2019-03-03 13:30:48.267000','4','修仙',1,'[{\"added\": {}}]',9,1),(9,'2019-03-03 13:30:54.452000','4','<blog:元尊>',1,'[{\"added\": {}}]',8,1),(10,'2019-03-03 13:31:12.772000','5','<blog:啊哈哈哈>',1,'[{\"added\": {}}]',8,1),(11,'2019-03-03 13:38:08.834000','1','ReadNum object (1)',1,'[{\"added\": {}}]',10,1),(12,'2019-03-04 12:58:24.890000','1','ReadDetail object (1)',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'article','article'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'blog','blog'),(9,'blog','blogtype'),(10,'blog','readnum'),(5,'contenttypes','contenttype'),(12,'read_statistics','readdetail'),(11,'read_statistics','readnum'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-05 06:28:09.655052'),(2,'auth','0001_initial','2019-03-05 06:28:12.441288'),(3,'admin','0001_initial','2019-03-05 06:28:13.167352'),(4,'admin','0002_logentry_remove_auto_add','2019-03-05 06:28:13.237711'),(5,'admin','0003_logentry_add_action_flag_choices','2019-03-05 06:28:13.274493'),(6,'article','0001_initial','2019-03-05 06:28:13.408300'),(7,'article','0002_auto_20190228_2040','2019-03-05 06:28:14.191049'),(8,'contenttypes','0002_remove_content_type_name','2019-03-05 06:28:14.771693'),(9,'auth','0002_alter_permission_name_max_length','2019-03-05 06:28:15.032355'),(10,'auth','0003_alter_user_email_max_length','2019-03-05 06:28:15.152405'),(11,'auth','0004_alter_user_username_opts','2019-03-05 06:28:15.197260'),(12,'auth','0005_alter_user_last_login_null','2019-03-05 06:28:15.422546'),(13,'auth','0006_require_contenttypes_0002','2019-03-05 06:28:15.431260'),(14,'auth','0007_alter_validators_add_error_messages','2019-03-05 06:28:15.456833'),(15,'auth','0008_alter_user_username_max_length','2019-03-05 06:28:15.704808'),(16,'auth','0009_alter_user_last_name_max_length','2019-03-05 06:28:16.080273'),(17,'blog','0001_initial','2019-03-05 06:28:16.910334'),(18,'blog','0002_auto_20190303_2117','2019-03-05 06:28:17.836561'),(19,'blog','0003_auto_20190303_2155','2019-03-05 06:28:17.961241'),(20,'blog','0004_auto_20190303_2317','2019-03-05 06:28:18.328345'),(21,'read_statistics','0001_initial','2019-03-05 06:28:18.692407'),(22,'read_statistics','0002_readdetail','2019-03-05 06:28:19.121729'),(23,'read_statistics','0003_auto_20190304_2100','2019-03-05 06:28:19.201609'),(24,'sessions','0001_initial','2019-03-05 06:28:19.393411');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('pcsn84a2jcra08en19qbprv37x8tf1gj','N2FlMjhkOTUyM2YxY2Q3ZmRjYWVhYzFhOGI3MmYwMmM5ZTExYjI5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MmQ4NmU3MGE5Y2IxYjg5YTlkODJlNGI2ZGQ0ZWIwNTEzZTcwYTdjIn0=','2019-03-17 15:18:07.976000'),('tj4dn2ivc291x8y875fqkda5pewmsx3c','N2FlMjhkOTUyM2YxY2Q3ZmRjYWVhYzFhOGI3MmYwMmM5ZTExYjI5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MmQ4NmU3MGE5Y2IxYjg5YTlkODJlNGI2ZGQ0ZWIwNTEzZTcwYTdjIn0=','2019-03-17 13:26:37.382000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_statistics_readdetail`
--

DROP TABLE IF EXISTS `read_statistics_readdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `read_statistics_readdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `read_num` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statistics_read_content_type_id_589c7d92_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statistics_read_content_type_id_589c7d92_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_statistics_readdetail`
--

LOCK TABLES `read_statistics_readdetail` WRITE;
/*!40000 ALTER TABLE `read_statistics_readdetail` DISABLE KEYS */;
INSERT INTO `read_statistics_readdetail` VALUES (1,'2019-03-04',10,20,8),(2,'2019-03-04',1,30,8),(3,'2019-03-04',1,2,8);
/*!40000 ALTER TABLE `read_statistics_readdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_statistics_readnum`
--

DROP TABLE IF EXISTS `read_statistics_readnum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `read_statistics_readnum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `read_num` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statistics_read_content_type_id_560f0f39_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statistics_read_content_type_id_560f0f39_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_statistics_readnum`
--

LOCK TABLES `read_statistics_readnum` WRITE;
/*!40000 ALTER TABLE `read_statistics_readnum` DISABLE KEYS */;
INSERT INTO `read_statistics_readnum` VALUES (1,1,5,8),(2,2,34,8),(3,1,3,8),(4,3,35,8),(5,1,1,8),(6,1,31,8),(7,1,20,8),(8,1,30,8),(9,1,2,8);
/*!40000 ALTER TABLE `read_statistics_readnum` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-07 13:19:35
