/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.50 : Database - herewego
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`herewego` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `herewego`;

/*Table structure for table `good` */

DROP TABLE IF EXISTS `good`;

CREATE TABLE `good` (
  `good_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `content` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `good` */

/*Table structure for table `myorder` */

DROP TABLE IF EXISTS `myorder`;

CREATE TABLE `myorder` (
  `order_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `buy_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sell_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `time` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `1` (`good_id`),
  KEY `2` (`buy_id`),
  KEY `3` (`sell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `myorder` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_password` varchar(16) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_password`) values ('11111','22222'),('a',''),('all','guanliyuan'),('ryz','asas'),('test03','123456'),('yhx','123456'),('zcz','123456'),('zcztest01','123456'),('zcztest02','123456');

/*Table structure for table `user_friends` */

DROP TABLE IF EXISTS `user_friends`;

CREATE TABLE `user_friends` (
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_friend` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`user_id`,`user_friend`),
  KEY `user_friend` (`user_friend`),
  CONSTRAINT `user_friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_friends_ibfk_2` FOREIGN KEY (`user_friend`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_friends` */

insert  into `user_friends`(`user_id`,`user_friend`) values ('zcz','11111'),('zcz','yhx'),('test03','zcztest01'),('test03','zcztest02');

/*Table structure for table `user_game` */

DROP TABLE IF EXISTS `user_game`;

CREATE TABLE `user_game` (
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_game` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_district` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`user_id`,`user_game`,`user_district`),
  CONSTRAINT `user_game_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_game` */

insert  into `user_game`(`user_id`,`user_game`,`user_district`) values ('11111','LOL','gtly'),('a','a','a'),('ryz','é´é³å¸','åå¿ä¸æ'),('yhx','10','10'),('zcz','10','10'),('zcztest01','10','10');

/*Table structure for table `user_information` */

DROP TABLE IF EXISTS `user_information`;

CREATE TABLE `user_information` (
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_name` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `user_sex` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `user_age` int(20) DEFAULT NULL,
  `user_constellation` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `foreign(user_id)` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_information` */

insert  into `user_information`(`user_id`,`user_name`,`user_sex`,`user_age`,`user_constellation`) values ('11111','nny','n',30,'n'),('a','a','a',11,'a'),('ryz','hahaha','ç·',20,'åé±¼'),('zcz','zcz','man',21,'famale'),('zcztest01','test01','famale',20,'å¤å¥³åº§'),('zcztest02','TestIsOver','男',18,'射手');

/*Table structure for table `user_message` */

DROP TABLE IF EXISTS `user_message`;

CREATE TABLE `user_message` (
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `touser` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user_message` varchar(128) CHARACTER SET utf8 NOT NULL,
  `user_add_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`user_message`,`user_add_time`,`touser`),
  KEY `touser` (`touser`),
  CONSTRAINT `user_message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_message_ibfk_2` FOREIGN KEY (`touser`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_message` */

insert  into `user_message`(`user_id`,`touser`,`user_message`,`user_add_time`) values ('zcz','11111','1010','2016-12-15 19:31:29'),('zcz','11111','11','2016-12-15 19:32:05'),('zcz','11111','1111','2016-12-15 15:25:54'),('zcz','11111','1111','2016-12-15 19:32:36'),('zcz','11111','111111','2016-12-15 19:32:12'),('zcz','11111','111111','2016-12-15 19:32:15'),('zcztest01','all','this is to all','2016-12-05 17:38:51'),('zcztest01','yhx','hello ','2016-12-05 17:38:00');

/*Table structure for table `user_money` */

DROP TABLE IF EXISTS `user_money`;

CREATE TABLE `user_money` (
  `user_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_money` float DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_money` */

insert  into `user_money`(`user_id`,`user_money`) values ('zcz',1000);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`) values (1,'dzx','654321'),(2,'whatever','654321'),(3,'Your name','******'),(4,'liutao','1120219'),(5,'dsad','sdsads'),(6,'dengzhixiao','111111'),(7,'xiaoye','123456'),(8,'hehe','ewqeqw');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
