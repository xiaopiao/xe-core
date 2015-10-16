# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.25)
# Database: uitest
# Generation Time: 2015-10-16 07:10:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table xe_action_forward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_action_forward`;

CREATE TABLE `xe_action_forward` (
  `act` varchar(80) NOT NULL,
  `module` varchar(60) NOT NULL,
  `type` varchar(15) NOT NULL,
  UNIQUE KEY `idx_foward` (`act`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_action_forward` WRITE;
/*!40000 ALTER TABLE `xe_action_forward` DISABLE KEYS */;

INSERT INTO `xe_action_forward` (`act`, `module`, `type`)
VALUES
	('atom','rss','view'),
	('IS','integration_search','view'),
	('rss','rss','view');

/*!40000 ALTER TABLE `xe_action_forward` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_addons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_addons`;

CREATE TABLE `xe_addons` (
  `addon` varchar(250) NOT NULL,
  `is_used` char(1) NOT NULL DEFAULT 'Y',
  `is_used_m` char(1) NOT NULL DEFAULT 'N',
  `is_fixed` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`addon`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_addons_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_addons_site`;

CREATE TABLE `xe_addons_site` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `addon` varchar(250) NOT NULL,
  `is_used` char(1) NOT NULL DEFAULT 'Y',
  `is_used_m` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_addon_site` (`site_srl`,`addon`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_addons_site` WRITE;
/*!40000 ALTER TABLE `xe_addons_site` DISABLE KEYS */;

INSERT INTO `xe_addons_site` (`site_srl`, `addon`, `is_used`, `is_used_m`, `extra_vars`, `regdate`)
VALUES
	(0,'autolink','Y','N',NULL,'20151006062112'),
	(0,'blogapi','N','N',NULL,'20151006062112'),
	(0,'member_communication','Y','N',NULL,'20151006062112'),
	(0,'member_extra_info','Y','N',NULL,'20151006062112'),
	(0,'mobile','Y','N',NULL,'20151006062112'),
	(0,'openid_delegation_id','N','N',NULL,'20151006062112'),
	(0,'point_level_icon','N','N',NULL,'20151006062112'),
	(0,'resize_image','Y','N',NULL,'20151006062112');

/*!40000 ALTER TABLE `xe_addons_site` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_admin_favorite
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_admin_favorite`;

CREATE TABLE `xe_admin_favorite` (
  `admin_favorite_srl` bigint(11) NOT NULL,
  `site_srl` bigint(11) DEFAULT '0',
  `module` varchar(80) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_favorite_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_admin_log`;

CREATE TABLE `xe_admin_log` (
  `ipaddress` varchar(100) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `site_srl` bigint(11) DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `act` varchar(100) DEFAULT NULL,
  `request_vars` text,
  KEY `idx_admin_ip` (`ipaddress`),
  KEY `idx_admin_date` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_ai_installed_packages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_ai_installed_packages`;

CREATE TABLE `xe_ai_installed_packages` (
  `package_srl` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  `current_version` varchar(255) DEFAULT NULL,
  `need_update` char(1) DEFAULT 'N',
  KEY `idx_package_srl` (`package_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_ai_remote_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_ai_remote_categories`;

CREATE TABLE `xe_ai_remote_categories` (
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`category_srl`),
  KEY `idx_parent_srl` (`parent_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_autoinstall_packages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_autoinstall_packages`;

CREATE TABLE `xe_autoinstall_packages` (
  `package_srl` bigint(11) NOT NULL DEFAULT '0',
  `category_srl` bigint(11) DEFAULT '0',
  `path` varchar(250) NOT NULL,
  `have_instance` char(1) NOT NULL DEFAULT 'N',
  `updatedate` varchar(14) DEFAULT NULL,
  `latest_item_srl` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  UNIQUE KEY `unique_path` (`path`),
  KEY `idx_package_srl` (`package_srl`),
  KEY `idx_category_srl` (`category_srl`),
  KEY `idx_regdate` (`updatedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_comment_declared
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_comment_declared`;

CREATE TABLE `xe_comment_declared` (
  `comment_srl` bigint(11) NOT NULL,
  `declared_count` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_srl`),
  KEY `idx_declared_count` (`declared_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_comment_declared_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_comment_declared_log`;

CREATE TABLE `xe_comment_declared_log` (
  `comment_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_comment_srl` (`comment_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_comment_voted_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_comment_voted_log`;

CREATE TABLE `xe_comment_voted_log` (
  `comment_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `point` bigint(11) NOT NULL,
  KEY `idx_comment_srl` (`comment_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_comments`;

CREATE TABLE `xe_comments` (
  `comment_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(11) NOT NULL DEFAULT '0',
  `is_secret` char(1) NOT NULL DEFAULT 'N',
  `content` longtext NOT NULL,
  `voted_count` bigint(11) NOT NULL DEFAULT '0',
  `blamed_count` bigint(11) NOT NULL DEFAULT '0',
  `notify_message` char(1) NOT NULL DEFAULT 'N',
  `password` varchar(60) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `homepage` varchar(250) NOT NULL,
  `uploaded_count` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `status` bigint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`comment_srl`),
  UNIQUE KEY `idx_module_list_order` (`module_srl`,`list_order`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_voted_count` (`voted_count`),
  KEY `idx_blamed_count` (`blamed_count`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_uploaded_count` (`uploaded_count`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_list_order` (`list_order`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_comments` WRITE;
/*!40000 ALTER TABLE `xe_comments` DISABLE KEYS */;

INSERT INTO `xe_comments` (`comment_srl`, `module_srl`, `document_srl`, `parent_srl`, `is_secret`, `content`, `voted_count`, `blamed_count`, `notify_message`, `password`, `user_id`, `user_name`, `nick_name`, `member_srl`, `email_address`, `homepage`, `uploaded_count`, `regdate`, `last_update`, `ipaddress`, `list_order`, `status`)
VALUES
	(362,65,359,0,'N','<p>Board1 노티스 댓글</p>',0,0,'N',NULL,'admin','admin','Admin',4,'admin@admin.net','',0,'20151013180311','20151013180311','127.0.0.1',-363,1),
	(368,65,365,0,'N','<p>Board1 일반글 댓글</p>',0,0,'N',NULL,'admin','admin','Admin',4,'admin@admin.net','',0,'20151013180345','20151013180345','127.0.0.1',-369,1),
	(394,65,392,0,'N','<p>보내드립니다.</p>',0,0,'N',NULL,'admin','admin','Admin',4,'admin@admin.net','',0,'20151016160546','20151016160546','127.0.0.1',-395,1),
	(397,65,392,394,'N','<p>감사합니다</p>',0,0,'N',NULL,'user_id','user_name','nick_name',268,'email@domain.com','',0,'20151016160555','20151016160555','192.168.0.1',-398,1),
	(400,65,393,0,'N','<p>안보이는데요?</p>',0,0,'N',NULL,'user_id','user_name','nick_name',268,'email@domain.com','',0,'20151016160603','20151016160603','192.168.0.1',-401,1),
	(403,65,393,400,'N','<p>기분 탓입니다.</p>',0,0,'N',NULL,'admin','admin','Admin',4,'admin@admin.net','',0,'20151016160615','20151016160615','127.0.0.1',-404,1);

/*!40000 ALTER TABLE `xe_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_comments_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_comments_list`;

CREATE TABLE `xe_comments_list` (
  `comment_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `head` bigint(11) NOT NULL DEFAULT '0',
  `arrange` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `depth` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_srl`),
  KEY `idx_list` (`document_srl`,`head`,`arrange`),
  KEY `idx_date` (`module_srl`,`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_comments_list` WRITE;
/*!40000 ALTER TABLE `xe_comments_list` DISABLE KEYS */;

INSERT INTO `xe_comments_list` (`comment_srl`, `document_srl`, `head`, `arrange`, `module_srl`, `regdate`, `depth`)
VALUES
	(362,359,362,362,65,'20151013180311',0),
	(368,365,368,368,65,'20151013180345',0),
	(394,392,394,394,65,'20151016160546',0),
	(397,392,394,397,65,'20151016160555',1),
	(400,393,400,400,65,'20151016160603',0),
	(403,393,400,403,65,'20151016160615',1);

/*!40000 ALTER TABLE `xe_comments_list` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_counter_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_counter_log`;

CREATE TABLE `xe_counter_log` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `ipaddress` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `user_agent` varchar(250) DEFAULT NULL,
  KEY `idx_site_counter_log` (`site_srl`,`ipaddress`),
  KEY `idx_counter_log` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_counter_site_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_counter_site_status`;

CREATE TABLE `xe_counter_site_status` (
  `site_srl` bigint(11) NOT NULL,
  `regdate` bigint(11) NOT NULL,
  `unique_visitor` bigint(11) DEFAULT '0',
  `pageview` bigint(11) DEFAULT '0',
  UNIQUE KEY `site_status` (`site_srl`,`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_counter_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_counter_status`;

CREATE TABLE `xe_counter_status` (
  `regdate` bigint(11) NOT NULL,
  `unique_visitor` bigint(11) DEFAULT '0',
  `pageview` bigint(11) DEFAULT '0',
  PRIMARY KEY (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_document_aliases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_aliases`;

CREATE TABLE `xe_document_aliases` (
  `alias_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `alias_title` varchar(250) NOT NULL,
  PRIMARY KEY (`alias_srl`),
  UNIQUE KEY `idx_module_title` (`module_srl`,`alias_title`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_alias_title` (`alias_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_document_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_categories`;

CREATE TABLE `xe_document_categories` (
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `parent_srl` bigint(12) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `expand` char(1) DEFAULT 'N',
  `document_count` bigint(11) NOT NULL DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  `group_srls` text,
  `color` varchar(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_document_declared
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_declared`;

CREATE TABLE `xe_document_declared` (
  `document_srl` bigint(11) NOT NULL,
  `declared_count` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_srl`),
  KEY `idx_declared_count` (`declared_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_document_declared` WRITE;
/*!40000 ALTER TABLE `xe_document_declared` DISABLE KEYS */;

INSERT INTO `xe_document_declared` (`document_srl`, `declared_count`)
VALUES
	(389,1);

/*!40000 ALTER TABLE `xe_document_declared` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_document_declared_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_declared_log`;

CREATE TABLE `xe_document_declared_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_document_declared_log` WRITE;
/*!40000 ALTER TABLE `xe_document_declared_log` DISABLE KEYS */;

INSERT INTO `xe_document_declared_log` (`document_srl`, `member_srl`, `ipaddress`, `regdate`)
VALUES
	(389,4,'127.0.0.1','20151014165645');

/*!40000 ALTER TABLE `xe_document_declared_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_document_extra_keys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_extra_keys`;

CREATE TABLE `xe_document_extra_keys` (
  `module_srl` bigint(11) NOT NULL,
  `var_idx` bigint(11) NOT NULL,
  `var_name` varchar(250) NOT NULL,
  `var_type` varchar(50) NOT NULL,
  `var_is_required` char(1) NOT NULL DEFAULT 'N',
  `var_search` char(1) NOT NULL DEFAULT 'N',
  `var_default` text,
  `var_desc` text,
  `eid` varchar(40) DEFAULT NULL,
  UNIQUE KEY `unique_module_keys` (`module_srl`,`var_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_document_extra_vars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_extra_vars`;

CREATE TABLE `xe_document_extra_vars` (
  `module_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL,
  `var_idx` bigint(11) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `value` longtext,
  `eid` varchar(40) DEFAULT NULL,
  UNIQUE KEY `unique_extra_vars` (`module_srl`,`document_srl`,`var_idx`,`lang_code`),
  KEY `idx_document_list_order` (`document_srl`,`module_srl`,`var_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_document_histories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_histories`;

CREATE TABLE `xe_document_histories` (
  `history_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `content` longtext,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  PRIMARY KEY (`history_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_ipaddress` (`ipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_document_readed_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_readed_log`;

CREATE TABLE `xe_document_readed_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_document_trash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_trash`;

CREATE TABLE `xe_document_trash` (
  `trash_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `trash_date` varchar(14) DEFAULT NULL,
  `description` text,
  `ipaddress` varchar(128) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  PRIMARY KEY (`trash_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_trash_date` (`trash_date`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_member_srl` (`member_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_document_voted_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_document_voted_log`;

CREATE TABLE `xe_document_voted_log` (
  `document_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `point` bigint(11) NOT NULL,
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_documents`;

CREATE TABLE `xe_documents` (
  `document_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `category_srl` bigint(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(10) NOT NULL DEFAULT '',
  `is_notice` char(1) NOT NULL DEFAULT 'N',
  `title` varchar(250) DEFAULT NULL,
  `title_bold` char(1) NOT NULL DEFAULT 'N',
  `title_color` varchar(7) DEFAULT NULL,
  `content` longtext NOT NULL,
  `readed_count` bigint(11) NOT NULL DEFAULT '0',
  `voted_count` bigint(11) NOT NULL DEFAULT '0',
  `blamed_count` bigint(11) NOT NULL DEFAULT '0',
  `comment_count` bigint(11) NOT NULL DEFAULT '0',
  `trackback_count` bigint(11) NOT NULL DEFAULT '0',
  `uploaded_count` bigint(11) NOT NULL DEFAULT '0',
  `password` varchar(60) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `homepage` varchar(250) NOT NULL,
  `tags` text,
  `extra_vars` text,
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `last_updater` varchar(80) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `update_order` bigint(11) NOT NULL,
  `allow_trackback` char(1) NOT NULL DEFAULT 'Y',
  `notify_message` char(1) NOT NULL DEFAULT 'N',
  `status` varchar(20) DEFAULT 'PUBLIC',
  `comment_status` varchar(20) DEFAULT 'ALLOW',
  PRIMARY KEY (`document_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_category_srl` (`category_srl`),
  KEY `idx_is_notice` (`is_notice`),
  KEY `idx_readed_count` (`readed_count`),
  KEY `idx_voted_count` (`voted_count`),
  KEY `idx_blamed_count` (`blamed_count`),
  KEY `idx_comment_count` (`comment_count`),
  KEY `idx_trackback_count` (`trackback_count`),
  KEY `idx_uploaded_count` (`uploaded_count`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_list_order` (`list_order`),
  KEY `idx_update_order` (`update_order`),
  KEY `idx_module_list_order` (`module_srl`,`list_order`),
  KEY `idx_module_update_order` (`module_srl`,`update_order`),
  KEY `idx_module_readed_count` (`module_srl`,`readed_count`),
  KEY `idx_module_voted_count` (`module_srl`,`voted_count`),
  KEY `idx_module_notice` (`module_srl`,`is_notice`),
  KEY `idx_module_document_srl` (`module_srl`,`document_srl`),
  KEY `idx_module_blamed_count` (`module_srl`,`blamed_count`),
  KEY `idx_module_status` (`module_srl`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_documents` WRITE;
/*!40000 ALTER TABLE `xe_documents` DISABLE KEYS */;

INSERT INTO `xe_documents` (`document_srl`, `module_srl`, `category_srl`, `lang_code`, `is_notice`, `title`, `title_bold`, `title_color`, `content`, `readed_count`, `voted_count`, `blamed_count`, `comment_count`, `trackback_count`, `uploaded_count`, `password`, `user_id`, `user_name`, `nick_name`, `member_srl`, `email_address`, `homepage`, `tags`, `extra_vars`, `regdate`, `last_update`, `last_updater`, `ipaddress`, `list_order`, `update_order`, `allow_trackback`, `notify_message`, `status`, `comment_status`)
VALUES
	(88,63,0,'ko','N','MAIN PAGE\n\nMAIN BODY','N','N','<h1>MAIN PAGE</h1>\n\n<p>MAIN BODY</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','','','N;','20151006062112','20151006062205',NULL,'127.0.0.1',-88,-130,'N','N','PUBLIC','DENY'),
	(89,63,0,'ko','N','Welcome mobile XE','N','N','<link rel=\"stylesheet\" href=\"./layouts/xedition/css/welcome.css\" />\n<div class=\"welcomeXE\">\n	<section class=\"intro\">\n		<span class=\"noti\">WELCOME TO</span>\n		<h1 class=\"tit\">WELCOME TO XPRESSENGINE</h1>\n		<P class=\"cont\">XpressEngine은 자유로운 웹 콘텐츠 발행을 돕는 CMS입니다.<br />간편한 설치와 다양한 추가 프로그램을 활용하여<br /> 자신만의 웹페이지를 쉽고 빠르게 만들 수 있습니다.</P>\n		<a href=\"/index.php?module=admin\" target=\"_blank\" class=\"btn_start\">XE 시작하기</a>\n	</section>\n</div>\n',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151006062112','20151006062112',NULL,'127.0.0.1',-89,-89,'N','N','PUBLIC','DENY'),
	(359,65,0,'ko','Y','Board1 노티스','N','N','<p>Board1 노티스</p>',0,0,0,1,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','','board1,노티스','N;','20151013180259','20151013180311','Admin','127.0.0.1',-359,-364,'N','N','PUBLIC','ALLOW'),
	(365,65,0,'ko','N','Board1 일반글','N','N','<p>Board1 일반글 내용</p>',0,0,0,1,0,0,NULL,'user_id','user_name','nick_name',268,'email@domain.com','http://example.com/','board1,일반글','N;','20151013180336','20151013180345','Admin','127.0.0.1',-365,-370,'N','N','PUBLIC','ALLOW'),
	(371,263,0,'ko','Y','Board2 노티스','N','N','<p>Board2 노티스 내용</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','','board2,노티스','N;','20151013180415','20151013180415',NULL,'127.0.0.1',-371,-371,'N','N','PUBLIC','ALLOW'),
	(374,263,0,'ko','N','Board2 일반글','N','N','<p>Board2 일반글 내용</p>',0,0,0,0,0,0,NULL,'user_id','user_name','nick_name',268,'email@domain.com','','board2,일반글','N;','20151013180440','20151013180440',NULL,'127.0.0.1',-374,-374,'N','N','PUBLIC','ALLOW'),
	(377,65,0,'ko','N','Board1 비밀글','N','N','<p>Board1 비밀글 내용</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','','','N;','20151013181608','20151013181630',NULL,'127.0.0.1',-377,-378,'N','N','SECRET','ALLOW'),
	(379,65,0,'ko','N','많이 본 글','N','N','<p>많이 본 글</p>',200,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014140913','20151014140913',NULL,'127.0.0.1',-379,-379,'N','N','PUBLIC','ALLOW'),
	(380,65,0,'ko','N','대단한 글','N','N','<p>대단한 글</p>',0,20,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014140924','20151014140924',NULL,'127.0.0.1',-380,-380,'N','N','PUBLIC','ALLOW'),
	(381,65,0,'ko','N','나쁜 글','N','N','<p>나쁜 글</p>',0,0,-10,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014140948','20151014140948',NULL,'127.0.0.1',-381,-381,'N','N','PUBLIC','ALLOW'),
	(382,65,0,'ko','N','토론','N','N','<p>토론</p>',0,0,0,10,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014141004','20151014141004',NULL,'127.0.0.1',-382,-382,'N','N','PUBLIC','ALLOW'),
	(383,65,0,'ko','N','파일이 많은 글','N','N','<p>파일이 많은 글</p>',0,0,0,0,0,10,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014141021','20151014141021',NULL,'127.0.0.1',-383,-383,'N','N','PUBLIC','ALLOW'),
	(384,65,0,'ko','N','오래된 글','N','N','<p>오래된 글</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','19800101141042','20151014141042',NULL,'127.0.0.1',-384,-384,'N','N','PUBLIC','ALLOW'),
	(385,65,0,'ko','N','방금 수정된 글','N','N','<p>방금 수정된 글</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014141105','20100101141105',NULL,'127.0.0.1',-385,-385,'N','N','PUBLIC','ALLOW'),
	(386,65,0,'ko','N','출처 불명 글','N','N','<p>출처 불명 글</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014141127','20151014141127',NULL,'192.168.0.1',-386,-386,'N','N','PUBLIC','ALLOW'),
	(387,65,0,'ko','N','공격받은 문서','N','N','<p>공격받은 문서</p>',0,0,0,0,10,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014141614','20151014141614',NULL,'127.0.0.1',-387,-387,'N','N','PUBLIC','ALLOW'),
	(388,65,0,'ko','N','임시 저장 글입니다.','N','N','<p>아직 다 쓰지 않았습니다.</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151014165512','20151014165512',NULL,'127.0.0.1',-388,-388,'N','N','TEMP','ALLOW'),
	(389,65,0,'ko','N','신고당한 글입니다.','N','N','<p>억울합니다</p>',0,0,0,0,0,0,NULL,'user_id','user_name','nick_name',268,'email@domain.com','',NULL,'N;','20151014165537','20151014165537',NULL,'192.168.0.1',-389,-389,'N','N','PUBLIC','ALLOW'),
	(390,65,0,'ko','N','삭제될 글입니다.','N','N','<p>바카라 바카라 라라라라 바카라</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151016151429','20151016151429',NULL,'127.0.0.1',-390,-390,'N','N','PUBLIC','ALLOW'),
	(391,65,0,'ko','N','휴지통으로 보내질 글입니다.','N','N','<p>I HATE XE</p>',0,0,0,0,0,0,NULL,'admin','admin','Admin',4,'admin@admin.net','',NULL,'N;','20151016151457','20151016151457',NULL,'127.0.0.1',-391,-391,'N','N','PUBLIC','ALLOW'),
	(392,65,0,'ko','N','게시판2로 가고 싶은 글','N','N','<p>게시판 2로 가고파</p>',0,0,0,2,0,0,NULL,'user_id','user_name','nick_name',268,'email@domain.com','',NULL,'N;','20151016160519','20151016160555','Admin','127.0.0.1',-392,-399,'N','N','PUBLIC','ALLOW'),
	(393,65,0,'ko','N','쌍둥이 게시글','N','N','<p>게시판 1과 2에 모두 있어야 하는 글</p>',0,0,0,2,0,0,NULL,'user_id','user_name','nick_name',268,'email@domain.com','',NULL,'N;','20151016160538','20151016160615','Admin','127.0.0.1',-393,-405,'N','N','PUBLIC','ALLOW');

/*!40000 ALTER TABLE `xe_documents` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_editor_autosave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_editor_autosave`;

CREATE TABLE `xe_editor_autosave` (
  `member_srl` bigint(11) DEFAULT '0',
  `ipaddress` varchar(128) DEFAULT NULL,
  `module_srl` bigint(11) DEFAULT NULL,
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `content` longtext NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_editor_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_editor_components`;

CREATE TABLE `xe_editor_components` (
  `component_name` varchar(250) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`component_name`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_editor_components` WRITE;
/*!40000 ALTER TABLE `xe_editor_components` DISABLE KEYS */;

INSERT INTO `xe_editor_components` (`component_name`, `enabled`, `extra_vars`, `list_order`)
VALUES
	('colorpicker_bg','Y',NULL,41),
	('colorpicker_text','Y',NULL,39),
	('emoticon','Y',NULL,43),
	('image_gallery','Y',NULL,57),
	('image_link','Y',NULL,47),
	('multimedia_link','Y',NULL,49),
	('poll_maker','Y',NULL,55),
	('quotation','Y',NULL,51),
	('table_maker','Y',NULL,53),
	('url_link','Y',NULL,45);

/*!40000 ALTER TABLE `xe_editor_components` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_editor_components_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_editor_components_site`;

CREATE TABLE `xe_editor_components_site` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `component_name` varchar(250) NOT NULL,
  `enabled` char(1) NOT NULL DEFAULT 'N',
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  UNIQUE KEY `unique_component_site` (`site_srl`,`component_name`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_files`;

CREATE TABLE `xe_files` (
  `file_srl` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL DEFAULT '0',
  `upload_target_type` char(3) DEFAULT NULL,
  `sid` varchar(60) DEFAULT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `member_srl` bigint(11) NOT NULL,
  `download_count` bigint(11) NOT NULL DEFAULT '0',
  `direct_download` char(1) NOT NULL DEFAULT 'N',
  `source_filename` varchar(250) DEFAULT NULL,
  `uploaded_filename` varchar(250) DEFAULT NULL,
  `file_size` bigint(11) NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  `isvalid` char(1) DEFAULT 'N',
  `cover_image` char(1) NOT NULL DEFAULT 'N',
  `regdate` varchar(14) DEFAULT NULL,
  `ipaddress` varchar(128) NOT NULL,
  PRIMARY KEY (`file_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_upload_target_type` (`upload_target_type`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_download_count` (`download_count`),
  KEY `idx_file_size` (`file_size`),
  KEY `idx_is_valid` (`isvalid`),
  KEY `idx_list_order` (`cover_image`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_ipaddress` (`ipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_lang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_lang`;

CREATE TABLE `xe_lang` (
  `site_srl` bigint(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `value` text,
  KEY `idx_lang` (`site_srl`,`name`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_layouts`;

CREATE TABLE `xe_layouts` (
  `layout_srl` bigint(12) NOT NULL,
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `layout` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `extra_vars` text,
  `layout_path` varchar(250) DEFAULT NULL,
  `module_srl` bigint(12) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  `layout_type` char(1) DEFAULT 'P',
  PRIMARY KEY (`layout_srl`),
  KEY `menu_site_srl` (`site_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_layouts` WRITE;
/*!40000 ALTER TABLE `xe_layouts` DISABLE KEYS */;

INSERT INTO `xe_layouts` (`layout_srl`, `site_srl`, `layout`, `title`, `extra_vars`, `layout_path`, `module_srl`, `regdate`, `layout_type`)
VALUES
	(86,0,'xedition','XEDITION','O:8:\"stdClass\":18:{s:16:\"error_return_url\";s:1:\"/\";s:7:\"ruleset\";s:12:\"updateLayout\";s:12:\"_layout_type\";s:1:\"P\";s:15:\"xe_validator_id\";s:37:\"modules/layout/tpl/lyaout_info_view/1\";s:8:\"use_demo\";s:1:\"N\";s:11:\"layout_type\";s:4:\"auto\";s:14:\"menu_type_main\";s:5:\"basic\";s:13:\"menu_type_sub\";s:5:\"basic\";s:19:\"content_fixed_width\";s:5:\"index\";s:10:\"menu_fixed\";s:1:\"Y\";s:16:\"sidebar_position\";s:5:\"right\";s:26:\"enable_intergration_search\";s:1:\"Y\";s:16:\"use_login_widget\";s:1:\"Y\";s:9:\"use_slide\";s:1:\"N\";s:3:\"GNB\";s:2:\"62\";s:3:\"UNB\";s:2:\"73\";s:3:\"FNB\";s:2:\"76\";s:14:\"menu_name_list\";a:3:{i:62;s:9:\"Main menu\";i:73;s:12:\"Utility menu\";i:76;s:11:\"Footer Menu\";}}',NULL,0,'20151006062112','P'),
	(87,0,'default','welcome_mobile_layout','O:8:\"stdClass\":4:{s:3:\"GNB\";i:62;s:3:\"UNB\";i:73;s:3:\"FNB\";i:76;s:9:\"main_menu\";i:62;}',NULL,0,'20151006062112','M'),
	(127,0,'xe_official','XE 공식 사이트 레이아웃',NULL,NULL,0,'20151006062129','P'),
	(128,0,'default','기본 레이아웃',NULL,NULL,0,'20151006062129','P'),
	(129,0,'user_layout','테스트 레이아웃','O:8:\"stdClass\":6:{s:16:\"error_return_url\";s:1:\"/\";s:7:\"ruleset\";s:12:\"updateLayout\";s:12:\"_layout_type\";s:1:\"P\";s:15:\"xe_validator_id\";s:37:\"modules/layout/tpl/lyaout_info_view/1\";s:11:\"global_menu\";s:2:\"62\";s:14:\"menu_name_list\";a:1:{i:62;s:9:\"Main menu\";}}',NULL,0,'20151006062129','P'),
	(316,0,'colorCode','XE Color Code 모바일 레이아웃',NULL,NULL,0,'20151007103932','M'),
	(317,0,'simpleGray','XE 심플 그레이 레이아웃',NULL,NULL,0,'20151007103932','M');

/*!40000 ALTER TABLE `xe_layouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member`;

CREATE TABLE `xe_member` (
  `member_srl` bigint(11) NOT NULL,
  `user_id` varchar(80) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email_id` varchar(80) NOT NULL,
  `email_host` varchar(160) DEFAULT NULL,
  `user_name` varchar(40) NOT NULL,
  `nick_name` varchar(40) NOT NULL,
  `find_account_question` bigint(11) DEFAULT NULL,
  `find_account_answer` varchar(250) DEFAULT NULL,
  `homepage` varchar(250) DEFAULT NULL,
  `blog` varchar(250) DEFAULT NULL,
  `birthday` char(8) DEFAULT NULL,
  `allow_mailing` char(1) NOT NULL DEFAULT 'Y',
  `allow_message` char(1) NOT NULL DEFAULT 'Y',
  `denied` char(1) DEFAULT 'N',
  `limit_date` varchar(14) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `last_login` varchar(14) DEFAULT NULL,
  `change_password_date` varchar(14) DEFAULT NULL,
  `is_admin` char(1) DEFAULT 'N',
  `description` text,
  `extra_vars` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`member_srl`),
  UNIQUE KEY `unique_user_id` (`user_id`),
  UNIQUE KEY `unique_email_address` (`email_address`),
  UNIQUE KEY `unique_nick_name` (`nick_name`),
  KEY `idx_email_host` (`email_host`),
  KEY `idx_allow_mailing` (`allow_mailing`),
  KEY `idx_is_denied` (`denied`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_login` (`last_login`),
  KEY `idx_is_admin` (`is_admin`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_member` WRITE;
/*!40000 ALTER TABLE `xe_member` DISABLE KEYS */;

INSERT INTO `xe_member` (`member_srl`, `user_id`, `email_address`, `password`, `email_id`, `email_host`, `user_name`, `nick_name`, `find_account_question`, `find_account_answer`, `homepage`, `blog`, `birthday`, `allow_mailing`, `allow_message`, `denied`, `limit_date`, `regdate`, `last_login`, `change_password_date`, `is_admin`, `description`, `extra_vars`, `list_order`)
VALUES
	(4,'admin','admin@admin.net','sha256:0008192:lWA6w3klx7BA:N0GllPfXy0+ltxV3rDdBFDa2NFAS4e78','admin','admin.net','admin','Admin',NULL,NULL,'','',NULL,'N','Y','N',NULL,'20151006062111','20151016160428','20151006062111','Y',NULL,NULL,-4),
	(163,'test_id_56136aad87eec','tester_56136aad87eec@xpessengine.com','sha256:0008192:02gt11G6GCqS:lYXaF5HATsfG0GGb1nX3df1AUDA/cffH','tester_56136aad87eec','xpessengine.com','test_name_56136aad87eec','test_nick_56136aad87eec',4,'꽃피는 산골','http://example.com/tester_56136aad87eec','http://blog.example.com/tester_56136aad87eec','19811001','N','Y','N','','20151006063114','20151006063114','20151006063114','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-163),
	(164,'test_id_56136ab2d6c2d','tester_56136ab2d6c2d@xpessengine.com','sha256:0008192:c2Wigsr61Qb9:WxE73lgXefIS0aXvMriSbjdEwNmjfUNc','tester_56136ab2d6c2d','xpessengine.com','test_name_56136ab2d6c2d','test_nick_56136ab2d6c2d',4,'꽃피는 산골','http://example.com/tester_56136ab2d6c2d','http://blog.example.com/tester_56136ab2d6c2d','19851001','N','Y','N','','20151006063119','20151006063119','20151006063119','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-164),
	(165,'test_id_56136ab831fdd','tester_56136ab831fdd@xpessengine.com','sha256:0008192:tOshk2wFDrvI:pe5nIlklodlU0eVGHwA3xUaHKa6aUEit','tester_56136ab831fdd','xpessengine.com','test_name_56136ab831fdd','test_nick_56136ab831fdd',4,'꽃피는 산골','http://example.com/tester_56136ab831fdd','http://blog.example.com/tester_56136ab831fdd','19861001','N','Y','N','','20151006063125','20151006063125','20151006063125','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-165),
	(166,'test_id_56136abd925ec','tester_56136abd925ec@xpessengine.com','sha256:0008192:mNDH2Zi82BUI:bsSLSsFG0Lky2bq7eQ0PBnv6nwhEvefO','tester_56136abd925ec','xpessengine.com','test_name_56136abd925ec','test_nick_56136abd925ec',4,'꽃피는 산골','http://example.com/tester_56136abd925ec','http://blog.example.com/tester_56136abd925ec','19921001','N','Y','N','','20151006063130','20151006063130','20151006063130','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1992-10-01\";}',-166),
	(167,'test_id_56136ac2d903d','tester_56136ac2d903d@xpessengine.com','sha256:0008192:HX16znC2tl1P:h5i1qD2vZwA2FcetetrWD8GgP4+c83cL','tester_56136ac2d903d','xpessengine.com','test_name_56136ac2d903d','test_nick_56136ac2d903d',4,'꽃피는 산골','http://example.com/tester_56136ac2d903d','http://blog.example.com/tester_56136ac2d903d','19881001','N','Y','N','','20151006063135','20151006063135','20151006063135','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1988-10-01\";}',-167),
	(168,'test_id_56136ac873fe7','tester_56136ac873fe7@xpessengine.com','sha256:0008192:FOgaqXsdxZve:iFJVA/lwPqSZ/PVTqcDbHimzPJmymk+F','tester_56136ac873fe7','xpessengine.com','test_name_56136ac873fe7','test_nick_56136ac873fe7',4,'꽃피는 산골','http://example.com/tester_56136ac873fe7','http://blog.example.com/tester_56136ac873fe7','19921001','N','Y','N','','20151006063140','20151006063140','20151006063140','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1992-10-01\";}',-168),
	(169,'test_id_56136acd8c7ee','tester_56136acd8c7ee@xpessengine.com','sha256:0008192:jmZP4iZBKcIW:3ZoUVF2mBH9MGMcWlGJfaQn4zWaC8KHI','tester_56136acd8c7ee','xpessengine.com','test_name_56136acd8c7ee','test_nick_56136acd8c7ee',4,'꽃피는 산골','http://example.com/tester_56136acd8c7ee','http://blog.example.com/tester_56136acd8c7ee','19931001','N','Y','N','','20151006063146','20151006063146','20151006063146','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1993-10-01\";}',-169),
	(170,'test_id_56136ad2b62b4','tester_56136ad2b62b4@xpessengine.com','sha256:0008192:juexZIrzx7ZH:wl/kF0Y0JWLatVUUzp57dvAOsShohos9','tester_56136ad2b62b4','xpessengine.com','test_name_56136ad2b62b4','test_nick_56136ad2b62b4',4,'꽃피는 산골','http://example.com/tester_56136ad2b62b4','http://blog.example.com/tester_56136ad2b62b4','19851001','N','Y','N','','20151006063151','20151006063151','20151006063151','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-170),
	(171,'test_id_56136ad843dd2','tester_56136ad843dd2@xpessengine.com','sha256:0008192:ijL9a4yRx7vZ:CUEkyAiYviT/rrXMs7EWwTNj0pIj/tAN','tester_56136ad843dd2','xpessengine.com','test_name_56136ad843dd2','test_nick_56136ad843dd2',4,'꽃피는 산골','http://example.com/tester_56136ad843dd2','http://blog.example.com/tester_56136ad843dd2','19911001','N','Y','N','','20151006063156','20151006063156','20151006063156','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1991-10-01\";}',-171),
	(172,'test_id_56136add65e74','tester_56136add65e74@xpessengine.com','sha256:0008192:L7Qw03kcXTdo:bUOEAah4KvUC7PQT2Gtlw9tzfrZqyDtb','tester_56136add65e74','xpessengine.com','test_name_56136add65e74','test_nick_56136add65e74',4,'꽃피는 산골','http://example.com/tester_56136add65e74','http://blog.example.com/tester_56136add65e74','19931001','N','Y','N','','20151006063202','20151006063202','20151006063202','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1993-10-01\";}',-172),
	(173,'test_id_56136ae2cdc10','tester_56136ae2cdc10@xpessengine.com','sha256:0008192:d5UB3FrkswAA:AcM/XhQx10LQlEB7ebzm6WwfhJC63rF8','tester_56136ae2cdc10','xpessengine.com','test_name_56136ae2cdc10','test_nick_56136ae2cdc10',4,'꽃피는 산골','http://example.com/tester_56136ae2cdc10','http://blog.example.com/tester_56136ae2cdc10','19811001','N','Y','N','','20151006063207','20151006063207','20151006063207','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-173),
	(174,'test_id_56136ae850cc1','tester_56136ae850cc1@xpessengine.com','sha256:0008192:fYwLoIOWjjH3:juOoGDCj1kvguzHuLebIS3yaImuwVuU6','tester_56136ae850cc1','xpessengine.com','test_name_56136ae850cc1','test_nick_56136ae850cc1',4,'꽃피는 산골','http://example.com/tester_56136ae850cc1','http://blog.example.com/tester_56136ae850cc1','19911001','N','Y','N','','20151006063213','20151006063213','20151006063213','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1991-10-01\";}',-174),
	(175,'test_id_56136aedae3ba','tester_56136aedae3ba@xpessengine.com','sha256:0008192:trQxjTmJ5k38:bKBAszhRbvj72+Bs9U84/GpUyivse1yD','tester_56136aedae3ba','xpessengine.com','test_name_56136aedae3ba','test_nick_56136aedae3ba',4,'꽃피는 산골','http://example.com/tester_56136aedae3ba','http://blog.example.com/tester_56136aedae3ba','19921001','N','Y','N','','20151006063218','20151006063218','20151006063218','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1992-10-01\";}',-175),
	(176,'test_id_56136af306622','tester_56136af306622@xpessengine.com','sha256:0008192:f8Q6nlORLDRY:sikG2AkiUZX9q+LCliP5M9ltcrRvaZ6S','tester_56136af306622','xpessengine.com','test_name_56136af306622','test_nick_56136af306622',4,'꽃피는 산골','http://example.com/tester_56136af306622','http://blog.example.com/tester_56136af306622','19931001','N','Y','N','','20151006063223','20151006063223','20151006063223','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1993-10-01\";}',-176),
	(177,'test_id_56136af871795','tester_56136af871795@xpessengine.com','sha256:0008192:Vu2VAfghVcyR:Ig2I0o8j56vOI34iBqSoIBOA9kQ5xifv','tester_56136af871795','xpessengine.com','test_name_56136af871795','test_nick_56136af871795',4,'꽃피는 산골','http://example.com/tester_56136af871795','http://blog.example.com/tester_56136af871795','19851001','N','Y','N','','20151006063229','20151006063229','20151006063229','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-177),
	(178,'test_id_56136afdc2e97','tester_56136afdc2e97@xpessengine.com','sha256:0008192:R5Wst6lhyRLC:a6etCe45mXSO+5NQt0FfM8X0e/UGjFEE','tester_56136afdc2e97','xpessengine.com','test_name_56136afdc2e97','test_nick_56136afdc2e97',4,'꽃피는 산골','http://example.com/tester_56136afdc2e97','http://blog.example.com/tester_56136afdc2e97','19891001','N','Y','N','','20151006063234','20151006063234','20151006063234','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1989-10-01\";}',-178),
	(179,'test_id_56136b0321a0e','tester_56136b0321a0e@xpessengine.com','sha256:0008192:csXdPPnG8TtV:6nL3+COZ12hRv3UmU3/LhGV6eS9XWvSU','tester_56136b0321a0e','xpessengine.com','test_name_56136b0321a0e','test_nick_56136b0321a0e',4,'꽃피는 산골','http://example.com/tester_56136b0321a0e','http://blog.example.com/tester_56136b0321a0e','19851001','N','Y','N','','20151006063239','20151006063239','20151006063239','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-179),
	(180,'test_id_56136b0888b64','tester_56136b0888b64@xpessengine.com','sha256:0008192:Y4O3Nz0Lk1g4:ZoexKZI7jtY6dr3mXp4UsriqvnI5R1lc','tester_56136b0888b64','xpessengine.com','test_name_56136b0888b64','test_nick_56136b0888b64',4,'꽃피는 산골','http://example.com/tester_56136b0888b64','http://blog.example.com/tester_56136b0888b64','19921001','N','Y','N','','20151006063245','20151006063245','20151006063245','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1992-10-01\";}',-180),
	(181,'test_id_56136b0dc14df','tester_56136b0dc14df@xpessengine.com','sha256:0008192:LYKuggp6iqPD:xy8hH6gsY0pCSn/F5UIggH9r+ayMoIqB','tester_56136b0dc14df','xpessengine.com','test_name_56136b0dc14df','test_nick_56136b0dc14df',4,'꽃피는 산골','http://example.com/tester_56136b0dc14df','http://blog.example.com/tester_56136b0dc14df','19811001','N','Y','N','','20151006063250','20151006063250','20151006063250','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-181),
	(182,'test_id_56136b1321ab1','tester_56136b1321ab1@xpessengine.com','sha256:0008192:J3sl3X3XFJnS:y2yzILKqTi3eMbSDUUmJhFTd8HyStnV0','tester_56136b1321ab1','xpessengine.com','test_name_56136b1321ab1','test_nick_56136b1321ab1',4,'꽃피는 산골','http://example.com/tester_56136b1321ab1','http://blog.example.com/tester_56136b1321ab1','19821001','N','Y','N','','20151006063255','20151006063255','20151006063255','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1982-10-01\";}',-182),
	(183,'test_id_56136b185819b','tester_56136b185819b@xpessengine.com','sha256:0008192:j2LKOfEUD2vl:G1QnEgkz5t/iXa6g0UdRXWaDkUTW2Kzd','tester_56136b185819b','xpessengine.com','test_name_56136b185819b','test_nick_56136b185819b',4,'꽃피는 산골','http://example.com/tester_56136b185819b','http://blog.example.com/tester_56136b185819b','19811001','N','Y','N','','20151006063300','20151006063300','20151006063300','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-183),
	(184,'test_id_56136b1d891f7','tester_56136b1d891f7@xpessengine.com','sha256:0008192:e37whw1xsA8C:zXp3c4j+c+48hZ6RBgFoCavqjVehShzF','tester_56136b1d891f7','xpessengine.com','test_name_56136b1d891f7','test_nick_56136b1d891f7',4,'꽃피는 산골','http://example.com/tester_56136b1d891f7','http://blog.example.com/tester_56136b1d891f7','19821001','N','Y','N','','20151006063306','20151006063306','20151006063306','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1982-10-01\";}',-184),
	(185,'test_id_56136b2319e4a','tester_56136b2319e4a@xpessengine.com','sha256:0008192:YojxGcvAsSv5:BkbFZZVk/2d7SG7V03JCjvaSkYzbLSwb','tester_56136b2319e4a','xpessengine.com','test_name_56136b2319e4a','test_nick_56136b2319e4a',4,'꽃피는 산골','http://example.com/tester_56136b2319e4a','http://blog.example.com/tester_56136b2319e4a','19941001','N','Y','N','','20151006063311','20151006063311','20151006063311','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1994-10-01\";}',-185),
	(186,'test_id_56136b2889d35','tester_56136b2889d35@xpessengine.com','sha256:0008192:V2tb6Q6t4k1e:uGeFjAZVFref20zfJPUpe/zDafZEA/5P','tester_56136b2889d35','xpessengine.com','test_name_56136b2889d35','test_nick_56136b2889d35',4,'꽃피는 산골','http://example.com/tester_56136b2889d35','http://blog.example.com/tester_56136b2889d35','19841001','N','Y','N','','20151006063317','20151006063317','20151006063317','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1984-10-01\";}',-186),
	(187,'test_id_56136b2dc38bb','tester_56136b2dc38bb@xpessengine.com','sha256:0008192:7MNkvmal9bic:cT3O1i/vsg3yR/3ePYkKFnrBwA/fPaSg','tester_56136b2dc38bb','xpessengine.com','test_name_56136b2dc38bb','test_nick_56136b2dc38bb',4,'꽃피는 산골','http://example.com/tester_56136b2dc38bb','http://blog.example.com/tester_56136b2dc38bb','19851001','N','Y','N','','20151006063322','20151006063322','20151006063322','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-187),
	(188,'test_id_56136b32ed12a','tester_56136b32ed12a@xpessengine.com','sha256:0008192:Vpu7ypxs1feO:1702ehMG6HCWcvBjZh4tu5wx2URSjcrf','tester_56136b32ed12a','xpessengine.com','test_name_56136b32ed12a','test_nick_56136b32ed12a',4,'꽃피는 산골','http://example.com/tester_56136b32ed12a','http://blog.example.com/tester_56136b32ed12a','19951001','N','Y','N','','20151006063327','20151006063327','20151006063327','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1995-10-01\";}',-188),
	(189,'test_id_56136b384dd01','tester_56136b384dd01@xpessengine.com','sha256:0008192:vaakRZpJr78X:ZLsqHTemcsZndrxO+da6cVpbAKSoaPXt','tester_56136b384dd01','xpessengine.com','test_name_56136b384dd01','test_nick_56136b384dd01',4,'꽃피는 산골','http://example.com/tester_56136b384dd01','http://blog.example.com/tester_56136b384dd01','19931001','N','Y','N','','20151006063332','20151006063332','20151006063332','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1993-10-01\";}',-189),
	(190,'test_id_56136b3da531e','tester_56136b3da531e@xpessengine.com','sha256:0008192:7ld93MjEzC07:krODeHZ8ukKVi8kxeKrXOcCLmww1yb5C','tester_56136b3da531e','xpessengine.com','test_name_56136b3da531e','test_nick_56136b3da531e',4,'꽃피는 산골','http://example.com/tester_56136b3da531e','http://blog.example.com/tester_56136b3da531e','19911001','N','Y','N','','20151006063338','20151006063338','20151006063338','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1991-10-01\";}',-190),
	(191,'test_id_56136b432fb1c','tester_56136b432fb1c@xpessengine.com','sha256:0008192:CudS5mOuOTNW:MFoIVDbmwdbkmanE8lBQkjOQ2pXGeB28','tester_56136b432fb1c','xpessengine.com','test_name_56136b432fb1c','test_nick_56136b432fb1c',4,'꽃피는 산골','http://example.com/tester_56136b432fb1c','http://blog.example.com/tester_56136b432fb1c','19951001','N','Y','N','','20151006063343','20151006063343','20151006063343','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1995-10-01\";}',-191),
	(192,'test_id_56136b489ec9a','tester_56136b489ec9a@xpessengine.com','sha256:0008192:Q48auWbOuGmP:UXmPztuK66pJWTUp7mSUMYWhvdk28mos','tester_56136b489ec9a','xpessengine.com','test_name_56136b489ec9a','test_nick_56136b489ec9a',4,'꽃피는 산골','http://example.com/tester_56136b489ec9a','http://blog.example.com/tester_56136b489ec9a','19801001','N','Y','N','','20151006063349','20151006063349','20151006063349','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1980-10-01\";}',-192),
	(193,'test_id_56136b4dc68e3','tester_56136b4dc68e3@xpessengine.com','sha256:0008192:AVYpye7feAW1:b+LB8dbZANl6TOHBn4DW39VMWLz7LkBo','tester_56136b4dc68e3','xpessengine.com','test_name_56136b4dc68e3','test_nick_56136b4dc68e3',4,'꽃피는 산골','http://example.com/tester_56136b4dc68e3','http://blog.example.com/tester_56136b4dc68e3','19891001','N','Y','N','','20151006063354','20151006063354','20151006063354','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1989-10-01\";}',-193),
	(194,'test_id_56136b530ef81','tester_56136b530ef81@xpessengine.com','sha256:0008192:ahZUOZP68iHv:UfFo4FMHZSGDeIMUKKCuN7HRBqumBu/h','tester_56136b530ef81','xpessengine.com','test_name_56136b530ef81','test_nick_56136b530ef81',4,'꽃피는 산골','http://example.com/tester_56136b530ef81','http://blog.example.com/tester_56136b530ef81','19811001','N','Y','N','','20151006063359','20151006063359','20151006063359','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-194),
	(195,'test_id_56136b588f4bb','tester_56136b588f4bb@xpessengine.com','sha256:0008192:wQ6fyrpQXgHk:do5+/Sws7s2b6tot6I/Fb7tTrrIJyfGl','tester_56136b588f4bb','xpessengine.com','test_name_56136b588f4bb','test_nick_56136b588f4bb',4,'꽃피는 산골','http://example.com/tester_56136b588f4bb','http://blog.example.com/tester_56136b588f4bb','19861001','N','Y','N','','20151006063405','20151006063405','20151006063405','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-195),
	(196,'test_id_56136b5e3e30c','tester_56136b5e3e30c@xpessengine.com','sha256:0008192:6iGU01hAtpcu:UoVf6J1SqC9o/Jo+p0vxqwQP92DrxEr5','tester_56136b5e3e30c','xpessengine.com','test_name_56136b5e3e30c','test_nick_56136b5e3e30c',4,'꽃피는 산골','http://example.com/tester_56136b5e3e30c','http://blog.example.com/tester_56136b5e3e30c','19951001','N','Y','N','','20151006063410','20151006063410','20151006063410','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1995-10-01\";}',-196),
	(197,'test_id_56136b63b1bbb','tester_56136b63b1bbb@xpessengine.com','sha256:0008192:dUpOJCJUKAP0:WN8ql/zfpjnrgMCFPE5HF7UzK8EXkaPC','tester_56136b63b1bbb','xpessengine.com','test_name_56136b63b1bbb','test_nick_56136b63b1bbb',4,'꽃피는 산골','http://example.com/tester_56136b63b1bbb','http://blog.example.com/tester_56136b63b1bbb','19941001','N','Y','N','','20151006063416','20151006063416','20151006063416','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1994-10-01\";}',-197),
	(198,'test_id_56136b693bd8d','tester_56136b693bd8d@xpessengine.com','sha256:0008192:RhP3P5aZLmJD:TLxa1DZacBWnjCQfOy7Ik/D6mXvMjb2e','tester_56136b693bd8d','xpessengine.com','test_name_56136b693bd8d','test_nick_56136b693bd8d',4,'꽃피는 산골','http://example.com/tester_56136b693bd8d','http://blog.example.com/tester_56136b693bd8d','19941001','N','Y','N','','20151006063421','20151006063421','20151006063421','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1994-10-01\";}',-198),
	(199,'test_id_56136b6e967be','tester_56136b6e967be@xpessengine.com','sha256:0008192:TgkNJmGhO1ld:F42aGu6LNrM+gZtDAUNcmzTLYf5fEgQm','tester_56136b6e967be','xpessengine.com','test_name_56136b6e967be','test_nick_56136b6e967be',4,'꽃피는 산골','http://example.com/tester_56136b6e967be','http://blog.example.com/tester_56136b6e967be','19911001','N','Y','N','','20151006063427','20151006063427','20151006063427','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1991-10-01\";}',-199),
	(200,'test_id_56136b73e892d','tester_56136b73e892d@xpessengine.com','sha256:0008192:ImOaJ5eUmEcZ:Zc2rsUufs2iQQwu4+O+6lZrqC5CKnkpA','tester_56136b73e892d','xpessengine.com','test_name_56136b73e892d','test_nick_56136b73e892d',4,'꽃피는 산골','http://example.com/tester_56136b73e892d','http://blog.example.com/tester_56136b73e892d','19911001','N','Y','N','','20151006063432','20151006063432','20151006063432','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1991-10-01\";}',-200),
	(201,'test_id_56136b793b594','tester_56136b793b594@xpessengine.com','sha256:0008192:rz54meT6wmds:TQTXbXoj9ywKhvITArpw8gEGQ7tLCB47','tester_56136b793b594','xpessengine.com','test_name_56136b793b594','test_nick_56136b793b594',4,'꽃피는 산골','http://example.com/tester_56136b793b594','http://blog.example.com/tester_56136b793b594','19831001','N','Y','N','','20151006063438','20151006063438','20151006063438','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1983-10-01\";}',-201),
	(202,'test_id_56136b7ece55e','tester_56136b7ece55e@xpessengine.com','sha256:0008192:QWMkpDmxsUxL:FwlNXjRVxvMe6zR9YUsMgJVykWa2rBZ3','tester_56136b7ece55e','xpessengine.com','test_name_56136b7ece55e','test_nick_56136b7ece55e',4,'꽃피는 산골','http://example.com/tester_56136b7ece55e','http://blog.example.com/tester_56136b7ece55e','19861001','N','Y','N','','20151006063443','20151006063443','20151006063443','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-202),
	(203,'test_id_56136b845c399','tester_56136b845c399@xpessengine.com','sha256:0008192:ZQyxTb48cpHa:SqTg37VtTr23/GPv9mqjxhNCJnQM9lTz','tester_56136b845c399','xpessengine.com','test_name_56136b845c399','test_nick_56136b845c399',4,'꽃피는 산골','http://example.com/tester_56136b845c399','http://blog.example.com/tester_56136b845c399','19881001','N','Y','N','','20151006063449','20151006063449','20151006063449','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1988-10-01\";}',-203),
	(204,'test_id_56136b89cb93d','tester_56136b89cb93d@xpessengine.com','sha256:0008192:rJXIcyIw39S0:AVphQP/YjzE4+dgLVV/sT2hVKbbGiyWI','tester_56136b89cb93d','xpessengine.com','test_name_56136b89cb93d','test_nick_56136b89cb93d',4,'꽃피는 산골','http://example.com/tester_56136b89cb93d','http://blog.example.com/tester_56136b89cb93d','19851001','N','Y','N','','20151006063454','20151006063454','20151006063454','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-204),
	(205,'test_id_56136b8f5f96a','tester_56136b8f5f96a@xpessengine.com','sha256:0008192:u5uz5ePCz2RV:ieaLwOAH+gKnZpssbpkCpIy4FXAu3EGO','tester_56136b8f5f96a','xpessengine.com','test_name_56136b8f5f96a','test_nick_56136b8f5f96a',4,'꽃피는 산골','http://example.com/tester_56136b8f5f96a','http://blog.example.com/tester_56136b8f5f96a','19821001','N','Y','N','','20151006063459','20151006063459','20151006063459','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1982-10-01\";}',-205),
	(206,'test_id_56136b94aab84','tester_56136b94aab84@xpessengine.com','sha256:0008192:MLyzY5ScTrnR:BwgZXcibPfJVKOmhd5ohICwU77XXnaSC','tester_56136b94aab84','xpessengine.com','test_name_56136b94aab84','test_nick_56136b94aab84',4,'꽃피는 산골','http://example.com/tester_56136b94aab84','http://blog.example.com/tester_56136b94aab84','19851001','N','Y','N','','20151006063505','20151006063505','20151006063505','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-206),
	(207,'test_id_56136b99e3a7f','tester_56136b99e3a7f@xpessengine.com','sha256:0008192:qlO0UPt0CFZ7:1/SBZF20qpteP1tsQrqxpgFZZWybXmb2','tester_56136b99e3a7f','xpessengine.com','test_name_56136b99e3a7f','test_nick_56136b99e3a7f',4,'꽃피는 산골','http://example.com/tester_56136b99e3a7f','http://blog.example.com/tester_56136b99e3a7f','19821001','N','Y','N','','20151006063510','20151006063510','20151006063510','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1982-10-01\";}',-207),
	(208,'test_id_56136b9f835c0','tester_56136b9f835c0@xpessengine.com','sha256:0008192:7DsFKehOWiiS:joLZVkEgDh0ujVTWlIfK93yanCwP+zFu','tester_56136b9f835c0','xpessengine.com','test_name_56136b9f835c0','test_nick_56136b9f835c0',4,'꽃피는 산골','http://example.com/tester_56136b9f835c0','http://blog.example.com/tester_56136b9f835c0','19871001','N','Y','N','','20151006063516','20151006063516','20151006063516','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1987-10-01\";}',-208),
	(209,'test_id_56136ba4d43dd','tester_56136ba4d43dd@xpessengine.com','sha256:0008192:H7VFtpnsc7Aa:ZlDjsoha3LZNXoArVNCvOM/kEMP4fgeB','tester_56136ba4d43dd','xpessengine.com','test_name_56136ba4d43dd','test_nick_56136ba4d43dd',4,'꽃피는 산골','http://example.com/tester_56136ba4d43dd','http://blog.example.com/tester_56136ba4d43dd','19951001','N','Y','N','','20151006063521','20151006063521','20151006063521','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1995-10-01\";}',-209),
	(210,'test_id_56136baa38879','tester_56136baa38879@xpessengine.com','sha256:0008192:3DXNbHJq9D9C:MDVfEo181kpiWVJhT0xK6Q1aPf//qpXH','tester_56136baa38879','xpessengine.com','test_name_56136baa38879','test_nick_56136baa38879',4,'꽃피는 산골','http://example.com/tester_56136baa38879','http://blog.example.com/tester_56136baa38879','19871001','N','Y','N','','20151006063527','20151006063527','20151006063527','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1987-10-01\";}',-210),
	(211,'test_id_56136baff00ad','tester_56136baff00ad@xpessengine.com','sha256:0008192:bEZlTA2yQry1:bBromcnoBiIUZbR9N6p7hawrQAWbWZTh','tester_56136baff00ad','xpessengine.com','test_name_56136baff00ad','test_nick_56136baff00ad',4,'꽃피는 산골','http://example.com/tester_56136baff00ad','http://blog.example.com/tester_56136baff00ad','19841001','N','Y','N','','20151006063532','20151006063532','20151006063532','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1984-10-01\";}',-211),
	(212,'test_id_56136bb56cafe','tester_56136bb56cafe@xpessengine.com','sha256:0008192:PHE98xLfXQTw:WoDUwXP+WXSR8VtOJ0+Nb+zaf3oSa/OO','tester_56136bb56cafe','xpessengine.com','test_name_56136bb56cafe','test_nick_56136bb56cafe',4,'꽃피는 산골','http://example.com/tester_56136bb56cafe','http://blog.example.com/tester_56136bb56cafe','19801001','N','Y','N','','20151006063537','20151006063537','20151006063537','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1980-10-01\";}',-212),
	(213,'test_id_56136bbabe303','tester_56136bbabe303@xpessengine.com','sha256:0008192:AW7ThQUdHmIn:SsmFB6ofpaVZaaRQLA26CqHGXMZXfqWI','tester_56136bbabe303','xpessengine.com','test_name_56136bbabe303','test_nick_56136bbabe303',4,'꽃피는 산골','http://example.com/tester_56136bbabe303','http://blog.example.com/tester_56136bbabe303','19901001','N','Y','N','','20151006063543','20151006063543','20151006063543','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1990-10-01\";}',-213),
	(214,'test_id_56136bc01e413','tester_56136bc01e413@xpessengine.com','sha256:0008192:Jg46b2jyp52A:D017BefcSxxeesHohArxV2nEUTokYc4d','tester_56136bc01e413','xpessengine.com','test_name_56136bc01e413','test_nick_56136bc01e413',4,'꽃피는 산골','http://example.com/tester_56136bc01e413','http://blog.example.com/tester_56136bc01e413','19851001','N','Y','N','','20151006063548','20151006063548','20151006063548','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-214),
	(215,'test_id_56136bc5c3936','tester_56136bc5c3936@xpessengine.com','sha256:0008192:LCDII9zIEeSK:t1VF/p1hp6JspwObKyetsNUZ77zTI+kV','tester_56136bc5c3936','xpessengine.com','test_name_56136bc5c3936','test_nick_56136bc5c3936',4,'꽃피는 산골','http://example.com/tester_56136bc5c3936','http://blog.example.com/tester_56136bc5c3936','19821001','N','Y','N','','20151006063554','20151006063554','20151006063554','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1982-10-01\";}',-215),
	(216,'test_id_56136bcb66e5a','tester_56136bcb66e5a@xpessengine.com','sha256:0008192:Wej1LIohecvE:i4PAYfEyYdHvMFY0OttR1SiP7pZnRNce','tester_56136bcb66e5a','xpessengine.com','test_name_56136bcb66e5a','test_nick_56136bcb66e5a',4,'꽃피는 산골','http://example.com/tester_56136bcb66e5a','http://blog.example.com/tester_56136bcb66e5a','19881001','N','Y','N','','20151006063600','20151006063600','20151006063600','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1988-10-01\";}',-216),
	(217,'test_id_56136bd0d7604','tester_56136bd0d7604@xpessengine.com','sha256:0008192:NSXgLeMnBByt:YsjsCoQbAkamhOE+ER02muF6zqb7s3M0','tester_56136bd0d7604','xpessengine.com','test_name_56136bd0d7604','test_nick_56136bd0d7604',4,'꽃피는 산골','http://example.com/tester_56136bd0d7604','http://blog.example.com/tester_56136bd0d7604','19891001','N','Y','N','','20151006063605','20151006063605','20151006063605','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1989-10-01\";}',-217),
	(218,'test_id_56136bd662197','tester_56136bd662197@xpessengine.com','sha256:0008192:iEbbNqcDdsaD:rnuSKv48B4RBleyLMMgWt4j+92ZpSF8p','tester_56136bd662197','xpessengine.com','test_name_56136bd662197','test_nick_56136bd662197',4,'꽃피는 산골','http://example.com/tester_56136bd662197','http://blog.example.com/tester_56136bd662197','19871001','N','Y','N','','20151006063610','20151006063610','20151006063610','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1987-10-01\";}',-218),
	(219,'test_id_56136bdbbb15f','tester_56136bdbbb15f@xpessengine.com','sha256:0008192:USXemVL9ycYB:Qn5UMtPhF4r8uqR8g81XH4vi6iAPmRtO','tester_56136bdbbb15f','xpessengine.com','test_name_56136bdbbb15f','test_nick_56136bdbbb15f',4,'꽃피는 산골','http://example.com/tester_56136bdbbb15f','http://blog.example.com/tester_56136bdbbb15f','19871001','N','Y','N','','20151006063616','20151006063616','20151006063616','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1987-10-01\";}',-219),
	(220,'test_id_56136be130c40','tester_56136be130c40@xpessengine.com','sha256:0008192:9NErxmquEdbu:MXN/CapbHUeo3o5GV4FLD3GJ8ttGeMFf','tester_56136be130c40','xpessengine.com','test_name_56136be130c40','test_nick_56136be130c40',4,'꽃피는 산골','http://example.com/tester_56136be130c40','http://blog.example.com/tester_56136be130c40','19861001','N','Y','N','','20151006063621','20151006063621','20151006063621','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-220),
	(221,'test_id_56136be6ad6a3','tester_56136be6ad6a3@xpessengine.com','sha256:0008192:5d7onhJYiyRE:sZzoUl1pp0o21rwHDR05AkDcVvTw5vdg','tester_56136be6ad6a3','xpessengine.com','test_name_56136be6ad6a3','test_nick_56136be6ad6a3',4,'꽃피는 산골','http://example.com/tester_56136be6ad6a3','http://blog.example.com/tester_56136be6ad6a3','19831001','N','Y','N','','20151006063627','20151006063627','20151006063627','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1983-10-01\";}',-221),
	(222,'test_id_56136bec3dd07','tester_56136bec3dd07@xpessengine.com','sha256:0008192:UkZGZGv2KdiM:ttmVczU/QAo5eBZxzYSjCe3vQTObRRSn','tester_56136bec3dd07','xpessengine.com','test_name_56136bec3dd07','test_nick_56136bec3dd07',4,'꽃피는 산골','http://example.com/tester_56136bec3dd07','http://blog.example.com/tester_56136bec3dd07','19861001','N','Y','N','','20151006063632','20151006063632','20151006063632','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-222),
	(223,'test_id_56136bf1830a2','tester_56136bf1830a2@xpessengine.com','sha256:0008192:6MoJ5wO7rL3h:/paAMXcbvpnjsHKHxLOtsj+0R5byKfzt','tester_56136bf1830a2','xpessengine.com','test_name_56136bf1830a2','test_nick_56136bf1830a2',4,'꽃피는 산골','http://example.com/tester_56136bf1830a2','http://blog.example.com/tester_56136bf1830a2','19871001','N','Y','N','','20151006063638','20151006063638','20151006063638','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1987-10-01\";}',-223),
	(224,'test_id_56136bf751ea4','tester_56136bf751ea4@xpessengine.com','sha256:0008192:nXi4FtQjhL8m:BcWxckb8rfc58EsS+hhDbr/Rmz2y2yK2','tester_56136bf751ea4','xpessengine.com','test_name_56136bf751ea4','test_nick_56136bf751ea4',4,'꽃피는 산골','http://example.com/tester_56136bf751ea4','http://blog.example.com/tester_56136bf751ea4','19931001','N','Y','N','','20151006063644','20151006063644','20151006063644','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1993-10-01\";}',-224),
	(225,'test_id_56136bfcc7471','tester_56136bfcc7471@xpessengine.com','sha256:0008192:2Fk2e6onoI4s:8prSth7gFMP4qY+6NdUTye4KxoH7Xcs3','tester_56136bfcc7471','xpessengine.com','test_name_56136bfcc7471','test_nick_56136bfcc7471',4,'꽃피는 산골','http://example.com/tester_56136bfcc7471','http://blog.example.com/tester_56136bfcc7471','19881001','N','Y','N','','20151006063649','20151006063649','20151006063649','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1988-10-01\";}',-225),
	(226,'test_id_56136c027425e','tester_56136c027425e@xpessengine.com','sha256:0008192:uCrgOXL6KII7:LDN7H41K3evL7tmJUFBPAjbS/bqlLxgX','tester_56136c027425e','xpessengine.com','test_name_56136c027425e','test_nick_56136c027425e',4,'꽃피는 산골','http://example.com/tester_56136c027425e','http://blog.example.com/tester_56136c027425e','19931001','N','Y','N','','20151006063654','20151006063654','20151006063654','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1993-10-01\";}',-226),
	(227,'test_id_56136c07c5d56','tester_56136c07c5d56@xpessengine.com','sha256:0008192:eS5BdssNzJLj:frljyfiBjhyTZVO7sryCIcu4ExwxDHea','tester_56136c07c5d56','xpessengine.com','test_name_56136c07c5d56','test_nick_56136c07c5d56',4,'꽃피는 산골','http://example.com/tester_56136c07c5d56','http://blog.example.com/tester_56136c07c5d56','19921001','N','Y','N','','20151006063700','20151006063700','20151006063700','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1992-10-01\";}',-227),
	(228,'test_id_56136c0d5da69','tester_56136c0d5da69@xpessengine.com','sha256:0008192:yfuy8sfLNzEE:4+/cQEDeDuR7qczbTzdK33NbAsKKDdp9','tester_56136c0d5da69','xpessengine.com','test_name_56136c0d5da69','test_nick_56136c0d5da69',4,'꽃피는 산골','http://example.com/tester_56136c0d5da69','http://blog.example.com/tester_56136c0d5da69','19861001','N','Y','N','','20151006063706','20151006063706','20151006063706','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-228),
	(229,'test_id_56136c1323977','tester_56136c1323977@xpessengine.com','sha256:0008192:KQbeQrhSfoS2:3qzEKQ7Vx0aJiBgiiEA18jK2I99LVqYD','tester_56136c1323977','xpessengine.com','test_name_56136c1323977','test_nick_56136c1323977',4,'꽃피는 산골','http://example.com/tester_56136c1323977','http://blog.example.com/tester_56136c1323977','19921001','N','Y','N','','20151006063711','20151006063711','20151006063711','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1992-10-01\";}',-229),
	(230,'test_id_56136c36a31f4','tester_56136c36a31f4@xpessengine.com','sha256:0008192:naQoS0e4Ou6V:vQMAoi/enAPkYnFNeoBOFnXPfimXl2T6','tester_56136c36a31f4','xpessengine.com','test_name_56136c36a31f4','test_nick_56136c36a31f4',4,'꽃피는 산골','http://example.com/tester_56136c36a31f4','http://blog.example.com/tester_56136c36a31f4','19851001','N','Y','N','','20151006063747','20151006063747','20151006063747','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-230),
	(231,'test_id_56136c3be605f','tester_56136c3be605f@xpessengine.com','sha256:0008192:uvmbaa3LXDU5:vdQs2IvbqS6hOwRGxjwbKfmcP2suzNk5','tester_56136c3be605f','xpessengine.com','test_name_56136c3be605f','test_nick_56136c3be605f',4,'꽃피는 산골','http://example.com/tester_56136c3be605f','http://blog.example.com/tester_56136c3be605f','19931001','N','Y','N','','20151006063752','20151006063752','20151006063752','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1993-10-01\";}',-231),
	(232,'test_id_56136c416bbe7','tester_56136c416bbe7@xpessengine.com','sha256:0008192:yXkPYolVyM2t:MYQ91ZswcMOvO/rMl9VbprI03QMO+DBp','tester_56136c416bbe7','xpessengine.com','test_name_56136c416bbe7','test_nick_56136c416bbe7',4,'꽃피는 산골','http://example.com/tester_56136c416bbe7','http://blog.example.com/tester_56136c416bbe7','19881001','N','Y','N','','20151006063758','20151006063758','20151006063758','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1988-10-01\";}',-232),
	(233,'test_id_56136c46ccc3f','tester_56136c46ccc3f@xpessengine.com','sha256:0008192:18hehgPUK0Cm:6pPy857n4Yhk1mKVi8FGM3EMFyxv0tvk','tester_56136c46ccc3f','xpessengine.com','test_name_56136c46ccc3f','test_nick_56136c46ccc3f',4,'꽃피는 산골','http://example.com/tester_56136c46ccc3f','http://blog.example.com/tester_56136c46ccc3f','19931001','N','Y','N','','20151006063803','20151006063803','20151006063803','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1993-10-01\";}',-233),
	(234,'test_id_56136c4c27e13','tester_56136c4c27e13@xpessengine.com','sha256:0008192:uZETUcMy89UK:hdq4khWbRmyx8npaLqwMcmVUlGNCBigR','tester_56136c4c27e13','xpessengine.com','test_name_56136c4c27e13','test_nick_56136c4c27e13',4,'꽃피는 산골','http://example.com/tester_56136c4c27e13','http://blog.example.com/tester_56136c4c27e13','19921001','N','Y','N','','20151006063808','20151006063808','20151006063808','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1992-10-01\";}',-234),
	(235,'test_id_56136c51b6d44','tester_56136c51b6d44@xpessengine.com','sha256:0008192:PAwRVmQs1rGX:KOfvGR/7T1ebefWGZZGW+JyBtSFuC0/8','tester_56136c51b6d44','xpessengine.com','test_name_56136c51b6d44','test_nick_56136c51b6d44',4,'꽃피는 산골','http://example.com/tester_56136c51b6d44','http://blog.example.com/tester_56136c51b6d44','19901001','N','Y','N','','20151006063814','20151006063814','20151006063814','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1990-10-01\";}',-235),
	(236,'test_id_56136c56ed81e','tester_56136c56ed81e@xpessengine.com','sha256:0008192:WvXi5cwMvmfP:N29p5fV9eBvvbt5Gmb2ucsnqSP8Chykv','tester_56136c56ed81e','xpessengine.com','test_name_56136c56ed81e','test_nick_56136c56ed81e',4,'꽃피는 산골','http://example.com/tester_56136c56ed81e','http://blog.example.com/tester_56136c56ed81e','19951001','N','Y','N','','20151006063819','20151006063819','20151006063819','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1995-10-01\";}',-236),
	(237,'test_id_56136c5c4c042','tester_56136c5c4c042@xpessengine.com','sha256:0008192:VJBWqz0f2g6Q:NPdkeEGELRVVtGV3fVWLOIBC6KxPzXHu','tester_56136c5c4c042','xpessengine.com','test_name_56136c5c4c042','test_nick_56136c5c4c042',4,'꽃피는 산골','http://example.com/tester_56136c5c4c042','http://blog.example.com/tester_56136c5c4c042','19811001','N','Y','N','','20151006063824','20151006063824','20151006063824','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-237),
	(238,'test_id_56136c618d97e','tester_56136c618d97e@xpessengine.com','sha256:0008192:wVbdcKMPFqrK:HkJSmduPPoZo/A/ZUQkg3ZtU9wGt9Ia4','tester_56136c618d97e','xpessengine.com','test_name_56136c618d97e','test_nick_56136c618d97e',4,'꽃피는 산골','http://example.com/tester_56136c618d97e','http://blog.example.com/tester_56136c618d97e','19811001','N','Y','N','','20151006063830','20151006063830','20151006063830','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-238),
	(239,'test_id_56136c66bce2b','tester_56136c66bce2b@xpessengine.com','sha256:0008192:KyqRGfrpa7ce:305VTVspmxFs7X9FLDr3Vyf4vf+sowXn','tester_56136c66bce2b','xpessengine.com','test_name_56136c66bce2b','test_nick_56136c66bce2b',4,'꽃피는 산골','http://example.com/tester_56136c66bce2b','http://blog.example.com/tester_56136c66bce2b','19861001','N','Y','N','','20151006063835','20151006063835','20151006063835','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-239),
	(240,'test_id_56136c6c08186','tester_56136c6c08186@xpessengine.com','sha256:0008192:pfjqfFStTr6Q:HWbvCMu+YqJ44Rrp9CHMsC7zyY8syuds','tester_56136c6c08186','xpessengine.com','test_name_56136c6c08186','test_nick_56136c6c08186',4,'꽃피는 산골','http://example.com/tester_56136c6c08186','http://blog.example.com/tester_56136c6c08186','19941001','N','Y','N','','20151006063840','20151006063840','20151006063840','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1994-10-01\";}',-240),
	(241,'test_id_56136c7171425','tester_56136c7171425@xpessengine.com','sha256:0008192:5IQytFowTMI5:c/Hk1It1S7J4hiegFgmCARLFueNvUM3E','tester_56136c7171425','xpessengine.com','test_name_56136c7171425','test_nick_56136c7171425',4,'꽃피는 산골','http://example.com/tester_56136c7171425','http://blog.example.com/tester_56136c7171425','19871001','N','Y','N','','20151006063845','20151006063845','20151006063845','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1987-10-01\";}',-241),
	(242,'test_id_56136c7699ccb','tester_56136c7699ccb@xpessengine.com','sha256:0008192:gkkdMv3ku6uk:XL3FBPLb+HqsrMmNDArj7b8baXVgSOYG','tester_56136c7699ccb','xpessengine.com','test_name_56136c7699ccb','test_nick_56136c7699ccb',4,'꽃피는 산골','http://example.com/tester_56136c7699ccb','http://blog.example.com/tester_56136c7699ccb','19831001','N','Y','N','','20151006063851','20151006063851','20151006063851','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1983-10-01\";}',-242),
	(243,'test_id_56136c7c01528','tester_56136c7c01528@xpessengine.com','sha256:0008192:K6YI2BBMlQz1:2MrQcYyIz8Gq/UDVYP89aQ9wWZf+Fp3U','tester_56136c7c01528','xpessengine.com','test_name_56136c7c01528','test_nick_56136c7c01528',4,'꽃피는 산골','http://example.com/tester_56136c7c01528','http://blog.example.com/tester_56136c7c01528','19871001','N','Y','N','','20151006063856','20151006063856','20151006063856','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1987-10-01\";}',-243),
	(244,'test_id_56136c8143db5','tester_56136c8143db5@xpessengine.com','sha256:0008192:pBcWbgkpeK26:7ExeDLjp/Jpo1xHvHcJ7AWcJUkrxyNCb','tester_56136c8143db5','xpessengine.com','test_name_56136c8143db5','test_nick_56136c8143db5',4,'꽃피는 산골','http://example.com/tester_56136c8143db5','http://blog.example.com/tester_56136c8143db5','19811001','N','Y','N','','20151006063901','20151006063901','20151006063901','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-244),
	(245,'test_id_56136c867dd37','tester_56136c867dd37@xpessengine.com','sha256:0008192:jD3ZXkAaKhpp:Mif9NXK2NiBm0kWUxIYf0PLqQSYu+IY7','tester_56136c867dd37','xpessengine.com','test_name_56136c867dd37','test_nick_56136c867dd37',4,'꽃피는 산골','http://example.com/tester_56136c867dd37','http://blog.example.com/tester_56136c867dd37','19861001','N','Y','N','','20151006063907','20151006063907','20151006063907','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-245),
	(246,'test_id_56136c8be729b','tester_56136c8be729b@xpessengine.com','sha256:0008192:OqEt5lUENrpx:t2fX9uTyZcZnKn5kY0sRJpF1ap4/iXCy','tester_56136c8be729b','xpessengine.com','test_name_56136c8be729b','test_nick_56136c8be729b',4,'꽃피는 산골','http://example.com/tester_56136c8be729b','http://blog.example.com/tester_56136c8be729b','19851001','N','Y','N','','20151006063912','20151006063912','20151006063912','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1985-10-01\";}',-246),
	(247,'test_id_56136c9163853','tester_56136c9163853@xpessengine.com','sha256:0008192:yFWLANhQtt0U:gPJLAk5lV6Y0qFuZ1w2FMXonLlbBto+9','tester_56136c9163853','xpessengine.com','test_name_56136c9163853','test_nick_56136c9163853',4,'꽃피는 산골','http://example.com/tester_56136c9163853','http://blog.example.com/tester_56136c9163853','19861001','N','Y','N','','20151006063917','20151006063917','20151006063917','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-247),
	(248,'test_id_56136c9694e91','tester_56136c9694e91@xpessengine.com','sha256:0008192:ZQkr2eXM8xfR:MRRuR+9VNJ0Kwm9ckhMgLxpLUpzqgicA','tester_56136c9694e91','xpessengine.com','test_name_56136c9694e91','test_nick_56136c9694e91',4,'꽃피는 산골','http://example.com/tester_56136c9694e91','http://blog.example.com/tester_56136c9694e91','19821001','N','Y','N','','20151006063923','20151006063923','20151006063923','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1982-10-01\";}',-248),
	(249,'test_id_56136c9c1e46a','tester_56136c9c1e46a@xpessengine.com','sha256:0008192:cI699cnAk8PM:ME3RvD9SRC+Ih0aBsL2UgWaOgGsLxxTU','tester_56136c9c1e46a','xpessengine.com','test_name_56136c9c1e46a','test_nick_56136c9c1e46a',4,'꽃피는 산골','http://example.com/tester_56136c9c1e46a','http://blog.example.com/tester_56136c9c1e46a','19821001','N','Y','N','','20151006063928','20151006063928','20151006063928','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1982-10-01\";}',-249),
	(250,'test_id_56136ca155831','tester_56136ca155831@xpessengine.com','sha256:0008192:SRrSsU89QxJ6:P0BywE/nWy5IJ8am2PeQN5bqYnVVWbZk','tester_56136ca155831','xpessengine.com','test_name_56136ca155831','test_nick_56136ca155831',4,'꽃피는 산골','http://example.com/tester_56136ca155831','http://blog.example.com/tester_56136ca155831','19901001','N','Y','N','','20151006063933','20151006063933','20151006063933','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1990-10-01\";}',-250),
	(251,'test_id_56136ca6b5144','tester_56136ca6b5144@xpessengine.com','sha256:0008192:oRJpYOwMAkA6:dBh4fgcjS/pQy2UhlX6LjN53RzkFCNSS','tester_56136ca6b5144','xpessengine.com','test_name_56136ca6b5144','test_nick_56136ca6b5144',4,'꽃피는 산골','http://example.com/tester_56136ca6b5144','http://blog.example.com/tester_56136ca6b5144','19861001','N','Y','N','','20151006063939','20151006063939','20151006063939','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1986-10-01\";}',-251),
	(252,'test_id_56136cac67a72','tester_56136cac67a72@xpessengine.com','sha256:0008192:1wrYK6AwsD4B:XXeYVpRo/l4pZ+gaCnrAnULHe1Kh2wOX','tester_56136cac67a72','xpessengine.com','test_name_56136cac67a72','test_nick_56136cac67a72',4,'꽃피는 산골','http://example.com/tester_56136cac67a72','http://blog.example.com/tester_56136cac67a72','19891001','N','Y','N','','20151006063945','20151006063945','20151006063945','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1989-10-01\";}',-252),
	(253,'test_id_56136cb1c8bca','tester_56136cb1c8bca@xpessengine.com','sha256:0008192:sSffEVG6wfbE:MRw/SkyWQRUD9+s3OAoNIm/EYPmoJXAp','tester_56136cb1c8bca','xpessengine.com','test_name_56136cb1c8bca','test_nick_56136cb1c8bca',4,'꽃피는 산골','http://example.com/tester_56136cb1c8bca','http://blog.example.com/tester_56136cb1c8bca','19911001','N','Y','N','','20151006063950','20151006063950','20151006063950','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1991-10-01\";}',-253),
	(254,'test_id_56136cb7751c3','tester_56136cb7751c3@xpessengine.com','sha256:0008192:7ytn5GPsGNI6:arPFJJM1e+OPBbTLnbcEb/m+H70BBRui','tester_56136cb7751c3','xpessengine.com','test_name_56136cb7751c3','test_nick_56136cb7751c3',4,'꽃피는 산골','http://example.com/tester_56136cb7751c3','http://blog.example.com/tester_56136cb7751c3','19941001','N','Y','N','','20151006063955','20151006063955','20151006063955','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1994-10-01\";}',-254),
	(255,'test_id_56136cbca2e85','tester_56136cbca2e85@xpessengine.com','sha256:0008192:meiPCzrSUvte:fx8Hoa7zIjZcipqDwAxp7rIMhPHCRL04','tester_56136cbca2e85','xpessengine.com','test_name_56136cbca2e85','test_nick_56136cbca2e85',4,'꽃피는 산골','http://example.com/tester_56136cbca2e85','http://blog.example.com/tester_56136cbca2e85','19811001','N','Y','N','','20151006064001','20151006064001','20151006064001','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1981-10-01\";}',-255),
	(256,'test_id_56136cc22232d','tester_56136cc22232d@xpessengine.com','sha256:0008192:cO35yTJJu0HQ:IDn4DfJCR1mTJCOaQjS1kKr/IA7dWuW5','tester_56136cc22232d','xpessengine.com','test_name_56136cc22232d','test_nick_56136cc22232d',4,'꽃피는 산골','http://example.com/tester_56136cc22232d','http://blog.example.com/tester_56136cc22232d','19831001','N','Y','N','','20151006064006','20151006064006','20151006064006','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1983-10-01\";}',-256),
	(257,'test_id_56136cc7599bc','tester_56136cc7599bc@xpessengine.com','sha256:0008192:o1szAavjfLeb:n6uVMUzgUqAKSFTUzHJ0Uweult6G8IEE','tester_56136cc7599bc','xpessengine.com','test_name_56136cc7599bc','test_nick_56136cc7599bc',4,'꽃피는 산골','http://example.com/tester_56136cc7599bc','http://blog.example.com/tester_56136cc7599bc','19881001','N','Y','N','','20151006064011','20151006064011','20151006064011','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1988-10-01\";}',-257),
	(258,'test_id_56136ccc8b6e1','tester_56136ccc8b6e1@xpessengine.com','sha256:0008192:vAMs2lzfrDGH:GbcjIOhRhKSShHKmgNY3KBcwvF0IkLDb','tester_56136ccc8b6e1','xpessengine.com','test_name_56136ccc8b6e1','test_nick_56136ccc8b6e1',4,'꽃피는 산골','http://example.com/tester_56136ccc8b6e1','http://blog.example.com/tester_56136ccc8b6e1','19821001','N','Y','N','','20151006064017','20151006064017','20151006064017','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1982-10-01\";}',-258),
	(259,'test_id_56136cd1e09f7','tester_56136cd1e09f7@xpessengine.com','sha256:0008192:1QeXfHQgS6d4:xFe1FVB5XZrjpirMuFo33FtqfRFztZFe','tester_56136cd1e09f7','xpessengine.com','test_name_56136cd1e09f7','test_nick_56136cd1e09f7',4,'꽃피는 산골','http://example.com/tester_56136cd1e09f7','http://blog.example.com/tester_56136cd1e09f7','19831001','N','Y','N','','20151006064022','20151006064022','20151006064022','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1983-10-01\";}',-259),
	(260,'test_id_56136cd7528e5','tester_56136cd7528e5@xpessengine.com','sha256:0008192:OEjRdwaVGw0X:z96Anp/ZWw2LyRQMc0mm+qRFGa5sKp06','tester_56136cd7528e5','xpessengine.com','test_name_56136cd7528e5','test_nick_56136cd7528e5',4,'꽃피는 산골','http://example.com/tester_56136cd7528e5','http://blog.example.com/tester_56136cd7528e5','19951001','N','Y','N','','20151006064027','20151006064027','20151006064027','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1995-10-01\";}',-260),
	(261,'test_id_56136cdc5dd30','tester_56136cdc5dd30@xpessengine.com','sha256:0008192:JiJPaB9L2g8L:Qhz212dr45rGoWDbJMZrSExl4LB5FSIW','tester_56136cdc5dd30','xpessengine.com','test_name_56136cdc5dd30','test_nick_56136cdc5dd30',4,'꽃피는 산골','http://example.com/tester_56136cdc5dd30','http://blog.example.com/tester_56136cdc5dd30','19871001','N','Y','N','','19800101064032','19800101064032','20151006064032','N',NULL,'O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1987-10-01\";}',-261),
	(262,'test_id_56136ce1952ff','tester_56136ce1952ff@xpessengine.com','sha256:0008192:TxcCMvuLGUA4:2HG1Oupxv2y4jeVNVgrlhpcGFVQIWMfR','tester_56136ce1952ff','xpessengine.com','test_name_56136ce1952ff','test_nick_56136ce1952ff',4,'꽃피는 산골','http://example.com/tester_56136ce1952ff','http://blog.example.com/tester_56136ce1952ff','19801001','N','Y','N','','20200101064038','20200101064038','20151006064038','N','','O:8:\"stdClass\":2:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"1980-10-01\";}',-262),
	(265,'boardmaster','boardmaster@xpressengine.com','sha256:0008192:Tu9U5J17FSsx:aaBuLKO5o+B47E6hNry6pCgEcCjikhO6','boardmaster','xpressengine.com','265','boardmaster',1,'boardmaster','','','','N','Y','N','','20151006064402','20151006064402','20151006064402','N','','O:8:\"stdClass\":1:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";}',-265),
	(266,'boardsupermaster','boardsupermaster@xpressengine.com','sha256:0008192:8Hl82NuxQyjg:wV3HwYmNSu+Kk/JK6DteSTBS1L/ovJlA','boardsupermaster','xpressengine.com','boardsupermaster','boardsupermaster',1,'boardsupermaster','','',NULL,'N','Y','N','','20151006064427','20151006064427','20151006064427','N',NULL,'O:8:\"stdClass\":1:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";}',-266),
	(268,'user_id','email@domain.com','sha256:0008192:SML1gPcoDF3A:/IIqcI9QB67h6+NrTeOO+q0O5yD85u/f','email','domain.com','user_name','nick_name',1,'tester','','','20000101','N','Y','N','','20151006065722','20151008150849','20001006065722','N','','O:8:\"stdClass\":3:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";s:11:\"birthday_ui\";s:10:\"2000-01-01\";s:11:\"userdefined\";s:5:\"XEHub\";}',-268),
	(272,'changing','changing@xpressengine.com','sha256:0008192:OG8GxNkoipKB:DncQ9hZ/gZupLra2DhHeI/CHekeC/h0Y','changing','xpressengine.com','changing','new',1,'new','','','','N','Y','N','','20151006071931','20151006071949','20151006071931','N','','O:8:\"stdClass\":1:{s:15:\"xe_validator_id\";s:20:\"modules/member/tpl/1\";}',-272);

/*!40000 ALTER TABLE `xe_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_member_auth_mail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_auth_mail`;

CREATE TABLE `xe_member_auth_mail` (
  `auth_key` varchar(60) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `user_id` varchar(80) NOT NULL,
  `new_password` varchar(80) NOT NULL,
  `is_register` char(1) DEFAULT 'N',
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_key` (`auth_key`,`member_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_member_autologin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_autologin`;

CREATE TABLE `xe_member_autologin` (
  `autologin_key` varchar(80) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  UNIQUE KEY `unique_key` (`autologin_key`,`member_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_member_count_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_count_history`;

CREATE TABLE `xe_member_count_history` (
  `member_srl` bigint(11) NOT NULL,
  `content` longtext NOT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`member_srl`),
  KEY `idx_last_update` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_member_denied_nick_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_denied_nick_name`;

CREATE TABLE `xe_member_denied_nick_name` (
  `nick_name` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`nick_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_member_denied_nick_name` WRITE;
/*!40000 ALTER TABLE `xe_member_denied_nick_name` DISABLE KEYS */;

INSERT INTO `xe_member_denied_nick_name` (`nick_name`, `regdate`, `description`)
VALUES
	('admin','20151006075601','');

/*!40000 ALTER TABLE `xe_member_denied_nick_name` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_member_denied_user_id
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_denied_user_id`;

CREATE TABLE `xe_member_denied_user_id` (
  `user_id` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `description` text,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_member_denied_user_id` WRITE;
/*!40000 ALTER TABLE `xe_member_denied_user_id` DISABLE KEYS */;

INSERT INTO `xe_member_denied_user_id` (`user_id`, `regdate`, `description`, `list_order`)
VALUES
	('admin','20151006075558','',-281);

/*!40000 ALTER TABLE `xe_member_denied_user_id` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_member_friend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_friend`;

CREATE TABLE `xe_member_friend` (
  `friend_srl` bigint(11) NOT NULL,
  `friend_group_srl` bigint(11) NOT NULL DEFAULT '0',
  `member_srl` bigint(11) NOT NULL,
  `target_srl` bigint(11) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`friend_srl`),
  KEY `idx_friend_group_srl` (`friend_group_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_target_srl` (`target_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_member_friend_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_friend_group`;

CREATE TABLE `xe_member_friend_group` (
  `friend_group_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`friend_group_srl`),
  KEY `index_owner_member_srl` (`member_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_member_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_group`;

CREATE TABLE `xe_member_group` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `group_srl` bigint(11) NOT NULL,
  `list_order` bigint(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `is_default` char(1) DEFAULT 'N',
  `is_admin` char(1) DEFAULT 'N',
  `image_mark` text,
  `description` text,
  PRIMARY KEY (`group_srl`),
  UNIQUE KEY `idx_site_title` (`site_srl`,`title`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_member_group` WRITE;
/*!40000 ALTER TABLE `xe_member_group` DISABLE KEYS */;

INSERT INTO `xe_member_group` (`site_srl`, `group_srl`, `list_order`, `title`, `regdate`, `is_default`, `is_admin`, `image_mark`, `description`)
VALUES
	(0,1,1,'관리그룹','20151006062111','N','Y','',''),
	(0,2,2,'준회원','20151006062111','Y','N','',''),
	(0,3,3,'정회원','20151006062111','N','N','','');

/*!40000 ALTER TABLE `xe_member_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_member_group_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_group_member`;

CREATE TABLE `xe_member_group_member` (
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `group_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_site_srl` (`site_srl`),
  KEY `idx_group_member` (`group_srl`,`member_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_member_group_member` WRITE;
/*!40000 ALTER TABLE `xe_member_group_member` DISABLE KEYS */;

INSERT INTO `xe_member_group_member` (`site_srl`, `group_srl`, `member_srl`, `regdate`)
VALUES
	(0,1,4,'20151006062111'),
	(0,2,163,'20151006063114'),
	(0,2,164,'20151006063119'),
	(0,2,165,'20151006063125'),
	(0,2,166,'20151006063130'),
	(0,2,167,'20151006063135'),
	(0,2,168,'20151006063140'),
	(0,2,169,'20151006063146'),
	(0,2,170,'20151006063151'),
	(0,2,171,'20151006063156'),
	(0,2,172,'20151006063202'),
	(0,2,173,'20151006063207'),
	(0,2,174,'20151006063213'),
	(0,2,175,'20151006063218'),
	(0,2,176,'20151006063223'),
	(0,2,177,'20151006063229'),
	(0,2,178,'20151006063234'),
	(0,2,179,'20151006063239'),
	(0,2,180,'20151006063245'),
	(0,2,181,'20151006063250'),
	(0,2,182,'20151006063255'),
	(0,2,183,'20151006063300'),
	(0,2,184,'20151006063306'),
	(0,2,185,'20151006063311'),
	(0,2,186,'20151006063317'),
	(0,2,187,'20151006063322'),
	(0,2,188,'20151006063327'),
	(0,2,189,'20151006063332'),
	(0,2,190,'20151006063338'),
	(0,2,191,'20151006063343'),
	(0,2,192,'20151006063349'),
	(0,2,193,'20151006063354'),
	(0,2,194,'20151006063359'),
	(0,2,195,'20151006063405'),
	(0,2,196,'20151006063410'),
	(0,2,197,'20151006063416'),
	(0,2,198,'20151006063421'),
	(0,2,199,'20151006063427'),
	(0,2,200,'20151006063432'),
	(0,2,201,'20151006063438'),
	(0,2,202,'20151006063443'),
	(0,2,203,'20151006063449'),
	(0,2,204,'20151006063454'),
	(0,2,205,'20151006063459'),
	(0,2,206,'20151006063505'),
	(0,2,207,'20151006063510'),
	(0,2,208,'20151006063516'),
	(0,2,209,'20151006063521'),
	(0,2,210,'20151006063527'),
	(0,2,211,'20151006063532'),
	(0,2,212,'20151006063537'),
	(0,2,213,'20151006063543'),
	(0,2,214,'20151006063548'),
	(0,2,215,'20151006063554'),
	(0,2,216,'20151006063600'),
	(0,2,217,'20151006063605'),
	(0,2,218,'20151006063610'),
	(0,2,219,'20151006063616'),
	(0,2,220,'20151006063621'),
	(0,2,221,'20151006063627'),
	(0,2,222,'20151006063632'),
	(0,2,223,'20151006063638'),
	(0,2,224,'20151006063644'),
	(0,2,225,'20151006063649'),
	(0,2,226,'20151006063654'),
	(0,2,227,'20151006063700'),
	(0,2,228,'20151006063706'),
	(0,2,229,'20151006063711'),
	(0,2,230,'20151006063747'),
	(0,2,231,'20151006063752'),
	(0,2,232,'20151006063758'),
	(0,2,233,'20151006063803'),
	(0,2,234,'20151006063808'),
	(0,2,235,'20151006063814'),
	(0,2,236,'20151006063819'),
	(0,2,237,'20151006063824'),
	(0,2,238,'20151006063830'),
	(0,2,239,'20151006063835'),
	(0,2,240,'20151006063840'),
	(0,2,241,'20151006063845'),
	(0,2,242,'20151006063851'),
	(0,2,243,'20151006063856'),
	(0,2,244,'20151006063901'),
	(0,2,245,'20151006063907'),
	(0,2,246,'20151006063912'),
	(0,2,247,'20151006063917'),
	(0,2,248,'20151006063923'),
	(0,2,249,'20151006063928'),
	(0,2,250,'20151006063933'),
	(0,2,251,'20151006063939'),
	(0,2,252,'20151006063945'),
	(0,2,253,'20151006063950'),
	(0,2,254,'20151006063955'),
	(0,2,255,'20151006064001'),
	(0,2,256,'20151006064006'),
	(0,2,257,'20151006064011'),
	(0,2,258,'20151006064017'),
	(0,2,259,'20151006064022'),
	(0,2,260,'20151006064027'),
	(0,2,261,'20151006064032'),
	(0,2,262,'20151006064254'),
	(0,1,266,'20151006064427'),
	(0,2,265,'20151006064436'),
	(0,2,272,'20151006072019'),
	(0,2,268,'20151008160322');

/*!40000 ALTER TABLE `xe_member_group_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_member_join_form
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_join_form`;

CREATE TABLE `xe_member_join_form` (
  `member_join_form_srl` bigint(11) NOT NULL,
  `column_type` varchar(60) NOT NULL,
  `column_name` varchar(60) NOT NULL,
  `column_title` varchar(60) NOT NULL,
  `required` char(1) NOT NULL DEFAULT 'N',
  `default_value` text,
  `is_active` char(1) DEFAULT 'Y',
  `description` text,
  `list_order` bigint(11) NOT NULL DEFAULT '1',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`member_join_form_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_member_join_form` WRITE;
/*!40000 ALTER TABLE `xe_member_join_form` DISABLE KEYS */;

INSERT INTO `xe_member_join_form` (`member_join_form_srl`, `column_type`, `column_name`, `column_title`, `required`, `default_value`, `is_active`, `description`, `list_order`, `regdate`)
VALUES
	(338,'text','userdefined','UserDefined','N','','Y','',338,'20151008143018');

/*!40000 ALTER TABLE `xe_member_join_form` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_member_login_count
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_login_count`;

CREATE TABLE `xe_member_login_count` (
  `ipaddress` varchar(128) NOT NULL,
  `count` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_last_update` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_member_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_message`;

CREATE TABLE `xe_member_message` (
  `message_srl` bigint(11) NOT NULL,
  `related_srl` bigint(11) NOT NULL,
  `sender_srl` bigint(11) NOT NULL,
  `receiver_srl` bigint(11) NOT NULL,
  `message_type` char(1) NOT NULL DEFAULT 'S',
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `readed` char(1) NOT NULL DEFAULT 'N',
  `list_order` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `readed_date` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`message_srl`),
  KEY `idx_related_srl` (`related_srl`),
  KEY `idx_sender_srl` (`sender_srl`),
  KEY `idx_receiver_srl` (`receiver_srl`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_member_scrap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_member_scrap`;

CREATE TABLE `xe_member_scrap` (
  `member_srl` bigint(11) NOT NULL,
  `document_srl` bigint(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `user_name` varchar(80) NOT NULL,
  `nick_name` varchar(80) NOT NULL,
  `target_member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  UNIQUE KEY `unique_scrap` (`member_srl`,`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_menu`;

CREATE TABLE `xe_menu` (
  `menu_srl` bigint(12) NOT NULL,
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `listorder` bigint(11) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`menu_srl`),
  KEY `menu_site_srl` (`site_srl`),
  KEY `idx_title` (`title`),
  KEY `idx_listorder` (`listorder`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_menu` WRITE;
/*!40000 ALTER TABLE `xe_menu` DISABLE KEYS */;

INSERT INTO `xe_menu` (`menu_srl`, `site_srl`, `title`, `listorder`, `regdate`)
VALUES
	(62,0,'Main menu',-62,'20151006062112'),
	(73,0,'Utility menu',-73,'20151006062112'),
	(76,0,'Footer Menu',-76,'20151006062112'),
	(94,0,'__ADMINMENU_V17__',-94,'20151006062117');

/*!40000 ALTER TABLE `xe_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_menu_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_menu_item`;

CREATE TABLE `xe_menu_item` (
  `menu_item_srl` bigint(12) NOT NULL,
  `parent_srl` bigint(12) NOT NULL DEFAULT '0',
  `menu_srl` bigint(12) NOT NULL,
  `name` text,
  `desc` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `is_shortcut` char(1) DEFAULT 'N',
  `open_window` char(1) DEFAULT 'N',
  `expand` char(1) DEFAULT 'N',
  `normal_btn` varchar(255) DEFAULT NULL,
  `hover_btn` varchar(255) DEFAULT NULL,
  `active_btn` varchar(255) DEFAULT NULL,
  `group_srls` text,
  `listorder` bigint(11) DEFAULT '0',
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`menu_item_srl`),
  KEY `idx_menu_srl` (`menu_srl`),
  KEY `idx_listorder` (`listorder`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_menu_item` WRITE;
/*!40000 ALTER TABLE `xe_menu_item` DISABLE KEYS */;

INSERT INTO `xe_menu_item` (`menu_item_srl`, `parent_srl`, `menu_srl`, `name`, `desc`, `url`, `is_shortcut`, `open_window`, `expand`, `normal_btn`, `hover_btn`, `active_btn`, `group_srls`, `listorder`, `regdate`)
VALUES
	(64,0,62,'Welcome Page','','index','N','N','N',NULL,NULL,NULL,NULL,-64,'20151006062112'),
	(66,0,62,'Board1','','board1','N','N','N',NULL,NULL,NULL,NULL,-66,'20151006062112'),
	(74,0,73,'XE Official Site','','http://www.xpressengine.com','Y','N','N',NULL,NULL,NULL,NULL,-74,'20151006062112'),
	(75,0,73,'GitHub','','https://github.com/xpressengine','Y','N','N',NULL,NULL,NULL,NULL,-75,'20151006062112'),
	(77,0,76,'Welcome Page','','#','Y','N','N',NULL,NULL,NULL,NULL,-77,'20151006062112'),
	(78,77,76,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-78,'20151006062112'),
	(79,77,76,'SAMPLE 2','','#','Y','N','N',NULL,NULL,NULL,NULL,-79,'20151006062112'),
	(80,77,76,'SAMPLE 3','','#','Y','N','N',NULL,NULL,NULL,NULL,-80,'20151006062112'),
	(81,0,76,'Board','','#','Y','N','N',NULL,NULL,NULL,NULL,-81,'20151006062112'),
	(82,81,76,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-82,'20151006062112'),
	(83,81,76,'SAMPLE 2','','#','Y','N','N',NULL,NULL,NULL,NULL,-83,'20151006062112'),
	(84,0,76,'XEIcon','','#','Y','N','N',NULL,NULL,NULL,NULL,-84,'20151006062112'),
	(85,84,76,'SAMPLE 1','','#','Y','N','N',NULL,NULL,NULL,NULL,-85,'20151006062112'),
	(95,0,94,'{$lang->menu_gnb[\'dashboard\']}',NULL,'index.php?module=admin','N','N','N',NULL,NULL,NULL,NULL,-95,'20151006062117'),
	(96,0,94,'{$lang->menu_gnb[\'menu\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-96,'20151006062117'),
	(97,0,94,'{$lang->menu_gnb[\'user\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-97,'20151006062117'),
	(98,0,94,'{$lang->menu_gnb[\'content\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-98,'20151006062117'),
	(99,0,94,'{$lang->menu_gnb[\'configuration\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-99,'20151006062117'),
	(100,0,94,'{$lang->menu_gnb[\'advanced\']}',NULL,'#','N','N','N',NULL,NULL,NULL,NULL,-100,'20151006062117'),
	(101,96,94,'{$lang->menu_gnb_sub[\'siteMap\']}',NULL,'index.php?module=admin&act=dispMenuAdminSiteMap','N','N','N','','','','1',-101,'20151006062117'),
	(102,96,94,'{$lang->menu_gnb_sub[\'siteDesign\']}',NULL,'index.php?module=admin&act=dispMenuAdminSiteDesign','N','N','N','','','','1',-102,'20151006062117'),
	(103,97,94,'{$lang->menu_gnb_sub[\'userList\']}',NULL,'index.php?module=admin&act=dispMemberAdminList','N','N','N','','','','1',-103,'20151006062117'),
	(104,97,94,'{$lang->menu_gnb_sub[\'userSetting\']}',NULL,'index.php?module=admin&act=dispMemberAdminConfig','N','N','N','','','','1',-104,'20151006062117'),
	(105,97,94,'{$lang->menu_gnb_sub[\'userGroup\']}',NULL,'index.php?module=admin&act=dispMemberAdminGroupList','N','N','N','','','','1',-105,'20151006062117'),
	(106,98,94,'{$lang->menu_gnb_sub[\'document\']}',NULL,'index.php?module=admin&act=dispDocumentAdminList','N','N','N','','','','1',-106,'20151006062117'),
	(107,98,94,'{$lang->menu_gnb_sub[\'comment\']}',NULL,'index.php?module=admin&act=dispCommentAdminList','N','N','N','','','','1',-107,'20151006062117'),
	(108,98,94,'{$lang->menu_gnb_sub[\'file\']}',NULL,'index.php?module=admin&act=dispFileAdminList','N','N','N','','','','1',-108,'20151006062117'),
	(109,98,94,'{$lang->menu_gnb_sub[\'poll\']}',NULL,'index.php?module=admin&act=dispPollAdminList','N','N','N','','','','1',-109,'20151006062117'),
	(110,98,94,'{$lang->menu_gnb_sub[\'rss\']}',NULL,'index.php?module=admin&act=dispRssAdminIndex','N','N','N','','','','1',-110,'20151006062117'),
	(111,98,94,'{$lang->menu_gnb_sub[\'multilingual\']}',NULL,'index.php?module=admin&act=dispModuleAdminLangcode','N','N','N','','','','1',-111,'20151006062117'),
	(112,98,94,'{$lang->menu_gnb_sub[\'importer\']}',NULL,'index.php?module=admin&act=dispImporterAdminImportForm','N','N','N','','','','1',-112,'20151006062117'),
	(113,98,94,'{$lang->menu_gnb_sub[\'trash\']}',NULL,'index.php?module=admin&act=dispTrashAdminList','N','N','N','','','','1',-113,'20151006062117'),
	(114,100,94,'{$lang->menu_gnb_sub[\'easyInstall\']}',NULL,'index.php?module=admin&act=dispAutoinstallAdminIndex','N','N','N','','','','1',-114,'20151006062117'),
	(115,100,94,'{$lang->menu_gnb_sub[\'installedLayout\']}',NULL,'index.php?module=admin&act=dispLayoutAdminInstalledList','N','N','N','','','','1',-115,'20151006062117'),
	(116,100,94,'{$lang->menu_gnb_sub[\'installedModule\']}',NULL,'index.php?module=admin&act=dispModuleAdminContent','N','N','N','','','','1',-116,'20151006062117'),
	(117,100,94,'{$lang->menu_gnb_sub[\'installedWidget\']}',NULL,'index.php?module=admin&act=dispWidgetAdminDownloadedList','N','N','N','','','','1',-117,'20151006062117'),
	(118,100,94,'{$lang->menu_gnb_sub[\'installedAddon\']}',NULL,'index.php?module=admin&act=dispAddonAdminIndex','N','N','N','','','','1',-118,'20151006062117'),
	(119,100,94,'{$lang->menu_gnb_sub[\'editor\']}',NULL,'index.php?module=admin&act=dispEditorAdminIndex','N','N','N','','','','1',-119,'20151006062117'),
	(120,98,94,'{$lang->menu_gnb_sub[\'spamFilter\']}',NULL,'index.php?module=admin&act=dispSpamfilterAdminDeniedIPList','N','N','N','','','','1',-120,'20151006062117'),
	(121,99,94,'{$lang->menu_gnb_sub[\'adminConfigurationGeneral\']}',NULL,'index.php?module=admin&act=dispAdminConfigGeneral','N','N','N','','','','1',-121,'20151006062117'),
	(122,99,94,'{$lang->menu_gnb_sub[\'adminConfigurationFtp\']}',NULL,'index.php?module=admin&act=dispAdminConfigFtp','N','N','N','','','','1',-122,'20151006062117'),
	(123,99,94,'{$lang->menu_gnb_sub[\'adminMenuSetup\']}',NULL,'index.php?module=admin&act=dispAdminSetup','N','N','N','','','','1',-123,'20151006062117'),
	(124,99,94,'{$lang->menu_gnb_sub[\'fileUpload\']}',NULL,'index.php?module=admin&act=dispFileAdminConfig','N','N','N','','','','1',-124,'20151006062117'),
	(125,99,94,'{$lang->menu_gnb_sub[\'filebox\']}',NULL,'index.php?module=admin&act=dispModuleAdminFileBox','N','N','N','','','','1',-125,'20151006062117'),
	(126,97,94,'{$lang->menu_gnb_sub[\'point\']}',NULL,'index.php?module=admin&act=dispPointAdminConfig','N','N','N','','','','1',-126,'20151006062117'),
	(264,0,62,'Board2','Board2','board2','N','N','N',NULL,NULL,NULL,NULL,-264,'20151006064210');

/*!40000 ALTER TABLE `xe_menu_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_menu_layout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_menu_layout`;

CREATE TABLE `xe_menu_layout` (
  `menu_srl` bigint(12) NOT NULL,
  `layout_srl` bigint(12) NOT NULL,
  PRIMARY KEY (`menu_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_module_admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_admins`;

CREATE TABLE `xe_module_admins` (
  `module_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `unique_module_admin` (`module_srl`,`member_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_module_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_categories`;

CREATE TABLE `xe_module_categories` (
  `module_category_srl` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_category_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_module_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_config`;

CREATE TABLE `xe_module_config` (
  `module` varchar(250) NOT NULL,
  `site_srl` bigint(11) NOT NULL,
  `config` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_module_config` WRITE;
/*!40000 ALTER TABLE `xe_module_config` DISABLE KEYS */;

INSERT INTO `xe_module_config` (`module`, `site_srl`, `config`, `regdate`)
VALUES
	('autoinstall',0,'O:8:\"stdClass\":1:{s:14:\"downloadServer\";s:33:\"http://download.xpressengine.com/\";}','20151006062110'),
	('comment',0,'N;','20151006062110'),
	('editor',0,'N;','20151006062110'),
	('file',0,'O:8:\"stdClass\":3:{s:16:\"allowed_filesize\";s:1:\"2\";s:19:\"allowed_attach_size\";s:1:\"2\";s:17:\"allowed_filetypes\";s:3:\"*.*\";}','20151006062111'),
	('layout',0,'N;','20151006062110'),
	('member',0,'O:8:\"stdClass\":41:{s:11:\"enable_join\";s:1:\"Y\";s:13:\"enable_openid\";s:1:\"N\";s:16:\"enable_auth_mail\";s:1:\"N\";s:10:\"image_name\";s:1:\"N\";s:10:\"image_mark\";s:1:\"N\";s:13:\"profile_image\";s:1:\"N\";s:20:\"image_name_max_width\";N;s:21:\"image_name_max_height\";N;s:20:\"image_mark_max_width\";N;s:21:\"image_mark_max_height\";N;s:23:\"profile_image_max_width\";N;s:24:\"profile_image_max_height\";N;s:16:\"group_image_mark\";s:1:\"Y\";s:17:\"password_strength\";s:6:\"normal\";s:26:\"password_hashing_algorithm\";s:6:\"pbkdf2\";s:28:\"password_hashing_work_factor\";i:8;s:29:\"password_hashing_auto_upgrade\";s:1:\"Y\";s:10:\"signupForm\";a:14:{i:0;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:1;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:13:\"email_address\";s:5:\"title\";s:16:\"이메일 주소\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";}i:1;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:7:\"user_id\";s:5:\"title\";s:9:\"아이디\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";}i:2;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"password\";s:5:\"title\";s:12:\"비밀번호\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"N\";}i:3;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"user_name\";s:5:\"title\";s:6:\"이름\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";}i:4;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"nick_name\";s:5:\"title\";s:9:\"닉네임\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";}i:5;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:21:\"find_account_question\";s:5:\"title\";s:33:\"비밀번호 찾기 질문/답변\";s:12:\"mustRequired\";b:1;s:9:\"imageType\";b:0;s:8:\"required\";b:1;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"N\";}i:6;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"homepage\";s:5:\"title\";s:12:\"홈페이지\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";}i:7;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:4:\"blog\";s:5:\"title\";s:9:\"블로그\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";}i:8;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:8:\"birthday\";s:5:\"title\";s:6:\"생일\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";}i:9;O:8:\"stdClass\":9:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:9:\"signature\";s:5:\"title\";s:6:\"서명\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";}i:10;O:8:\"stdClass\":11:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:13:\"profile_image\";s:5:\"title\";s:16:\"프로필 사진\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:9:\"max_width\";N;s:10:\"max_height\";N;}i:11;O:8:\"stdClass\":11:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:10:\"image_name\";s:5:\"title\";s:16:\"이미지 이름\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:9:\"max_width\";N;s:10:\"max_height\";N;}i:12;O:8:\"stdClass\":11:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:1;s:4:\"name\";s:10:\"image_mark\";s:5:\"title\";s:16:\"이미지 마크\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:1;s:8:\"required\";b:0;s:5:\"isUse\";b:0;s:8:\"isPublic\";s:1:\"N\";s:9:\"max_width\";N;s:10:\"max_height\";N;}i:13;O:8:\"stdClass\":12:{s:12:\"isIdentifier\";b:0;s:13:\"isDefaultForm\";b:0;s:4:\"name\";s:11:\"userdefined\";s:5:\"title\";s:11:\"UserDefined\";s:12:\"mustRequired\";b:0;s:9:\"imageType\";b:0;s:8:\"required\";b:0;s:5:\"isUse\";b:1;s:8:\"isPublic\";s:1:\"Y\";s:4:\"type\";s:4:\"text\";s:20:\"member_join_form_srl\";i:338;s:11:\"description\";s:0:\"\";}}s:10:\"identifier\";s:13:\"email_address\";s:14:\"enable_confirm\";s:1:\"N\";s:14:\"webmaster_name\";s:9:\"webmaster\";s:15:\"webmaster_email\";N;s:9:\"limit_day\";i:0;s:21:\"limit_day_description\";N;s:9:\"agreement\";N;s:12:\"redirect_url\";N;s:21:\"signature_editor_skin\";s:8:\"ckeditor\";s:19:\"sel_editor_colorset\";s:5:\"moono\";s:9:\"signature\";s:1:\"N\";s:20:\"change_password_date\";i:0;s:24:\"enable_login_fail_report\";s:1:\"Y\";s:15:\"max_error_count\";s:2:\"10\";s:20:\"max_error_count_time\";s:3:\"300\";s:15:\"after_login_url\";N;s:16:\"after_logout_url\";N;s:10:\"layout_srl\";N;s:4:\"skin\";s:7:\"default\";s:8:\"colorset\";s:5:\"white\";s:11:\"mlayout_srl\";N;s:5:\"mskin\";s:7:\"default\";s:11:\"editor_skin\";s:8:\"ckeditor\";}','20151008151436'),
	('module',0,'O:8:\"stdClass\":1:{s:18:\"isUpdateFixedValue\";b:1;}','20151006062110'),
	('point',0,'O:8:\"stdClass\":22:{s:11:\"able_module\";s:1:\"N\";s:9:\"max_level\";i:30;s:10:\"level_step\";a:30:{i:1;i:90;i:2;i:360;i:3;i:810;i:4;i:1440;i:5;i:2250;i:6;i:3240;i:7;i:4410;i:8;i:5760;i:9;i:7290;i:10;i:9000;i:11;i:10890;i:12;i:12960;i:13;i:15210;i:14;i:17640;i:15;i:20250;i:16;i:23040;i:17;i:26010;i:18;i:29160;i:19;i:32490;i:20;i:36000;i:21;i:39690;i:22;i:43560;i:23;i:47610;i:24;i:51840;i:25;i:56250;i:26;i:60840;i:27;i:65610;i:28;i:70560;i:29;i:75690;i:30;i:81000;}s:12:\"signup_point\";i:10;s:11:\"login_point\";i:5;s:10:\"point_name\";s:5:\"point\";s:10:\"level_icon\";s:7:\"default\";s:16:\"disable_download\";b:0;s:15:\"insert_document\";i:10;s:19:\"insert_document_act\";s:23:\"procBoardInsertDocument\";s:19:\"delete_document_act\";s:23:\"procBoardDeleteDocument\";s:14:\"insert_comment\";i:5;s:18:\"insert_comment_act\";s:44:\"procBoardInsertComment,procBlogInsertComment\";s:18:\"delete_comment_act\";s:44:\"procBoardDeleteComment,procBlogDeleteComment\";s:11:\"upload_file\";i:5;s:15:\"upload_file_act\";s:14:\"procFileUpload\";s:15:\"delete_file_act\";s:14:\"procFileDelete\";s:13:\"download_file\";i:-5;s:17:\"download_file_act\";s:16:\"procFileDownload\";s:13:\"read_document\";i:0;s:5:\"voted\";i:0;s:6:\"blamed\";i:0;}','20151006062112'),
	('poll',0,'O:8:\"stdClass\":2:{s:4:\"skin\";s:7:\"default\";s:8:\"colorset\";s:6:\"normal\";}','20151006062111'),
	('rss',0,'N;','20151006062110');

/*!40000 ALTER TABLE `xe_module_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_module_extend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_extend`;

CREATE TABLE `xe_module_extend` (
  `parent_module` varchar(80) NOT NULL,
  `extend_module` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `kind` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_module_extra_vars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_extra_vars`;

CREATE TABLE `xe_module_extra_vars` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_vars` (`module_srl`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_module_extra_vars` WRITE;
/*!40000 ALTER TABLE `xe_module_extra_vars` DISABLE KEYS */;

INSERT INTO `xe_module_extra_vars` (`module_srl`, `name`, `value`)
VALUES
	(63,'page_type','WIDGET'),
	(63,'regdate','20151006062112'),
	(65,'consultation','N'),
	(65,'except_notice','Y'),
	(65,'list','no,title,nick_name,regdate,readed_count'),
	(65,'list_count','20'),
	(65,'mobile_list_count','20'),
	(65,'mobile_page_count','5'),
	(65,'mobile_search_list_count','20'),
	(65,'order_target','list_order'),
	(65,'order_type','asc'),
	(65,'page_count','10'),
	(65,'protect_content','N'),
	(65,'search_list_count','20'),
	(65,'use_anonymous','N'),
	(65,'use_status','PUBLIC|@|SECRET'),
	(263,'consultation','N'),
	(263,'except_notice','Y'),
	(263,'list','no,title,nick_name,regdate,readed_count'),
	(263,'list_count','20'),
	(263,'mobile_list_count','20'),
	(263,'mobile_page_count','5'),
	(263,'mobile_search_list_count','20'),
	(263,'order_target','list_order'),
	(263,'order_type','asc'),
	(263,'page_count','10'),
	(263,'protect_content','N'),
	(263,'search_list_count','20'),
	(263,'use_anonymous','N'),
	(263,'use_status','PUBLIC');

/*!40000 ALTER TABLE `xe_module_extra_vars` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_module_filebox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_filebox`;

CREATE TABLE `xe_module_filebox` (
  `module_filebox_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `fileextension` varchar(4) NOT NULL,
  `filesize` bigint(11) NOT NULL DEFAULT '0',
  `comment` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_filebox_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_fileextension` (`fileextension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_module_filebox` WRITE;
/*!40000 ALTER TABLE `xe_module_filebox` DISABLE KEYS */;

INSERT INTO `xe_module_filebox` (`module_filebox_srl`, `member_srl`, `filename`, `fileextension`, `filesize`, `comment`, `regdate`)
VALUES
	(349,4,'./modules/point/icons/default/30.gif','gif',897,'','20151008145623');

/*!40000 ALTER TABLE `xe_module_filebox` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_module_grants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_grants`;

CREATE TABLE `xe_module_grants` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `group_srl` bigint(11) NOT NULL,
  UNIQUE KEY `unique_module` (`module_srl`,`name`,`group_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_module_grants` WRITE;
/*!40000 ALTER TABLE `xe_module_grants` DISABLE KEYS */;

INSERT INTO `xe_module_grants` (`module_srl`, `name`, `group_srl`)
VALUES
	(263,'access',0),
	(263,'list',0),
	(263,'manager',1),
	(263,'view',0),
	(263,'write_comment',0),
	(263,'write_document',0);

/*!40000 ALTER TABLE `xe_module_grants` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_module_locks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_locks`;

CREATE TABLE `xe_module_locks` (
  `lock_name` varchar(40) NOT NULL,
  `deadline` varchar(14) DEFAULT NULL,
  `member_srl` bigint(11) DEFAULT NULL,
  UNIQUE KEY `unique_lock_name` (`lock_name`),
  KEY `idx_deadline` (`deadline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_module_mobile_skins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_mobile_skins`;

CREATE TABLE `xe_module_mobile_skins` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_mobile_skins` (`module_srl`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_module_part_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_part_config`;

CREATE TABLE `xe_module_part_config` (
  `module` varchar(250) NOT NULL,
  `module_srl` bigint(11) NOT NULL,
  `config` text,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_module_part_config` (`module`,`module_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_module_part_config` WRITE;
/*!40000 ALTER TABLE `xe_module_part_config` DISABLE KEYS */;

INSERT INTO `xe_module_part_config` (`module`, `module_srl`, `config`, `regdate`)
VALUES
	('layout',86,'O:8:\"stdClass\":1:{s:13:\"header_script\";N;}','20151006062137'),
	('board',263,'a:5:{i:0;s:2:\"no\";i:1;s:5:\"title\";i:2;s:9:\"nick_name\";i:3;s:7:\"regdate\";i:4;s:12:\"readed_count\";}','20151007102940'),
	('layout',129,'O:8:\"stdClass\":1:{s:13:\"header_script\";N;}','20151007102957'),
	('board',65,'a:5:{i:0;s:2:\"no\";i:1;s:5:\"title\";i:2;s:9:\"nick_name\";i:3;s:7:\"regdate\";i:4;s:12:\"readed_count\";}','20151013181619');

/*!40000 ALTER TABLE `xe_module_part_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_module_skins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_skins`;

CREATE TABLE `xe_module_skins` (
  `module_srl` bigint(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` text,
  UNIQUE KEY `unique_module_skins` (`module_srl`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_module_trigger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_module_trigger`;

CREATE TABLE `xe_module_trigger` (
  `trigger_name` varchar(80) NOT NULL,
  `called_position` varchar(15) NOT NULL,
  `module` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `called_method` varchar(80) NOT NULL,
  UNIQUE KEY `idx_trigger` (`trigger_name`,`called_position`,`module`,`type`,`called_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_module_trigger` WRITE;
/*!40000 ALTER TABLE `xe_module_trigger` DISABLE KEYS */;

INSERT INTO `xe_module_trigger` (`trigger_name`, `called_position`, `module`, `type`, `called_method`)
VALUES
	('comment.deleteComment','after','file','controller','triggerCommentDeleteAttached'),
	('comment.deleteComment','after','poll','controller','triggerDeleteCommentPoll'),
	('comment.getCommentMenu','after','member','controller','triggerGetCommentMenu'),
	('comment.insertComment','after','file','controller','triggerCommentAttachFiles'),
	('comment.insertComment','after','poll','controller','triggerInsertCommentPoll'),
	('comment.insertComment','before','file','controller','triggerCommentCheckAttached'),
	('comment.insertComment','before','spamfilter','controller','triggerInsertComment'),
	('comment.updateComment','after','file','controller','triggerCommentAttachFiles'),
	('comment.updateComment','after','poll','controller','triggerUpdateCommentPoll'),
	('comment.updateComment','before','file','controller','triggerCommentCheckAttached'),
	('comment.updateComment','before','spamfilter','controller','triggerInsertComment'),
	('communication.sendMessage','before','spamfilter','controller','triggerSendMessage'),
	('display','before','editor','controller','triggerEditorComponentCompile'),
	('display','before','widget','controller','triggerWidgetCompile'),
	('document.deleteDocument','after','comment','controller','triggerDeleteDocumentComments'),
	('document.deleteDocument','after','file','controller','triggerDeleteAttached'),
	('document.deleteDocument','after','poll','controller','triggerDeleteDocumentPoll'),
	('document.deleteDocument','after','tag','controller','triggerDeleteTag'),
	('document.getDocumentMenu','after','member','controller','triggerGetDocumentMenu'),
	('document.insertDocument','after','editor','controller','triggerDeleteSavedDoc'),
	('document.insertDocument','after','file','controller','triggerAttachFiles'),
	('document.insertDocument','after','poll','controller','triggerInsertDocumentPoll'),
	('document.insertDocument','after','tag','controller','triggerInsertTag'),
	('document.insertDocument','before','file','controller','triggerCheckAttached'),
	('document.insertDocument','before','spamfilter','controller','triggerInsertDocument'),
	('document.insertDocument','before','tag','controller','triggerArrangeTag'),
	('document.updateDocument','after','editor','controller','triggerDeleteSavedDoc'),
	('document.updateDocument','after','file','controller','triggerAttachFiles'),
	('document.updateDocument','after','poll','controller','triggerUpdateDocumentPoll'),
	('document.updateDocument','after','tag','controller','triggerInsertTag'),
	('document.updateDocument','before','file','controller','triggerCheckAttached'),
	('document.updateDocument','before','spamfilter','controller','triggerInsertDocument'),
	('document.updateDocument','before','tag','controller','triggerArrangeTag'),
	('editor.deleteSavedDoc','after','file','controller','triggerDeleteAttached'),
	('member.getMemberMenu','after','board','controller','triggerMemberMenu'),
	('menu.getModuleListInSitemap','after','board','model','triggerModuleListInSitemap'),
	('module.deleteModule','after','comment','controller','triggerDeleteModuleComments'),
	('module.deleteModule','after','document','controller','triggerDeleteModuleDocuments'),
	('module.deleteModule','after','file','controller','triggerDeleteModuleFiles'),
	('module.deleteModule','after','tag','controller','triggerDeleteModuleTags'),
	('module.dispAdditionSetup','before','comment','view','triggerDispCommentAdditionSetup'),
	('module.dispAdditionSetup','before','document','view','triggerDispDocumentAdditionSetup'),
	('module.dispAdditionSetup','before','editor','view','triggerDispEditorAdditionSetup'),
	('module.dispAdditionSetup','before','file','view','triggerDispFileAdditionSetup'),
	('module.dispAdditionSetup','before','rss','view','triggerDispRssAdditionSetup'),
	('module.procModuleAdminCopyModule','after','comment','controller','triggerCopyModule'),
	('module.procModuleAdminCopyModule','after','document','controller','triggerCopyModule'),
	('module.procModuleAdminCopyModule','after','document','controller','triggerCopyModuleExtraKeys'),
	('module.procModuleAdminCopyModule','after','editor','controller','triggerCopyModule'),
	('module.procModuleAdminCopyModule','after','file','controller','triggerCopyModule'),
	('module.procModuleAdminCopyModule','after','rss','controller','triggerCopyModule'),
	('moduleHandler.proc','after','rss','controller','triggerRssUrlInsert'),
	('trackback.insertTrackback','before','spamfilter','controller','triggerInsertTrackback');

/*!40000 ALTER TABLE `xe_module_trigger` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_modules`;

CREATE TABLE `xe_modules` (
  `module_srl` bigint(11) NOT NULL,
  `module` varchar(80) NOT NULL,
  `module_category_srl` bigint(11) DEFAULT '0',
  `layout_srl` bigint(11) DEFAULT '0',
  `use_mobile` char(1) DEFAULT 'N',
  `mlayout_srl` bigint(11) DEFAULT '0',
  `menu_srl` bigint(11) DEFAULT '0',
  `site_srl` bigint(11) NOT NULL DEFAULT '0',
  `mid` varchar(40) NOT NULL,
  `is_skin_fix` char(1) NOT NULL DEFAULT 'Y',
  `skin` varchar(250) DEFAULT NULL,
  `is_mskin_fix` char(1) NOT NULL DEFAULT 'Y',
  `mskin` varchar(250) DEFAULT NULL,
  `browser_title` varchar(250) NOT NULL,
  `description` text,
  `is_default` char(1) NOT NULL DEFAULT 'N',
  `content` longtext,
  `mcontent` longtext,
  `open_rss` char(1) NOT NULL DEFAULT 'Y',
  `header_text` text,
  `footer_text` text,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`module_srl`),
  UNIQUE KEY `idx_site_mid` (`site_srl`,`mid`),
  KEY `idx_module` (`module`),
  KEY `idx_module_category` (`module_category_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_modules` WRITE;
/*!40000 ALTER TABLE `xe_modules` DISABLE KEYS */;

INSERT INTO `xe_modules` (`module_srl`, `module`, `module_category_srl`, `layout_srl`, `use_mobile`, `mlayout_srl`, `menu_srl`, `site_srl`, `mid`, `is_skin_fix`, `skin`, `is_mskin_fix`, `mskin`, `browser_title`, `description`, `is_default`, `content`, `mcontent`, `open_rss`, `header_text`, `footer_text`, `regdate`)
VALUES
	(63,'page',0,-1,'Y',-1,62,0,'index','N','/USE_DEFAULT/','N','/USE_DEFAULT/','Welcome Page','','N','<img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"width: 100%; float: left;\" body=\"\" document_srl=\"88\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\" draggable=\"false\"  />','<img hasContent=\"true\" class=\"zbxe_widget_output\" widget=\"widgetContent\" style=\"width: 100%; float: left;\" body=\"\" document_srl=\"89\" widget_padding_left=\"0\" widget_padding_right=\"0\" widget_padding_top=\"0\" widget_padding_bottom=\"0\"  />','Y','','','20151006062112'),
	(65,'board',0,-1,'Y',-1,62,0,'board1','N','/USE_DEFAULT/','N','/USE_DEFAULT/','Board1','','N',NULL,NULL,'Y','','','20151006062112'),
	(263,'board',0,129,'Y',-1,62,0,'board2','N','/USE_DEFAULT/','N','/USE_DEFAULT/','Board2','','N',NULL,NULL,'Y','','','20151006064210');

/*!40000 ALTER TABLE `xe_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_point
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_point`;

CREATE TABLE `xe_point` (
  `member_srl` bigint(11) NOT NULL,
  `point` bigint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_srl`),
  KEY `idx_point` (`point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_poll
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_poll`;

CREATE TABLE `xe_poll` (
  `poll_srl` bigint(11) NOT NULL,
  `stop_date` varchar(14) DEFAULT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `poll_count` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  PRIMARY KEY (`poll_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_poll_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_poll_item`;

CREATE TABLE `xe_poll_item` (
  `poll_item_srl` bigint(11) NOT NULL,
  `poll_srl` bigint(11) NOT NULL,
  `poll_index_srl` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `poll_count` bigint(11) NOT NULL,
  PRIMARY KEY (`poll_item_srl`),
  KEY `index_poll_srl` (`poll_srl`),
  KEY `idx_poll_index_srl` (`poll_index_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_poll_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_poll_log`;

CREATE TABLE `xe_poll_log` (
  `poll_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  KEY `idx_poll_srl` (`poll_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_poll_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_poll_title`;

CREATE TABLE `xe_poll_title` (
  `poll_srl` bigint(11) NOT NULL,
  `poll_index_srl` bigint(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `checkcount` bigint(11) NOT NULL DEFAULT '1',
  `poll_count` bigint(11) NOT NULL,
  `upload_target_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(128) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  `list_order` bigint(11) NOT NULL,
  KEY `idx_poll_srl` (`poll_srl`,`poll_index_srl`),
  KEY `idx_upload_target_srl` (`upload_target_srl`),
  KEY `idx_member_srl` (`member_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_list_order` (`list_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_sequence
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_sequence`;

CREATE TABLE `xe_sequence` (
  `seq` bigint(64) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8;

LOCK TABLES `xe_sequence` WRITE;
/*!40000 ALTER TABLE `xe_sequence` DISABLE KEYS */;

INSERT INTO `xe_sequence` (`seq`)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(23),
	(24),
	(25),
	(26),
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37),
	(38),
	(39),
	(40),
	(41),
	(42),
	(43),
	(44),
	(45),
	(46),
	(47),
	(48),
	(49),
	(50),
	(51),
	(52),
	(53),
	(54),
	(55),
	(56),
	(57),
	(58),
	(59),
	(60),
	(61),
	(62),
	(63),
	(64),
	(65),
	(66),
	(67),
	(68),
	(69),
	(70),
	(71),
	(72),
	(73),
	(74),
	(75),
	(76),
	(77),
	(78),
	(79),
	(80),
	(81),
	(82),
	(83),
	(84),
	(85),
	(86),
	(87),
	(88),
	(89),
	(90),
	(91),
	(92),
	(93),
	(94),
	(95),
	(96),
	(97),
	(98),
	(99),
	(100),
	(101),
	(102),
	(103),
	(104),
	(105),
	(106),
	(107),
	(108),
	(109),
	(110),
	(111),
	(112),
	(113),
	(114),
	(115),
	(116),
	(117),
	(118),
	(119),
	(120),
	(121),
	(122),
	(123),
	(124),
	(125),
	(126),
	(127),
	(128),
	(129),
	(130),
	(131),
	(132),
	(133),
	(134),
	(135),
	(136),
	(137),
	(138),
	(139),
	(140),
	(141),
	(142),
	(143),
	(144),
	(145),
	(146),
	(147),
	(148),
	(149),
	(150),
	(151),
	(152),
	(153),
	(154),
	(155),
	(156),
	(157),
	(158),
	(159),
	(160),
	(161),
	(162),
	(163),
	(164),
	(165),
	(166),
	(167),
	(168),
	(169),
	(170),
	(171),
	(172),
	(173),
	(174),
	(175),
	(176),
	(177),
	(178),
	(179),
	(180),
	(181),
	(182),
	(183),
	(184),
	(185),
	(186),
	(187),
	(188),
	(189),
	(190),
	(191),
	(192),
	(193),
	(194),
	(195),
	(196),
	(197),
	(198),
	(199),
	(200),
	(201),
	(202),
	(203),
	(204),
	(205),
	(206),
	(207),
	(208),
	(209),
	(210),
	(211),
	(212),
	(213),
	(214),
	(215),
	(216),
	(217),
	(218),
	(219),
	(220),
	(221),
	(222),
	(223),
	(224),
	(225),
	(226),
	(227),
	(228),
	(229),
	(230),
	(231),
	(232),
	(233),
	(234),
	(235),
	(236),
	(237),
	(238),
	(239),
	(240),
	(241),
	(242),
	(243),
	(244),
	(245),
	(246),
	(247),
	(248),
	(249),
	(250),
	(251),
	(252),
	(253),
	(254),
	(255),
	(256),
	(257),
	(258),
	(259),
	(260),
	(261),
	(262),
	(263),
	(264),
	(265),
	(266),
	(267),
	(268),
	(269),
	(270),
	(271),
	(272),
	(273),
	(274),
	(275),
	(276),
	(277),
	(278),
	(279),
	(280),
	(281),
	(282),
	(283),
	(284),
	(285),
	(286),
	(287),
	(288),
	(289),
	(290),
	(291),
	(292),
	(293),
	(294),
	(295),
	(296),
	(297),
	(298),
	(299),
	(300),
	(301),
	(302),
	(303),
	(304),
	(305),
	(306),
	(307),
	(308),
	(309),
	(310),
	(311),
	(312),
	(313),
	(314),
	(315),
	(316),
	(317),
	(318),
	(319),
	(320),
	(321),
	(322),
	(323),
	(324),
	(325),
	(326),
	(327),
	(328),
	(329),
	(330),
	(331),
	(332),
	(333),
	(334),
	(335),
	(336),
	(337),
	(338),
	(339),
	(340),
	(341),
	(342),
	(343),
	(344),
	(345),
	(346),
	(347),
	(348),
	(349),
	(350),
	(351),
	(352),
	(353),
	(354),
	(355),
	(356),
	(357),
	(358),
	(359),
	(360),
	(361),
	(362),
	(363),
	(364),
	(365),
	(366),
	(367),
	(368),
	(369),
	(370),
	(371),
	(372),
	(373),
	(374),
	(375),
	(376),
	(377),
	(378),
	(379),
	(380),
	(381),
	(382),
	(383),
	(384),
	(385),
	(386),
	(387),
	(388),
	(389),
	(390),
	(391),
	(392),
	(393),
	(394),
	(395),
	(396),
	(397),
	(398),
	(399),
	(400),
	(401),
	(402),
	(403),
	(404),
	(405);

/*!40000 ALTER TABLE `xe_sequence` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_session`;

CREATE TABLE `xe_session` (
  `session_key` varchar(255) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `expired` varchar(14) DEFAULT NULL,
  `val` longtext,
  `ipaddress` varchar(128) NOT NULL,
  `last_update` varchar(14) DEFAULT NULL,
  `cur_mid` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`session_key`),
  KEY `idx_session_member_srl` (`member_srl`),
  KEY `idx_session_expired` (`expired`),
  KEY `idx_session_update` (`last_update`),
  KEY `idx_session_cur_mid` (`cur_mid`),
  KEY `idx_session_update_mid` (`member_srl`,`last_update`,`cur_mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_site_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_site_admin`;

CREATE TABLE `xe_site_admin` (
  `site_srl` bigint(11) NOT NULL,
  `member_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  UNIQUE KEY `idx_site_admin` (`site_srl`,`member_srl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_sites`;

CREATE TABLE `xe_sites` (
  `site_srl` bigint(11) NOT NULL,
  `index_module_srl` bigint(11) DEFAULT '0',
  `domain` varchar(255) NOT NULL,
  `default_language` varchar(255) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`site_srl`),
  UNIQUE KEY `unique_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_sites` WRITE;
/*!40000 ALTER TABLE `xe_sites` DISABLE KEYS */;

INSERT INTO `xe_sites` (`site_srl`, `index_module_srl`, `domain`, `default_language`, `regdate`)
VALUES
	(0,63,'uitest.app/','ko','20151006062109');

/*!40000 ALTER TABLE `xe_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_spamfilter_denied_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_spamfilter_denied_ip`;

CREATE TABLE `xe_spamfilter_denied_ip` (
  `ipaddress` varchar(250) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_spamfilter_denied_word
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_spamfilter_denied_word`;

CREATE TABLE `xe_spamfilter_denied_word` (
  `word` varchar(250) NOT NULL,
  `hit` bigint(20) NOT NULL DEFAULT '0',
  `latest_hit` varchar(14) DEFAULT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`word`),
  KEY `idx_hit` (`hit`),
  KEY `idx_latest_hit` (`latest_hit`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_spamfilter_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_spamfilter_log`;

CREATE TABLE `xe_spamfilter_log` (
  `spamfilter_log_srl` bigint(11) NOT NULL,
  `ipaddress` varchar(250) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`spamfilter_log_srl`),
  KEY `idx_ipaddress` (`ipaddress`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xe_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_tags`;

CREATE TABLE `xe_tags` (
  `tag_srl` bigint(11) NOT NULL,
  `module_srl` bigint(11) NOT NULL DEFAULT '0',
  `document_srl` bigint(11) NOT NULL DEFAULT '0',
  `tag` varchar(240) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`tag_srl`),
  KEY `idx_module_srl` (`module_srl`),
  KEY `idx_document_srl` (`document_srl`),
  KEY `idx_regdate` (`regdate`),
  KEY `idx_tag` (`document_srl`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `xe_tags` WRITE;
/*!40000 ALTER TABLE `xe_tags` DISABLE KEYS */;

INSERT INTO `xe_tags` (`tag_srl`, `module_srl`, `document_srl`, `tag`, `regdate`)
VALUES
	(360,65,359,'board1','20151013180259'),
	(361,65,359,'노티스','20151013180259'),
	(366,65,365,'board1','20151013180336'),
	(367,65,365,'일반글','20151013180336'),
	(372,263,371,'board2','20151013180415'),
	(373,263,371,'노티스','20151013180415'),
	(375,263,374,'board2','20151013180440'),
	(376,263,374,'일반글','20151013180440');

/*!40000 ALTER TABLE `xe_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xe_trash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xe_trash`;

CREATE TABLE `xe_trash` (
  `trash_srl` bigint(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `origin_module` varchar(250) NOT NULL DEFAULT 'document',
  `serialized_object` longtext NOT NULL,
  `description` text,
  `ipaddress` varchar(128) NOT NULL,
  `remover_srl` bigint(11) NOT NULL,
  `regdate` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`trash_srl`),
  KEY `idx_regdate` (`regdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
