-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: slsxpt
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `content` text COMMENT '正文',
  `description` text COMMENT '摘要',
  `praise_count` int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `collect_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_article_category_idx` (`category_id`),
  KEY `fk_article_user_idx` (`user_id`),
  CONSTRAINT `fk_article_category_idx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_article_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,29,9,'看的风景和国家开发和国','空间和空间发的和刚看见啥地方和高科技的发挥<br>的风格的发生高科技的复合管会计的发挥<br>看手机的符合国家可说的和高科技','空间和空间发的和刚看见啥地方和高科技的发挥 的风格的发生高科技的复合管会计的发挥',0,0,0,'2015-10-04 03:00:30','2015-10-04 03:00:30'),(3,29,9,'sffsd 上发生地方是否是收到','&nbsp;收到方式收到收到是',' 收到方式收到收到是',0,0,0,'2015-11-20 13:41:57','2015-11-20 13:41:57');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio`
--

DROP TABLE IF EXISTS `audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `resource_url` varchar(128) NOT NULL COMMENT '视频文件路径',
  `praise_count` int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `collect_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audio_category_idx` (`category_id`),
  KEY `fk_audio_user_idx` (`user_id`),
  CONSTRAINT `fk_audio_category_idx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_audio_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio`
--

LOCK TABLES `audio` WRITE;
/*!40000 ALTER TABLE `audio` DISABLE KEYS */;
INSERT INTO `audio` VALUES (7,31,9,'就会加快和地方看见好的妇科国家和地方官','/upload/audio/5a3c84af182fa3bb4ab241cbd6468879.mp3',0,0,0,'2015-10-11 13:36:25','2015-10-11 13:36:25','的风格的发了个健康的房间给快乐的房间管理'),(8,31,9,'珠光宝气','/upload/audio/5a3c84af182fa3bb4ab241cbd6468879.mp3',0,0,0,'2015-11-18 15:56:53','2015-11-18 15:56:53','水电费算法接收到了减肥了');
/*!40000 ALTER TABLE `audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio_qst`
--

DROP TABLE IF EXISTS `audio_qst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio_qst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audio_id` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `answer` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_aq_audio_idx` (`audio_id`),
  CONSTRAINT `fk_aq_audio_idx` FOREIGN KEY (`audio_id`) REFERENCES `audio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_qst`
--

LOCK TABLES `audio_qst` WRITE;
/*!40000 ALTER TABLE `audio_qst` DISABLE KEYS */;
INSERT INTO `audio_qst` VALUES (4,7,'这个沙盘的特征有哪些？','的地方价格放开的了结果来看的房价更快乐的风格','2015-10-11 13:36:25','2015-10-11 13:36:25'),(5,7,'综合你所发现的，你该如何回应给摆沙盘者。','了快递就付款了国家的法律可感觉到了放空管','2015-10-11 13:36:25','2015-10-11 13:36:25'),(6,7,'通过观察沙盘的特征，你的解释是什么？','离开房间打开了国家的法律可关键地方了看过就看了电饭锅','2015-10-11 13:36:25','2015-10-11 13:36:25'),(14,8,'这个沙盘的特征有哪些？','水电费水电费是收到收到','2015-11-18 16:05:06','2015-11-18 16:05:06'),(15,8,'通过观察沙盘的特征，你的解释是什么？','是的发送到发送到收到多少多少是','2015-11-18 16:05:06','2015-11-18 16:05:06'),(16,8,'综合你所发现的，你该如何回应给摆沙盘者。','是的发送到收到多少多少多少多少多少是','2015-11-18 16:05:06','2015-11-18 16:05:06'),(17,8,'是的发送到收到','水电费收到收到收到收到','2015-11-18 16:05:06','2015-11-18 16:05:06'),(18,8,'是的发送到 收到收到','水电费的所发生的收到了房间','2015-11-18 16:05:06','2015-11-18 16:05:06');
/*!40000 ALTER TABLE `audio_qst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `category_id` int(11) DEFAULT NULL,
  `editor` enum('yes','no') NOT NULL DEFAULT 'yes',
  `type` enum('normal','exam','article','video','audio') NOT NULL DEFAULT 'normal',
  `qst_tpl_id` int(11) DEFAULT NULL COMMENT '问答模板ID',
  PRIMARY KEY (`id`),
  KEY `fk_category_category1_idx` (`category_id`),
  KEY `FK_sk1crnd8ps963xjre34sf7gp3` (`qst_tpl_id`),
  CONSTRAINT `FK_sk1crnd8ps963xjre34sf7gp3` FOREIGN KEY (`qst_tpl_id`) REFERENCES `qst_tpl` (`id`),
  CONSTRAINT `fk_category_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'基础理论夯实',0,NULL,'yes','exam',2),(6,'中级技能进阶',0,NULL,'yes','normal',NULL),(7,'实操技能强化',0,NULL,'yes','normal',NULL),(8,'分析倾听音频库',1,7,'yes','exam',NULL),(9,'实操仿真视频库',1,7,'yes','video',1),(16,'自助练习文本库',1,7,'yes','exam',3),(26,'内容反应',1,6,'yes','video',3),(27,'情感反应',1,6,'yes','video',1),(28,'具体化技术',1,6,'yes','audio',NULL),(29,'重复技术',1,6,'yes','article',NULL),(30,'房树人测验',1,6,'yes','article',2),(31,'沙盘实验',1,6,'yes','audio',3),(34,'社区文章',0,NULL,'yes','article',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `type` enum('normal','exam','article','image','audio','video') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collect_user_idx` (`user_id`),
  CONSTRAINT `fk_collect_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `pub` enum('yes','no') NOT NULL DEFAULT 'yes',
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `top` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user1_idx` (`user_id`),
  KEY `fk_comment_project1_idx` (`project_id`),
  CONSTRAINT `fk_comment_project1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `content` text COMMENT '补充',
  `answer` text NOT NULL COMMENT '答案json字符串',
  `test_type` enum('single','multiple','qa','other') NOT NULL DEFAULT 'other',
  `praise_count` int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `collect_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_exam_category_idx` (`category_id`),
  KEY `fk_exam_user_idx` (`user_id`),
  CONSTRAINT `fk_exam_category_idx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_exam_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,4,9,'收到水电费是收到','水电费收到是是是','[]','qa',0,0,0,'2015-11-18 14:41:40','2015-11-18 14:41:40'),(3,4,9,'鼎折覆餗的是收到','水电费收到收到收到反倒是 是','{\"items\":[\"水电费收到收到四大皆空嘂看来\",\"了吉林省的家乐福的设计费\",\"了圣诞节了\",\"拉近了看涉及\"],\"right\":[1,2]}','multiple',0,0,0,'2015-11-18 15:13:46','2015-11-18 15:13:46'),(4,4,9,'影响力最明显的一种影响性技术是#2','','{\"items\":[\"解释 \",\"自我开放 \",\"指导\",\"内容表达\"],\"right\":[2]}','single',0,0,0,'2015-11-20 13:52:40','2015-11-20 13:52:40'),(5,4,9,'影响力最明显的一种影响性技术是#1','','{\"items\":[\"解释\",\"自我开放\",\"指导\",\"内容表达\"],\"right\":[2]}','single',0,0,0,'2015-11-20 13:53:26','2015-11-20 13:53:26'),(6,4,9,'影响力最明显的一种影响性技术是12','','{\"items\":[\"解释 \",\"自我开放\",\"指导\",\"内容表达\"],\"right\":[2]}','single',0,0,0,'2015-11-20 14:24:56','2015-11-20 14:24:56'),(7,4,9,'影响力最明显的一种影响性技术是13','','{\"items\":[\"解释\",\"自我开放\",\"指导\",\"内容表达\"],\"right\":[2]}','single',0,0,0,'2015-11-20 14:25:40','2015-11-20 14:25:40');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_qst`
--

DROP TABLE IF EXISTS `exam_qst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_qst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_eq_exam_idx` (`exam_id`),
  CONSTRAINT `fk_eq_exam_idx` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_qst`
--

LOCK TABLES `exam_qst` WRITE;
/*!40000 ALTER TABLE `exam_qst` DISABLE KEYS */;
INSERT INTO `exam_qst` VALUES (9,1,'这幅画的特征有哪些？','水电费是 是','2015-11-18 15:04:08','2015-11-18 15:04:08'),(10,1,'通过画的特征，你的解释是什么？','水电费收到收到','2015-11-18 15:04:08','2015-11-18 15:04:08'),(11,1,'综合你所发现的，你该如何回应给绘画者?','收到多少收到收到是是是是','2015-11-18 15:04:08','2015-11-18 15:04:08'),(12,1,'东方饭店订单','大概的地方地方地方 ','2015-11-18 15:04:08','2015-11-18 15:04:08'),(13,1,'大范甘迪地方浮动 ？','圣诞节快放假的说了句发了啥鉴定费了','2015-11-18 15:04:08','2015-11-18 15:04:08');
/*!40000 ALTER TABLE `exam_qst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `praise`
--

DROP TABLE IF EXISTS `praise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `praise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `type` enum('normal','exam','article','image','audio','video') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_praise_user_idx` (`user_id`),
  CONSTRAINT `fk_praise_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praise`
--

LOCK TABLES `praise` WRITE;
/*!40000 ALTER TABLE `praise` DISABLE KEYS */;
/*!40000 ALTER TABLE `praise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` text,
  `content` text,
  `type` enum('normal','exam','article','image','audio','video') NOT NULL DEFAULT 'normal',
  `resource_url` varchar(255) DEFAULT NULL,
  `praise_count` int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `collect_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `enable_test` enum('yes','no') NOT NULL DEFAULT 'no',
  `test_type` enum('single','multiple','other') DEFAULT NULL COMMENT '测试类型',
  `answer` text COMMENT '答案，json格式,格式如下,这样设计支持多选\n[\n{"answer":true,"text":"da an nei rong"},\n{"answer":false,"text":"da an nei rong"},\n{"answer":false,"text":"da an nei rong"},\n{"answer":false,"text":"da an nei rong"},\n]\n',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enable_comment` enum('yes','no') NOT NULL DEFAULT 'yes',
  `order_by` int(11) DEFAULT '0',
  `test_count` int(11) NOT NULL DEFAULT '0' COMMENT '测试人数',
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7t3pfhxi3tmfxbcraljg29qvi` (`category_id`),
  CONSTRAINT `FK_7t3pfhxi3tmfxbcraljg29qvi` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,8,'这是题干','这是补充说明','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":false,\"text\":\"的所发生的刚\"},{\"answer\":false,\"text\":\"是大法官的双方各\"},{\"answer\":true,\"text\":\"的双方各收到\"},{\"answer\":false,\"text\":\"是是广泛的发\"}]','2015-07-09 13:27:46','yes',0,0,NULL,NULL),(2,8,'第二题，轻坠','楼上的客户方会计上','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"啥地方开始的恢复会计师的咖啡\"},{\"answer\":true,\"text\":\"孙丹菲广东省高\"},{\"answer\":true,\"text\":\"了贷款卡缴费的烧烤郭德纲\"},{\"answer\":false,\"text\":\"梵蒂冈的非官方的个\"}]','2015-07-09 13:28:25','yes',0,0,NULL,NULL),(3,8,'水电费水电费','<h1>水电费水电费深刻的九分裤上对方会尽快是的粉色的</h1><br><br>孙丹菲离开深刻的放<br>孙丹菲','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"上大方的说法\"},{\"answer\":true,\"text\":\"孙丹菲地方\"},{\"answer\":false,\"text\":\"的非官方的\"},{\"answer\":false,\"text\":\"发给发\"}]','2015-07-09 14:35:47','yes',0,0,NULL,NULL),(4,8,'这个是为什么呢','<ul><li>所说的分公司的</li><li>的说法都是</li><li>的地方</li><li>地方的</li></ul>','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"的风格大方\"},{\"answer\":true,\"text\":\"的风格地方地方\"},{\"answer\":false,\"text\":\"地方地方地方\"},{\"answer\":false,\"text\":\"体育体育\"}]','2015-07-09 14:40:40','yes',0,0,NULL,NULL),(5,8,'这个是为什么呢','<ul><li>所说的分公司的</li><li>的说法都是</li><li>的地方</li><li>地方的</li></ul>','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"的风格大方\"},{\"answer\":true,\"text\":\"的风格地方地方\"},{\"answer\":false,\"text\":\"地方地方地方\"},{\"answer\":false,\"text\":\"天然556756765\"}]','2015-07-09 14:42:14','yes',0,0,NULL,NULL),(6,8,'再来一题如何','好的，没问题','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"这就是答案\"},{\"answer\":false,\"text\":\"这不是答案B\"},{\"answer\":false,\"text\":\"这不是答案C\"},{\"answer\":false,\"text\":\"这不是答案D\"}]','2015-07-10 14:14:05','yes',0,0,NULL,NULL),(7,8,'这是新的试题 是的是的是的是的','是的粉色的国际法的鬼地方是个可尽快的说法韩国','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"广泛的广泛的广泛的\"},{\"answer\":false,\"text\":\"的非官方的个的方法的个\"},{\"answer\":false,\"text\":\"的非官方的个福德宫地方\"},{\"answer\":false,\"text\":\"的法国人特意特然\"}]','2015-07-11 14:44:10','yes',0,0,NULL,NULL),(8,16,'fsdfsdsf','sdfsdfsdffffffffdfdgsdfsdfsdffffffffdfdgsdfsdfsdffffffffdfdgsdfsdfsdffffffffdfdg','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"dfgdfgdfg\"},{\"answer\":false,\"text\":\"fdgdfgerwt43534\"},{\"answer\":false,\"text\":\"45656ttrytr\"},{\"answer\":false,\"text\":\"ytrhthgfhcfdfg\"}]','2015-07-12 07:52:28','yes',0,0,NULL,NULL),(9,8,'这是题干','这是补充说明','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"我了个擦，\"},{\"answer\":true,\"text\":\"为什么会这样呢\"},{\"answer\":false,\"text\":\"水电费的\"},{\"answer\":false,\"text\":\"孙丹菲收到\"}]','2015-07-12 08:28:55','yes',0,0,NULL,NULL),(10,8,'这是题干','这是补充说明','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":false,\"text\":\"的风格风格的风格大方\"},{\"answer\":false,\"text\":\"梵蒂冈梵蒂冈的风格\"},{\"answer\":true,\"text\":\"梵蒂冈梵蒂冈地方\"},{\"answer\":false,\"text\":\"的非官方的个梵蒂冈\"}]','2015-07-12 08:30:18','yes',0,0,NULL,NULL),(11,8,'这是题干','这是补充说明','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"的风格的非官方的个\"},{\"answer\":true,\"text\":\"的非官方的个的非官方的\"},{\"answer\":true,\"text\":\"的法规的法规瑞特人员用\"},{\"answer\":false,\"text\":\"挺容易热一热依然\"}]','2015-07-12 08:31:24','yes',0,0,NULL,NULL),(12,16,'孙丹菲该死的风格收到收到','孙丹菲该死的风格','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"我就不明白了你到底想要什么么\"},{\"answer\":false,\"text\":\"地方的发生个地方\"},{\"answer\":false,\"text\":\"的风格地方\"},{\"answer\":false,\"text\":\"的非官方的个\"}]','2015-07-12 08:42:10','yes',0,0,NULL,NULL),(13,27,'我就不名白','微微i外i诶为i喂喂 &nbsp;','video','/upload/video/d63a86c891a97cd40ce3e12424c51c49.mp4',0,0,0,'no',NULL,NULL,'2015-07-17 09:36:49','yes',0,0,'/upload/thumbnail/d63a86c891a97cd40ce3e12424c51c49.jpg',NULL),(14,27,'我就不名白','微微i外i诶为i喂喂 &nbsp;','video','/upload/video/d63a86c891a97cd40ce3e12424c51c49.mp4',0,0,0,'no',NULL,NULL,'2015-07-17 09:40:46','yes',0,0,'/upload/thumbnail/d63a86c891a97cd40ce3e12424c51c49.jpg',NULL),(15,26,'了加拉加斯了风景撒的发蓝精灵','聊得来会计师的疯狂了估计','video','/upload/video/6f05d4985598160c548e6e8f537247c8.mp4',0,0,0,'no',NULL,NULL,'2015-07-17 10:24:35','yes',0,0,'/upload/thumbnail/6b62ac7780be8d480c3b42fc789d4db2.jpg',NULL),(17,8,'额额个人股的法规的法规','低功耗肉汤圆他人45','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"如何规范和规范和法规和法规和\"},{\"answer\":true,\"text\":\"法规和法规发给发给\"},{\"answer\":false,\"text\":\"法国恢复好发过火发货方\"},{\"answer\":false,\"text\":\"方法好繁华发股份发给发给\"}]','2015-07-17 12:36:32','yes',0,0,NULL,NULL),(18,16,'我就不信了哈','的双方各的双方各是大法官的双方各','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"尔特我让他二\"},{\"answer\":false,\"text\":\"儿童额问题而突然\"},{\"answer\":false,\"text\":\"福德宫发的规范和\"},{\"answer\":false,\"text\":\"放到发局域\"}]','2015-07-17 12:37:52','yes',0,0,NULL,NULL),(19,31,'规范的所说的','的双方各都是发感染他人太让他人突然很发放到放到','audio','/upload/audio/a7054ed0515a34edeec4eb771d84649d.mp3',0,0,0,'no',NULL,NULL,'2015-07-17 12:44:55','yes',0,0,NULL,NULL),(20,29,'了吉林省大机房了跨世纪的老规矩的斯洛伐克赶紧了的哭声房价高了','<h1><a href=\"http://www.cnblogs.com/dqrcsc/p/4655772.html\" target=\"\" rel=\"\">android菜鸟学习笔记29----Android应用向用户发送提示信息的方式总结</a></h1><ul><li>常见的向用户发送提示信息的方式有3种，分别为：1)发送Toast信息2)弹出对话框3)发送通知总结如下：方式1：发送Toast信息：这种方式最简单，在之前的学习中多次使用过。Toast是在一个浮动于应用之上的View中显示信息，显示一定的时间间隔后自动消失，不可获得焦点。最简单的用法就是之前的学习中一直使用的：通过一个静态的makeText()方法返回一个Toast对象，然后调用sho</li><li>的风格w()方法。如：布局文件添加一个Button:</li></ul>','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:44:39','yes',0,0,NULL,'android菜鸟学习笔记29----Android应用向用户发送提示信息的方式'),(21,29,'的双方各都是发过来快圣诞节了开发工具栏的开始放假','<ul><li>第三个的反光镜的，发神经更凉快的水井坊了酷狗了对方就够了看电视剧sd</li><li>了广东省将反光镜的洛杉矶古老的发神经公路局的路口水晶宫了圣诞节反过来看</li><li>；的发生见鬼了会计的说法了更简单了收款方</li><li>凉快的说法金刚狼的健身房了更简单了双方均高</li><li>快高考楼上的机房了高考就上当了反光镜了</li></ul>','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:47:58','yes',0,0,NULL,'第三个的反光镜的，发神经更凉快的水井坊了酷狗了对方就够了看电视剧sd 了广东省将'),(22,30,'放大镜更凉快的说法了快过节了的咖啡机更凉快的水井坊了控股将发大水了科技感的风景谁离开过','的三个楼上的发过来就盯上了快过节了的发生就挂了会计师的发了髋关节的路口房价高了第三方见鬼了会计的了世界观来看<br><ol><li>快过节了的发生就挂了会计师的发了髋关节的路口房价高了第三方见鬼了会计的了世界观来看</li><li>快过节了的发生就挂了会计师的发了髋关节的路口房价高了第三方见鬼了会计的了世界观来看</li><li>快过节了的发生就挂了会计师的发了髋关节的路口房价高了第三方见鬼了会计的了世界观来看</li><li>快过节了的发生就挂了会计师的发了髋关节的路口房价高了第三方见鬼了会计的了世界观来看</li></ol>','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:48:35','yes',0,0,NULL,'的三个楼上的发过来就盯上了快过节了的发生就挂了会计师的发了髋关节的路口房价高了第'),(23,30,'梵蒂冈梵蒂冈的挂号费的和规范化','快的说法国际化的开始讲风格和会计和的发生过<br>的风景上两个激烈的发神经l的浪费水晶宫了看见对方<br>的发神经更凉快的风景谁离开估计快了d<br>的哭声分公司的fgreiwtgfdsfghkdjfs','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:49:05','yes',0,0,NULL,'快的说法国际化的开始讲风格和会计和的发生过 的风景上两个激烈的发神经l的浪费水晶'),(24,30,'额外热热帖呀让他和方法女不能更好的法规和','是梵蒂冈孙丹菲该死的风格都是经费的假两件的谁','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:50:15','yes',0,0,NULL,'是梵蒂冈孙丹菲该死的风格都是经费的假两件的谁'),(25,30,'的双方各是的非官方的谁干的少发广告发生的个','<ol><li>的发生该发生感染他很反<b>感合肥的规划</b></li><li><b><br></b></li><li><b><br></b></li><li><b><br></b></li><li><b>的发生该发生感染他很反<span class=\"wysiwyg-color-red\">感合肥的规划法规和规范和地方&nbsp;</span></b><span><b><span class=\"wysiwyg-color-red\">的发生该发生感染他<br><br>好几个和经费和规范环境<br>很反感合肥的</span>规划法规和规范和</b>地方&nbsp;</span></li></ol><br>非官方的树干上的风格孙丹菲<br><ol><li>就了第三方见鬼了会计的发生了看过就疯狂的了睡</li><li>陆地上就发个链接的了三方工具惹你狗了的份上就赶快了</li><li>的风格地方谁跟谁的感染过</li></ol>','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:51:20','yes',0,0,NULL,'的发生该发生感染他很反感合肥的规划 的发生该发生感染他很反感合肥的规划法规和规范'),(26,29,'的非官方的谁勾搭上了金刚经当上了髋关节的法律上会计','的发生过的发生过的双方均过路口发生的金刚狼的风景受够了<br>将第三方离开家更凉快打飞机更快乐简单来说开复工IE加我ijgfdlkjdfljg &nbsp;<br>两个<br>的双方各扣篮大赛风景咯咯IE网购i人的烦恼赶快的技能<br>的了罚款水晶宫快乐的健身房了客观讲<br><br>的发生了看过就凉快的深加工了发神经的<br><b>的房价高了经费的说了句</b><br><b>洛杉矶了罚款讲的是快乐方</b>','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:51:52','yes',0,0,NULL,'的发生过的发生过的双方均过路口发生的金刚狼的风景受够了 将第三方离开家更凉快打飞'),(27,29,' 的双方各的发生过的非官方的的符合法规和规范V承包，出校门，吧','的双方各收到发过了开始的见鬼了肯德基发过了鬼地方个的说法<br><span>各收到发过了开始的见鬼了肯德基发过了鬼地方个的说法<br></span><span>各收到发过了开始的见鬼了肯德基发过了鬼地方个的说法<br></span><span>各收到发过了开始的见鬼了肯德基发过了鬼地方个的说法<br></span>各收到发过了开始的见鬼了肯德基发过了鬼地方个的说法<br>','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:52:14','yes',0,0,NULL,'的双方各收到发过了开始的见鬼了肯德基发过了鬼地方个的说法 各收到发过了开始的见鬼'),(28,29,'的双方各收到法规发生的官方给','<h1>的分公司的广东省法规的双方各军绿色的见鬼了会计的了疯狂世界观来看的双方均高</h1><h1><u><br></u>了地方开始加干辣椒的发了水果机</h1><h1><u><br></u>流口水的反光镜的发生了赶紧了开放的</h1><h1><br></h1><h1>就凉快的说法见鬼了会计的发生了客观讲</h1><h1><u><br></u>老公的复式结构i如饿哦IE发的啥看法和高科技的说法&nbsp;</h1><br><br>','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:52:58','yes',0,0,NULL,'的分公司的广东省法规的双方各军绿色的见鬼了会计的了疯狂世界观来看的双方均高 了地'),(29,29,'讽德诵功发生的广泛的三个发生的工地上干','的分公司的非官方的广泛的法规和方法的和东方红','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:53:13','yes',0,0,NULL,'的分公司的非官方的广泛的法规和方法的和东方红'),(30,30,'上的风格的说法赶得上法规发生的国防生的刚','<blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote>的发生过的双方各都是分<span class=\"wysiwyg-color-red\">公司的分公司的广泛孙丹菲该死的风格是<br></span></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote><ul><li><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><span class=\"wysiwyg-color-red\"><b>sakdhfksahdf</b></span></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></li><li><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><span class=\"wysiwyg-color-red\"><b>拉伸的减肥了撒娇的放两块</b></span></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></li><li><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><span class=\"wysiwyg-color-red\"><b>了大</b><b>神就浪费凯撒的解放路口见撒旦法</b></span></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></li><li><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><blockquote><span class=\"wysiwyg-color-red\"><b>大厦疯狂的减肥韩国尽快发货的思考规划</b></span></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></blockquote></li></ul><span class=\"wysiwyg-color-red\"><br></span>','article',NULL,0,0,0,'no',NULL,NULL,'2015-07-17 13:53:32','yes',0,0,NULL,'的发生过的双方各都是分公司的分公司的广泛孙丹菲该死的风格是'),(31,16,'111SD卡发货速度快解放和会计师的疯狂','<ul><li><span class=\"wysiwyg-color-red\">SD卡罚款酒红色的会计和会计法规和会计的废话说赶快交水电</span></li><li><span class=\"wysiwyg-color-red\">费和高考较好的是会计法规和</span></li></ul>','exam',NULL,0,0,0,'no',NULL,'[{\"answer\":true,\"text\":\"孙丹菲国防生的广东省法国大使馆\"},{\"answer\":false,\"text\":\"孙丹菲赶得上鬼地方谁跟谁梵蒂冈\"},{\"answer\":false,\"text\":\"孙丹菲高耸的共同惹他依然依然规范化\"},{\"answer\":false,\"text\":\"的规划的法规和法规和他人也让他呀\"}]','2015-07-19 11:32:21','yes',0,0,NULL,NULL),(32,26,'发生的广东省法规的发生过','的双方各的风格让外国人通过他人规范办官方','video','/upload/video/9ca53f3a670fce70194c43ea082a9e3e.mp4',0,0,0,'no',NULL,NULL,'2015-07-19 11:34:06','yes',0,0,'/upload/thumbnail/9ca53f3a670fce70194c43ea082a9e3e.jpg',NULL),(33,27,'的风格的发生过的法规的法规','的发生过的风格的凤凰和法规和','video','/upload/video/c799034b0e0ec4f3bb60297e057f7268.mp4',0,0,0,'no',NULL,NULL,'2015-07-19 11:40:03','yes',0,0,'/upload/thumbnail/c799034b0e0ec4f3bb60297e057f7268.jpg',NULL),(34,28,'说的法规的法规的法规法规','的法规和合肥的话费和规范化和钢结构风景','audio','/upload/audio/f22c102b9a6d7cff868e27fe7b8e3798.mp3',0,0,0,'no',NULL,NULL,'2015-07-19 11:40:25','yes',0,0,NULL,NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_tpl`
--

DROP TABLE IF EXISTS `qst_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_tpl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '模板名称',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_tpl`
--

LOCK TABLES `qst_tpl` WRITE;
/*!40000 ALTER TABLE `qst_tpl` DISABLE KEYS */;
INSERT INTO `qst_tpl` VALUES (1,'五种技术','2015-10-07 05:57:10','0000-00-00 00:00:00'),(2,'房树人三个问题','2015-10-07 05:57:10','0000-00-00 00:00:00'),(3,'沙盘三个问题','2015-10-07 06:03:06','0000-00-00 00:00:00'),(4,'威尔而3','2015-11-15 10:26:03','2015-11-15 10:26:03'),(5,'水电费水电费2','2015-11-15 10:31:03','2015-11-15 10:31:03'),(8,'防守打法3','2015-11-15 10:42:46','2015-11-15 10:42:46'),(9,'水电费水电费','2015-11-15 10:47:51','2015-11-15 10:47:51'),(11,'防守打法谁说的收到','2015-11-15 11:24:51','2015-11-15 11:24:51');
/*!40000 ALTER TABLE `qst_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst_tpl_item`
--

DROP TABLE IF EXISTS `qst_tpl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qst_tpl_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qst_tpl_id` int(11) NOT NULL COMMENT '所属模板',
  `title` varchar(255) NOT NULL COMMENT '题干',
  `answer` text COMMENT '参考',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_s3er6p0qyruif3siu8wo43v1g` (`qst_tpl_id`),
  CONSTRAINT `FK_s3er6p0qyruif3siu8wo43v1g` FOREIGN KEY (`qst_tpl_id`) REFERENCES `qst_tpl` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst_tpl_item`
--

LOCK TABLES `qst_tpl_item` WRITE;
/*!40000 ALTER TABLE `qst_tpl_item` DISABLE KEYS */;
INSERT INTO `qst_tpl_item` VALUES (1,1,'若使用重复技术技术，你可能的回应是？','','2015-10-07 06:00:41','0000-00-00 00:00:00'),(2,1,'若使用内容反应技术技术，你可能的回应是？','','2015-10-07 06:00:41','0000-00-00 00:00:00'),(3,1,'若使用情感反应技术技术，你可能的回应是？','','2015-10-07 06:00:41','0000-00-00 00:00:00'),(4,1,'若使用具体化技术技术，你可能的回应是？','','2015-10-07 06:00:41','0000-00-00 00:00:00'),(5,1,'若使用共情技术技术，你可能的回应是？','','2015-10-07 06:00:41','0000-00-00 00:00:00'),(6,2,'这幅画的特征有哪些？','','2015-10-07 06:02:19','0000-00-00 00:00:00'),(7,2,'通过画的特征，你的解释是什么？','','2015-10-07 06:02:19','0000-00-00 00:00:00'),(8,2,'综合你所发现的，你该如何回应给绘画者?','','2015-10-07 06:02:19','0000-00-00 00:00:00'),(9,3,'这个沙盘的特征有哪些？','','2015-10-07 06:03:58','0000-00-00 00:00:00'),(10,3,'通过观察沙盘的特征，你的解释是什么？','','2015-10-07 06:03:58','0000-00-00 00:00:00'),(11,3,'综合你所发现的，你该如何回应给摆沙盘者。','','2015-10-07 06:03:58','0000-00-00 00:00:00'),(14,9,'水电费的说法','水电费水电费水电费','2015-11-15 10:47:52','2015-11-15 10:47:52'),(15,9,'是的发送到','水电费','2015-11-15 10:47:52','2015-11-15 10:47:52'),(28,8,'额外人味儿','玩儿玩儿为','2015-11-15 11:24:31','2015-11-15 11:24:31'),(29,8,'玩儿玩儿玩儿','玩儿玩儿玩儿玩儿','2015-11-15 11:24:31','2015-11-15 11:24:31'),(30,8,'大范甘迪  浮动','地方地方地方','2015-11-15 11:24:31','2015-11-15 11:24:31'),(32,11,'水电费是收到多少','胜多负少收到方式反倒是','2015-11-18 09:17:41','2015-11-18 09:17:41'),(33,11,'快速的健康房间开啥地方','了坚实的了福建路上的减肥路上的减肥','2015-11-18 09:17:41','2015-11-18 09:17:41');
/*!40000 ALTER TABLE `qst_tpl_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL COMMENT '标签名词',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_select`
--

DROP TABLE IF EXISTS `tag_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_select` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `tag_select_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `tag_select_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_select`
--

LOCK TABLES `tag_select` WRITE;
/*!40000 ALTER TABLE `tag_select` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `answer` text NOT NULL COMMENT '用户作答，json格式',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_test_project1_idx` (`project_id`),
  KEY `fk_user_test_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_test_project1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_test_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `gold` int(11) DEFAULT '0',
  `progress` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `type` enum('customer','admin','root') NOT NULL DEFAULT 'customer',
  `avatar` varchar(64) DEFAULT NULL,
  `clazz` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `FK_a4bhkx01s72ifnp31kr6a3220` (`college_id`),
  CONSTRAINT `FK_a4bhkx01s72ifnp31kr6a3220` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'admin888','7ca9d77f852e7205d74f7e91bbc5d40d','72acf2e2e5ff4f17882b4173832fa43f',NULL,0,0,'2015-06-28 08:29:32','2015-06-28 08:29:32','lvyahui8@126.com',NULL,'','admin','/upload/images/a25e2626494beb2a0d1f27b28a2032f0.jpg',NULL,NULL,NULL),(9,'lvyahui','00b25acc721a6989148fd2491233a71a','3464b746e8c44ff9b97c20826cf05348',NULL,0,0,'2015-06-28 14:32:25','2015-06-28 14:32:25','lvyahui6@163.com',NULL,'3340b609ed484d29b3d0da38802afc7a','root','/upload/images/a45b0f9c27ff4ce94a259a5d5961e810.jpg',NULL,NULL,NULL),(10,'devlyh','f9ad039fbe35fcedcf5482f7ca587d1b','5effef4761b840a29c70839f0279f5e6',NULL,0,0,'2015-07-19 11:57:03','2015-07-19 11:57:03','devlyh@163.com',NULL,'','customer',NULL,NULL,NULL,NULL),(12,'admin','b757da264780a87e7ef4bbcb75892f91','b5b3beef23de482886603d518d76338e',NULL,0,0,'2015-10-04 06:52:44','2015-10-04 06:52:44','1257069082@qq.com',NULL,'c5ee63af5e7347ff942650739fc645d5','customer',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL COMMENT '标题',
  `content` text COMMENT '补充',
  `resource_url` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `praise_count` int(11) NOT NULL DEFAULT '0' COMMENT '赞同数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `collect_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_video_category_idx` (`category_id`),
  KEY `fk_video_user_idx` (`user_id`),
  CONSTRAINT `fk_video_category_idx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_video_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (12,26,9,'的空间和国家开发的后果','快解放和高科技的复合管会计的收费高科技的恢复快关机','/upload/video/2da7c9260c2ca837e70668975aeae51d.mp4','/upload/thumbnail/2da7c9260c2ca837e70668975aeae51d.jpg',0,0,0,'2015-10-05 02:17:10','2015-10-05 02:17:10'),(13,26,9,'的非官方大哥大法官电饭锅','的风格的风格的风格的发个梵蒂冈','/upload/video/a20fc040156863d1fd1959ef2a2bb609.mp4','/upload/thumbnail/a20fc040156863d1fd1959ef2a2bb609.jpg',0,0,0,'2015-10-05 06:23:33','2015-10-05 06:23:33'),(14,27,9,'的反馈结果看见的风格化','的方法的鬼地方个梵蒂冈','/upload/video/8ef7926a6ca471a2a287907b5ff9bc78.mp4','/upload/thumbnail/8ef7926a6ca471a2a287907b5ff9bc78.jpg',0,0,0,'2015-10-05 07:28:40','2015-10-05 07:28:40'),(16,27,9,'的风格的风格的风格','的风格的风格风格合法化','/upload/video/2da7c9260c2ca837e70668975aeae51d.mp4','/upload/thumbnail/2da7c9260c2ca837e70668975aeae51d.jpg',0,0,0,'2015-10-08 12:38:06','2015-10-08 12:38:06'),(17,27,9,'说的梵蒂冈梵蒂冈梵蒂冈','的发个梵蒂冈大概地方浮动浮动','/upload/video/8ef7926a6ca471a2a287907b5ff9bc78.mp4','/upload/thumbnail/8ef7926a6ca471a2a287907b5ff9bc78.jpg',0,0,0,'2015-10-09 13:21:26','2015-10-09 13:21:26'),(19,26,9,'是德国的沙发看见过了高房价','家里的房间了看法的结果了客服的感觉','/upload/video/396e1acbd90058bf99eaabd33eba8c65.mp4','/upload/thumbnail/396e1acbd90058bf99eaabd33eba8c65.jpg',0,0,0,'2015-10-09 13:49:51','2015-10-09 13:49:51'),(20,27,9,'快速的减肥了几声','收到付款时间的发生的回复可见是东方红','/upload/video/a20fc040156863d1fd1959ef2a2bb609.mp4','/upload/thumbnail/a20fc040156863d1fd1959ef2a2bb609.jpg',0,0,0,'2015-10-11 14:22:55','2015-10-11 14:22:55'),(21,27,9,'收到反馈给快递发国际旅客的法国家乐福的价格','立刻就疯了快点击快乐的房间给快乐的房价高','/upload/video/a20fc040156863d1fd1959ef2a2bb609.mp4','/upload/thumbnail/a20fc040156863d1fd1959ef2a2bb609.jpg',0,0,0,'2015-10-11 14:23:29','2015-10-11 14:23:29'),(22,27,9,'地方规定了房间给旅客的房价高','的地方了开关机了看法点击开发了个','/upload/video/69b3882c664642f7f033597efc461d9b.mp4','/upload/thumbnail/69b3882c664642f7f033597efc461d9b.jpg',0,0,0,'2015-10-11 14:23:54','2015-10-11 14:23:54');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_qst`
--

DROP TABLE IF EXISTS `video_qst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_qst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `title` varchar(64) NOT NULL COMMENT '问题',
  `answer` varchar(64) NOT NULL COMMENT '解答',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_video_qst_video_idx` (`video_id`),
  CONSTRAINT `fk_video_qst_video_idx` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_qst`
--

LOCK TABLES `video_qst` WRITE;
/*!40000 ALTER TABLE `video_qst` DISABLE KEYS */;
INSERT INTO `video_qst` VALUES (10,12,'hello?','yes','2015-10-05 02:17:10',NULL),(11,12,'sex?','man','2015-10-05 02:17:10',NULL),(12,12,'birthy?','77','2015-10-05 02:17:10',NULL),(13,13,'的发个梵蒂冈地方','的发个梵蒂冈','2015-10-05 06:23:33',NULL),(14,13,'的发个梵蒂冈','的非官方大','2015-10-05 06:23:33',NULL),(15,13,'发货发货方内部女伴','人锐意哦哦好好好好好好好好好好好好好好好好好好好ijhjgfkhjkfgjkfd','2015-10-05 06:23:33',NULL),(16,14,'电饭锅','法规和法国dsfdsfsdf','2015-10-05 07:28:40',NULL),(17,14,'返回分',' 返回分','2015-10-05 07:28:40',NULL),(18,14,'法规和法国','返回','2015-10-05 07:28:40',NULL),(19,16,'若使用情感反应技术技术，你可能的回应是？','的说法个地方官g发郭德纲电饭锅电饭锅','2015-10-08 12:38:06',NULL),(20,16,'若使用重复技术技术，你可能的回应是？','的非官方的风格化sdfgsdfgdsf的发个梵蒂冈','2015-10-08 12:38:06',NULL),(21,16,'若使用共情技术技术，你可能fg的回应是？','发的规划费的话梵蒂冈dfgdfgdfg','2015-10-08 12:38:06',NULL),(22,16,'若使用具体化技术技术，你可能的回应是？','发的合法的合法的话发的股份的规定发给浮动','2015-10-08 12:38:06',NULL),(23,16,'若使用内容反应技术技术，你可能的回应是？','的复合肥的话法国恢复和爸爸vcdfg','2015-10-08 12:38:06',NULL),(59,17,'若使用情感反应技术技术，你可能的回应是？','的发个梵蒂冈梵蒂冈浮动大概大概','2015-10-09 13:21:26',NULL),(60,17,'若使用重复技术技术，你可能的回应是？',' 的非官方的个地方官地方给出vbvc','2015-10-09 13:21:26',NULL),(61,17,'若使用共情技术技术，你可能的回应是？','的非官方大哥大法官','2015-10-09 13:21:26',NULL),(62,17,'若使用具体化技术技术，你可能的回应是？','的发个梵蒂冈大概地方','2015-10-09 13:21:26',NULL),(63,17,'若使用内容反应技术技d术，你可能的回应是？','的发个梵蒂冈大概地方给对方改的分','2015-10-09 13:21:26',NULL),(69,19,'这个沙盘的特征有哪些？','的福克斯的疯狂的手机话费梵蒂冈梵蒂冈地方','2015-10-09 13:49:51',NULL),(70,19,'综合你所发现的，你该如何回应给摆沙盘者。','快恢复的空间和健康的法规和空间发的规划的非官方的','2015-10-09 13:49:51',NULL),(71,19,'通过观察沙盘的特征，你的解释是什么？','和空间的返回给空间发的和高科技的发个梵蒂冈','2015-10-09 13:49:51',NULL),(72,20,'若使用情感反应技术技术，你可能的回应是？','水电费水电费水电费','2015-10-11 14:22:55',NULL),(73,20,'若使用重复技术技术，你可能的回应是？','睡觉了快递发几个了快递发给','2015-10-11 14:22:55',NULL),(74,20,'若使用共情技术技术，你可能的回应是？','地方的发个梵蒂冈地方','2015-10-11 14:22:55',NULL),(75,20,'若使用具体化技术技术，你可能的回应是？','水电费水电费水电费水电费','2015-10-11 14:22:55',NULL),(76,20,'若使用内容反应技术技术，你可能的回应是？','电饭锅电饭锅快递反馈给健康的风格','2015-10-11 14:22:55',NULL),(77,21,'若使用情感反应技术技术，你可能的回应是？','说的地方了空间看了梵蒂冈','2015-10-11 14:23:29',NULL),(78,21,'若使用重复技术技术，你可能的回应是？','家乐福的结果了客服的经理看妇科的价格','2015-10-11 14:23:29',NULL),(79,21,'若使用共情技术技术，你可能的回应是？','了空间发的快乐感觉到了反馈给甲方大哥好好好好好好好iodufg','2015-10-11 14:23:29',NULL),(80,21,'若使用具体化技术技术，你可能的回应是？','的房间了开房间的观看了饭店国际饭店','2015-10-11 14:23:29',NULL),(81,21,'若使用内容反应技术技术，你可能的回应是？','立即离开的房间给快乐的房价高了快递发给','2015-10-11 14:23:29',NULL),(92,22,'若使用情感反应技术技术，你可能的回应是？','说的地方进口高科技的复合机梵蒂冈','2015-11-18 15:37:58',NULL),(93,22,'若使用重复技术技术，你可能的回应是？','空间的发挥空间和地方科技规划空间梵蒂冈','2015-11-18 15:37:58',NULL),(94,22,'若使用共情技术技术，你可能的回应是？','空间的发挥高科技的复合管会计梵蒂冈','2015-11-18 15:37:58',NULL),(95,22,'若使用具体化技术技术，你可能的回应是？','空间和地方科技规划空间的风格','2015-11-18 15:37:58',NULL),(96,22,'地方是收到是收到是是','水电费算法是是','2015-11-18 15:37:58',NULL),(97,22,'浮动地方浮动浮动浮动','地方地方浮动浮动地方浮动的','2015-11-18 15:37:58',NULL);
/*!40000 ALTER TABLE `video_qst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `type` enum('normal','exam','article','image','audio','video') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_view_user_idx` (`user_id`),
  CONSTRAINT `fk_view_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

LOCK TABLES `view` WRITE;
/*!40000 ALTER TABLE `view` DISABLE KEYS */;
/*!40000 ALTER TABLE `view` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-04 17:10:01
