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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `applyvacency` */

insert  into `applyvacency`(`id`,`vacencyid`,`userid`,`date`,`status`) values 
(1,1,23,'2020-03-14','accepted'),
(2,1,24,'2020-03-14','accepted'),
(3,3,23,'2020-03-14','accepted'),
(4,1,35,'2020-06-02','pending');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`id`,`lid`,`companyname`,`pin`,`place`,`post`,`website`,`email`,`contactnumber`,`password`) values 
(1,28,'softech',990099,'kozhikod','kozhikod','www.softech.com','softech12@gmail.com',8899112233,'12345678'),
(2,29,'infotech',679329,'nilambur','nilambur','www.infotech34.com','infotech11@gmail.com',9656846024,'222333444'),
(4,31,'AgTech',676545,'Kottayam','Changanassery','www.agtechinfo.com','agtech13@gmail.com',8129324997,'113355');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`id`,`userid`,`complaint`,`date`,`reply`) values 
(1,25,'bad','2020-06-02','thanks');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype_id` int(30) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`usertype_id`,`feedback`,`date`) values 
(1,29,'exelent','2020-03-14'),
(2,25,'good morning ','2020-06-02');

/*Table structure for table `interview` */

DROP TABLE IF EXISTS `interview`;

CREATE TABLE `interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `vacencyid` int(11) NOT NULL,
  `interviewdate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `interview` */

insert  into `interview`(`id`,`companyid`,`vacencyid`,`interviewdate`) values 
(1,28,2,'2020-07-15'),
(2,28,2,'2020-07-14'),
(3,28,2,'2021-10-15'),
(4,28,3,'2021-05-16');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `usertype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`usertype`) values 
(23,'abhi123@gmail.com','111222333','user'),
(24,'ijas22@gmail.com','444555666','user'),
(25,'pranav34@gmail.com','777888999','user'),
(26,'ajith','123456','admin'),
(28,'softech12@gmail.com','12345678','company'),
(29,'infotech11@gmail.com','222333444','company'),
(31,'agtech13@gmail.com','113355','company'),
(33,'ajith456@gmail.com','1234567','user'),
(35,'sanu123@gmail.com','2345678','user'),
(36,'sanu345@gmail.com','2345678','user');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `contactnumber` bigint(20) DEFAULT NULL,
  `resume` varchar(1000) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `post` varchar(25) DEFAULT NULL,
  `pin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`userid`,`name`,`gender`,`email`,`contactnumber`,`resume`,`place`,`post`,`pin`) values 
(4,23,'Abhijith','Male','abhi123@gmail.com',9656846024,'DSC0926.JPG','kizhattur','kizhattur p.o',679325),
(5,24,'IjasNasar','Male','ijas22@gmail.com',7034455703,'IMG-20200308-WA0047.jpg','vilayur','vilayur p.o',679309),
(6,25,'Pranav','Male','pranav34@gmail.com',8281741591,'IMG-20200308-WA0054.jpg','neelanchery','neelancheri p.o',676525),
(7,33,'Ajith','Male','ajith456@gmail.com',9539782035,'Screenshot_20191210-150718_Google_Pay.jpg','ggdhdbfb','gshdhdb',678601),
(8,35,'sanu','Male','sanu123@gmail.com',8606239654,'1590995769196fc9f950da4818f72f9ba01e2e32e460c4173b9a5cdf01346a16c3b81219d7a2bd8e3474b8369e3c617ec7b1a8a65708814e5262adcddf46e114d7be0027edba4.jpg','fgdhfnfhhs','sanu123@gmail.com',678605),
(9,36,'sanu','Male','sanu345@gmail.com',8606365236,'20200513_105517.jpg','gsgdbdnbbss','gxhhdhdnggshd',678605);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `vacency` */

insert  into `vacency`(`id`,`companyid`,`post`,`numberofvacency`,`dates`,`description`) values 
(1,29,'Android developer',3,'2020-03-14','2 year experience in Android developing'),
(2,28,'Business Analyst',1,'2020-03-14','MBA Graduates with 2 year Experience'),
(3,28,'java developer',4,'2020-03-14','2 year Experience');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
