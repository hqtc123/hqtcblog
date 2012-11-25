/*
Navicat MySQL Data Transfer

Source Server         : hqtcblog
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hqtcblog

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-11-15 13:31:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blogid`
-- ----------------------------
DROP TABLE IF EXISTS `blogid`;
CREATE TABLE `blogid` (
  `blogid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogid
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_tag`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `blogid` int(11) DEFAULT NULL,
  `tagid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `boke`
-- ----------------------------
DROP TABLE IF EXISTS `boke`;
CREATE TABLE `boke` (
  `bokeid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `bokename` varchar(255) NOT NULL,
  PRIMARY KEY (`bokeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boke
-- ----------------------------

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
-- Table structure for `picblog`
-- ----------------------------
DROP TABLE IF EXISTS `picblog`;
CREATE TABLE `picblog` (
  `blogid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `contentnum` int(11) NOT NULL,
  `bokeid` int(11) NOT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picblog
-- ----------------------------

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for `txtblog`
-- ----------------------------
DROP TABLE IF EXISTS `txtblog`;
CREATE TABLE `txtblog` (
  `blogid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `commentnum` int(11) NOT NULL,
  `bokeid` int(11) NOT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of txtblog
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nick` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5@r.com', 'eeeeeeeeee', 'eeeeeeeeeeeeeeeeeeeeeee');
INSERT INTO `user` VALUES ('6@6.com', 'qwerty', '肯定不去啊啊');
INSERT INTO `user` VALUES ('a@q.com', 'qwerty', 'errrrrrrrrrrrrrrrrrrrrrrrrrrrr');
INSERT INTO `user` VALUES ('q@q.com', 'qwerty', 'ffffffffffffffffffffffffffffffffffffffff');
INSERT INTO `user` VALUES ('r@ddd.com', 'qwerty', 'gggggggggggggggg');
INSERT INTO `user` VALUES ('r@w.com', 'qwerty', 'ffffffffffffffffffffffffffffffffffff');
INSERT INTO `user` VALUES ('test2@a.com', 'qwerty', '那是一条和马菲菲');
INSERT INTO `user` VALUES ('test3@qq.com', 'ddddddddd', '不是我啊啊啊啊啊啊啊啊啊');
INSERT INTO `user` VALUES ('test@a.com', 'qwerty', 'nick');
