# MySQL-Front 5.1  (Build 1.5)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: e_fitness
# ------------------------------------------------------
# Server version 5.1.29-rc-community

#
# Source for table calendar
#

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `text` varchar(250) DEFAULT NULL,
  `details` longtext,
  `calories` int(11) DEFAULT NULL,
  `auto_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

#
# Dumping data for table calendar
#
LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;

INSERT INTO `calendar` VALUES (5,'2009-06-12 02:25:00','2009-06-12 04:45:00','asdsdasdsad','กด กฟกด ฟหกหฟก ฟก กฟหกหฟกหฟก ฟกหกหกฟห ฟหกหก ฟหก ฟหก ฟหกฟหก ฟหกฟห กฟหกฟ',156,1244948208815,0);
INSERT INTO `calendar` VALUES (9,'2009-06-10 02:45:00','2009-06-10 04:55:00','asd','asd asdsd asd adasd sd sd as das dsad sadsadsdsd asd sad sda sad asd as',1,1244948753401,0);
INSERT INTO `calendar` VALUES (11,'2009-06-14 01:55:00','2009-06-14 04:45:00','New event','undefined',1,1244948777809,0);
INSERT INTO `calendar` VALUES (24,'2009-06-15 01:55:00','2009-06-15 04:10:00','New event','undefined',1,1245229156186,0);
INSERT INTO `calendar` VALUES (28,'2009-06-20 02:00:00','2009-06-20 04:50:00','aaa','bbb',11,1245229277657,0);
INSERT INTO `calendar` VALUES (42,'2009-06-16 03:55:00','2009-06-16 05:55:00','ads','asd',11,1245230008602,0);
INSERT INTO `calendar` VALUES (47,'2009-06-18 06:45:00','2009-06-18 09:30:00','aaa','aaa',1,1245588631103,0);
INSERT INTO `calendar` VALUES (48,'2009-06-18 02:25:00','2009-06-18 04:45:00','New event','',1,1245589196080,0);
INSERT INTO `calendar` VALUES (49,'2009-06-19 02:10:00','2009-06-19 04:30:00','ฟ','ฟ',1,1245589198137,0);
INSERT INTO `calendar` VALUES (50,'2009-06-23 01:15:00','2009-06-23 03:25:00','New event','',11,1245808928492,NULL);
INSERT INTO `calendar` VALUES (54,'2009-06-24 01:55:00','2009-06-24 01:55:00','BARBELL Behind Next Press','ads asd aasd asd asd sad adsd asds adasda d adasd ad asdasdasdas das asdas asd',1,NULL,1);
INSERT INTO `calendar` VALUES (55,'2009-06-22 03:15:00','2009-06-22 03:15:00','BARBELL Behind Next Press','your details',1,NULL,1);
INSERT INTO `calendar` VALUES (56,'2009-06-22','2009-06-22','BARBELL Behind Next Press','your details',1,NULL,1);
INSERT INTO `calendar` VALUES (57,'2009-06-26 05:00:00','2009-06-26 05:00:00','BARBELL Behind Next Press','your details กหฟก ฟหก หฟก ฟกฟ ฟกกฟห กฟ หก ฟหก  adsadasd sad adsd123',1,NULL,1);
INSERT INTO `calendar` VALUES (58,'2009-06-25 04:40:00','2009-06-25 04:40:00','BARBELL Behind Next Press','your details',1,NULL,1);
INSERT INTO `calendar` VALUES (59,'2009-06-27 01:45:00','2009-06-27 01:45:00','Behind Next Press','your details',1,NULL,1);
INSERT INTO `calendar` VALUES (60,'2009-06-25','2009-06-25','BARBELL Front Raise','your details',1,NULL,1);
INSERT INTO `calendar` VALUES (62,'2009-06-26 06:30:00','2009-06-26 08:15:00','New event','',1,1245849226779,NULL);
INSERT INTO `calendar` VALUES (63,'2009-07-03 05:25:00','2009-07-03 05:25:00','BARBELL Triceps Extension ( Lying )','your details',1,NULL,1);
INSERT INTO `calendar` VALUES (64,'2009-06-29','2009-06-29','BARBELL Behind Next Press','your details',1,NULL,1);
INSERT INTO `calendar` VALUES (65,'2009-06-26 01:45:00','2009-06-26 01:45:00','BARBELL Triceps Extension ( Lying )','your details',1,NULL,1);
INSERT INTO `calendar` VALUES (66,'2009-06-29','2009-06-29','BARBELL Behind Next Press','your details',1,NULL,2);
INSERT INTO `calendar` VALUES (67,'2009-06-29','2009-06-29','BARBELL Behind Next Press','your details',1,NULL,2);
INSERT INTO `calendar` VALUES (68,'2009-06-26','2009-06-26','BARBELL Front Raise','your details',1,NULL,2);
INSERT INTO `calendar` VALUES (69,'2009-06-28','2009-06-28','BARBELL Triceps Extension ( Lying )','your details',5445,NULL,3);
INSERT INTO `calendar` VALUES (70,'2009-06-28','2009-06-28','BARBELL Front Raise','your details',11,NULL,3);
INSERT INTO `calendar` VALUES (73,'2009-06-30','2009-06-30','BARBELL Curl','your details',45,NULL,2);
INSERT INTO `calendar` VALUES (74,'2009-06-30','2009-06-30','BARBELL Front Raise','your details',1,NULL,3);
INSERT INTO `calendar` VALUES (75,'2009-06-29','2009-06-29','BARBELL Behind Next Press','your details',45,NULL,1);
INSERT INTO `calendar` VALUES (76,'2009-06-29','2009-06-29','BARBELL Behind Next Press','your details',22,NULL,1);
INSERT INTO `calendar` VALUES (79,'2009-06-23 04:55:00','2009-06-23 04:55:00','BARBELL Military Press','your details',24,NULL,1);
INSERT INTO `calendar` VALUES (81,'2009-06-26','2009-06-26','BARBELL Behind Next Press','your details',245,NULL,2);
INSERT INTO `calendar` VALUES (82,'2009-06-30','2009-06-30','BARBELL Behind Next Press','your details',45,NULL,2);
INSERT INTO `calendar` VALUES (83,'2009-06-28','2009-06-28','BARBELL Behind Next Press','your details',4252,NULL,2);
INSERT INTO `calendar` VALUES (84,'2009-06-28','2009-06-28','DUMBBELL Arnold Press','your details',445,NULL,3);
INSERT INTO `calendar` VALUES (85,'2009-06-30','2009-06-30','DUMBBELL Upright Now','your details',45,NULL,3);
INSERT INTO `calendar` VALUES (105,'2009-06-22 00:25:00','2009-06-22 02:05:00','New event asdasd asd asd asd asd sad asd asd asasd ad ad ','asd',4,1246160718464,1);
INSERT INTO `calendar` VALUES (106,'2009-06-29','2009-06-29','BARBELL Behind Next Press','your details',4545,NULL,1);
INSERT INTO `calendar` VALUES (107,'2009-06-28 06:20:00','2009-06-28 06:20:00','BARBELL Front Raise','your details',4545,NULL,1);
INSERT INTO `calendar` VALUES (108,'2009-06-28 08:45:00','2009-06-28 08:45:00','BARBELL Behind Next Press','your details',5,NULL,1);
INSERT INTO `calendar` VALUES (109,'2009-06-28 06:50:00','2009-06-28 06:50:00','BARBELL Front Raise','your details',4578,NULL,1);
INSERT INTO `calendar` VALUES (110,'2009-06-27 06:55:00','2009-06-27 06:55:00','BARBELL Behind Next Press','your details',54,NULL,1);
INSERT INTO `calendar` VALUES (111,'2009-06-27 04:55:00','2009-06-27 04:55:00','BARBELL Front Raise','your details',454,NULL,1);
INSERT INTO `calendar` VALUES (112,'2009-06-28','2009-06-28','BARBELL Front Raise','your details',75,NULL,1);
INSERT INTO `calendar` VALUES (113,'2009-06-28 01:50:00','2009-06-28 01:50:00','BARBELL Military Press','your details',55,NULL,1);
INSERT INTO `calendar` VALUES (114,'2009-06-28','2009-06-28','BARBELL Behind Next Press','your details',785,NULL,1);
INSERT INTO `calendar` VALUES (115,'2009-06-28','2009-06-28','BARBELL Front Raise','your details',7875,NULL,1);
INSERT INTO `calendar` VALUES (116,'2009-06-28','2009-06-28','BARBELL Behind Next Press','your details',8,NULL,1);
INSERT INTO `calendar` VALUES (118,'2009-06-28','2009-06-28','BARBELL Behind Next Press','your details',24,NULL,1);
INSERT INTO `calendar` VALUES (119,'2009-06-28 01:15:00','2009-06-28 01:15:00','BARBELL Military Press','your details',542,NULL,1);
INSERT INTO `calendar` VALUES (130,'2009-06-30','2009-06-30','BARBELL Front Raise','your details',2,NULL,1);
INSERT INTO `calendar` VALUES (133,'2009-06-30 10:25:00','2009-06-30 11:25:00','BARBELL Behind Next Press','your details',24,NULL,1);
INSERT INTO `calendar` VALUES (134,'2009-07-01 12:34:00','2009-07-01 13:34:00','BARBELL Front Raise','your details',254,NULL,1);
INSERT INTO `calendar` VALUES (135,'2009-06-30 11:05:00','2009-06-30 12:05:00','BARBELL Behind Next Press','your details',22,NULL,1);
INSERT INTO `calendar` VALUES (136,'2009-07-01 12:34:00','2009-07-01 13:34:00','BARBELL Front Raise','your details',422,NULL,1);
INSERT INTO `calendar` VALUES (137,'2009-06-30 12:34:00','2009-06-30 13:34:00','BARBELL Behind Next Press','your details',2542,NULL,1);
INSERT INTO `calendar` VALUES (138,'2009-07-01 14:34:00','2009-07-01 15:34:00','BARBELL Front Raise','your details',2,NULL,1);
INSERT INTO `calendar` VALUES (139,'2009-06-30 12:34:00','2009-06-30 13:34:00','BARBELL Behind Next Press','your details',52452,NULL,1);
INSERT INTO `calendar` VALUES (140,'2009-07-01 14:34:00','2009-07-01 15:34:00','BARBELL Front Raise','your details',422,NULL,1);
INSERT INTO `calendar` VALUES (141,'2009-07-01 02:55:00','2009-07-01 04:55:00','New event','',454,1246345961788,1);
INSERT INTO `calendar` VALUES (142,'2009-06-30 14:13:00','2009-06-30 14:13:00','CABLE Wrist Curl','your details',242,NULL,1);
INSERT INTO `calendar` VALUES (143,'2009-06-30','2009-06-30','Behind Next Press','your details',452,NULL,1);
INSERT INTO `calendar` VALUES (144,'2009-06-30','2009-06-30','Shrug','your details',42,NULL,1);
INSERT INTO `calendar` VALUES (145,'2009-06-30','2009-06-30','BARBELL Front Raise','your details',25,NULL,1);
INSERT INTO `calendar` VALUES (146,'2009-06-30','2009-06-30','BARBELL Behind Next Press','your details',5,NULL,1);
INSERT INTO `calendar` VALUES (147,'2009-06-30','2009-06-30','DUMBBELL Front Lateral Raise','your details',42,NULL,1);
INSERT INTO `calendar` VALUES (148,'2009-06-30 14:22:00','2009-06-30 14:22:00','BARBELL Behind Next Press','your details',5425,NULL,1);
INSERT INTO `calendar` VALUES (149,'2009-06-30 14:23:00','2009-06-30 14:23:00','BARBELL Front Raise','your details',2,NULL,1);
INSERT INTO `calendar` VALUES (150,'2009-06-30 10:00:00','2009-06-30','BARBELL Triceps Extension ( Lying )','your details',151,NULL,1);
INSERT INTO `calendar` VALUES (151,'2009-06-30 18:00:00','2009-06-30','BARBELL Front Raise','your details',178,NULL,1);
INSERT INTO `calendar` VALUES (152,'2009-06-30 16:00:00','2009-06-30','BARBELL Military Press','your details',163,NULL,1);
INSERT INTO `calendar` VALUES (153,'2009-06-30 14:57:00','2009-06-30 15:57:00','BARBELL Behind Next Press','your details',130,NULL,1);
INSERT INTO `calendar` VALUES (154,'2009-06-30 15:01:00','2009-06-30 16:01:00','BARBELL Behind Next Press','your details',60,NULL,1);
INSERT INTO `calendar` VALUES (155,'2009-06-30 15:04:00','2009-06-30 16:04:00','BARBELL Behind Next Press','your details',7800,NULL,1);
INSERT INTO `calendar` VALUES (156,'2009-06-30 15:05:00','2009-06-30 16:05:00','CABLE Rear Lateral Raise ( Lying )','your details',6360,NULL,1);
INSERT INTO `calendar` VALUES (157,'2009-06-30 15:06:00','2009-06-30 16:06:00','BARBELL Behind Next Press','your details',7800,NULL,1);
INSERT INTO `calendar` VALUES (158,'2009-06-30 15:20:00','2009-06-30 15:20:00','BARBELL Behind Next Press','your details',0,NULL,1);
INSERT INTO `calendar` VALUES (159,'2009-07-05 15:18:00','2009-07-05 16:20:00','BARBELL Behind Next Press','your details',8060,NULL,1);
INSERT INTO `calendar` VALUES (160,'2009-07-06 15:19:00','2009-07-06 17:22:00','BARBELL Curl','your details',21648,NULL,1);
INSERT INTO `calendar` VALUES (162,'2009-07-14 17:28:00','2009-07-14 18:28:00','BARBELL Wrist Curl','your details',11400,NULL,2);
INSERT INTO `calendar` VALUES (163,'2009-06-30 17:45:00','2009-06-30 19:06:00','BARBELL Behind Next Press','your details',10530,NULL,2);
INSERT INTO `calendar` VALUES (164,'2009-06-30 17:31:00','2009-06-30 18:31:00','BARBELL Behind Next Press','your details',7800,NULL,2);
INSERT INTO `calendar` VALUES (165,'2009-06-30 17:32:00','2009-06-30 18:32:00','BARBELL Behind Next Press','your details',7800,NULL,2);
INSERT INTO `calendar` VALUES (166,'2009-06-30 17:32:00','2009-06-30 18:32:00','BARBELL Front Raise','your details',10680,NULL,2);
INSERT INTO `calendar` VALUES (167,'2009-06-30 20:03:00','2009-06-30 21:03:00','BARBELL Behind Next Press','your details',7800,NULL,1);
INSERT INTO `calendar` VALUES (168,'2009-06-30 20:17:00','2009-06-30 21:17:00','BARBELL Behind Next Press','your details',7800,NULL,1);
INSERT INTO `calendar` VALUES (169,'2009-06-30 20:18:00','2009-06-30 21:18:00','BARBELL Behind Next Press','your details',7800,NULL,1);
INSERT INTO `calendar` VALUES (170,'2009-07-02 20:19:00','2009-07-02 21:19:00','BARBELL Behind Next Press','your details',7800,NULL,1);
INSERT INTO `calendar` VALUES (171,'2009-07-03 20:19:00','2009-07-03 22:19:00','BARBELL Behind Next Press','your details',15600,NULL,1);
INSERT INTO `calendar` VALUES (172,'2009-06-30 20:41:00','2009-06-30 20:41:00','BARBELL Behind Next Press','your details',0,NULL,1);
INSERT INTO `calendar` VALUES (173,'2009-06-30 20:42:00','2009-06-30 20:42:00','BARBELL Military Press','your details',0,NULL,1);
INSERT INTO `calendar` VALUES (174,'2009-06-30 20:42:00','2009-06-30 20:42:00','DUMBBELL Arnold Press','your details',0,NULL,1);
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table chatroom
#

DROP TABLE IF EXISTS `chatroom`;
CREATE TABLE `chatroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

#
# Dumping data for table chatroom
#
LOCK TABLES `chatroom` WRITE;
/*!40000 ALTER TABLE `chatroom` DISABLE KEYS */;

INSERT INTO `chatroom` VALUES (6,1,'ฟหกฟกก','2009-06-19 07:50:12');
INSERT INTO `chatroom` VALUES (7,1,'ฟหกฟกกฟหกกฟหกห','2009-06-19 07:50:21');
INSERT INTO `chatroom` VALUES (28,2,'asd','2009-06-19 08:15:59');
INSERT INTO `chatroom` VALUES (36,1,'asd','2009-06-19 20:29:22');
INSERT INTO `chatroom` VALUES (37,1,'asd','2009-06-19 20:29:42');
INSERT INTO `chatroom` VALUES (38,1,'asd','2009-06-19 20:30:18');
INSERT INTO `chatroom` VALUES (39,1,'asd','2009-06-19 20:30:22');
INSERT INTO `chatroom` VALUES (40,1,'ฟหก','2009-06-19 20:30:25');
INSERT INTO `chatroom` VALUES (41,1,'asd','2009-06-19 20:38:32');
INSERT INTO `chatroom` VALUES (42,1,'asd','2009-06-19 20:39:38');
INSERT INTO `chatroom` VALUES (43,1,'ฟฟฟ','2009-06-19 20:42:11');
INSERT INTO `chatroom` VALUES (44,1,'ฟฟฟ','2009-06-19 20:42:14');
INSERT INTO `chatroom` VALUES (45,1,'ฟฟฟ','2009-06-19 20:42:16');
INSERT INTO `chatroom` VALUES (46,1,'ฟหกฟหกฟหกฟหก','2009-06-19 20:42:18');
INSERT INTO `chatroom` VALUES (47,1,'ไๆำๆไำไๆำ','2009-06-19 20:42:19');
INSERT INTO `chatroom` VALUES (48,1,'dadsas','2009-06-19 20:45:39');
INSERT INTO `chatroom` VALUES (49,1,'asdasdas','2009-06-19 20:45:40');
INSERT INTO `chatroom` VALUES (50,1,'asdasdsd','2009-06-19 20:45:41');
INSERT INTO `chatroom` VALUES (51,1,'asdas','2009-06-19 20:45:42');
INSERT INTO `chatroom` VALUES (52,1,'asasd','2009-06-19 20:45:44');
INSERT INTO `chatroom` VALUES (53,1,'asd','2009-06-19 20:45:55');
INSERT INTO `chatroom` VALUES (54,1,'asdasd','2009-06-19 20:45:57');
INSERT INTO `chatroom` VALUES (55,1,'ฟหก','2009-06-19 21:09:24');
INSERT INTO `chatroom` VALUES (56,1,'asda','2009-06-20 08:43:36');
INSERT INTO `chatroom` VALUES (57,1,'asdasad','2009-06-20 08:43:42');
INSERT INTO `chatroom` VALUES (58,1,'asdasadasd','2009-06-20 08:43:47');
INSERT INTO `chatroom` VALUES (59,1,'zzz','2009-06-20 08:46:54');
INSERT INTO `chatroom` VALUES (60,1,'zzz','2009-06-20 08:46:56');
INSERT INTO `chatroom` VALUES (61,1,'zzz','2009-06-20 08:46:58');
INSERT INTO `chatroom` VALUES (62,1,'asd','2009-06-20 08:46:59');
INSERT INTO `chatroom` VALUES (63,1,'asdasda','2009-06-20 08:47:01');
INSERT INTO `chatroom` VALUES (64,1,'asdsadsadsad','2009-06-20 08:47:02');
INSERT INTO `chatroom` VALUES (65,1,'ฟหกกฟหก','2009-06-20 08:47:06');
INSERT INTO `chatroom` VALUES (66,1,'ฟหกฟหกหฟก','2009-06-20 08:47:07');
INSERT INTO `chatroom` VALUES (67,1,'ฟหกฟกฟหก','2009-06-20 08:47:08');
INSERT INTO `chatroom` VALUES (68,1,'ไกๆกไก','2009-06-20 08:47:33');
INSERT INTO `chatroom` VALUES (69,1,'ผปแผแปแ','2009-06-20 08:47:35');
INSERT INTO `chatroom` VALUES (70,1,'ฟกฟหกฟหกฟหกหฟกหฟกหฟกหฟก ฟหกฟหก ฟหกฟหกฟหก ฟหกฟหกหไกๆ adsasdasdsad asdasdsad','2009-06-20 08:48:21');
INSERT INTO `chatroom` VALUES (71,1,'asdas','2009-06-20 08:48:23');
INSERT INTO `chatroom` VALUES (72,1,'asdsdasd','2009-06-20 08:48:25');
INSERT INTO `chatroom` VALUES (73,1,'asdasdsd','2009-06-20 08:48:26');
INSERT INTO `chatroom` VALUES (74,1,'asdasdadasd','2009-06-20 08:48:28');
INSERT INTO `chatroom` VALUES (75,1,'asdadssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss asdsad asd asddsads','2009-06-20 08:48:34');
INSERT INTO `chatroom` VALUES (76,1,'asdad asd sadsad asdasd asdsasd asd asdasd asd asd asdasdsadsd ','2009-06-20 08:48:42');
INSERT INTO `chatroom` VALUES (77,1,'asdasdsad','2009-06-20 08:49:06');
INSERT INTO `chatroom` VALUES (78,1,'asd asdas asd asdsd adasdas asd asd asd adsdas asd ad asda ads a sadsa ','2009-06-20 08:49:28');
INSERT INTO `chatroom` VALUES (79,1,'sdasdsa asd asd sadsd ads asd asd asdsdsa asd asd','2009-06-20 08:49:34');
INSERT INTO `chatroom` VALUES (80,2,'aaa','2009-06-20 08:52:53');
INSERT INTO `chatroom` VALUES (81,2,'asdasd','2009-06-20 08:56:30');
INSERT INTO `chatroom` VALUES (82,2,'asd','2009-06-20 08:56:37');
INSERT INTO `chatroom` VALUES (83,2,'asd','2009-06-20 08:56:40');
INSERT INTO `chatroom` VALUES (84,2,'zzz','2009-06-20 08:56:45');
INSERT INTO `chatroom` VALUES (85,2,'นานาฟกหหฟก','2009-06-20 08:58:26');
INSERT INTO `chatroom` VALUES (86,2,'ฟหกฟหกฟหก','2009-06-20 08:58:31');
INSERT INTO `chatroom` VALUES (87,1,'asd','2009-06-21 09:58:57');
INSERT INTO `chatroom` VALUES (88,1,'adsds','2009-06-21 09:59:01');
INSERT INTO `chatroom` VALUES (89,1,'zxc','2009-06-21 09:59:05');
INSERT INTO `chatroom` VALUES (90,1,'????????????????','2009-06-21 09:59:10');
INSERT INTO `chatroom` VALUES (91,1,'mac','2009-06-21 09:59:20');
INSERT INTO `chatroom` VALUES (92,1,'asdasd','2009-06-21 09:59:42');
INSERT INTO `chatroom` VALUES (93,1,'???????????????????????','2009-06-21 09:59:45');
INSERT INTO `chatroom` VALUES (94,1,'ฟหก','2009-06-21 10:01:01');
INSERT INTO `chatroom` VALUES (95,1,'ฟหกฟหก','2009-06-21 10:01:06');
INSERT INTO `chatroom` VALUES (96,1,'ฟหกฟหกห','2009-06-21 10:01:26');
INSERT INTO `chatroom` VALUES (97,2,'asdasd','2009-06-21 10:13:42');
INSERT INTO `chatroom` VALUES (98,1,'asdas','2009-06-21 10:13:46');
INSERT INTO `chatroom` VALUES (99,2,'กะั','2009-06-21 10:15:37');
INSERT INTO `chatroom` VALUES (100,3,'asdsd','2009-06-21 10:16:54');
INSERT INTO `chatroom` VALUES (101,2,'asd','2009-06-21 13:36:41');
INSERT INTO `chatroom` VALUES (102,1,'ฟหกฟหกหฟ','2009-06-21 13:51:33');
INSERT INTO `chatroom` VALUES (103,2,'กฟหกหหกฟ','2009-06-21 13:55:04');
INSERT INTO `chatroom` VALUES (104,1,'asdd','2009-06-21 13:55:07');
INSERT INTO `chatroom` VALUES (105,3,'asdd','2009-06-21 13:57:46');
INSERT INTO `chatroom` VALUES (106,2,'asdasdsad','2009-06-21 13:57:53');
INSERT INTO `chatroom` VALUES (107,1,'ฟกหกฟห','2009-06-21 13:57:57');
INSERT INTO `chatroom` VALUES (108,3,'ฟหกฟหก','2009-06-21 13:58:02');
INSERT INTO `chatroom` VALUES (109,2,'หฟกหกห','2009-06-21 13:58:07');
INSERT INTO `chatroom` VALUES (110,1,'ฟหกฟหก','2009-06-21 19:56:39');
INSERT INTO `chatroom` VALUES (111,2,'ผกแผปแผ','2009-06-21 19:56:57');
INSERT INTO `chatroom` VALUES (112,1,'ผปแผปแปผแ','2009-06-21 19:57:00');
INSERT INTO `chatroom` VALUES (113,2,'ผปแผปแผปแ','2009-06-21 19:57:04');
INSERT INTO `chatroom` VALUES (114,1,'ผปแผปแผปแ','2009-06-21 19:57:06');
INSERT INTO `chatroom` VALUES (115,2,'asdsd','2009-06-21 19:57:09');
INSERT INTO `chatroom` VALUES (116,1,'aaa','2009-06-24 18:53:31');
INSERT INTO `chatroom` VALUES (117,1,'หฟกก','2009-06-24 18:53:34');
INSERT INTO `chatroom` VALUES (118,1,'asdasd','2009-06-24 20:14:03');
INSERT INTO `chatroom` VALUES (119,1,'asdsad','2009-06-27 12:16:08');
INSERT INTO `chatroom` VALUES (120,1,'adsadasasd','2009-06-27 14:18:07');
INSERT INTO `chatroom` VALUES (121,1,'ฟกหฟกหฟกฟ','2009-06-27 14:18:11');
INSERT INTO `chatroom` VALUES (122,1,'asdd','2009-06-27 19:07:59');
INSERT INTO `chatroom` VALUES (123,1,'asd','2009-06-27 20:24:42');
INSERT INTO `chatroom` VALUES (124,1,'asdfasdsฟหกหกฟก','2009-06-28 10:00:23');
/*!40000 ALTER TABLE `chatroom` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table hilight
#

DROP TABLE IF EXISTS `hilight`;
CREATE TABLE `hilight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part` varchar(50) DEFAULT NULL,
  `organ_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

#
# Dumping data for table hilight
#
LOCK TABLES `hilight` WRITE;
/*!40000 ALTER TABLE `hilight` DISABLE KEYS */;

INSERT INTO `hilight` VALUES (1,'frontBackgroundLeft',NULL);
INSERT INTO `hilight` VALUES (2,'frontBackgroundRight',NULL);
INSERT INTO `hilight` VALUES (3,'frontHeadLeft',NULL);
INSERT INTO `hilight` VALUES (4,'frontHeadRight',NULL);
INSERT INTO `hilight` VALUES (5,'frontPharynx',NULL);
INSERT INTO `hilight` VALUES (6,'frontNeck1',NULL);
INSERT INTO `hilight` VALUES (7,'frontNeck2',NULL);
INSERT INTO `hilight` VALUES (8,'frontNeck1',NULL);
INSERT INTO `hilight` VALUES (9,'frontBack',4);
INSERT INTO `hilight` VALUES (10,'frontShoulderIn',1);
INSERT INTO `hilight` VALUES (11,'frontShoulderOut',1);
INSERT INTO `hilight` VALUES (12,'frontChestBackground',NULL);
INSERT INTO `hilight` VALUES (13,'frontChestUp',5);
INSERT INTO `hilight` VALUES (14,'frontChestDown',5);
INSERT INTO `hilight` VALUES (15,'frontChestWaist',5);
INSERT INTO `hilight` VALUES (16,'frontWaistIn',6);
INSERT INTO `hilight` VALUES (17,'frontWaistOut',6);
INSERT INTO `hilight` VALUES (19,'frontHand',NULL);
INSERT INTO `hilight` VALUES (20,'frontForeArmIn',3);
INSERT INTO `hilight` VALUES (21,'frontForeArmOut',3);
INSERT INTO `hilight` VALUES (22,'frontUpperArmIn',2);
INSERT INTO `hilight` VALUES (23,'frontUpperArmOut',2);
INSERT INTO `hilight` VALUES (24,'frontKnee',NULL);
INSERT INTO `hilight` VALUES (25,'frontHipsOut',7);
INSERT INTO `hilight` VALUES (26,'frontHipsGunwale',7);
INSERT INTO `hilight` VALUES (27,'frontThighsMiddle',7);
INSERT INTO `hilight` VALUES (28,'frontCalvesIn',9);
INSERT INTO `hilight` VALUES (29,'frontCalvesOutUp',9);
INSERT INTO `hilight` VALUES (30,'frontCalvesOutDown',9);
INSERT INTO `hilight` VALUES (31,'frontFoot',NULL);
INSERT INTO `hilight` VALUES (32,'frontGunwale',NULL);
INSERT INTO `hilight` VALUES (33,'behindBackground',NULL);
INSERT INTO `hilight` VALUES (34,'behindNeck',NULL);
INSERT INTO `hilight` VALUES (35,'behindOcciput',4);
INSERT INTO `hilight` VALUES (36,'behindWaistIn',4);
INSERT INTO `hilight` VALUES (37,'behindWaistOut',4);
INSERT INTO `hilight` VALUES (38,'behindThighsIn',8);
INSERT INTO `hilight` VALUES (39,'behindCalvesUp',9);
INSERT INTO `hilight` VALUES (40,'behindCalvesDown',9);
INSERT INTO `hilight` VALUES (41,'behindFoot',NULL);
INSERT INTO `hilight` VALUES (42,'behindThighsMiddle',8);
INSERT INTO `hilight` VALUES (43,'behindBackOut',4);
INSERT INTO `hilight` VALUES (44,'behindHipsIn',7);
INSERT INTO `hilight` VALUES (45,'behindHipsOut',7);
INSERT INTO `hilight` VALUES (46,'behindHand',NULL);
INSERT INTO `hilight` VALUES (47,'behindShouldersIn',1);
INSERT INTO `hilight` VALUES (48,'behindShouldersOut',1);
INSERT INTO `hilight` VALUES (49,'behindWaistWing',4);
INSERT INTO `hilight` VALUES (50,'behindUpperArm',2);
INSERT INTO `hilight` VALUES (51,'behindForeArmIn',3);
INSERT INTO `hilight` VALUES (52,'behindForeArmOut',3);
INSERT INTO `hilight` VALUES (54,'behindWaistIn',6);
INSERT INTO `hilight` VALUES (55,'behindWaistOut',6);
INSERT INTO `hilight` VALUES (56,'frontThighsMiddle',8);
INSERT INTO `hilight` VALUES (57,'behindDetailCalves',9);
/*!40000 ALTER TABLE `hilight` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table login
#

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

#
# Dumping data for table login
#
LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;

INSERT INTO `login` VALUES (74,1);
INSERT INTO `login` VALUES (75,2);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table organ
#

DROP TABLE IF EXISTS `organ`;
CREATE TABLE `organ` (
  `organ_id` int(11) NOT NULL AUTO_INCREMENT,
  `organ_name` varchar(50) NOT NULL,
  `hilight` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organ_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Dumping data for table organ
#
LOCK TABLES `organ` WRITE;
/*!40000 ALTER TABLE `organ` DISABLE KEYS */;

INSERT INTO `organ` VALUES (1,'กล้ามเนื้อหัวไหล่','frontShoulderIn-frontShoulderOut-behindShouldersIn-behindShouldersOut');
INSERT INTO `organ` VALUES (2,'กล้ามเนื้อท่อนแขนส่วนบน','frontUpperArmIn-frontUpperArmOut-behindUpperArm');
INSERT INTO `organ` VALUES (3,'กล้ามเนื้อแขนส่วนล่าง','frontForeArmIn-frontForeArmOut-behindForeArmIn-behindForeArmOut');
INSERT INTO `organ` VALUES (4,'กล้ามเนื้อแผ่นหลัง','frontBack-behindOcciput-behindWaistIn-behindWaistOut-behindBackOut-behindWaistWing');
INSERT INTO `organ` VALUES (5,'กล้ามเนื้อทรวงอก','frontChestUp-frontChestDown-frontChestWaist');
INSERT INTO `organ` VALUES (6,'กล้ามเนื้อเอว','frontWaistIn-frontWaistOut-behindWaistIn-behindWaistOut');
INSERT INTO `organ` VALUES (7,'กล้ามเนื้อสะโพก','frontHipsOut-frontHipsGunwale-frontThighsMiddle-behindHipsIn-behindHipsOut');
INSERT INTO `organ` VALUES (8,'กล้ามเนื้อต้นขา','frontThighsMiddle-behindThighsIn-behindThighsMiddle');
INSERT INTO `organ` VALUES (9,'กล้ามเนื้อน่อง','frontCalvesIn-frontCalvesOutUp-frontCalvesOutDown-behindCalvesUp-behindCalvesDown-behindDetailCalves');
/*!40000 ALTER TABLE `organ` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table organ_detail
#

DROP TABLE IF EXISTS `organ_detail`;
CREATE TABLE `organ_detail` (
  `organ_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `organ_detail_name` varchar(50) NOT NULL,
  `organ_id` int(11) NOT NULL,
  `hilight` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organ_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

#
# Dumping data for table organ_detail
#
LOCK TABLES `organ_detail` WRITE;
/*!40000 ALTER TABLE `organ_detail` DISABLE KEYS */;

INSERT INTO `organ_detail` VALUES (1,'กล้ามเนื้อหัวไหล่ส่วนหน้า',1,'frontShoulderIn');
INSERT INTO `organ_detail` VALUES (2,'กล้ามเนื้อหัวไหล่ด้านข้าง',1,'frontShoulderOut-behindShouldersOut');
INSERT INTO `organ_detail` VALUES (3,'กล้ามเนื้อหัวไหล่ด้านหลัง',1,'behindShouldersIn');
INSERT INTO `organ_detail` VALUES (4,'supraspinatus',1,'behindShouldersIn');
INSERT INTO `organ_detail` VALUES (5,'กล้ามเนื้อด้านหลังแขนส่วนบน',2,'behindUpperArm');
INSERT INTO `organ_detail` VALUES (6,'กล้ามเนื้อด้านหน้าแขนส่วนบน',2,'frontUpperArmIn');
INSERT INTO `organ_detail` VALUES (7,'brachialis',2,'frontUpperArmOut');
INSERT INTO `organ_detail` VALUES (8,'brachioradialis',3,'frontForeArmOut');
INSERT INTO `organ_detail` VALUES (9,'กล้ามเนื้อที่งอข้อต่อที่ข้อมือ',3,'frontForeArmIn-behindForeArmIn');
INSERT INTO `organ_detail` VALUES (10,'กล้ามเนื้องอข้อต่อข้อมือด้านหลัง',3,'behindForeArmOut');
INSERT INTO `organ_detail` VALUES (11,'แผ่นหลัง',4,'frontBack-behindOcciput-behindWaistIn-behindWaistOut-behindBackOut-behindWaistWing');
INSERT INTO `organ_detail` VALUES (12,'กล้ามเนื้อหลังส่วนกลาง',4,'behindBackOut');
INSERT INTO `organ_detail` VALUES (13,'กล้ามเนื้อหลังติดกับไหล่ส่วนบน',4,'frontBack-behindWaistOut');
INSERT INTO `organ_detail` VALUES (14,'กล้ามเนื้ออกที่เกี่ยวกับกระดูกสันนอก',5,'frontChestDown');
INSERT INTO `organ_detail` VALUES (15,'กล้ามเนื้ออกบริเวณ รอยบุ๋มที่สะบักทั้ง 2 ข้าง',5,'frontChestUp');
INSERT INTO `organ_detail` VALUES (16,'กล้ามเนื้อบริเวณรอบกระดูกสะบัก และ ยกกระดูกซี่โครง',5,'frontChestWaist');
INSERT INTO `organ_detail` VALUES (17,'กล้ามเนื้อส่วนหน้าของกระเพาะ',6,'frontWaistIn');
INSERT INTO `organ_detail` VALUES (18,'obliques',6,'frontWaistOut-behindWaistOut');
INSERT INTO `organ_detail` VALUES (19,'กล้ามเนื้อยกกระดูสันหลัง',6,'behindWaistIn-behindOcciput');
INSERT INTO `organ_detail` VALUES (20,'กล้ามเนื้อบั้นท้าย',7,'behindHipsIn');
INSERT INTO `organ_detail` VALUES (21,'กล้ามเนื้อสะโพกที่ดึงเข้าสู่แกนร่างกาย',7,'frontHipsOut-behindHipsOut');
INSERT INTO `organ_detail` VALUES (22,'กล้ามเนื้อสะโพกที่งอข้อต่อ',7,'frontHipsOut-frontHipsGunwale-frontThighsMiddle');
INSERT INTO `organ_detail` VALUES (23,'กล้ามเนื้อต้นขาด้านหน้า',8,'frontThighsMiddle');
INSERT INTO `organ_detail` VALUES (24,'กล้ามเนื้อต้นขาด้านหลัง',8,'behindThighsMiddle');
INSERT INTO `organ_detail` VALUES (25,'กล้ามเนื้อต้นขาที่ดึงออกห่างจากแกนกลาง',8,'frontHipsOut-behindThighsIn-behindHipsOut-behindHipsIn');
INSERT INTO `organ_detail` VALUES (26,'กล้ามเนื้อน่อง',9,'frontCalvesOutUp-behindCalvesUp');
INSERT INTO `organ_detail` VALUES (27,'กล้ามเนื้อหลังของขาส่วนล่าง',9,'frontCalvesOutDown-behindCalvesDown');
INSERT INTO `organ_detail` VALUES (28,'กล้ามเนื้อน่องส่วนหน้า',9,'frontCalvesIn');
/*!40000 ALTER TABLE `organ_detail` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table organ_method
#

DROP TABLE IF EXISTS `organ_method`;
CREATE TABLE `organ_method` (
  `organ_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `organ_method_name` varchar(50) NOT NULL,
  `organ_method_type` int(11) NOT NULL,
  `organ_method_level` int(11) NOT NULL,
  `organ_detail_id` int(11) NOT NULL,
  `calorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`organ_method_id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

#
# Dumping data for table organ_method
#
LOCK TABLES `organ_method` WRITE;
/*!40000 ALTER TABLE `organ_method` DISABLE KEYS */;

INSERT INTO `organ_method` VALUES (1,'Behind Next Press',1,0,1,130);
INSERT INTO `organ_method` VALUES (2,'Front Raise',1,0,1,178);
INSERT INTO `organ_method` VALUES (3,'Military Press',1,0,1,163);
INSERT INTO `organ_method` VALUES (4,'Arnold Press',2,0,1,168);
INSERT INTO `organ_method` VALUES (5,'Shoulder Press',2,0,1,132);
INSERT INTO `organ_method` VALUES (6,'Shoulder Press',3,0,1,157);
INSERT INTO `organ_method` VALUES (7,'Upright Now',1,0,2,143);
INSERT INTO `organ_method` VALUES (8,'Lateral Raise',4,0,2,185);
INSERT INTO `organ_method` VALUES (9,'Upright Now',2,0,2,125);
INSERT INTO `organ_method` VALUES (10,'Lateral Raise',2,0,2,178);
INSERT INTO `organ_method` VALUES (11,'Lateral Raise',3,0,2,111);
INSERT INTO `organ_method` VALUES (12,'Row ( To Neck with Elbows Out )',1,0,3,171);
INSERT INTO `organ_method` VALUES (13,'Rear Lateral Raise ( Lying )',4,0,3,106);
INSERT INTO `organ_method` VALUES (14,'Row ( With Elbows Out )',2,0,3,94);
INSERT INTO `organ_method` VALUES (15,'Rear Lateral Raise ( Seated )',2,0,3,135);
INSERT INTO `organ_method` VALUES (16,'Rear Lateral Raise ',2,0,3,181);
INSERT INTO `organ_method` VALUES (17,'Rear Lateral Raise ( Seated )',3,0,3,108);
INSERT INTO `organ_method` VALUES (18,'Front Lateral Raise',4,0,4,150);
INSERT INTO `organ_method` VALUES (19,'Front Lateral Raise',2,0,4,152);
INSERT INTO `organ_method` VALUES (20,'Triceps Extension ( Lying )',1,0,5,151);
INSERT INTO `organ_method` VALUES (21,'Close Grip Bench Press',1,0,5,91);
INSERT INTO `organ_method` VALUES (22,'Triceps Extension',1,0,5,157);
INSERT INTO `organ_method` VALUES (23,'Triceps Extension ( Bent - Over )',4,0,5,164);
INSERT INTO `organ_method` VALUES (24,'Pushdown ( One Arm )',4,0,5,126);
INSERT INTO `organ_method` VALUES (25,'Pushdown ( Heavy )',4,0,5,172);
INSERT INTO `organ_method` VALUES (26,'Triceps Extension One Arm ( Bent - Over )',4,0,5,134);
INSERT INTO `organ_method` VALUES (27,'Pushdown',4,0,5,125);
INSERT INTO `organ_method` VALUES (28,'Triceps Extension',4,0,5,158);
INSERT INTO `organ_method` VALUES (29,'Triceps Extension ( One Arm )',2,0,5,190);
INSERT INTO `organ_method` VALUES (30,'Triceps Extension',2,0,5,193);
INSERT INTO `organ_method` VALUES (31,'Triceps Extension ( Lying )',2,0,5,132);
INSERT INTO `organ_method` VALUES (32,'Kickback',2,0,5,91);
INSERT INTO `organ_method` VALUES (33,'Bench Dip',5,0,5,193);
INSERT INTO `organ_method` VALUES (34,'Curl',1,0,6,176);
INSERT INTO `organ_method` VALUES (35,'Curl',4,0,6,198);
INSERT INTO `organ_method` VALUES (36,'Curl',2,0,6,188);
INSERT INTO `organ_method` VALUES (37,'Curl ( Incline )',2,0,6,165);
INSERT INTO `organ_method` VALUES (38,'Curl',3,0,6,154);
INSERT INTO `organ_method` VALUES (39,'Preacher Curl',1,0,7,150);
INSERT INTO `organ_method` VALUES (40,'Concentrate Curl',2,0,7,166);
INSERT INTO `organ_method` VALUES (41,'Preacher Curl',2,0,7,130);
INSERT INTO `organ_method` VALUES (42,'Preacher Curl',3,0,7,112);
INSERT INTO `organ_method` VALUES (43,'Reverse Curl',1,0,8,190);
INSERT INTO `organ_method` VALUES (44,'Reverse Preacher Curl',1,0,8,163);
INSERT INTO `organ_method` VALUES (45,'Hammer Curl',4,0,8,138);
INSERT INTO `organ_method` VALUES (46,'Reverse Curl',4,0,8,105);
INSERT INTO `organ_method` VALUES (47,'Reverse Preacher Curl',4,0,8,162);
INSERT INTO `organ_method` VALUES (48,'Hammer Curl',2,0,8,104);
INSERT INTO `organ_method` VALUES (49,'Wrist Curl',1,0,9,190);
INSERT INTO `organ_method` VALUES (50,'Wrist Curl',4,0,9,130);
INSERT INTO `organ_method` VALUES (51,'Wrist Curl',2,0,9,140);
INSERT INTO `organ_method` VALUES (52,'Reverse Wrist Curl',1,0,10,140);
INSERT INTO `organ_method` VALUES (53,'Reverse Wrist Curl',2,0,10,143);
INSERT INTO `organ_method` VALUES (54,'Bent - Over Row',1,0,11,169);
INSERT INTO `organ_method` VALUES (55,'Seated Row ( Straigth Back )',4,0,11,177);
INSERT INTO `organ_method` VALUES (56,'One Arm Row',4,0,11,90);
INSERT INTO `organ_method` VALUES (57,'Seated Row ',4,0,11,142);
INSERT INTO `organ_method` VALUES (58,'Seated Row ( Str.Back - Wide Gr. )',4,0,11,169);
INSERT INTO `organ_method` VALUES (59,'Seated Row ( Wide Grip )',4,0,11,188);
INSERT INTO `organ_method` VALUES (60,'Bent - Over Row',2,0,11,162);
INSERT INTO `organ_method` VALUES (61,'Seated Row',3,0,11,156);
INSERT INTO `organ_method` VALUES (62,'Incline Row',3,0,11,141);
INSERT INTO `organ_method` VALUES (63,'Pull Over',1,0,12,160);
INSERT INTO `organ_method` VALUES (64,'Pulldown ( Close Grip )',4,0,12,159);
INSERT INTO `organ_method` VALUES (65,'Pulldown ( Underhand )',4,0,12,127);
INSERT INTO `organ_method` VALUES (66,'Pulldown ( Front )',4,0,12,109);
INSERT INTO `organ_method` VALUES (67,'Pulldown ( Rear )',4,0,12,136);
INSERT INTO `organ_method` VALUES (68,'Pulldown',4,0,12,153);
INSERT INTO `organ_method` VALUES (69,'Pulldown ( Underhand )',3,0,12,191);
INSERT INTO `organ_method` VALUES (70,'Pulldown ( Front )',3,0,12,193);
INSERT INTO `organ_method` VALUES (71,'Shrug',1,0,13,101);
INSERT INTO `organ_method` VALUES (72,'Shrug',2,0,13,125);
INSERT INTO `organ_method` VALUES (73,'Bench Press',1,0,14,112);
INSERT INTO `organ_method` VALUES (74,'Bench Press ( Decline )',1,0,14,187);
INSERT INTO `organ_method` VALUES (75,'Bench Press ( Guillotine )',1,0,14,136);
INSERT INTO `organ_method` VALUES (76,'Bench Press ( Power Lift )',1,0,14,185);
INSERT INTO `organ_method` VALUES (77,'Fly ( Standing )',4,0,14,178);
INSERT INTO `organ_method` VALUES (78,'Bench Press',2,0,14,132);
INSERT INTO `organ_method` VALUES (79,'Bench Press ( Decline )',2,0,14,158);
INSERT INTO `organ_method` VALUES (80,'Pullover',2,0,14,149);
INSERT INTO `organ_method` VALUES (81,'Fly',2,0,14,140);
INSERT INTO `organ_method` VALUES (82,'Fly ( Pec Deck )',3,0,14,126);
INSERT INTO `organ_method` VALUES (83,'Bench Press',3,0,14,185);
INSERT INTO `organ_method` VALUES (84,'Fly ( Decline )',3,0,14,173);
INSERT INTO `organ_method` VALUES (85,'Fly ( Seated )',3,0,14,118);
INSERT INTO `organ_method` VALUES (86,'Chest Dip',5,0,14,114);
INSERT INTO `organ_method` VALUES (87,'Incline Bench Press',1,0,15,118);
INSERT INTO `organ_method` VALUES (88,'Fly ( High )',4,0,15,108);
INSERT INTO `organ_method` VALUES (89,'Incline Bench Press',2,0,15,158);
INSERT INTO `organ_method` VALUES (90,'Incline Shoulder Raise',1,0,16,102);
INSERT INTO `organ_method` VALUES (91,'Incline Shoulder Raise',2,0,16,113);
INSERT INTO `organ_method` VALUES (92,'Seated Crunch',3,0,17,124);
INSERT INTO `organ_method` VALUES (93,'Crunch Twisting Crunch',5,0,17,98);
INSERT INTO `organ_method` VALUES (94,'Jack-Knife Sit-Up',5,0,17,125);
INSERT INTO `organ_method` VALUES (95,'45 Side Bend',5,0,17,104);
INSERT INTO `organ_method` VALUES (96,'Side Bend',2,0,18,157);
INSERT INTO `organ_method` VALUES (97,'Twist',3,0,18,178);
INSERT INTO `organ_method` VALUES (98,'45 Side Bend',5,0,18,110);
INSERT INTO `organ_method` VALUES (99,'Side Crunch',5,0,18,152);
INSERT INTO `organ_method` VALUES (100,'Twisting Crunch',5,0,18,175);
INSERT INTO `organ_method` VALUES (101,'Straight-Leg Deadlift',1,0,19,143);
INSERT INTO `organ_method` VALUES (102,'Bent Knee Good-Morning',1,0,19,192);
INSERT INTO `organ_method` VALUES (103,'Deadlift',1,0,19,192);
INSERT INTO `organ_method` VALUES (104,'Stiff-Leg Deadlift',1,0,19,147);
INSERT INTO `organ_method` VALUES (105,'Seated Row ( Wide Grip )',4,0,19,150);
INSERT INTO `organ_method` VALUES (106,'Seated Row',4,0,19,138);
INSERT INTO `organ_method` VALUES (107,'Straight-Leg Deadlift',2,0,19,168);
INSERT INTO `organ_method` VALUES (108,'Back Extension',3,0,19,174);
INSERT INTO `organ_method` VALUES (109,'Back Extension',5,0,19,98);
INSERT INTO `organ_method` VALUES (110,'Deadlift',1,0,20,112);
INSERT INTO `organ_method` VALUES (111,'Stiff-Leg Deadlift',1,0,20,124);
INSERT INTO `organ_method` VALUES (112,'Step-Up',1,0,20,127);
INSERT INTO `organ_method` VALUES (113,'Squat',1,0,20,162);
INSERT INTO `organ_method` VALUES (114,'Full Squat',1,0,20,179);
INSERT INTO `organ_method` VALUES (115,'Front Squat',1,0,20,126);
INSERT INTO `organ_method` VALUES (116,'Hack Squat',1,0,20,168);
INSERT INTO `organ_method` VALUES (117,'Safety Squat',1,0,20,135);
INSERT INTO `organ_method` VALUES (118,'Rear Lunge',1,0,20,172);
INSERT INTO `organ_method` VALUES (119,'Lunge',1,0,20,168);
INSERT INTO `organ_method` VALUES (120,'Bent Knee Good-Morning',1,0,20,197);
INSERT INTO `organ_method` VALUES (121,'Straight-Back Stiff-Leg Deadlift',1,0,20,160);
INSERT INTO `organ_method` VALUES (122,'Squat',2,0,20,135);
INSERT INTO `organ_method` VALUES (123,'Step-Up',2,0,20,155);
INSERT INTO `organ_method` VALUES (124,'Lunge',2,0,20,198);
INSERT INTO `organ_method` VALUES (125,'Rear Lunge',2,0,20,133);
INSERT INTO `organ_method` VALUES (126,'Hip Extension',3,0,20,175);
INSERT INTO `organ_method` VALUES (127,'45 Leg Press',3,0,20,164);
INSERT INTO `organ_method` VALUES (128,'Hip Abduction',4,0,21,125);
INSERT INTO `organ_method` VALUES (129,'Seated Hip Abduction',3,0,21,193);
INSERT INTO `organ_method` VALUES (130,'Leg Raise',4,0,22,127);
INSERT INTO `organ_method` VALUES (131,'Leg Raise',5,0,22,183);
INSERT INTO `organ_method` VALUES (132,'Hanging Leg Raise',5,0,22,141);
INSERT INTO `organ_method` VALUES (133,'Squat',1,0,23,135);
INSERT INTO `organ_method` VALUES (134,'Front Squat',1,0,23,150);
INSERT INTO `organ_method` VALUES (135,'Full Squat',1,0,23,174);
INSERT INTO `organ_method` VALUES (136,'Rear Lunge',1,0,23,134);
INSERT INTO `organ_method` VALUES (137,'Step-Up',1,0,23,114);
INSERT INTO `organ_method` VALUES (138,'Hack Squat',1,0,23,100);
INSERT INTO `organ_method` VALUES (139,'Squat',2,0,23,101);
INSERT INTO `organ_method` VALUES (140,'Lunge',2,0,23,158);
INSERT INTO `organ_method` VALUES (141,'Rear Lunge',2,0,23,179);
INSERT INTO `organ_method` VALUES (142,'Step-Up',2,0,23,122);
INSERT INTO `organ_method` VALUES (143,'45 Leg Press',3,0,23,179);
INSERT INTO `organ_method` VALUES (144,'Seated Leg Press',3,0,23,135);
INSERT INTO `organ_method` VALUES (145,'Leg Extension',3,0,23,101);
INSERT INTO `organ_method` VALUES (146,'Hack Squat',6,0,23,178);
INSERT INTO `organ_method` VALUES (147,'Sissy Squat',5,0,23,156);
INSERT INTO `organ_method` VALUES (152,'Good-Morning',1,0,24,116);
INSERT INTO `organ_method` VALUES (153,'Straight-Leg Deadlift',1,0,24,119);
INSERT INTO `organ_method` VALUES (154,'Hip Extension',1,0,24,188);
INSERT INTO `organ_method` VALUES (155,'Straight-Back Striaght-Leg Deadlift',1,0,24,170);
INSERT INTO `organ_method` VALUES (156,'Lying Leg Curl',4,0,24,178);
INSERT INTO `organ_method` VALUES (157,'Straight-Leg Deadlift ',2,0,24,132);
INSERT INTO `organ_method` VALUES (158,'Straight-Back Straight-Leg Deadlift',2,0,24,170);
INSERT INTO `organ_method` VALUES (159,'Seated Leg Curl',3,0,24,160);
INSERT INTO `organ_method` VALUES (160,'Standing Leg Curl',3,0,24,136);
INSERT INTO `organ_method` VALUES (161,'Lying Leg Curl',3,0,24,192);
INSERT INTO `organ_method` VALUES (162,'Hip Abduction',4,0,25,186);
INSERT INTO `organ_method` VALUES (163,'Seated Hip Abduction',3,0,25,154);
INSERT INTO `organ_method` VALUES (164,'Standing Calf Raise',1,0,26,127);
INSERT INTO `organ_method` VALUES (165,'Standing Calf Raise',4,0,26,147);
INSERT INTO `organ_method` VALUES (166,'Single Leg Calf Raise',2,0,26,171);
INSERT INTO `organ_method` VALUES (167,'Donkey Calf Raise',3,0,26,128);
INSERT INTO `organ_method` VALUES (168,'Standing Calf Raise',3,0,26,148);
INSERT INTO `organ_method` VALUES (169,'Seated Calf Extension',3,0,26,163);
INSERT INTO `organ_method` VALUES (170,'Safety Barbell Seated Calf Raise',1,0,27,147);
INSERT INTO `organ_method` VALUES (171,'Seated Calf Raise',3,0,27,119);
INSERT INTO `organ_method` VALUES (172,'Reverse Calf Raise',1,0,28,167);
INSERT INTO `organ_method` VALUES (173,'Reverse Calf Raise',2,0,28,183);
INSERT INTO `organ_method` VALUES (174,'Single Leg Reverse Calf Raise',2,0,28,154);
INSERT INTO `organ_method` VALUES (175,'45 Reverse Calf Press',3,0,28,116);
INSERT INTO `organ_method` VALUES (176,'45 Reverse Calf Press',6,0,28,101);
/*!40000 ALTER TABLE `organ_method` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table organ_method_type
#

DROP TABLE IF EXISTS `organ_method_type`;
CREATE TABLE `organ_method_type` (
  `organ_method_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organ_method_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`organ_method_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Dumping data for table organ_method_type
#
LOCK TABLES `organ_method_type` WRITE;
/*!40000 ALTER TABLE `organ_method_type` DISABLE KEYS */;

INSERT INTO `organ_method_type` VALUES (1,'BARBELL');
INSERT INTO `organ_method_type` VALUES (2,'DUMBBELL');
INSERT INTO `organ_method_type` VALUES (3,'LEVER');
INSERT INTO `organ_method_type` VALUES (4,'CABLE');
INSERT INTO `organ_method_type` VALUES (5,'WEIGHTED');
INSERT INTO `organ_method_type` VALUES (6,'SLED');
/*!40000 ALTER TABLE `organ_method_type` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `activate_code` varchar(100) DEFAULT NULL,
  `receiveNews` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

#
# Dumping data for table user
#
LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` VALUES (1,'mac','mac','Kittipat','Matachoochok','Male','2009-12-30','Mac Home',NULL,'2009-06-11','2009-08-11','wizard_akirqqqqa@hotmail.com',1,NULL,0);
INSERT INTO `user` VALUES (2,'banka','bank','siripongฟหก','tianpajeekul','Male','2009-06-01','home','0866004744','2009-06-30','2009-07-17','siripong@gmail.com',1,NULL,1);
INSERT INTO `user` VALUES (3,'pon','pon','ฟหกฟกห','dasdadzcฟหกก','ชาย','1990-12-30','บ้านนนนนนน',NULL,'2009-06-15','2009-09-05','asda@hotmail.com',0,NULL,0);
INSERT INTO `user` VALUES (26,'testPanda','password','panda','ฟฟฟ','Male','1991-06-04','home','021211211','2009-06-26 21:05:54','2009-07-11','wizard_akira@hotmail.com',1,'8W2R9J3G5S7Z9P7G9Y',0);
INSERT INTO `user` VALUES (27,'testA2','password','test','555','Male','2009-06-02','testman','028681244','2009-06-26 21:13:50','2009-06-15','wizard_akira@hotmail.com',0,'5B8T9E7S3O0I',0);
INSERT INTO `user` VALUES (28,'testBANK','password','Siripong','Tianpajeekul','Male','2009-06-01','Home','0866004744','2009-06-26 22:42:18','2009-06-11','banktp106@hotmail.com',1,'3E6Q8M8A1F3B2J7M',0);
INSERT INTO `user` VALUES (29,'test','password','Ponlavat','ๆไ','Male','2009-06-02','KMUTT','028630321','2009-06-27 21:17:47','2009-06-11','wizard_akira@hotmail.com',1,'4Z7Q3H2Z',0);
INSERT INTO `user` VALUES (30,'testSend2','password','Ponlavat','เดกเ ฟกฟหกฟหกหฟก ฟหก ฟหกฟห ฟก ฟกห ฟหฟหก ฟกหฟ หฟ กฟ','Male','2009-06-01','asd','024763669','2009-06-28 19:16:15','2009-06-11','efitness.mail@gmail.com',0,'2U5Y7L1V3L3B5H7E7Q',0);
INSERT INTO `user` VALUES (31,'pattest','password','Pat','adsdadad asd asd a as asd a a asd asdasd sd asd sa','Male','2009-06-02','home','028630321','2009-06-28 20:23:28','2009-06-11','wizard_akira@hotmail.com',1,'7H3N0W4W6P0C9T',1);
INSERT INTO `user` VALUES (32,'bank1','bank111111','bank','bank ads asd a asd  กกหฟก ฟหก กฟหก515ฟก ฟก516165ฟห','Male','2009-06-30','5555','5555555555','2009-06-29 14:46:22','2009-06-11','siripong.tianpakeekul@gmail.com',0,'8L1K8V4H0E',1);
INSERT INTO `user` VALUES (33,'bank1','bankbank','bank','bank','Male','2009-06-30','babaa','1122121212','2009-06-29 14:51:39','2009-06-11','siripong.tianpakeekul@gmail.com',0,'7S1T5K3Y9N',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
