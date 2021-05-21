/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.7.17-log : Database - expressproject1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expressproject1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `expressproject1`;

/*Table structure for table `branch` */

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `braid` int(11) NOT NULL AUTO_INCREMENT,
  `bracode` varchar(250) DEFAULT NULL,
  `braname` varchar(250) NOT NULL,
  `branameEnglish` varchar(250) NOT NULL,
  `braprovince` varchar(250) DEFAULT NULL,
  `bracity` varchar(250) DEFAULT NULL,
  `bracounty` varchar(250) DEFAULT NULL,
  `braaddress` varchar(250) DEFAULT NULL,
  `brasuoshu` varchar(250) DEFAULT NULL,
  `brarank` int(11) DEFAULT NULL,
  `braprincipal` varchar(250) DEFAULT NULL,
  `braphone` varchar(250) DEFAULT NULL,
  `brapicture` varchar(250) DEFAULT NULL,
  `braremark` varchar(250) DEFAULT NULL,
  `bratime` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`braid`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;

/*Data for the table `branch` */

insert  into `branch`(`braid`,`bracode`,`braname`,`branameEnglish`,`braprovince`,`bracity`,`bracounty`,`braaddress`,`brasuoshu`,`brarank`,`braprincipal`,`braphone`,`brapicture`,`braremark`,`bratime`) values (1,'2021001','广东省广州市天河区网点','H','广东省','广州市','天河区','天河广场','广东省广州市天河区网点',4,'钱浩洋','15565252676','','四级网点','2021-3-11 21:30:21'),(3,'2021004','广东省广州市番禺区中心','H','广东省','广州市','番禺区','人民广场','广东省广州市番禺区中心',2,'程文剑','15623669856',NULL,'总公司','2021-3-11 15:23:01'),(25,'2021058','广东省广州市白云区网点','H','广东省','广州市','白云区','商会大厦','广东省广州市白云区网点',3,'杜孟伟','15565252676',NULL,'三级网点','2021-3-11 20:20:36'),(6,'2021006','广东省广州市网点','H','广东省','广州市','白云','市区','广东省广州市网点',4,'王振青','15565252676',NULL,'二级网点','2021-3-11 15:23:01'),(64,'2021754','广东省广州市花都区网点','H','广东省','广州市','花都区','郊区的犄角疙瘩','广东省广州市花都区网点',3,'','15565230986',NULL,'三级网点','2021-3-11 16:31:27'),(2,'2021002','广东省广州市分拣中心','H','广东省','广州市','花都区','学府路1号','广东省广州市分拣中心',5,'孙新悦','15565252675','','五级网点','2021-3-10 21:32:21'),(22,'2021000','总公司','Z','北京','北京','东城区','市区','admin',1,'bigboss','15623669856',NULL,'总公司','2021-3-11 19:00:29'),(23,'2021055','上海市上海市分拣中心','S','上海','上海','徐汇区','郊区','总公司',2,'孙鑫宇','15568978326',NULL,'二级网点','2021-3-11 20:20:36'),(24,'2021056','上海市上海市徐汇区网点','S','上海','上海','徐汇区','徐汇大厦','上海市上海市分拣中心',3,'孙成成','15836079616',NULL,'三级网点','2021-3-11 20:20:36'),(71,'2021876','北京市东城区网点','B','北京市','北京市','东城区','12号','北京市分拣中心',3,'小东','15565238038',NULL,'三级网点','2021-3-11 16:46:47'),(69,'2021625','北京市分拣中心','B','北京市','北京市','朝阳区','1314号','总公司',2,'小亮','15565238038',NULL,'二级网点','2021-3-11 16:32:46'),(70,'2021897','北京朝阳区网点','B','北京市','北京市','朝阳区','11号','北京市分拣中心',3,'小朝','15565238038',NULL,'三级网点','2021-3-11 16:46:04'),(65,'2021747','广东省湛江市网点','H','广东省','湛江市','步行街','郊区','广东省湛江市网点',3,'王麻子','15565239856',NULL,'三级网点','2021-3-11 16:46:56'),(77,'2021157','广东省广州市海珠区','G','北京市','北京市','东城区','郊区','广东省广州市网点',5,'李三炸','17754268774',NULL,'三级网点','2021-05-07 12:13:59'),(81,'2021334','上海市黄浦区网点','S','上海市','上海市','黄浦区','郊区','上海市上海市徐汇区网点',4,'张啊啊','13824545411',NULL,'三级网点','2021-05-08 19:31:33'),(85,'2021584','上海市长宁区','S','上海市','上海市','长宁区','郊区','上海市上海市徐汇区网点',4,'张一','13824834644',NULL,'三级网点','2021-05-08 21:54:06');

/*Table structure for table `branchexpend` */

DROP TABLE IF EXISTS `branchexpend`;

CREATE TABLE `branchexpend` (
  `braexid` int(11) NOT NULL AUTO_INCREMENT,
  `braexname` varchar(50) DEFAULT NULL,
  `braexludannumber` int(11) DEFAULT NULL,
  `braexrecnumber` int(11) DEFAULT NULL,
  `braexsendnumber` int(11) DEFAULT NULL,
  `bradaojiannumber` int(11) DEFAULT NULL,
  `braextakenumber` int(11) DEFAULT NULL,
  `brawentijiannumber` int(11) DEFAULT NULL,
  `braexqiannumber` int(11) DEFAULT NULL,
  `braexludan` double(11,2) DEFAULT NULL,
  `braexaddress` double(11,2) DEFAULT NULL,
  `braexaddresser` double(11,2) DEFAULT NULL,
  `bradaojian` double(11,2) DEFAULT NULL,
  `braexdelivery` double(11,2) DEFAULT NULL,
  `brawentijian` double(11,2) DEFAULT NULL,
  `braexsign` double(11,2) DEFAULT NULL,
  `zongfeiyong` double(11,2) DEFAULT NULL,
  `braexdate` date DEFAULT NULL,
  `complaintsnumber` int(11) DEFAULT NULL,
  `complaintsmoney` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`braexid`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4;

/*Data for the table `branchexpend` */

insert  into `branchexpend`(`braexid`,`braexname`,`braexludannumber`,`braexrecnumber`,`braexsendnumber`,`bradaojiannumber`,`braextakenumber`,`brawentijiannumber`,`braexqiannumber`,`braexludan`,`braexaddress`,`braexaddresser`,`bradaojian`,`braexdelivery`,`brawentijian`,`braexsign`,`zongfeiyong`,`braexdate`,`complaintsnumber`,`complaintsmoney`) values (1,'广东省广州市天河区网点',4,1,3,2,3,1,2,2.60,1.00,1.60,1.40,1.40,50.00,2.80,0.00,'2021-03-11',1,100.00),(2,'广东省广州市番禺区中心',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-03-11',1,50.00),(3,'红旗区技师网点',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(4,'广东省湛江市网点',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(79,'广东省广州市白云区网点',1,0,1,0,0,0,0,1.40,0.00,0.30,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(80,'广东省广州市网点',0,1,1,0,0,0,0,0.00,0.30,0.30,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(81,'广东省广州市分拣中心',0,0,0,1,1,0,1,0.00,0.00,0.00,0.60,0.60,0.00,1.30,0.00,'2021-03-11',0,0.00),(33,'总公司',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(23,'上海市上海市分拣中心',0,1,1,0,0,0,0,0.00,0.20,0.20,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(25,'广东省广州市花都区网点',1,2,3,0,0,0,0,1.30,0.40,0.60,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(24,'上海市上海市徐汇区网点',0,0,0,1,1,2,1,0.00,0.00,0.00,0.50,0.50,60.00,1.20,0.00,'2021-03-11',1,60.00),(83,'北京市分拣中心',0,1,1,0,0,0,0,0.00,0.20,0.20,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(84,'北京朝阳区网点',1,0,1,0,0,0,0,1.40,0.00,0.30,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(85,'北京市东城区网点',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(86,'天津市天津市和平区13',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(87,'河南省新乡市红旗区网点',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-03-11',0,0.00),(91,'广东省广州市海珠区',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-05-00',0,0.00),(98,'上海市黄浦区网点',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-05-00',0,0.00),(102,'上海市长宁区',0,0,0,0,0,0,0,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'2021-05-00',0,0.00);

/*Table structure for table `branchsq` */

DROP TABLE IF EXISTS `branchsq`;

CREATE TABLE `branchsq` (
  `braid` int(11) NOT NULL AUTO_INCREMENT,
  `bracode` varchar(250) DEFAULT NULL,
  `braname` varchar(250) NOT NULL,
  `branameEnglish` varchar(250) NOT NULL,
  `braprovince` varchar(250) DEFAULT NULL,
  `bracity` varchar(250) DEFAULT NULL,
  `bracounty` varchar(250) DEFAULT NULL,
  `braaddress` varchar(250) DEFAULT NULL,
  `brasuoshu` varchar(250) DEFAULT NULL,
  `brarank` int(11) DEFAULT NULL,
  `braprincipal` varchar(250) DEFAULT NULL,
  `braphone` varchar(250) DEFAULT NULL,
  `brapicture` varchar(250) DEFAULT NULL,
  `braremark` varchar(250) DEFAULT NULL,
  `bratime` varchar(250) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`braid`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

/*Data for the table `branchsq` */

insert  into `branchsq`(`braid`,`bracode`,`braname`,`branameEnglish`,`braprovince`,`bracity`,`bracounty`,`braaddress`,`brasuoshu`,`brarank`,`braprincipal`,`braphone`,`brapicture`,`braremark`,`bratime`,`state`,`reason`) values (48,'2021754','广东省广州市天河区网点','H','广东省','广州市','天河区','郊区犄角疙瘩','广东省广州市天河区网点',2,NULL,NULL,NULL,'三级网点','2021-3-11 16:31:27',2,NULL),(49,'2021325','广东省广州市番禺区中心','H','广东省','广州市','番禺区','郊区','广东省广州市番禺区中心',3,NULL,NULL,NULL,'四级网点','2021-3-11 16:49:58',2,NULL),(50,'2021261','北京市东城区网点','H','北京市','北京市','东城区','郊区','北京市东城区网点',2,NULL,NULL,NULL,'四级网点','2021-3-11 09:24:53',2,'sdcas'),(51,'2021897','北京朝阳区网点','B','北京市','北京市','朝阳区','11号','北京市分拣中心',2,NULL,NULL,NULL,'三级网点','2021-3-11 16:46:04',2,NULL),(52,'2021876','北京市东城区网点','B','北京市','北京市','东城区','12号','北京市分拣中心',2,NULL,NULL,NULL,'三级网点','2021-3-11 16:46:47',2,NULL),(64,'2021584','上海市长宁区','S','上海市','上海市','长宁区','郊区','上海市上海市徐汇区网点',3,NULL,NULL,NULL,'三级网点','2021-05-08 21:54:06',2,NULL),(60,'2021334','上海市黄浦区网点','S','上海市','上海市','黄浦区','郊区','上海市上海市徐汇区网点',3,NULL,NULL,NULL,'三级网点','2021-05-08 19:31:33',2,NULL);

/*Table structure for table `cardid` */

DROP TABLE IF EXISTS `cardid`;

CREATE TABLE `cardid` (
  `cardid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `id` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`cardid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cardid` */

insert  into `cardid`(`cardid`,`name`,`id`,`phone`) values (1,'钱浩洋','410482199901021751','15565252675'),(2,'孙新悦','410724199905169588','15836079616');

/*Table structure for table `complaintestaff` */

DROP TABLE IF EXISTS `complaintestaff`;

CREATE TABLE `complaintestaff` (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `combranch` varchar(50) DEFAULT NULL,
  `comtuser` varchar(50) DEFAULT NULL,
  `comexpnum` varchar(50) DEFAULT NULL,
  `comfinemoney` varchar(200) DEFAULT NULL,
  `comcontent` varchar(50) DEFAULT NULL,
  `comdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`comid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `complaintestaff` */

insert  into `complaintestaff`(`comid`,`combranch`,`comtuser`,`comexpnum`,`comfinemoney`,`comcontent`,`comdate`) values (4,'上海市上海市徐汇区网点','孙成成','YF00002','200','态度非常恶劣','2021-03-11 08:47:15'),(5,'广东省广州市天河区网点','钱浩洋','YF00003','23','态度恶劣','2021-03-11 10:27:07'),(8,'广东省广州市分拣中心','孙新悦','YF32467','100','态度恶劣','2021-03-11 17:17:28');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `custnickname` varchar(50) DEFAULT NULL,
  `custphone` varchar(50) DEFAULT NULL,
  `custname` varchar(50) DEFAULT NULL,
  `custidcord` varchar(50) DEFAULT NULL,
  `custemail` varchar(50) DEFAULT NULL,
  `brandid` int(11) DEFAULT NULL,
  `custrank` int(11) DEFAULT NULL,
  PRIMARY KEY (`custid`),
  KEY `fk_brandid` (`brandid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `customer` */

/*Table structure for table `diaogangrecord` */

DROP TABLE IF EXISTS `diaogangrecord`;

CREATE TABLE `diaogangrecord` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `iphone` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `agobranch` varchar(255) DEFAULT NULL,
  `shijian` varchar(255) DEFAULT NULL,
  `nowbranch` varchar(255) DEFAULT NULL,
  `braname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `diaogangrecord` */

insert  into `diaogangrecord`(`id`,`name`,`iphone`,`address`,`agobranch`,`shijian`,`nowbranch`,`braname`) values (3,'张三','15565230986','开发区199号','广东省广州市番禺区中心','2021-04-12 02:01:32','广东省广州市白云区网点',NULL),(4,'张啊啊','13824545411','郊区','上海市黄浦区网点','2021-05-08 19:33:17','广东省广州市海珠区',NULL),(5,'张一','13824834644','郊区','上海市长宁区','2021-05-08 21:59:59','上海市黄浦区网点',NULL);

/*Table structure for table `express` */

DROP TABLE IF EXISTS `express`;

CREATE TABLE `express` (
  `expid` int(11) NOT NULL AUTO_INCREMENT,
  `expnum` varchar(50) DEFAULT NULL,
  `custrank` varchar(50) DEFAULT NULL,
  `braid` int(11) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendphone` varchar(50) DEFAULT NULL,
  `sendidcard` varchar(50) DEFAULT NULL,
  `sendprovince` varchar(50) DEFAULT NULL,
  `sendcity` varchar(50) DEFAULT NULL,
  `sendcounty` varchar(50) DEFAULT NULL,
  `senddetailaddress` varchar(50) DEFAULT NULL,
  `recipient` varchar(50) DEFAULT NULL,
  `recphone` varchar(50) DEFAULT NULL,
  `recprovince` varchar(50) DEFAULT NULL,
  `reccity` varchar(50) DEFAULT NULL,
  `reccounty` varchar(50) DEFAULT NULL,
  `recdetailaddress` varchar(50) DEFAULT NULL,
  `itemtype` varchar(50) DEFAULT NULL,
  `itemweight` int(11) DEFAULT NULL,
  `offerprice` int(11) DEFAULT NULL,
  `offerprices` int(11) DEFAULT NULL,
  `paytype` varchar(50) DEFAULT NULL,
  `exptype` varchar(50) DEFAULT NULL,
  `expremark` varchar(50) DEFAULT NULL,
  `expprice` int(11) DEFAULT NULL,
  `gogalprice` int(11) DEFAULT NULL,
  `exptime` varchar(50) DEFAULT NULL,
  `Expstate` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `quhuoma` varchar(100) DEFAULT NULL,
  `protype` varchar(50) DEFAULT NULL,
  `managetime` varchar(50) DEFAULT NULL,
  `wentibranch` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`expid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

/*Data for the table `express` */

insert  into `express`(`expid`,`expnum`,`custrank`,`braid`,`sender`,`sendphone`,`sendidcard`,`sendprovince`,`sendcity`,`sendcounty`,`senddetailaddress`,`recipient`,`recphone`,`recprovince`,`reccity`,`reccounty`,`recdetailaddress`,`itemtype`,`itemweight`,`offerprice`,`offerprices`,`paytype`,`exptype`,`expremark`,`expprice`,`gogalprice`,`exptime`,`Expstate`,`id`,`quhuoma`,`protype`,`managetime`,`wentibranch`) values (1,'YF00001','普通客户',2,'贺云肖','13600000000','440882199901021752','广东省','广州市','花都区','广东省广州市花都区新华曙光大道26号','孙一悦','15836079616','北京','北京','东城区','上海市上海市徐汇区万象城220','日用品',2,200,20,'现付','普通件','你快点给我送过去',10,10,'2021-03-9 11:32:18',3,3,'43454',NULL,NULL,NULL),(2,'YF00002','普通客户',2,'孙鑫宇','13600000000','440882199901021751','广东省','广州市','白云区','白云区汉塘西路113号','孙二悦','15565252675','上海市','上海市','徐汇区','上海市上海市徐汇区万象城2201','日用品',2,200,20,'现付','普通件','你快点给我送过去',10,30,'2021-03-9 11:18:18',11,3,'12345','快递损伤','2021-03-11 21:44:39','上海市上海市徐汇区网点'),(3,'YF00003','普通客户',2,'孙璐璐','13600000000','440882199901021753','广东省','广州市','番禺区','番禺区禺山西路363号','孙三悦','15836079616','北京市','北京市','东城区','上海市上海市徐汇区万象城22011','日用品',2,200,20,'现付','普通件','你快点给我送过去',10,10,'2021-03-9 19:32:18',2,3,'55555','',NULL,NULL),(19,'YF38953','普通客户',2,'孙新悦','15836079616','440884199905169588','广东省','广州市','天河区','广州市越秀区麓景西路41号','孙三悦','15565252675','上海市','上海市','黄浦区','上海市上海市黄浦区皇后大道','数码产品',1,100,1,'到付','普通件','你快点给我送过去',10,11,'2021-03-9 15:04:56',11,3,'66666','快递丢失','2021-03-11 20:37:22','广东省广州市花都区'),(23,'YF84195','普通客户',1,'钱浩洋','15565252675','440882199901021751','广东省','广州市','花都区','\r\n广州市花都区大华村永昌路3号','杜孟伟','15938683132','上海市','上海市','徐汇区','上海市上海市徐汇区陆家嘴','数码产品',1,600,6,'到付','加急件','你快点给我送过去',15,21,'2021-03-9 13:47:26',3,2,'87283',NULL,NULL,NULL);

/*Table structure for table `expressdetails` */

DROP TABLE IF EXISTS `expressdetails`;

CREATE TABLE `expressdetails` (
  `expdid` int(11) NOT NULL AUTO_INCREMENT,
  `expnum` varchar(50) DEFAULT NULL,
  `expoper` varchar(50) DEFAULT NULL,
  `expoperipone` varchar(50) DEFAULT NULL,
  `expdregion` varchar(200) DEFAULT NULL,
  `transtype` varchar(50) DEFAULT NULL,
  `vehnum` varchar(150) DEFAULT NULL,
  `transtate` int(11) DEFAULT NULL,
  `nextbranch` varchar(200) DEFAULT NULL,
  `expdregiontime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`expdid`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4;

/*Data for the table `expressdetails` */

insert  into `expressdetails`(`expdid`,`expnum`,`expoper`,`expoperipone`,`expdregion`,`transtype`,`vehnum`,`transtate`,`nextbranch`,`expdregiontime`) values (130,'YF00002','孙新悦','15836079616','华南理工大学广州学院  已揽件',NULL,NULL,0,NULL,'21-3-11 10:52:32'),(132,'YF38953','孙新悦','15836079616','华南理工大学广州学院   已揽件',NULL,NULL,0,NULL,'21-3-11 11:10:41'),(133,'YF00003','孙新悦','15836079616','华南理工大学广州学院   已揽件',NULL,NULL,0,NULL,'21-3-11 11:15:18'),(139,'YF00002','孙新悦','15836079616','离开:  华南理工大学广州学院   下一站:  广东省花都分拣中心','汽车','粤H00001',0,'华南理工大学广州学院   ','21-3-11 11:28:00'),(140,'YF00003','孙新悦','15836079616','离开:  华南理工大学广州学院   下一站:  广东省花都分拣中心','汽车','粤H00001',0,'华南理工大学广州学院   ','21-3-11 11:28:29'),(141,'YF00002','钱浩洋','15565252675','已到达:  广东省花都分拣中心(经转)',NULL,NULL,0,NULL,'21-3-11 11:30:41'),(142,'YF00003','钱浩洋','15565252675','已到达:  广东省花都分拣中心(经转)',NULL,NULL,0,NULL,'21-3-11 11:31:39'),(144,'YF00002','钱浩洋','15565252675','离开:  广东省花都分拣中心  下一站:  广东省花都分拣中心','汽车','粤H12345',0,'广东省花都分拣中心','21-3-11 11:32:14'),(145,'YF00003','钱浩洋','15565252675','离开:  广东省花都分拣中心  下一站:  广东省花都分拣中心','汽车','粤H12345',0,'广东省花都分拣中心','21-3-11 11:32:30'),(146,'YF00002','程文剑','15565238038','已到达:  广东省花都分拣中心(经转)',NULL,NULL,0,NULL,'21-3-11 11:33:23'),(147,'YF00003','程文剑','15565238038','已到达:  广东省花都分拣中心(经转)',NULL,NULL,0,NULL,'21-3-11 11:33:32'),(148,'YF00002','程文剑','15565238038','离开:  广东省花都分拣中心  下一站:  上海市上海市分拣中心','汽车','粤A00001',0,'上海市上海市分拣中心','21-3-11 11:33:56'),(150,'YF00002','孙鑫宇','15969857485','已到达:  上海市上海市分拣中心(经转)',NULL,NULL,0,NULL,'21-3-11 11:35:07'),(152,'YF00002','孙鑫宇','15969857485','离开:  上海市上海市分拣中心  下一站:  上海市上海市徐汇区网点','汽车','沪A00001',0,'上海市上海市徐汇区网点','21-3-11 11:35:37'),(198,'YF84195','孙鑫宇','15969857485','已到达:  上海市上海市分拣中心(经转)',NULL,NULL,0,NULL,'21-3-11 14:20:06'),(187,'YF84195','钱浩洋','15565252675','上海市上海市分拣中心  已揽件  揽件人:钱浩洋  电话:15565252675',NULL,NULL,0,NULL,'21-3-11 13:52:30'),(166,'YF00002','孙成成','15896589674','已到达:  上海市上海市徐汇区网点',NULL,NULL,0,NULL,'21-3-11 10:40:56'),(176,'YF00002','孙成成','15896589674','派送中: 上海市上海市徐汇区网点的 孙成成,正在为您派件。有问题请联系:15896589674',NULL,NULL,0,NULL,'21-3-11 13:04:05'),(214,'YF00001','孙新悦','15836079616','华南理工大学广州学院  已揽件  揽件人:孙新悦  电话:15836079616',NULL,NULL,0,NULL,'21-3-11 19:19:10'),(197,'YF84195','程文剑','15565238038','离开:  华南理工大学广州学院下一站:  广东省花都分拣中心','汽车','粤A00001',0,'上海市上海市分拣中心','21-3-12 14:17:34'),(199,'YF84195','孙鑫宇','15969857485','离开:  广东省花都分拣中心下一站:    华南理工大学广州学院','汽车','沪A00002',0,'上海市上海市徐汇区网点','21-3-12 14:20:55'),(196,'YF84195','程文剑','15565238038','已到达:   华南理工大学广州学院',NULL,NULL,0,NULL,'21-3-12 14:15:05'),(194,'YF84195','钱浩洋','15565252675','离开:  :  广东省花都分拣中心  下一站: 上海市上海市徐汇区网点','飞机','波音747',0,'上海市上海市徐汇区网点','21-3-12 14:11:54'),(206,'YF84195','孙成成','15896589674','已签收，投递员孙成成，电话:15896589674',NULL,NULL,0,NULL,'21-3-12 14:46:20'),(201,'YF84195','孙成成','15896589674','已到达:  上海市上海市徐汇区网点',NULL,NULL,0,NULL,'21-3-12 14:22:43'),(205,'YF84195','孙成成','15896589674','派送中: 上海市上海市徐汇区网点的 孙成成,正在为您派件。有问题请联系:15896589674',NULL,NULL,0,NULL,'21-3-12 14:45:04'),(208,'YF38953','孙新悦','15836079616','华南理工大学广州学院  已揽件  揽件人:孙新悦  电话:15836079616',NULL,NULL,0,NULL,'21-3-12 18:39:52'),(221,'YF00001','孙新悦','15836079616','派送中:华南理工大学广州学院 孙新悦,正在为您派件。有问题请联系:15836079616',NULL,NULL,0,NULL,'21-3-12 19:52:40'),(220,'YF00001','孙新悦','15836079616','已到达:  华南理工大学广州学院',NULL,NULL,0,NULL,'21-3-12 19:52:31'),(222,'YF00001','孙新悦','15836079616','已签收，投递员孙新悦，电话:15836079616',NULL,NULL,0,NULL,'21-3-12 19:54:22');

/*Table structure for table `expresstype` */

DROP TABLE IF EXISTS `expresstype`;

CREATE TABLE `expresstype` (
  `exptypeid` int(11) NOT NULL AUTO_INCREMENT,
  `exptype` varchar(50) DEFAULT NULL,
  `exptime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`exptypeid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `expresstype` */

insert  into `expresstype`(`exptypeid`,`exptype`,`exptime`) values (1,'普通件','2021-3-11 12:00:01'),(2,'加急件','2021-3-11 12:11:01');

/*Table structure for table `itemtype` */

DROP TABLE IF EXISTS `itemtype`;

CREATE TABLE `itemtype` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(50) DEFAULT NULL,
  `itemtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `itemtype` */

insert  into `itemtype`(`itemid`,`itemtype`,`itemtime`) values (1,'日用品','2021-3-11'),(2,'食品','2021-3-11'),(3,'文件','2021-3-11'),(4,'衣服','2021-3-11'),(5,'数码产品','2021-3-11'),(6,'其他','2021-3-11');

/*Table structure for table `offer` */

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `offerid` int(11) NOT NULL AUTO_INCREMENT,
  `offersend` varchar(50) DEFAULT NULL,
  `offergoal` varchar(50) DEFAULT NULL,
  `offerprice` double DEFAULT NULL,
  `offerprice2` double DEFAULT NULL,
  `offertime` varchar(50) DEFAULT NULL,
  `custrank` int(11) DEFAULT NULL,
  `offerday` int(11) DEFAULT NULL,
  `transid` int(11) DEFAULT NULL,
  PRIMARY KEY (`offerid`),
  KEY `fk_transid` (`transid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

/*Data for the table `offer` */

insert  into `offer`(`offerid`,`offersend`,`offergoal`,`offerprice`,`offerprice2`,`offertime`,`custrank`,`offerday`,`transid`) values (1,'广东省','上海市',11,5,'2021-3-10 14:21:57',1,4,2),(2,'广东省','广东省',12,6,'2021-3-10 15:29:17',1,4,2),(8,'广东省','广东省',10,2,'2021-3-11 10:29:17',1,2,2),(19,'广东省','辽宁省',10,1,'2021-3-12 16:40:25',1,3,2),(14,'广东省','广东省',11,2,'2021-3-11 18:55:29',1,3,2),(13,'广东省','上海市',10,1,'2021-3-11 18:46:09',2,3,1),(20,'北京市','广东省',10,1,'2021-3-13 16:42:12',1,3,2),(21,'北京市','北京市',10,1,'2021-3-13 16:53:27',1,2,2);

/*Table structure for table `offertype` */

DROP TABLE IF EXISTS `offertype`;

CREATE TABLE `offertype` (
  `offtyid` int(11) NOT NULL AUTO_INCREMENT,
  `offertype` varchar(50) DEFAULT NULL,
  `offerprice` int(11) DEFAULT NULL,
  `offerremark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`offtyid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `offertype` */

insert  into `offertype`(`offtyid`,`offertype`,`offerprice`,`offerremark`) values (1,'中转费',5,'中转费'),(2,'派件费',2,'派件费'),(3,'收件费',4,'收件费'),(4,'扫描费',1,'扫描费');

/*Table structure for table `paymethod` */

DROP TABLE IF EXISTS `paymethod`;

CREATE TABLE `paymethod` (
  `payid` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(50) DEFAULT NULL,
  `paynode` varchar(50) DEFAULT NULL,
  `paytime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `paymethod` */

insert  into `paymethod`(`payid`,`paytype`,`paynode`,`paytime`) values (1,'微信支付','小程序进行支付','2021-3-11 11:02:02');

/*Table structure for table `problemtype` */

DROP TABLE IF EXISTS `problemtype`;

CREATE TABLE `problemtype` (
  `proid` int(11) NOT NULL AUTO_INCREMENT,
  `protype` varchar(50) DEFAULT NULL,
  `pronode` varchar(50) DEFAULT NULL,
  `protime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`proid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `problemtype` */

insert  into `problemtype`(`proid`,`protype`,`pronode`,`protime`) values (1,'快递丢失','运输过程中丢失','2021-3-11'),(2,'快递损伤','运输过程中损伤','2021-3-11');

/*Table structure for table `pushmoney` */

DROP TABLE IF EXISTS `pushmoney`;

CREATE TABLE `pushmoney` (
  `pushid` int(11) NOT NULL AUTO_INCREMENT,
  `brarank` int(11) DEFAULT NULL,
  `enroll` double(11,1) DEFAULT NULL,
  `addressee` double(11,1) DEFAULT NULL,
  `addresser` double(11,1) DEFAULT NULL,
  `dao` double(11,1) DEFAULT NULL,
  `pai` double(11,1) DEFAULT NULL,
  `qian` double(11,1) DEFAULT NULL,
  PRIMARY KEY (`pushid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pushmoney` */

insert  into `pushmoney`(`pushid`,`brarank`,`enroll`,`addressee`,`addresser`,`dao`,`pai`,`qian`) values (2,2,1.3,0.2,0.2,0.5,0.5,1.0),(3,3,1.4,0.3,0.3,0.5,0.5,1.2),(4,4,1.5,0.4,0.3,0.6,0.6,1.3),(5,5,1.6,0.5,0.4,0.7,0.7,1.4);

/*Table structure for table `staffdetails` */

DROP TABLE IF EXISTS `staffdetails`;

CREATE TABLE `staffdetails` (
  `staid` int(11) NOT NULL AUTO_INCREMENT,
  `staphone` varchar(50) DEFAULT NULL,
  `staaddress` varchar(50) DEFAULT NULL,
  `staidcard` varchar(50) DEFAULT NULL,
  `stapic1` varchar(150) DEFAULT NULL,
  `stapic2` varchar(150) DEFAULT NULL,
  `braid` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`staid`),
  KEY `fk_brainch` (`braid`),
  KEY `fk_userid` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;

/*Data for the table `staffdetails` */

insert  into `staffdetails`(`staid`,`staphone`,`staaddress`,`staidcard`,`stapic1`,`stapic2`,`braid`,`id`) values (1,'15836079616','广东省广州市白云区天河广场7号','410724199905169588','','',25,3),(2,'15565252675','北京市朝阳区街区','410482199901021751','','',70,2),(3,'13244345643','白云区楼道198号','421777687856546456',NULL,NULL,6,4),(5,'15565238038','广东省广州市番禺区人民广场445号','410421199904242012',NULL,NULL,3,5),(56,'15565239865','河南省安阳市林州','410421199904242012',NULL,NULL,66,90),(16,'15969857485','上海市上海市中心','456987415296359855',NULL,NULL,23,6),(53,'15565230986','开发区199号','410421199904242012',NULL,NULL,25,87),(17,'18276545667','北京市','410821199807776254',NULL,NULL,22,36),(18,'15896589674','上海市上海市徐汇区','410789654789652636',NULL,NULL,24,7),(19,'13298787843','北京','432983778493847893',NULL,NULL,22,37),(20,'13298787843','广东省广州市花都区','421777687856546456',NULL,NULL,25,1),(25,'12372678767','三单元六号','324545166726534521',NULL,NULL,6,43),(54,'15565238038','郑州市金水区','410421199904242011',NULL,NULL,69,88),(55,'15565239856','朝阳区079号','410421199904242012',NULL,NULL,65,89),(58,'15565238039','dasc','410421199904242012',NULL,NULL,66,92),(59,'13222343234','北京','321234322123432123',NULL,NULL,3,44),(60,'15565238038','北京市朝阳区10号','410421199904242012',NULL,NULL,69,93),(61,'15565238038','北京市朝阳区11号','410421199904242012',NULL,NULL,65,94),(62,'15565238038','北京市东城区11号','410421199904242012',NULL,NULL,71,95),(64,'13111334455','海角七号','440234567894561231',NULL,NULL,70,97),(65,'17754268774','海珠七号','440851199905063251',NULL,NULL,77,98),(66,'13345721254','上海市黄浦区铜门路424号','440822199909241245',NULL,NULL,78,99),(67,'13722984574','天梯大厦广场101号','440834199901241212',NULL,NULL,24,100),(68,'13824545411','郊区','440882199912314444',NULL,NULL,77,101),(69,'13824834644','郊区','440882199912121121',NULL,NULL,81,102);

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1705032705 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`icon`,`name`,`state`,`url`,`p_id`) values (1,'menu-plugin','系统菜单',1,NULL,-1),(2,'&#xe857;','系统管理',1,NULL,1),(3,'&#xe705;','单证',1,NULL,1),(4,'&#xe600;','客服',1,NULL,1),(5,'&#xe65e;','财务',1,NULL,1),(6,'&#xe62e;','报价',1,NULL,1),(7,'&#xe6b2;','资料',1,NULL,1),(8,'&#xe67c;','其他',1,NULL,1),(9,'icon-icon10','角色管理',2,'admin/role/torolemanage',2),(10,'&#xe612;','用户管理',2,'admin/user/tousermanage',2),(13,'icon-ziliao','修改密码',2,'admin/user/toUpdatePassword',2),(41,'icon-tuichu','安全退出',2,'user/logout',2),(14,'&#xe756;','运单维护',2,'admin/express/expressselect',3),(37,'&#xe60e;','员工调岗',2,'relieveEdit/relieveUrl',7),(16,'icon-test','签收单查询',2,'expressSel/expressSelecturl',3),(17,'icon-github','快件跟踪查询',2,'admin/expressdetails/expressselect',3),(42,'&#xe635;','投诉员工',2,'complaintsEdit/toComplaintsUrl',4),(19,'icon-oschina','问题件查询与处理',2,'questionEdit/questionurl',4),(20,'icon-xiugai','问题件处理记录',2,'questionEdit/manageUrl',4),(21,'icon-liulanqi','快件跟踪查询',2,'expressdetailsEdit/selExpressdetailsUrl',4),(23,'&#xe735;','公司账单查询',2,'gongsi/gongsimoney',5),(24,'&#xe6af;','网点账单查询',2,'gongsi/wangdianmoney',5),(25,'&#xe60f;','订单统计查询',2,'gongsi/wangdiandingdan',5),(26,'&#xe629;','运单报价维护',2,'admin/offer/offerselect',6),(28,'&#xe609;','提成维护',2,'admin/pushmoney/pushmoneyselect',6),(29,'&#xe61c;','网点维护',2,'admin/network/toselect',7),(30,'&#xe634;','员工维护',2,'userEdit/userSelecturl',7),(31,'&#xe636;','车辆维护',2,'carEdit/carSelecturl',7),(32,'&#xe635;','物品类型维护',2,'itemEdit/itemSelecturl',7),(33,'&#xe638;','快递类型维护',2,'expEdit/expSelecturl',7),(43,'&#xe857;','投诉记录',2,'complaintsEdit/toSelectUrl',4),(35,'&#xe60e;','运输方式',2,'transEdit/transSelecturl',8),(36,'&#xe64d;','问题件类型',2,'problemEdit/problemSelecturl',8),(38,'&#xe60e;','网点审核',2,'admin/network/branchSQurl',7),(11,'&#xe631;','菜单管理',2,'admin/menu/tomunemanage',2),(39,'&#xe60e;','审核结果',2,'admin/network/branchJGurl',7),(40,'&#xe635;','网点负责人录入',2,'admin/principal/principalselect',7);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bz` varchar(1000) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`bz`,`name`,`remarks`) values (1,'超级管理员','超级管理员',NULL),(2,'网点管理员','网点管理员',NULL),(26,'资料管理员','资料管理员',NULL),(24,'客服管理员','客服管理员',NULL),(37,'普通员工','普通员工',NULL);

/*Table structure for table `t_role_menu` */

DROP TABLE IF EXISTS `t_role_menu`;

CREATE TABLE `t_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1314 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_menu` */

insert  into `t_role_menu`(`id`,`menu_id`,`role_id`) values (1311,23,37),(736,34,1),(1272,35,1),(1271,8,1),(1270,40,1),(1269,39,1),(1268,38,1),(1267,33,1),(1266,32,1),(1265,31,1),(1264,30,1),(346,16,22),(392,27,1),(1263,29,1),(1262,37,1),(1261,7,1),(1260,28,1),(1259,26,1),(1258,6,1),(385,22,1),(1257,25,1),(1256,24,1),(1255,23,1),(1254,5,1),(1253,43,1),(1252,21,1),(1251,20,1),(1310,5,37),(1250,19,1),(1249,42,1),(1248,4,1),(1247,17,1),(1246,16,1),(483,22,24),(979,20,24),(978,19,24),(977,42,24),(976,4,24),(975,17,24),(974,16,24),(973,14,24),(972,3,24),(1227,6,26),(853,41,24),(317,15,2),(970,13,24),(1235,36,26),(1234,35,26),(1233,8,26),(1232,33,26),(1231,32,26),(1230,7,26),(980,21,24),(1245,14,1),(1309,39,2),(1244,3,1),(1308,31,2),(1229,28,26),(1243,11,1),(1242,41,1),(1241,13,1),(1176,12,1),(1307,30,2),(1306,29,2),(1240,10,1),(1305,37,2),(1304,7,2),(1303,25,2),(1302,24,2),(1301,5,2),(1300,43,2),(1273,36,1),(1299,4,2),(1298,16,2),(1239,9,1),(1238,2,1),(1297,14,2),(1296,3,2),(1228,26,26),(1295,41,2),(1294,13,2),(1293,2,2),(969,2,24),(1313,25,37),(1312,24,37);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bz` varchar(1000) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `true_name` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`bz`,`password`,`true_name`,`user_name`,`remarks`) values (2,'管理员',NULL,'钱浩洋',NULL,'2'),(3,'管理员',NULL,'孙新悦',NULL,'3'),(4,'管理员',NULL,'王振青',NULL,'1'),(5,'管理员',NULL,'程文剑',NULL,'1'),(36,'最高权限','123456','最高权限','admin','1'),(6,'管理员','123456','孙鑫宇','sunxinyu','1'),(7,'管理员','123456','孙成成','sunchengcheng','1'),(37,'超级管理员','123456','bigboss','bigboss','1'),(87,'管理员',NULL,'张三',NULL,NULL),(44,'全国指定客服','123456','李光耀','liguangyao',NULL),(100,NULL,'241212','张流星','zhangliuxing',NULL),(99,NULL,'241245','刘宇名','liuyuming',NULL),(98,'普通员工','063251','李三炸','lisanzha',NULL),(90,'客服管理员','242012','张麻子','zhangmazi',NULL),(89,NULL,NULL,'王麻子',NULL,NULL),(101,NULL,'314444','张啊啊','zhangaa',NULL),(102,NULL,'121121','张一','zhangyi',NULL);

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`role_id`,`user_id`) values (62,2,6),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(51,1,36),(89,2,87),(60,2,38),(76,2,51),(65,24,44),(75,2,49),(78,2,89),(74,1,37),(70,2,46),(95,24,90),(92,2,7);

/*Table structure for table `transtype` */

DROP TABLE IF EXISTS `transtype`;

CREATE TABLE `transtype` (
  `transid` int(11) NOT NULL AUTO_INCREMENT,
  `transtype` varchar(50) DEFAULT NULL,
  `transtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `transtype` */

insert  into `transtype`(`transid`,`transtype`,`transtime`) values (1,'汽车','2021-3-11'),(2,'飞机','2021-3-11');

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `vehid` int(11) NOT NULL AUTO_INCREMENT,
  `vehids` varchar(200) DEFAULT NULL,
  `vehnum` varchar(200) DEFAULT NULL,
  `vehmodal` varchar(50) DEFAULT NULL,
  `transid` int(11) DEFAULT NULL,
  `vehtunnage` int(11) DEFAULT NULL,
  `vehilo` int(11) DEFAULT NULL,
  `vehdirver` varchar(50) DEFAULT NULL,
  `vehphone` varchar(50) DEFAULT NULL,
  `vehtime` varchar(50) DEFAULT NULL,
  `vehnode` varchar(50) DEFAULT NULL,
  `vehstate` int(11) DEFAULT NULL,
  `braid` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehid`),
  KEY `fk_trans` (`transid`),
  KEY `fk_branch` (`braid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

/*Data for the table `vehicle` */

insert  into `vehicle`(`vehid`,`vehids`,`vehnum`,`vehmodal`,`transid`,`vehtunnage`,`vehilo`,`vehdirver`,`vehphone`,`vehtime`,`vehnode`,`vehstate`,`braid`) values (1,'ac00007','粤A00001','大货',1,10,2,'李四四','13278763452','2021-3-11','大货司机',0,2),(3,'qc00003','粤A00003','小货',1,25,2,'小赵','13278763452','2021-3-11','小货司机',0,2),(6,'fj00001','波音747','货空',2,9,99,'小王','12332452356','2021-3-11','飞行员',0,1),(10,'fj00002','波音666','货空',2,30,30,'李寒空','18888888888','2021-3-11','巴蜀大侠',0,22),(11,'qc12345','粤A12345','小货',1,1,222,'精精','12222222222','2021-3-11','我是只猴',0,1),(15,'hh00001','沪A00001','大货',1,30,2,'宇宇','15896259636','2021-3-11','上海市分拣中心大货车',0,23),(12,'zz00001','粤A00001','大货',1,30,2,'成成','15896587496','2021-3-11','郑州市分拣中心大货车',0,3),(16,'hh00002','沪B00001','小货',1,30,2,'欣欣','15896369874','2021-3-11','上海市徐汇区小货车',0,24),(17,'沪A00002','沪A00002','小货',1,30,1,'宇宇2','15896856325','2021-3-11','上海市分拣中心大货车',0,23),(18,'qc99999','粤A99099','重货',1,2,2,'景天','13232276587','2021-3-11','老司机',0,22),(24,NULL,'粤A00906','厢货车',1,20,15,'花园宝宝','15565895326','2021-3-11','这是一个老司机',0,65),(25,NULL,'粤A00609','厢货车',1,20,15,'天线宝宝','15565230985','2021-3-11','林州的司机',0,66),(26,NULL,'粤A00004','货车',1,20,10,'花元宝吧','15896856325','2021-3-11','金水区货车',0,64),(27,NULL,'京A00001','箱货车',1,20,15,'张三','15565238038','2021-3-11','老司机',0,69),(28,NULL,'京A00002','半挂',1,20,15,'小朝阳','15565238038','2021-3-11','老司机',0,70),(29,NULL,'京A00003','半挂',1,20,15,'小东城','15565238038','2021-3-11','老司机',0,71);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
