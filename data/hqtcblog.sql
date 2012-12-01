/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : hqtcblog

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2012-12-01 13:46:24
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
  `content` text,
  `url` text,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
INSERT INTO `blog` VALUES ('16', '4', 'test@a.com', '2012-12-01', '0', '0', '喵星人看网球比赛，小脑袋摇得像拨浪鼓~', '', 'http://www.tudou.com/programs/view/-O4PhodlMvU/?fr=rec2');
INSERT INTO `blog` VALUES ('17', '4', 'test@a.com', '2012-12-01', '0', '0', '56出品《微播江湖》番外篇第20期 小心外星人忽悠地球', '', 'http://www.56.com/u34/v_ODA2MDM4ODc.html');
INSERT INTO `blog` VALUES ('18', '1', 'test@a.com', '2012-12-01', '0', '0', '进军大西北', '<p><strong>个</strong></p><p><strong><br /></strong></p>', ' ');
INSERT INTO `blog` VALUES ('19', '1', 'test@a.com', '2012-12-01', '0', '0', '无题', '<span style=\"font-family:宋体;color:#333333;font-size: 14px; line-height: 20px; background-color: rgb(250, 250, 250); \">到这些话语，瞳孔微微一缩，但是面上倒不像宝花那般彻底失色。　　　　但一直沉默不语的蟹道垩人，忽然开口了，所说内容让韩立心中为之一动。　　　　“真极之躯！是玄仙才能拥有的真躯之身？”蟹道垩人这般平静的说道。　　　　“哦，区区一具伪仙傫竟然也知道我这真极之躯。看来你原先主人，应该也是</span>', ' ');
INSERT INTO `blog` VALUES ('21', '1', 'test@a.com', '2012-12-01', '0', '0', '无题', '<span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">首先，说一下</span><a href=\"http://www.apkbus.com/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; color: rgb(68, 68, 68); cursor: pointer; font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \">Android开发</a><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">规范之编码规范</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">1，java代码中不出现中文，最多注释中可以出现中文，中文统一写在strings.xml中；</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">2，局部变量命名、静态成员变量命名 只能包含字母，单词首字母大写，其他字母都为小写</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">3，常量命名只能包含字母和_，字母全部大写，单词之间用_隔开</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">4，布局文件中的id命名</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">命名模式为：view缩写_模块名称_view的逻辑名称</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">常用控件的缩写如下</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">LayoutView：lv_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">RelativeView : rv_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">TextView : tv_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">ImageView : iv_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">ImageButton : im_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">Button : btn_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">5，strings.xml中的id命名</span>', ' ');
INSERT INTO `blog` VALUES ('22', '4', 'test@a.com', '2012-12-01', '0', '0', '天天向上20121130“婆妈”大咖齐聚一堂', '', 'http://www.56.com/u48/v_ODA2MjE1ODk.html');
INSERT INTO `blog` VALUES ('23', '2', 'test@a.com', '2012-12-01', '0', '0', 'NBa', '', 'upload/75OIARTRM02A.jpg,upload/w5w2MtSwEyWw.jpg,');
INSERT INTO `blog` VALUES ('24', '3', 'test@a.com', '2012-12-01', '0', '0', '无题', '', 'http://image.baidu.com/i?ct=201326592&cl=2&lm=-1&nc=1&ie=utf-8&tn=baiduimage&pv=&fm=rs4&word=nba%E7%90%83%E6%98%9F');
INSERT INTO `blog` VALUES ('25', '1', 'test@a.com', '2012-12-01', '0', '0', '刘强东', '<span style=\"color:#a7cbf3;line-height: 19px; background-color: rgb(10, 28, 50); \">“刘强东的童年好友李江，曾在宿迁老家见到刘强东和他的女友龚小京。龚小京的名字就是京东的“京”字出处。在这对恋人分手之后，没有人采访过龚小京，她的名字在网络上甚至被误传为罗小京。” 11月号，《在乡村咖啡馆和刘强东发小聊天》。</span>', ' ');
INSERT INTO `blog` VALUES ('26', '1', 'test@a.com', '2012-12-01', '0', '0', '留几手', '<span style=\"color:#333333;font-size: 14px; line-height: 23px; background-color: rgb(250, 250, 250); \">暴发户小舅子的气质，农村承包鱼塘的，泥腿子还没洗净，就进城投奔姐夫，干起了司机保镖，装修监理的工作。狗仗人势一废物，一脸猪头肉，一身猪下水，一走一阵风，一坐一个坑。兜里揣俩逼钱，喜欢语言调戏女服务员，文化素质决定了只有跟服务员才能体现出你的口才。吃喝嫖赌全占，却自诩信佛。负分，滚</span>', ' ');
INSERT INTO `blog` VALUES ('27', '1', 'test@a.com', '2012-12-01', '0', '0', '招聘', '<span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">网络创业不是梦，起点从这里开始。。。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">招聘条件：</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">1.有上网条件–兼职/专职均可(在家中、办公室、网吧等地)。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">2.时间自由，只要你有空就可赚钱。（具体时间由您自己掌握）。&nbsp;</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">3.有简单网络知识和淘宝网站应用的基础，会使用支付宝，语音YY。（如：下载都不会勿扰）</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">4、岗位薪资：800元/月——2000/月&nbsp;</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">5、本团队采取的是能多劳者多得。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">6、有意者请与我联系，本团队并非一些所谓的诈骗集团，可供考证。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">7. ，时间自由，没有限制。一边赚钱，一边交友，轻松，简单。支付宝转账。可以联系我咨询咨询。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">还在为你的淘宝店没有信誉和好评担心么？ 也可以找我们。详细Q上聊</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">适合者：想兼职，又不想影响正职！</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">扣扣</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">在下面</span>', ' ');

-- ----------------------------
-- Table structure for `blogtag`
-- ----------------------------
DROP TABLE IF EXISTS `blogtag`;
CREATE TABLE `blogtag` (
  `blogid` int(11) NOT NULL,
  `tagname` varchar(255) NOT NULL,
  PRIMARY KEY (`blogid`,`tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogtag
-- ----------------------------
INSERT INTO `blogtag` VALUES ('25', 'IT 刘强东 爱情');
INSERT INTO `blogtag` VALUES ('26', '几首');
INSERT INTO `blogtag` VALUES ('26', '微博');
INSERT INTO `blogtag` VALUES ('26', '留几手');
INSERT INTO `blogtag` VALUES ('27', '招聘');
INSERT INTO `blogtag` VALUES ('27', '求职');

-- ----------------------------
-- Table structure for `boke`
-- ----------------------------
DROP TABLE IF EXISTS `boke`;
CREATE TABLE `boke` (
  `bokeid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `bokename` varchar(255) NOT NULL,
  PRIMARY KEY (`bokeid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
INSERT INTO `boke` VALUES ('11', 'a@b.cn', '我的博客');
INSERT INTO `boke` VALUES ('12', 'a@c.com', '我的博客');

-- ----------------------------
-- Table structure for `followboke`
-- ----------------------------
DROP TABLE IF EXISTS `followboke`;
CREATE TABLE `followboke` (
  `email` varchar(255) NOT NULL,
  `bokeid` int(11) NOT NULL,
  PRIMARY KEY (`email`,`bokeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followboke
-- ----------------------------

-- ----------------------------
-- Table structure for `followtag`
-- ----------------------------
DROP TABLE IF EXISTS `followtag`;
CREATE TABLE `followtag` (
  `emial` varchar(255) NOT NULL,
  `tagname` varchar(255) NOT NULL,
  PRIMARY KEY (`emial`,`tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followtag
-- ----------------------------

-- ----------------------------
-- Table structure for `likes`
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `email` varchar(11) NOT NULL,
  `blogid` int(11) NOT NULL,
  PRIMARY KEY (`email`,`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likes
-- ----------------------------

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
INSERT INTO `user` VALUES ('a@b.cn', '123456a', 'A', 'upload/portrait/portrait.png');
INSERT INTO `user` VALUES ('a@c.com', 'qwerty', '生命的光彩', 'upload/portrait/girl.jpg');
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
INSERT INTO `user` VALUES ('test@a.com', 'qwerty', 'nick', 'upload/portrait/girl.jpg');
