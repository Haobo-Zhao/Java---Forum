/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : forum2017jsp

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-12-15 00:42:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `attachement`
-- ----------------------------
DROP TABLE IF EXISTS `attachement`;
CREATE TABLE `attachement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongfileldname` varchar(255) DEFAULT NULL,
  `belongid` varchar(255) DEFAULT NULL,
  `belongtable` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachement
-- ----------------------------

-- ----------------------------
-- Table structure for `bankuai`
-- ----------------------------
DROP TABLE IF EXISTS `bankuai`;
CREATE TABLE `bankuai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `ishow` int(11) NOT NULL,
  `isleaf` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parentid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bankuai
-- ----------------------------
INSERT INTO `bankuai` VALUES ('21', '2017-03-07 18:26:10', '', 'Film and Television Forum', '1', '0', 'Film and Television Forum', '0');
INSERT INTO `bankuai` VALUES ('22', '2017-03-07 18:26:24', '', 'Network hot play', '1', '1', 'Network hot play', '21');
INSERT INTO `bankuai` VALUES ('23', '2017-03-07 18:27:33', '', 'Variety entertainment\r\n', '1', '1', 'Variety entertainment', '21');
INSERT INTO `bankuai` VALUES ('24', '2017-03-07 18:28:11', '', 'European and American films', '1', '0', 'European and American films', '0');
INSERT INTO `bankuai` VALUES ('25', '2017-03-07 18:28:40', '', 'science fiction', '1', '1', 'science fiction', '24');
INSERT INTO `bankuai` VALUES ('26', '2017-03-07 18:28:53', '', 'Warfare', '1', '1', 'Warfare', '24');
INSERT INTO `bankuai` VALUES ('27', '2017-03-07 18:29:11', '', 'comedy', '1', '1', 'comedy', '24');
INSERT INTO `bankuai` VALUES ('28', '2017-03-07 18:29:19', '', 'Love', '1', '1', 'Love', '24');
INSERT INTO `bankuai` VALUES ('29', '2017-03-07 19:07:16', '', 'Film and television information', '1', '0', 'Film and television information', '0');
INSERT INTO `bankuai` VALUES ('30', '2017-03-07 19:07:36', '', 'Star gossip', '1', '1', 'Star gossip', '29');
INSERT INTO `bankuai` VALUES ('31', '2017-03-07 19:08:01', '', 'Variety information', '1', '1', 'Variety information', '29');
INSERT INTO `bankuai` VALUES ('32', '2017-03-07 19:08:32', '', 'film festival', '1', '1', 'film festival', '29');
INSERT INTO `bankuai` VALUES ('33', '2017-03-07 20:08:55', '', 'Test version', '1', '0', 'Test version', '0');
INSERT INTO `bankuai` VALUES ('34', '2017-03-07 20:09:09', '', 'Film and television beauty', '1', '1', 'Film and television beauty', '33');
INSERT INTO `bankuai` VALUES ('35', '2017-05-23 10:26:01', '', 'Test dating section 2\r\n', '1', '0', 'Test dating section 2', '0');
INSERT INTO `bankuai` VALUES ('36', '2017-05-23 10:26:11', '', 'Block 1', '1', '1', 'Block 1', '35');
INSERT INTO `bankuai` VALUES ('37', '2017-11-20 22:09:15', '', 'Block 2', '1', '1', 'Block 2', '35');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongid` varchar(255) DEFAULT NULL,
  `commentcontent` text,
  `commentren` varchar(255) DEFAULT NULL,
  `commenttime` datetime DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '不错了啊啊啊1234334', 'H001', '2017-01-12 23:08:30', '/forum/upload/nopic.jpg', 'album');
INSERT INTO `comment` VALUES ('2', '1', '好多不错了啊啊啊军训', 'H001', '2017-01-12 23:28:48', '/forum/upload/nopic.jpg', 'album');
INSERT INTO `comment` VALUES ('3', '2', '小妹子评论下啊啊', '38', '2017-01-12 23:30:33', '/forum/upload/temp/u=3693728450,53341709&fm=23&gp=0.jpg', 'album');
INSERT INTO `comment` VALUES ('4', '4', '帅啊啊啊啊啊啊啊啊', '38', '2017-01-12 23:33:29', '/forum/upload/temp/u=3693728450,53341709&fm=23&gp=0.jpg', 'album');
INSERT INTO `comment` VALUES ('5', '2', '123434343434343434', 'H002', '2017-03-07 19:48:08', '/forum/upload/temp/u=702642784,4049702756&fm=23&gp=0.jpg', 'news');
INSERT INTO `comment` VALUES ('6', '2', '234343434', 'H002', '2017-03-07 19:48:11', '/forum/upload/temp/u=702642784,4049702756&fm=23&gp=0.jpg', 'news');
INSERT INTO `comment` VALUES ('7', '1', '123434343434343434', 'H003', '2017-03-07 20:08:25', '/forum/upload/temp/u=3424906583,3037616705&fm=23&gp=0.jpg', 'news');
INSERT INTO `comment` VALUES ('8', '1', '123444444444444423432424', '13732921234', '2017-05-23 10:24:19', '/forum/upload/temp/u=3847547444,2022685440&fm=23&gp=0.jpg', 'news');
INSERT INTO `comment` VALUES ('9', '3', '1234343434', '13732921234', '2017-05-23 10:24:28', '/forum/upload/temp/u=3847547444,2022685440&fm=23&gp=0.jpg', 'news');

-- ----------------------------
-- Table structure for `friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendlink
-- ----------------------------
INSERT INTO `friendlink` VALUES ('1', '#', '水木年华BBS');

-- ----------------------------
-- Table structure for `huiyuan`
-- ----------------------------
DROP TABLE IF EXISTS `huiyuan`;
CREATE TABLE `huiyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `aihao` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idcardno` varchar(255) DEFAULT NULL,
  `logtimes` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `touxiang` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  `yue` float NOT NULL,
  `zhiye` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of huiyuan
-- ----------------------------
INSERT INTO `huiyuan` VALUES ('8', 'H001', '北京市XXXx', null, '', 'test@126.com', '', '18', '13732921234', '王艳', 'H001', '123456', '2017-03-07 18:50:51', '男', '1', '/forum/upload/nopic.jpg', '普通会员', '0', null);
INSERT INTO `huiyuan` VALUES ('9', 'H002', '杭州市XXX', null, '', '118822@qq.com', '', '2', '15797821233', '李涛', 'H002', '123456', '2017-03-07 19:46:16', '女', '1', '/forum/upload/temp/u=702642784,4049702756&fm=23&gp=0.jpg', '普通会员', '0', null);
INSERT INTO `huiyuan` VALUES ('10', 'H003', '杭州市XXX', null, '', '670@qq.com', '', '3', '13732928899', '刘刀刀', 'H003', '123456', '2017-03-07 20:05:55', '男', '1', '/forum/upload/temp/u=3424906583,3037616705&fm=23&gp=0.jpg', '普通会员', '0', null);
INSERT INTO `huiyuan` VALUES ('11', '13732921234', '深圳市罗湖区东正街XXXX', null, '', '11882126@qq.com', '', '2', '13732921234', '胡一刀', '13732921234', '123456', '2017-05-23 10:20:40', '女', '1', '/forum/upload/temp/u=3847547444,2022685440&fm=23&gp=0.jpg', '普通会员', '0', null);
INSERT INTO `huiyuan` VALUES ('12', 'H2017001', '深圳市罗湖区东正街XXXX', null, '', '1282@126.com', '', '3', '15788241234', '欧阳锋', 'H2017001', '123456', '2017-11-20 22:03:22', '男', '1', '/forum/upload/temp/u=523808086,2917561306&fm=23&gp=0.jpg', '普通会员', '0', null);

-- ----------------------------
-- Table structure for `hytype`
-- ----------------------------
DROP TABLE IF EXISTS `hytype`;
CREATE TABLE `hytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hytype
-- ----------------------------
INSERT INTO `hytype` VALUES ('1', '普通会员');
INSERT INTO `hytype` VALUES ('2', '白金会员');

-- ----------------------------
-- Table structure for `indexcolumns`
-- ----------------------------
DROP TABLE IF EXISTS `indexcolumns`;
CREATE TABLE `indexcolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coldes` varchar(255) DEFAULT NULL,
  `colid` int(11) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `showstyle` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indexcolumns
-- ----------------------------

-- ----------------------------
-- Table structure for `jiaodiantu`
-- ----------------------------
DROP TABLE IF EXISTS `jiaodiantu`;
CREATE TABLE `jiaodiantu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `pindex` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jiaodiantu
-- ----------------------------
INSERT INTO `jiaodiantu` VALUES ('1', '#', '0', '网聚', '/forum/upload/temp/142481593.jpg', '站内');
INSERT INTO `jiaodiantu` VALUES ('2', '#', '0', '因为爱遇见你', '/forum/upload/temp/142417984.jpg', '站内');
INSERT INTO `jiaodiantu` VALUES ('3', '#', '0', '封神', '/forum/upload/temp/i1487913426_1.jpg', '站内');

-- ----------------------------
-- Table structure for `leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `leaveword`;
CREATE TABLE `leaveword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `dcontent` varchar(255) DEFAULT NULL,
  `lyname` varchar(255) DEFAULT NULL,
  `lyren` varchar(255) DEFAULT NULL,
  `replycontent` varchar(255) DEFAULT NULL,
  `replyren` varchar(255) DEFAULT NULL,
  `replytime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaveword
-- ----------------------------
INSERT INTO `leaveword` VALUES ('2', '2016-12-24 20:41:50', '莫愁你好', '王强', 'H004', '你好了', 'H002', '2016-12-24 20:43:22', '2', '莫愁你好');
INSERT INTO `leaveword` VALUES ('4', '2017-03-07 19:47:18', '你好弟弟', '李涛', 'H002', '', 'H001', '2017-03-07 19:47:18', '1', '你好弟弟');
INSERT INTO `leaveword` VALUES ('5', '2017-03-07 20:07:44', '1234343434343434', '刘刀刀', 'H003', '', 'H002', '2017-03-07 20:07:44', '1', '123431234');
INSERT INTO `leaveword` VALUES ('6', '2017-05-23 10:21:56', '123444444444324324324', '胡一刀', '13732921234', '1234343434', 'H003', '2017-05-23 10:25:13', '2', '你好');
INSERT INTO `leaveword` VALUES ('7', '2017-11-20 22:06:37', '123444', '欧阳锋', 'H2017001', '122133333', 'H003', '2017-11-20 22:07:15', '2', '刘刀刀你好啊交个朋友');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clickcount` int(11) NOT NULL,
  `dcontent` text,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '7', '<p style=\"line-height:24px;margin-top:15.6pt;text-indent:21pt;font-family:宋体;margin-bottom:0pt;color:#333333;font-size:15px;\">\r\n	<br />\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\" font-size:14px;white-space:normal;background-color:#ffffff;line-height:23px;\"=\"\"><span style=\"font-family:\'tahoma, arial, 宋体, sans-serif\';\">1234343434</span> \r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>', 'admin', '2017-11-20 21:59:08', '测试公告');
INSERT INTO `notice` VALUES ('2', '0', '<span style=\"white-space:nowrap;\">发布系统公告了</span><span style=\"white-space:nowrap;\">发布系统公告了</span><span style=\"white-space:nowrap;\">发布系统公告了</span>', 'admin', '2017-11-20 21:59:08', '发布系统公告了');

-- ----------------------------
-- Table structure for `secquestion`
-- ----------------------------
DROP TABLE IF EXISTS `secquestion`;
CREATE TABLE `secquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secquestion
-- ----------------------------

-- ----------------------------
-- Table structure for `sitenav`
-- ----------------------------
DROP TABLE IF EXISTS `sitenav`;
CREATE TABLE `sitenav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `sindex` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sitenav
-- ----------------------------
INSERT INTO `sitenav` VALUES ('1', '/e/forumindex.jsp', '1', 'Site Index');
INSERT INTO `sitenav` VALUES ('14', '/e/noticelist.jsp', '2', 'System Notice');

-- ----------------------------
-- Table structure for `sysconfig`
-- ----------------------------
DROP TABLE IF EXISTS `sysconfig`;
CREATE TABLE `sysconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dcontent` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysconfig
-- ----------------------------

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bkid` int(255) DEFAULT NULL,
  `bkname` varchar(255) DEFAULT NULL,
  `clickcount` int(11) NOT NULL,
  `dcontent` text,
  `istopic` int(255) DEFAULT NULL,
  `lastreplyor` varchar(255) DEFAULT NULL,
  `lastreplytime` datetime DEFAULT NULL,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `replycount` int(11) NOT NULL,
  `replyid` int(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('13', '22', '网络热剧', '17', '1234444444444444444', '1', '', '2017-03-07 19:43:19', 'H001', '2017-11-20 21:58:10', '0', '-1', '测试信息442343434');
INSERT INTO `topic` VALUES ('14', '22', '网络热剧', '0', '123444444444444442434', '1', '', '2017-03-07 19:43:29', 'H001', '2017-11-20 21:58:10', '0', '-1', '测试信息2343434');
INSERT INTO `topic` VALUES ('16', '22', '网络热剧', '0', '123434343434343434', '0', '', '2017-03-07 19:47:52', 'H002', '2017-11-20 21:58:10', '0', '13', '可以啊啊啊啊啊啊');
INSERT INTO `topic` VALUES ('17', '22', '网络热剧', '0', '123444444444444444444441234353535', '0', '', '2017-03-07 20:08:10', 'H003', '2017-11-20 21:58:10', '0', '13', '1234343434343434');
INSERT INTO `topic` VALUES ('18', '25', '科幻', '3', '1234444444444444444443243434', '1', '', '2017-05-23 10:24:08', '13732921234', '2017-05-23 10:24:08', '0', '-1', '测试主题啊啊啊啊');
INSERT INTO `topic` VALUES ('19', '26', '战争', '4', '12344444444444444444444442343434', '1', '', '2017-11-20 22:05:16', 'H2017001', '2017-11-20 22:05:16', '0', '-1', '发布战争帖子1234444');
INSERT INTO `topic` VALUES ('20', '26', '战争', '0', '1324444444444444444444444123434', '0', '', '2017-11-20 22:05:46', 'H001', '2017-11-20 22:05:46', '0', '19', '1234444444444444');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logtimes` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `xiangpian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '2017-05-23 08:32:46', null, '670@qq.com', '77', 'admin', 'admin', '阿文', '管理员', '男', '0791-88125634', 'admin', '/forum/upload/temp/t222.jpg');
