/*
Navicat MySQL Data Transfer

Source Server         : hqtcblog
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hqtcblog

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-01 10:04:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blogid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `commentnum` int(11) NOT NULL,
  `likenum` int(11) NOT NULL,
  `title` text,
  `content` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('2', '1', 'test@a.com', '2012-11-30', '0', '0', '无题', 'ddddddddddddddddd顶顶顶顶顶顶顶顶顶顶顶顶', ' ');
INSERT INTO `blog` VALUES ('3', '2', 'test@a.com', '2012-11-30', '0', '0', '', '', 'upload/9HrH56Cwj4Z6.jpg,');
INSERT INTO `blog` VALUES ('4', '3', 'test@a.com', '2012-11-30', '0', '0', '无题', '', 'http://www.baidu.com/');
INSERT INTO `blog` VALUES ('5', '4', 'test@a.com', '2012-11-30', '0', '0', '习近平：伟大梦想照耀复兴之路 新闻联播 121129', '', 'http://v.youku.com/v_show/id_XNDgxODc2Njg4.html');
INSERT INTO `blog` VALUES ('6', '4', 'test@a.com', '2012-11-30', '0', '0', '印媒称印军机进入藏南', '', 'http://v.youku.com/v_show/id_XNDgxOTk1Nzc2.html');
INSERT INTO `blog` VALUES ('7', '1', 'test@a.com', '2012-11-30', '0', '0', '严昕有点二', '<p>严昕有多二？</p><p>到底是有多二？</p><p>不知道</p>', ' ');
INSERT INTO `blog` VALUES ('8', '2', 'test@a.com', '2012-11-30', '0', '0', '这是篮球篮球啊', '', 'upload/GBuhwkcz9aOD.jpg,upload/m3yYYYU3zf46.jpg,upload/OpGO5NeM529i.jpg,');
INSERT INTO `blog` VALUES ('9', '3', 'test@a.com', '2012-11-30', '0', '0', '我自己的网站', '', 'http://localhost:8088/hqtcblog/view/linkEditor.php');
INSERT INTO `blog` VALUES ('10', '1', 'test@a.com', '2012-11-30', '0', '0', '今天有点郁闷，是不是', '<p>今天有点郁闷，</p><p><em><strong>有点郁闷啊</strong></em></p>', ' ');
INSERT INTO `blog` VALUES ('11', '4', 'test@a.com', '2012-12-01', '0', '0', '无题', '', '');
INSERT INTO `blog` VALUES ('12', '4', 'test@a.com', '2012-12-01', '0', '0', '无题', '', '');
INSERT INTO `blog` VALUES ('13', '4', 'test@a.com', '2012-12-01', '0', '0', '无题', '', 'http://');
INSERT INTO `blog` VALUES ('14', '4', 'test@a.com', '2012-12-01', '0', '0', '无题', '', '');
INSERT INTO `blog` VALUES ('15', '2', 'test@a.com', '2012-12-01', '0', '0', '当初的愿望实现了吗？', '', 'upload/e2zTe7VfrfDf.jpg,upload/E5EK937XAYNF.jpg,upload/nR8GriEqeuVc.jpg,');

-- ----------------------------
-- Table structure for `blog_tag`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `blogid` int(11) NOT NULL,
  `tagname` varchar(255) NOT NULL,
  PRIMARY KEY (`blogid`,`tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('7', 'budong');
INSERT INTO `blog_tag` VALUES ('7', '汗');
INSERT INTO `blog_tag` VALUES ('7', '？？');
INSERT INTO `blog_tag` VALUES ('8', 'IT，飞');
INSERT INTO `blog_tag` VALUES ('8', '？？');
INSERT INTO `blog_tag` VALUES ('9', '奇幻');
INSERT INTO `blog_tag` VALUES ('9', '少年');
INSERT INTO `blog_tag` VALUES ('10', '万里');
INSERT INTO `blog_tag` VALUES ('10', '丰厚');
INSERT INTO `blog_tag` VALUES ('33', '咚呱');
INSERT INTO `blog_tag` VALUES ('155', '谷歌');
INSERT INTO `blog_tag` VALUES ('190', '菲菲');
INSERT INTO `blog_tag` VALUES ('192', '顶顶');
INSERT INTO `blog_tag` VALUES ('193', 'ddd');

-- ----------------------------
-- Table structure for `boke`
-- ----------------------------
DROP TABLE IF EXISTS `boke`;
CREATE TABLE `boke` (
  `bokeid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `bokename` varchar(255) NOT NULL,
  PRIMARY KEY (`bokeid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boke
-- ----------------------------
INSERT INTO `boke` VALUES ('1', 'test@a.com', '八度☆空间');
INSERT INTO `boke` VALUES ('2', 'test2@a.com', 'gggd');
INSERT INTO `boke` VALUES ('3', 'test3@a.com', '满天数星斗');
INSERT INTO `boke` VALUES ('4', 'r@r.com', '真一般');
INSERT INTO `boke` VALUES ('5', '6@6.com', '这是??');
INSERT INTO `boke` VALUES ('6', '2@2.com', '我的博客');
INSERT INTO `boke` VALUES ('7', '8@8.com', '我的博客');
INSERT INTO `boke` VALUES ('8', 'd@d.com', '我的博客');
INSERT INTO `boke` VALUES ('9', 'r@q.com', '我的妞妞');
INSERT INTO `boke` VALUES ('10', 'a@b.cd', '我的博客');

-- ----------------------------
-- Table structure for `followblog`
-- ----------------------------
DROP TABLE IF EXISTS `followblog`;
CREATE TABLE `followblog` (
  `email` varchar(255) NOT NULL,
  `blogid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followblog
-- ----------------------------

-- ----------------------------
-- Table structure for `followtag`
-- ----------------------------
DROP TABLE IF EXISTS `followtag`;
CREATE TABLE `followtag` (
  `emial` varchar(255) NOT NULL,
  `tagid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followtag
-- ----------------------------

-- ----------------------------
-- Table structure for `follow_boke`
-- ----------------------------
DROP TABLE IF EXISTS `follow_boke`;
CREATE TABLE `follow_boke` (
  `email` varchar(255) NOT NULL,
  `bokeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow_boke
-- ----------------------------

-- ----------------------------
-- Table structure for `follow_tag`
-- ----------------------------
DROP TABLE IF EXISTS `follow_tag`;
CREATE TABLE `follow_tag` (
  `emial` varchar(255) NOT NULL,
  `tagid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `likes`
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `userid` int(11) NOT NULL,
  `blogid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likes
-- ----------------------------

-- ----------------------------
-- Table structure for `txt`
-- ----------------------------
DROP TABLE IF EXISTS `txt`;
CREATE TABLE `txt` (
  `txt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of txt
-- ----------------------------
INSERT INTO `txt` VALUES ('\\');
INSERT INTO `txt` VALUES ('\\');
INSERT INTO `txt` VALUES ('\'\\\'');
INSERT INTO `txt` VALUES ('\"\\\"');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nick` varchar(255) NOT NULL,
  `portraiturl` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5@r.com', 'eeeeeeeeee', 'eeeeeeeeeeeeeeeeeeeeeee', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('6@6.com', 'qwerty', '肯定不去啊啊', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('8@8.com', 'qwerty', '超级吧吧', 'upload/portrait/dog.jpg');
INSERT INTO `user` VALUES ('a@b.cd', '123456a', 'hqtc', 'upload/portrait/portrait.png');
INSERT INTO `user` VALUES ('a@q.com', 'qwerty', 'errrrrrrrrrrrrrrrrrrrrrrrrrrrr', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('b@b.com', 'qwerty', 'baby', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('q@q.com', 'qwerty', 'ffffffffffffffffffffffffffffffffffffffff', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('r@ddd.com', 'qwerty', 'gggggggggggggggg', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('r@q.com', 'qwerty', 'qq小牛u', 'upload/portrait/girl.jpg');
INSERT INTO `user` VALUES ('r@r.com', 'qwerty', 'ggmm', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('r@w.com', 'qwerty', 'ffffffffffffffffffffffffffffffffffff', 'upload/portrait/boy.jpg');
INSERT INTO `user` VALUES ('test2@a.com', 'qwerty', '那是一条和马菲菲', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('test3@a.com', 'qwerty', '鱼儿不会飞', 'upload/portrait/boy.jpg');
INSERT INTO `user` VALUES ('test3@qq.com', 'ddddddddd', '不是我啊啊啊啊啊啊啊啊啊', 'upload/portrait/boy.jpg');
INSERT INTO `user` VALUES ('test@a.com', 'qwerty', 'nick', 'upload/portrait/portrait.png');
