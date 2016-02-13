
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

DROP TABLE IF EXISTS `gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_user` int(11) NOT NULL,
  `ID_tag` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `image_location` varchar(4000) DEFAULT NULL,
  `enabled` int(1) DEFAULT NULL,
  `datetime_created` datetime NOT NULL,
  `datetime_modified` datetime DEFAULT NULL,
  `datetime_closed` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin2;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gift` WRITE;
/*!40000 ALTER TABLE `gift` DISABLE KEYS */;
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (1,1,1,'klavir',NULL,NULL,1,'2013-11-09 17:11:41',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (3,1,3,'stolice',NULL,NULL,1,'2013-11-09 17:13:09',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (9,1,5,'katedrala',NULL,NULL,NULL,'2013-11-09 18:32:48',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (23,4,11,'nokat',NULL,NULL,NULL,'2013-11-09 19:17:15',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (25,4,12,'nokatt',NULL,NULL,NULL,'2013-11-09 19:17:41',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (26,4,13,'nokattt',NULL,NULL,NULL,'2013-11-09 19:18:59',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (27,7,14,'bibliju',NULL,NULL,NULL,'2013-11-09 19:38:07',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (28,7,15,'ipoloki',NULL,NULL,NULL,'2013-11-09 19:38:22',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (29,1,16,'set casa',NULL,NULL,NULL,'2013-11-09 19:38:49',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (31,1,18,'1000eura',NULL,NULL,NULL,'2013-11-09 19:41:25',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (32,16,NULL,'z',NULL,NULL,NULL,'2015-04-02 23:03:48',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (33,16,19,'z',NULL,NULL,NULL,'2015-04-02 23:03:48',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (34,16,NULL,'green',NULL,NULL,NULL,'2015-04-02 23:04:36',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (35,16,20,'green',NULL,NULL,NULL,'2015-04-02 23:04:36',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (36,16,NULL,'sa',NULL,NULL,NULL,'2015-04-02 23:05:50',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (37,16,21,'sa',NULL,NULL,NULL,'2015-04-02 23:05:50',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (38,16,NULL,'aaa',NULL,NULL,NULL,'2015-04-02 23:07:24',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (39,16,22,'aaa',NULL,NULL,NULL,'2015-04-02 23:07:24',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (40,24,NULL,'green',NULL,NULL,NULL,'2015-04-02 23:09:39',NULL,NULL);
INSERT INTO `gift` (`ID`, `ID_user`, `ID_tag`, `name`, `description`, `image_location`, `enabled`, `datetime_created`, `datetime_modified`, `datetime_closed`) VALUES (41,24,20,'green',NULL,NULL,NULL,'2015-04-02 23:09:39',NULL,NULL);
/*!40000 ALTER TABLE `gift` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin2;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`ID`, `name`) VALUES (1,'klavir');
INSERT INTO `tag` (`ID`, `name`) VALUES (2,'auto gume');
INSERT INTO `tag` (`ID`, `name`) VALUES (3,'stolice');
INSERT INTO `tag` (`ID`, `name`) VALUES (4,'televizor');
INSERT INTO `tag` (`ID`, `name`) VALUES (5,'katedrala');
INSERT INTO `tag` (`ID`, `name`) VALUES (6,'nesto');
INSERT INTO `tag` (`ID`, `name`) VALUES (7,'ddd');
INSERT INTO `tag` (`ID`, `name`) VALUES (8,'dfdf');
INSERT INTO `tag` (`ID`, `name`) VALUES (9,'pc2');
INSERT INTO `tag` (`ID`, `name`) VALUES (10,'ssd');
INSERT INTO `tag` (`ID`, `name`) VALUES (11,'nokat');
INSERT INTO `tag` (`ID`, `name`) VALUES (12,'nokatt');
INSERT INTO `tag` (`ID`, `name`) VALUES (13,'nokattt');
INSERT INTO `tag` (`ID`, `name`) VALUES (14,'bibliju');
INSERT INTO `tag` (`ID`, `name`) VALUES (15,'ipoloki');
INSERT INTO `tag` (`ID`, `name`) VALUES (16,'set casa');
INSERT INTO `tag` (`ID`, `name`) VALUES (17,'uuu');
INSERT INTO `tag` (`ID`, `name`) VALUES (18,'1000eura');
INSERT INTO `tag` (`ID`, `name`) VALUES (19,'z');
INSERT INTO `tag` (`ID`, `name`) VALUES (20,'green');
INSERT INTO `tag` (`ID`, `name`) VALUES (21,'sa');
INSERT INTO `tag` (`ID`, `name`) VALUES (22,'aaa');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `twitter_id` int(11) DEFAULT NULL,
  `twitter_screen_name` varchar(100) NOT NULL,
  `twitter_profile_image_url` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin2;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (1,216881683,'MiroslavVrbanac','http://abs.twimg.com/sticky/default_profile_images/default_profile_4_normal.png');
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (2,NULL,'MiroslavVrbanac2',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (3,NULL,'MiroslavVrbanac2',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (4,NULL,'chmuraOrg',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (5,NULL,'chmuraOrg',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (6,NULL,'chmuraOrg',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (7,NULL,'pipo',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (8,NULL,'pipo',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (9,NULL,'MiroslavVrbanac',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (10,NULL,'jaglac',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (11,NULL,'MiroslavVrbanac',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (12,NULL,'Mamama',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (13,NULL,'Mamama',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (14,NULL,'Mamama',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (15,NULL,'Mamama',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (16,NULL,'aaa',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (17,NULL,'aaa',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (18,NULL,'aaa',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (19,NULL,'aaa',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (20,NULL,'aaa',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (21,NULL,'aaa',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (22,NULL,'aaa',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (23,NULL,'aaa',NULL);
INSERT INTO `user` (`ID`, `twitter_id`, `twitter_screen_name`, `twitter_profile_image_url`) VALUES (24,NULL,'sas',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `user_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_user` int(11) NOT NULL,
  `ID_tag` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin2;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_tag` WRITE;
/*!40000 ALTER TABLE `user_tag` DISABLE KEYS */;
INSERT INTO `user_tag` (`ID`, `ID_user`, `ID_tag`) VALUES (1,1,1);
/*!40000 ALTER TABLE `user_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

