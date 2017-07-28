-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ptbc_realmd
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pass_hash` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `registration_ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `expansion_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `account_state_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `locale_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `last_local_ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `opcodes_disabled` int(10) unsigned NOT NULL DEFAULT '0',
  `account_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `client_os_version_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK_account_state_id` (`account_state_id`),
  KEY `FK_client_os_version_id` (`client_os_version_id`),
  KEY `FK_expansion_id` (`expansion_id`),
  CONSTRAINT `FK_account_state_id` FOREIGN KEY (`account_state_id`) REFERENCES `account_state` (`account_state_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_client_os_version_id` FOREIGN KEY (`client_os_version_id`) REFERENCES `client_os_version` (`client_os_version_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_expansion_id` FOREIGN KEY (`expansion_id`) REFERENCES `expansion` (`expansion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `account_creation` AFTER INSERT ON `account` FOR EACH ROW BEGIN
    INSERT INTO `account_permissions` (`account_id`, `realm_id`)
        SELECT NEW.`account_id`, `realm_id` FROM realms;
    INSERT INTO `account_support` (`account_id`)
        VALUES (NEW.`account_id`);
    INSERT INTO `account_session` (`account_id`)
        VALUES (NEW.`account_id`);
    INSERT INTO `realm_characters` (`account_id`, `realm_id`)
        SELECT NEW.`account_id`, `realm_id` FROM realms;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `account_friends`
--

DROP TABLE IF EXISTS `account_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_friends` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `friend_id` int(11) unsigned NOT NULL DEFAULT '0',
  `bind_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bring Date',
  `expire_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Expire Date',
  PRIMARY KEY (`id`,`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores accounts for Refer-a-Friend System.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_friends`
--

LOCK TABLES `account_friends` WRITE;
/*!40000 ALTER TABLE `account_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_login`
--

DROP TABLE IF EXISTS `account_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_login` (
  `account_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Id',
  `login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `local_ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `LocId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`,`login_date`),
  CONSTRAINT `FK_account_login_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_login`
--

LOCK TABLES `account_login` WRITE;
/*!40000 ALTER TABLE `account_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_login_old`
--

DROP TABLE IF EXISTS `account_login_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_login_old` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Id',
  `logindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(30) NOT NULL,
  `local_ip` varchar(30) NOT NULL,
  PRIMARY KEY (`id`,`logindate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_login_old`
--

LOCK TABLES `account_login_old` WRITE;
/*!40000 ALTER TABLE `account_login_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_login_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_permissions`
--

DROP TABLE IF EXISTS `account_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_permissions` (
  `account_id` int(10) unsigned NOT NULL,
  `realm_id` int(10) unsigned NOT NULL,
  `permission_mask` bigint(20) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`account_id`,`realm_id`),
  KEY `FK_account_permissions_realm_id` (`realm_id`),
  CONSTRAINT `FK_account_permissions_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_account_permissions_realm_id` FOREIGN KEY (`realm_id`) REFERENCES `realms` (`realm_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_permissions`
--

LOCK TABLES `account_permissions` WRITE;
/*!40000 ALTER TABLE `account_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_punishment`
--

DROP TABLE IF EXISTS `account_punishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_punishment` (
  `account_id` int(10) unsigned NOT NULL,
  `punishment_type_id` tinyint(3) unsigned NOT NULL,
  `punishment_date` int(11) NOT NULL,
  `expiration_date` int(11) NOT NULL,
  `punished_by` varchar(45) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`account_id`,`punishment_type_id`,`punishment_date`),
  KEY `FK_punishment_type_id` (`punishment_type_id`),
  CONSTRAINT `FK_account_punishment_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_punishment_type_id` FOREIGN KEY (`punishment_type_id`) REFERENCES `punishment_type` (`punishment_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_punishment`
--

LOCK TABLES `account_punishment` WRITE;
/*!40000 ALTER TABLE `account_punishment` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_punishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_session`
--

DROP TABLE IF EXISTS `account_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_session` (
  `account_id` int(10) unsigned NOT NULL,
  `session_key` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(80) NOT NULL DEFAULT '',
  `s` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`account_id`),
  CONSTRAINT `FK_account_session_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_session`
--

LOCK TABLES `account_session` WRITE;
/*!40000 ALTER TABLE `account_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_state`
--

DROP TABLE IF EXISTS `account_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_state` (
  `account_state_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`account_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_state`
--

LOCK TABLES `account_state` WRITE;
/*!40000 ALTER TABLE `account_state` DISABLE KEYS */;
INSERT INTO `account_state` VALUES (1,'Active'),(2,'IP locked'),(3,'Frozen');
/*!40000 ALTER TABLE `account_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_support`
--

DROP TABLE IF EXISTS `account_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_support` (
  `account_id` int(10) unsigned NOT NULL,
  `support_points` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`),
  CONSTRAINT `FK_account_support_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_support`
--

LOCK TABLES `account_support` WRITE;
/*!40000 ALTER TABLE `account_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_os_version`
--

DROP TABLE IF EXISTS `client_os_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_os_version` (
  `client_os_version_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`client_os_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_os_version`
--

LOCK TABLES `client_os_version` WRITE;
/*!40000 ALTER TABLE `client_os_version` DISABLE KEYS */;
INSERT INTO `client_os_version` VALUES (0,'Unknown'),(1,'Microsoft Windows'),(2,'Apple Macintosh OSX'),(3,'Custom WoW Chat Client');
/*!40000 ALTER TABLE `client_os_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_banned`
--

DROP TABLE IF EXISTS `email_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_banned` (
  `email` varchar(50) NOT NULL,
  `ban_date` int(11) NOT NULL,
  `banned_by` varchar(16) NOT NULL,
  `ban_reason` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_banned`
--

LOCK TABLES `email_banned` WRITE;
/*!40000 ALTER TABLE `email_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expansion`
--

DROP TABLE IF EXISTS `expansion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expansion` (
  `expansion_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`expansion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expansion`
--

LOCK TABLES `expansion` WRITE;
/*!40000 ALTER TABLE `expansion` DISABLE KEYS */;
INSERT INTO `expansion` VALUES (0,'World of Warcraft'),(1,'World of Warcraft: The Burning Crusade'),(2,'World of Warcraft: Wrath of the Lich King'),(3,'World of Warcraft: Cataclysm');
/*!40000 ALTER TABLE `expansion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_banned` (
  `ip` char(16) NOT NULL,
  `punishment_date` int(11) NOT NULL,
  `expiration_date` int(11) NOT NULL,
  `punished_by` varchar(16) NOT NULL,
  `ban_reason` varchar(100) NOT NULL,
  PRIMARY KEY (`ip`,`punishment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_banned`
--

LOCK TABLES `ip_banned` WRITE;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locale`
--

DROP TABLE IF EXISTS `locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locale` (
  `locale_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locale`
--

LOCK TABLES `locale` WRITE;
/*!40000 ALTER TABLE `locale` DISABLE KEYS */;
INSERT INTO `locale` VALUES (0,'enUS'),(1,'koKR'),(2,'frFR'),(3,'deDE'),(4,'zhCN'),(5,'zhTW'),(6,'esES'),(7,'esMX'),(8,'ruRU');
/*!40000 ALTER TABLE `locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pattern_banned`
--

DROP TABLE IF EXISTS `pattern_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pattern_banned` (
  `pattern_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_pattern` varchar(255) NOT NULL,
  `local_ip_pattern` varchar(255) NOT NULL,
  `comment` char(100) NOT NULL,
  PRIMARY KEY (`pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pattern_banned`
--

LOCK TABLES `pattern_banned` WRITE;
/*!40000 ALTER TABLE `pattern_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `pattern_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punishment_type`
--

DROP TABLE IF EXISTS `punishment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punishment_type` (
  `punishment_type_id` tinyint(3) unsigned NOT NULL,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`punishment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punishment_type`
--

LOCK TABLES `punishment_type` WRITE;
/*!40000 ALTER TABLE `punishment_type` DISABLE KEYS */;
INSERT INTO `punishment_type` VALUES (1,'Account mute'),(2,'Account ban');
/*!40000 ALTER TABLE `punishment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_characters`
--

DROP TABLE IF EXISTS `realm_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_characters` (
  `realm_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `characters_count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `FK_realm_characters_realm_id` (`realm_id`),
  KEY `FK_realm_characters_account_id` (`account_id`),
  CONSTRAINT `FK_realm_characters_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_realm_characters_realm_id` FOREIGN KEY (`realm_id`) REFERENCES `realms` (`realm_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_characters`
--

LOCK TABLES `realm_characters` WRITE;
/*!40000 ALTER TABLE `realm_characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacters_old`
--

DROP TABLE IF EXISTS `realmcharacters_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmcharacters_old` (
  `realmid` int(11) unsigned NOT NULL DEFAULT '0',
  `acctid` bigint(20) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacters_old`
--

LOCK TABLES `realmcharacters_old` WRITE;
/*!40000 ALTER TABLE `realmcharacters_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `realmcharacters_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realms`
--

DROP TABLE IF EXISTS `realms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realms` (
  `realm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '127.0.0.1',
  `port` int(10) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `flags` tinyint(3) unsigned NOT NULL DEFAULT '6' COMMENT 'Supported masks: 0x1 (invalid, not show in realm list), 0x2 (offline, set by core), 0x4 (show version and build), 0x20 (recommended), 0x40 (new players)',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `required_permission_mask` bigint(20) unsigned NOT NULL DEFAULT '1',
  `population` float unsigned NOT NULL DEFAULT '0',
  `allowed_builds` varchar(64) NOT NULL DEFAULT '8606',
  PRIMARY KEY (`realm_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realms`
--

LOCK TABLES `realms` WRITE;
/*!40000 ALTER TABLE `realms` DISABLE KEYS */;
/*!40000 ALTER TABLE `realms` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `realm_creation` AFTER INSERT ON `realms` FOR EACH ROW BEGIN
    INSERT INTO `account_permissions` (`account_id`, `realm_id`)
        SELECT `account_id`, NEW.`realm_id` FROM account;
    INSERT INTO `realm_characters` (`account_id`, `realm_id`)
        SELECT `account_id`, NEW.`realm_id` FROM account;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `unqueue_account`
--

DROP TABLE IF EXISTS `unqueue_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unqueue_account` (
  `accid` int(11) unsigned NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text,
  PRIMARY KEY (`accid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unqueue_account`
--

LOCK TABLES `unqueue_account` WRITE;
/*!40000 ALTER TABLE `unqueue_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `unqueue_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-02  3:33:32
