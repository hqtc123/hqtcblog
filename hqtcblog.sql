/*
Navicat MySQL Data Transfer

Source Server         : hqtcblog
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hqtcblog

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-11-27 11:50:31
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
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '1', 'test@a.com', '2012-11-24', '0');
INSERT INTO `blog` VALUES ('2', '1', 'test@a.com', '2012-11-24', '0');
INSERT INTO `blog` VALUES ('3', '1', 'test@a.com', '2012-11-24', '0');
INSERT INTO `blog` VALUES ('4', '1', 'test@a.com', '2012-11-24', '0');
INSERT INTO `blog` VALUES ('5', '1', 'test@a.com', '2012-11-24', '0');
INSERT INTO `blog` VALUES ('6', '1', 'test@a.com', '2012-11-24', '0');
INSERT INTO `blog` VALUES ('7', '1', 'test@a.com', '2012-11-24', '0');
INSERT INTO `blog` VALUES ('8', '1', 'test@a.com', '2012-11-24', '0');
INSERT INTO `blog` VALUES ('9', '1', 'test@a.com', '2012-11-25', '0');
INSERT INTO `blog` VALUES ('10', '1', 'test@a.com', '2012-11-25', '0');
INSERT INTO `blog` VALUES ('11', '1', 'test@a.com', '2012-11-27', '0');
INSERT INTO `blog` VALUES ('12', '1', 'test@a.com', '2012-11-27', '0');
INSERT INTO `blog` VALUES ('13', '1', 'test@a.com', '2012-11-27', '0');

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

-- ----------------------------
-- Table structure for `boke`
-- ----------------------------
DROP TABLE IF EXISTS `boke`;
CREATE TABLE `boke` (
  `bokeid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `bokename` varchar(255) NOT NULL,
  PRIMARY KEY (`bokeid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boke
-- ----------------------------
INSERT INTO `boke` VALUES ('1', 'test@a.com', '八度空间');
INSERT INTO `boke` VALUES ('2', 'test2@a.com', 'gggd');
INSERT INTO `boke` VALUES ('3', 'test3@a.com', '满天数星斗');
INSERT INTO `boke` VALUES ('4', 'r@r.com', '真一般');
INSERT INTO `boke` VALUES ('5', '6@6.com', '这是……');

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
-- Table structure for `like`
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like` (
  `userid` int(11) NOT NULL,
  `blogid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of like
-- ----------------------------

-- ----------------------------
-- Table structure for `linkblog`
-- ----------------------------
DROP TABLE IF EXISTS `linkblog`;
CREATE TABLE `linkblog` (
  `blogid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linkblog
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
  `tagname` varchar(255) NOT NULL,
  PRIMARY KEY (`tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('budong');
INSERT INTO `tag` VALUES ('gg');
INSERT INTO `tag` VALUES ('IT，飞');
INSERT INTO `tag` VALUES ('万里');
INSERT INTO `tag` VALUES ('丰厚');
INSERT INTO `tag` VALUES ('声明');
INSERT INTO `tag` VALUES ('奇幻');
INSERT INTO `tag` VALUES ('少年');
INSERT INTO `tag` VALUES ('汗');
INSERT INTO `tag` VALUES ('？？');

-- ----------------------------
-- Table structure for `txtblog`
-- ----------------------------
DROP TABLE IF EXISTS `txtblog`;
CREATE TABLE `txtblog` (
  `blogid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of txtblog
-- ----------------------------
INSERT INTO `txtblog` VALUES ('1', '无题', 'first');
INSERT INTO `txtblog` VALUES ('2', '无题', 'what??');
INSERT INTO `txtblog` VALUES ('3', '成功发布了吗', '<p><strong><em><span style=\"font-family:Microsoft YaHei;font-size:32px;\">也许</span></em></strong></p><p><strong><em><span style=\"font-family:Microsoft YaHei;font-size:16px;\">已经成功了呢，是吧</span></em></strong></p>');
INSERT INTO `txtblog` VALUES ('7', '无题', '那是');
INSERT INTO `txtblog` VALUES ('8', '补丁', '<p>那是</p><p>一个</p><p>补丁</p>');
INSERT INTO `txtblog` VALUES ('9', '一个好汉三个帮', '<span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 13.63636302947998px; line-height: 20px;\">我们常常以悲剧和喜剧来区分电影带给我们的情绪，但是实际上更多时候，一部电影没有这么简单，喜剧让人感到愉悦，悲剧让人得到震撼，而喜剧中又潜伏悲剧，这就让一部电影更有独特的魅力而余味悠长。《少年派的奇幻漂流》就是这样一部电影，大部分的时间，它像一部印度风情画，又像一种百折不挠的励志精神，或者是一段人生百转千回的哲理故事，但是，影片末端，另一种基调的故事描述，又让整个影片的味道瞬间改变，或者说升华。再好的原著小说，改编电影都是一场严峻考验，虽然没有看过原著，但是《少年派的奇幻漂流》的电影给人的情绪感染却那么深刻，两个故事，一种人生，派的故事给人一种温暖又残酷的震撼。</span>');
INSERT INTO `txtblog` VALUES ('10', '神马都是浮云', '<p>当年，</p><p>万里去新疆兵团参观</p><p><br /></p>');
INSERT INTO `txtblog` VALUES ('11', '无题', '费反复反复反复反复反复反复反复反复顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶');
INSERT INTO `txtblog` VALUES ('12', '无题', '费反复反复反复反复反复反复反复反复顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶');
INSERT INTO `txtblog` VALUES ('13', '无题', '费反复反复反复反复反复反复反复反复顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶');

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
INSERT INTO `user` VALUES ('6@6.com', 'qwerty', '肯定不去啊啊', 'upload/portrait/boy.jpg');
INSERT INTO `user` VALUES ('a@q.com', 'qwerty', 'errrrrrrrrrrrrrrrrrrrrrrrrrrrr', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('b@b.com', 'qwerty', 'baby', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('q@q.com', 'qwerty', 'ffffffffffffffffffffffffffffffffffffffff', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('r@ddd.com', 'qwerty', 'gggggggggggggggg', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('r@r.com', 'qwerty', 'ggmm', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('r@w.com', 'qwerty', 'ffffffffffffffffffffffffffffffffffff', 'upload/portrait/boy.jpg');
INSERT INTO `user` VALUES ('test2@a.com', 'qwerty', '那是一条和马菲菲', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('test3@a.com', 'qwerty', '鱼儿不会飞', 'upload/portrait/boy.jpg');
INSERT INTO `user` VALUES ('test3@qq.com', 'ddddddddd', '不是我啊啊啊啊啊啊啊啊啊', 'upload/portrait/boy.jpg');
INSERT INTO `user` VALUES ('test@a.com', 'qwerty', 'nick', 'upload/portrait/girl.jpg');

-- ----------------------------
-- Table structure for `videoblog`
-- ----------------------------
DROP TABLE IF EXISTS `videoblog`;
CREATE TABLE `videoblog` (
  `blogid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videoblog
-- ----------------------------
