/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.1.32-community : Database - onedayjobs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onedayjobs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `onedayjobs`;

/*Table structure for table `applyvacency` */

DROP TABLE IF EXISTS `applyvacency`;

CREATE TABLE `applyvacency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacencyid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `applyvacency` */

insert  into `applyvacency`(`id`,`vacencyid`,`userid`,`date`,`status`) values 
(1,1,12,'2019-12-26','accepted'),
(2,2,12,'2019-12-26','accepted'),
(3,2,12,'2019-12-27','accepted'),
(4,1,12,'2019-12-27','accepted'),
(5,3,12,'2019-12-27','rejected'),
(6,2,12,'2019-12-27','accepted'),
(7,3,12,'2019-12-27','rejected'),
(8,6,12,'2019-12-27','pending'),
(9,7,12,'2019-12-27','accepted'),
(10,8,12,'2019-12-27','pending'),
(11,9,12,'2019-12-28','pending'),
(12,9,12,'2019-12-28','pending'),
(13,8,12,'2019-12-28','pending'),
(14,8,12,'2019-12-28','pending'),
(15,6,12,'2019-12-28','pending'),
(16,7,12,'2019-12-28','pending');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `companyname` varchar(30) DEFAULT NULL,
  `pin` bigint(20) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `post` varchar(30) DEFAULT NULL,
  `website` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contactnumber` bigint(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`id`,`lid`,`companyname`,`pin`,`place`,`post`,`website`,`email`,`contactnumber`,`password`) values 
(1,7,'asdaaaaaa',656712,'ghjh','ghjhgf','hjgjhgfggf','asdd.com',9757645678,'321'),
(4,10,'rhtykuj',2435456,'axasgfgj','vdfnfg','gnfmhj.','bfgmgh,',24235658,'2222'),
(7,14,'ssssssss',212322,'sdsfd','fddd','dd','war@gmail.com',8564555555,'0000'),
(8,17,'company one',676767,'place one','post one','websiteone','companyone@gmail.com',9876543210,'1212');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`id`,`userid`,`complaint`,`date`,`reply`) values 
(1,12,'jsssdddfffggghhhjjjkkklll','2019-12-16','l;hj;ojpo'),
(2,16,'tfl the ','2019-12-24','not baad'),
(3,16,'','2019-12-24','pending'),
(4,12,'complaints 1','2019-12-27','hvvhg'),
(5,12,'complaints 1','2019-12-27','pending'),
(6,12,'badger ','2019-12-27','pending'),
(7,12,'tyshdb','2019-12-28','pending'),
(8,12,'refund ','2019-12-28','pending');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype_id` int(30) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`usertype_id`,`feedback`,`date`) values 
(1,12,'yrhdhfhfufjfjf','2019-12-27'),
(2,7,'very baaaaad','2019-12-27'),
(3,12,'nice','2019-12-27'),
(4,12,'ghjm','2019-12-28'),
(5,12,'ghgg','2019-12-28'),
(6,12,'r9y9f0','2019-12-28');

/*Table structure for table `interview` */

DROP TABLE IF EXISTS `interview`;

CREATE TABLE `interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `vacencyid` int(11) NOT NULL,
  `interviewdate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `interview` */

insert  into `interview`(`id`,`companyid`,`vacencyid`,`interviewdate`) values 
(1,7,1,'2019-12-27'),
(2,7,2,'2019-12-27'),
(3,7,4,'2019-12-26'),
(4,17,5,'2019-12-27'),
(5,14,7,'2019-12-27');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `usertype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`usertype`) values 
(1,'admin','123456','admin'),
(7,'asddgfsgfsg@hgj.com','321','company'),
(10,'bfgmgh,','2222','company'),
(12,'pranav','3333','user'),
(14,'war@gmail.com','0000','company'),
(16,'ghg','4321','user'),
(17,'companyone@gmail.com','1212','company'),
(19,'ajithhhd@gmail.com','123456','user');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `contactnumber` bigint(20) DEFAULT NULL,
  `resume` varchar(25) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `post` varchar(25) DEFAULT NULL,
  `pin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`userid`,`name`,`gender`,`email`,`contactnumber`,`resume`,`place`,`post`,`pin`) values 
(1,12,'aaaa','m','faffafaff',9865654322,'aaa.jpg','place one','faffafaff',345546),
(2,16,'right ','Male','asd',589,'g','hiding ','asd',425);

/*Table structure for table `vacency` */

DROP TABLE IF EXISTS `vacency`;

CREATE TABLE `vacency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `post` varchar(300) DEFAULT NULL,
  `numberofvacency` int(11) DEFAULT NULL,
  `dates` varchar(67) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `vacency` */

insert  into `vacency`(`id`,`companyid`,`post`,`numberofvacency`,`dates`,`description`) values 
(3,7,'post war',23,'2019-12-27','zxcvbwar'),
(4,7,'post war',23,'2019-12-27','zxcvbwar'),
(6,17,'post war',23,'2019-12-27','zxcvbwar'),
(7,14,'post war one',23,'2019-12-27','zxcvbwar'),
(8,14,'developing',35,'2019-12-27','asdfg'),
(9,14,'sample',21,'2019-12-27','de');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
