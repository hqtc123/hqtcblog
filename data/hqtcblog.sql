/*
Navicat MySQL Data Transfer

Source Server         : hqtcblog
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : hqtcblog

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-12-05 07:52:30
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
  `fromid` int(11) DEFAULT NULL,
  PRIMARY KEY (`blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('2', '1', 'test@a.com', '2012-11-30', '0', '0', '无题', 'ddddddddddddddddd顶顶顶顶顶顶顶顶顶顶顶顶', ' ', null);
INSERT INTO `blog` VALUES ('3', '2', 'test@a.com', '2012-11-30', '0', '0', '', '', 'upload/9HrH56Cwj4Z6.jpg,', null);
INSERT INTO `blog` VALUES ('4', '3', 'test@a.com', '2012-11-30', '0', '0', '无题', '', 'http://www.baidu.com/', null);
INSERT INTO `blog` VALUES ('5', '4', 'test@a.com', '2012-11-30', '0', '0', '习近平：伟大梦想照耀复兴之路 新闻联播 121129', '', 'http://v.youku.com/v_show/id_XNDgxODc2Njg4.html', null);
INSERT INTO `blog` VALUES ('6', '4', 'test@a.com', '2012-11-30', '0', '0', '印媒称印军机进入藏南', '', 'http://v.youku.com/v_show/id_XNDgxOTk1Nzc2.html', null);
INSERT INTO `blog` VALUES ('8', '2', 'test@a.com', '2012-11-30', '0', '0', '这是篮球篮球啊', '', 'upload/GBuhwkcz9aOD.jpg,upload/m3yYYYU3zf46.jpg,upload/OpGO5NeM529i.jpg,', null);
INSERT INTO `blog` VALUES ('9', '3', 'test@a.com', '2012-11-30', '0', '0', '我自己的网站', '', 'http://localhost:8088/hqtcblog/view/linkEditor.php', null);
INSERT INTO `blog` VALUES ('10', '1', 'test@a.com', '2012-11-30', '0', '0', '今天有点郁闷，是不是', '<p>今天有点郁闷，</p><p><em><strong>有点郁闷啊</strong></em></p>', ' ', null);
INSERT INTO `blog` VALUES ('15', '2', 'test@a.com', '2012-12-01', '0', '0', '当初的愿望实现了吗？', '', 'upload/e2zTe7VfrfDf.jpg,upload/E5EK937XAYNF.jpg,upload/nR8GriEqeuVc.jpg,', null);
INSERT INTO `blog` VALUES ('16', '4', 'test@a.com', '2012-12-01', '0', '0', '喵星人看网球比赛，小脑袋摇得像拨浪鼓~', '', 'http://www.tudou.com/programs/view/-O4PhodlMvU/?fr=rec2', null);
INSERT INTO `blog` VALUES ('17', '4', 'test@a.com', '2012-12-01', '0', '0', '56出品《微播江湖》番外篇第20期 小心外星人忽悠地球', '', 'http://www.56.com/u34/v_ODA2MDM4ODc.html', null);
INSERT INTO `blog` VALUES ('19', '1', 'test@a.com', '2012-12-01', '0', '0', '无题', '<span style=\"font-family:宋体;color:#333333;font-size: 14px; line-height: 20px; background-color: rgb(250, 250, 250); \">到这些话语，瞳孔微微一缩，但是面上倒不像宝花那般彻底失色。　　　　但一直沉默不语的蟹道垩人，忽然开口了，所说内容让韩立心中为之一动。　　　　“真极之躯！是玄仙才能拥有的真躯之身？”蟹道垩人这般平静的说道。　　　　“哦，区区一具伪仙傫竟然也知道我这真极之躯。看来你原先主人，应该也是</span>', ' ', null);
INSERT INTO `blog` VALUES ('21', '1', 'test@a.com', '2012-12-01', '0', '0', '无题', '<span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">首先，说一下</span><a href=\"http://www.apkbus.com/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; color: rgb(68, 68, 68); cursor: pointer; font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \">Android开发</a><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">规范之编码规范</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">1，java代码中不出现中文，最多注释中可以出现中文，中文统一写在strings.xml中；</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">2，局部变量命名、静态成员变量命名 只能包含字母，单词首字母大写，其他字母都为小写</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">3，常量命名只能包含字母和_，字母全部大写，单词之间用_隔开</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">4，布局文件中的id命名</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">命名模式为：view缩写_模块名称_view的逻辑名称</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">常用控件的缩写如下</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">LayoutView：lv_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">RelativeView : rv_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">TextView : tv_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">ImageView : iv_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">ImageButton : im_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">Button : btn_</span><br style=\"color: rgb(68, 68, 68); font-family: \'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; line-height: 20px; \" /><span style=\"font-family:\'Helvetica Neue\', \'Hiragino Sans GB\', \'Segoe UI\', \'Microsoft Yahei\', 微软雅黑, Tahoma, Arial, STHeiti, sans-serif;color:#444444;font-size: 14px; line-height: 20px; \">5，strings.xml中的id命名</span>', ' ', null);
INSERT INTO `blog` VALUES ('22', '4', 'test@a.com', '2012-12-01', '0', '0', '天天向上20121130“婆妈”大咖齐聚一堂', '', 'http://www.56.com/u48/v_ODA2MjE1ODk.html', null);
INSERT INTO `blog` VALUES ('23', '2', 'test@a.com', '2012-12-01', '0', '0', 'NBa', '', 'upload/75OIARTRM02A.jpg,upload/w5w2MtSwEyWw.jpg,', null);
INSERT INTO `blog` VALUES ('24', '3', 'test@a.com', '2012-12-01', '0', '0', '无题', '', 'http://image.baidu.com/i?ct=201326592&cl=2&lm=-1&nc=1&ie=utf-8&tn=baiduimage&pv=&fm=rs4&word=nba%E7%90%83%E6%98%9F', null);
INSERT INTO `blog` VALUES ('25', '1', 'test@a.com', '2012-12-01', '0', '0', '刘强东', '<span style=\"color:#a7cbf3;line-height: 19px; background-color: rgb(10, 28, 50); \">“刘强东的童年好友李江，曾在宿迁老家见到刘强东和他的女友龚小京。龚小京的名字就是京东的“京”字出处。在这对恋人分手之后，没有人采访过龚小京，她的名字在网络上甚至被误传为罗小京。” 11月号，《在乡村咖啡馆和刘强东发小聊天》。</span>', ' ', null);
INSERT INTO `blog` VALUES ('26', '1', 'test@a.com', '2012-12-01', '0', '0', '留几手', '<span style=\"color:#333333;font-size: 14px; line-height: 23px; background-color: rgb(250, 250, 250); \">暴发户小舅子的气质，农村承包鱼塘的，泥腿子还没洗净，就进城投奔姐夫，干起了司机保镖，装修监理的工作。狗仗人势一废物，一脸猪头肉，一身猪下水，一走一阵风，一坐一个坑。兜里揣俩逼钱，喜欢语言调戏女服务员，文化素质决定了只有跟服务员才能体现出你的口才。吃喝嫖赌全占，却自诩信佛。负分，滚</span>', ' ', null);
INSERT INTO `blog` VALUES ('27', '1', 'test@a.com', '2012-12-01', '0', '0', '招聘', '<span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">网络创业不是梦，起点从这里开始。。。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">招聘条件：</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">1.有上网条件–兼职/专职均可(在家中、办公室、网吧等地)。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">2.时间自由，只要你有空就可赚钱。（具体时间由您自己掌握）。&nbsp;</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">3.有简单网络知识和淘宝网站应用的基础，会使用支付宝，语音YY。（如：下载都不会勿扰）</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">4、岗位薪资：800元/月——2000/月&nbsp;</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">5、本团队采取的是能多劳者多得。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">6、有意者请与我联系，本团队并非一些所谓的诈骗集团，可供考证。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">7. ，时间自由，没有限制。一边赚钱，一边交友，轻松，简单。支付宝转账。可以联系我咨询咨询。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">还在为你的淘宝店没有信誉和好评担心么？ 也可以找我们。详细Q上聊</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">适合者：想兼职，又不想影响正职！</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">扣扣</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">在下面</span>', ' ', null);
INSERT INTO `blog` VALUES ('29', '2', 'test@a.com', '2012-12-02', '0', '0', '', '', 'upload/CXbi08EePpV7.jpg,upload/Df6d2ZvFF0mp.jpg,', null);
INSERT INTO `blog` VALUES ('31', '1', 'test@a.com', '2012-12-03', '0', '0', '无题', '<span style=\"font-family:Helvetica, Arial, sans-serif;font-size: 13px; line-height: 18px;\">A proxy server is a server that acts as an intermediary between your computer and other servers. Right now, your system is configured to use a proxy, but&nbsp;</span><span jscontent=\"productName\" jstcache=\"17\" class=\"productName\" style=\"font-family:Helvetica, Arial, sans-serif;font-size: 13px; line-height: 18px;\">Google Chrome</span><span style=\"font-family:Helvetica, Arial, sans-serif;font-size: 13px; line-height: 18px;\">&nbsp;can\'t connect to it.</span>', ' ', null);
INSERT INTO `blog` VALUES ('32', '1', 'test@a.com', '2012-12-03', '0', '0', '数组形式，查找条件', '<span style=\"font-family:Helvetica, Arial, sans-serif;font-size: 13px; line-height: 18px;\">If you use a proxy server, check your proxy settings or contact your network administrator to make sure the proxy server is working. If you don\'t believe you should be using a proxy server, adjust your proxy settings: Go to&nbsp;</span><strong jstcache=\"0\" style=\"font-family: Helvetica, Arial, sans-serif; font-size: 13px; line-height: 18px;\">the Chrome menu &gt;<span jscontent=\"settingsTitle\" jstcache=\"18\" class=\"settingsTitle\">Settings</span>&nbsp;&gt;&nbsp;<span jscontent=\"advancedTitle\" jstcache=\"19\" class=\"advancedTitle\">Show advanced settings...</span>&nbsp;&gt;&nbsp;<span jscontent=\"proxyTitle\" jstcache=\"20\" class=\"proxyTitle\">Change proxy settings...</span>&nbsp;&gt; LAN Settings&nbsp;</strong><span style=\"font-family:Helvetica, Arial, sans-serif;font-size: 13px; line-height: 18px;\">and deselect the &quot;Use a proxy server for your LAN&quot; checkbox.</span>', ' ', null);
INSERT INTO `blog` VALUES ('33', '1', 'test@a.com', '2012-12-03', '0', '0', '无题', '<strong style=\"font-family: 宋体; line-height: 18px;\"><cc><div id=\"post_content_24092745969\" class=\"d_post_content\" style=\"word-break: break-all; line-height: 24px; font-size: 14px; word-wrap: break-word;\"><p class=\"summary\" style=\"margin: 20px 0px 0px; padding: 15px; word-break: break-all; background-image: url(http://tb2.bdstatic.com/tb/static-pb/img/zt_top_bg.png); background-attachment: scroll; background-color: rgb(247, 247, 247); color: rgb(102, 102, 102); font-size: 12px; background-position: 0px 0px; background-repeat: no-repeat no-repeat;\">我的哈代网是湘潭高校联盟社区,网站主要以技术讨论和实用资料分享为主,其中有photoshop,CAD,制图,java,C#软件开发,java,.Net网站制作等,同时承接各种大小网站项目和程序开发</p></div></cc></strong>', ' ', null);
INSERT INTO `blog` VALUES ('34', '1', '1@1.com', '2012-12-03', '0', '0', '无题', '<span style=\"font-family:SimSun, Helvetica, sans-serif;color:#333333;font-size: 14px; line-height: 24px;\">国际金价周一亚洲盘初朝着1720美元水平温和反弹，上周五曾再度承压并逼近千七美元心理支撑。时至年末美国财政悬崖问题成为了不折不扣的市场焦点，但是由于市场对短期内黄金是以避险属性主导，还是以风险属性为先存在较大分歧，故预计后市陷入1700--1730美元内展开区间震荡的概率较大。美国共和党领袖众议院议长博纳上周表示，过去两周，国会两党就财政悬崖问题展开的磋商并没有取得实质进展。他指出，将尽一切努力令美国经济避免堕入财政悬崖。但是，民主党人至今还未能够认真地考虑如何削减支出，目前只有共和党人才考虑到平衡的避免财政悬崖的方法。有消息称，奥巴马总统希望在圣诞节前就财政悬崖问题取得进展，但目前该问题仍处于停滞状态。事实上，财政悬崖在圣诞节前解决的机会基本为零，届时美国“驴象两党”肯定又是草草达成一个拖延时间的临时决议。</span>', ' ', null);
INSERT INTO `blog` VALUES ('35', '4', '2@2.com', '2012-12-03', '0', '0', '鸟叔要来中国了座驾八轮儿加长悍马陆军一号 我倒！江南style航母style起飞歼15', '', 'http://www.tudou.com/programs/view/hoJgeYkNoLw/?fr=rec2', null);
INSERT INTO `blog` VALUES ('36', '1', '3@3.com', '2012-12-03', '0', '0', '先朝鲜', '<span style=\"font-family:SimSun, Helvetica, sans-serif;color:#333333;font-size: 14px; line-height: 24px;\">朝鲜在上周末表示，计划于本月再次发射卫星，这一计划立即遭到了韩国和美国方面的谴责，朝鲜卫星发射计划被外界普遍视为对其远程弹道导弹技术的测试。4月份朝鲜曾发射了一枚据称携带卫星的运载火箭，但火箭升空后不久发生爆炸解体。朝鲜国家通讯社称，科学家及工程技术人员已经对上一次发射的错误进行了分析，并改进了运载火箭的可靠性，下一次试射日期定于12月10日至22日。对此美国国务院发布声明称，朝鲜再次发射卫星属于“极具挑衅性的行为”，将危及地区和平和安全。韩国外交部发布声明称，若执意进行发射，朝鲜将面临来自国际社会的强烈反应。日本方面，首相野田佳彦于</span>', ' ', null);
INSERT INTO `blog` VALUES ('37', '4', '3@3.com', '2012-12-03', '0', '0', '习近平强调“空谈误国  实干兴邦”  王岐山：开会不准念稿[超级新闻场]', '', 'http://v.youku.com/v_show/id_XNDgzMTUyOTUy.html', null);
INSERT INTO `blog` VALUES ('38', '2', '3@3.com', '2012-12-03', '0', '0', '', '', 'upload/20vHdQuqF1Qc.jpg,upload/O9ze5884JX6v.jpg,', null);
INSERT INTO `blog` VALUES ('40', '1', '2@2.com', '2012-12-03', '1', '1', '2', 'this is 2', ' ', null);
INSERT INTO `blog` VALUES ('41', '4', '2@2.com', '2012-12-03', '4', '1', '【拍客】吉林珲春再次拍到野生东北虎豹影像', '', 'http://v.youku.com/v_show/id_XNDgzMTUxNTI4.html', null);
INSERT INTO `blog` VALUES ('42', '3', '3@3.com', '2012-12-03', '2', '2', '2', '', 'http://www.w3school.com.cn/jquery/traversing_each.asp', null);
INSERT INTO `blog` VALUES ('43', '1', 'test@a.com', '2012-12-04', '0', '0', '无题', '<p align=\"justify\" style=\"margin: 0px 3px 15px; padding: 0px; font-family: 宋体; font-size: 16px; line-height: 26px; text-align: justify; text-indent: 30px;\">南京市民老罗最近快崩溃了，因为妻子蒋某的异常举动，好好的一个家被搅得天翻地覆。蒋某背着家人，偷偷拿着房产证到中介抵押了100多万元。面对家人的质问，蒋某居然振振有词：2012世界末日马上就来了，要赶紧把钱捐掉。</p><p align=\"justify\" style=\"margin: 0px 3px 15px; padding: 0px; font-family: 宋体; font-size: 16px; line-height: 26px; text-align: justify; text-indent: 30px;\">随着电影《2012》的热映，“2012世界末日论”引起了不少人的恐慌。其实，各国专家都已经对此进行驳斥，所谓的“末日”根本就是子虚乌有。大家还是不要恐慌，好好地过日子吧。</p>', ' ', null);
INSERT INTO `blog` VALUES ('44', '2', '2@2.com', '2012-12-04', '0', '0', '我的网站上', '', 'upload/hySuBz8Z9jpT.jpg,upload/QJIigLLu96gK.png,', null);
INSERT INTO `blog` VALUES ('48', '4', '3@3.com', '2012-12-04', '0', '0', '星闻速递 20121203  贺岁档pk盛宴  《少年派》完胜', '', 'http://www.56.com/u18/v_ODA4NTE1OTE.html', null);
INSERT INTO `blog` VALUES ('49', '2', '3@3.com', '2012-12-04', '0', '0', '', '', 'upload/3vp780YYUoKd.jpg,upload/Ma2ymQ3YeCal.jpg,', null);
INSERT INTO `blog` VALUES ('50', '1', 'test@a.com', '2012-12-04', '0', '1', '韩立宝花', '<span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">韩立眉头一皱，目光飞快向那头螟虫之母被击杀的地方扫了一眼，忽却然单手虚空一抓。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　　“嗖”的一声！</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　　那片看似空无一物的虚空，波动一起，一块拇指大小的漆黑晶珠竟凭空浮现，再一个闪动后，就没入到韩立手掌中。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　　“咦，这如……”宝花见此一愣，刚憩再说些什么时，整个深渊就一下天翻地覆般的崩溃开来，无数淡白色裂痕凭空在四狂涌而现，并以肉囘眼可见速度飞快粗大起来。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　　宝花脸色大变，单手一扬，手中一块赤红阵盘一亮而出，但方一嗡鸣声响起，一股诡异波动忽然从手上一扫而过。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　　滴溜溜转动的阵盘，顿时光芒一敛，重新变得静止不动起来。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　　“不行。那人果然使了手段，你我现在无法轻易离开此地的。”宝花玉容阴沉的说道。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　　“很正常。那人既然敢如此说，自然是有十足的把握留下你我的。”韩立却平静的说道。</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　</span><br style=\"font-family: 宋体; font-size: 14px; line-height: 24px; \" /><span style=\"font-family:宋体;font-size: 14px; line-height: 24px; \">　　宝花哼了一声，再想说些什么的时候，忽然二者四周灰蒙蒙光霞一卷，一个模糊光阵直接冲二人一罩而下。</span>', ' ', null);
INSERT INTO `blog` VALUES ('51', '5', 'test@a.com', '2012-12-04', '0', '0', null, null, null, '39');
INSERT INTO `blog` VALUES ('52', '5', 'test@a.com', '2012-12-04', '0', '0', null, null, null, '39');
INSERT INTO `blog` VALUES ('53', '4', '2@2.com', '2012-12-04', '0', '0', '朝鲜卫星计划牵动各方神经  韩联社', '', 'http://v.youku.com/v_show/id_XNDgzODY2NTg4.html', null);
INSERT INTO `blog` VALUES ('54', '3', '2@2.com', '2012-12-04', '0', '0', '我的blog', '', 'http://www.baidu.com/', null);
INSERT INTO `blog` VALUES ('55', '2', 'test@a.com', '2012-12-05', '0', '0', '', '', 'upload/ibq3zGiDn8DY.jpg,upload/ziTB7pomypJZ.jpg,', null);
INSERT INTO `blog` VALUES ('56', '5', 'test@a.com', '2012-12-05', '0', '0', null, null, null, '53');

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
INSERT INTO `blogtag` VALUES ('27', '朝鲜');
INSERT INTO `blogtag` VALUES ('27', '求职');
INSERT INTO `blogtag` VALUES ('30', '导弹');
INSERT INTO `blogtag` VALUES ('30', '朝鲜');
INSERT INTO `blogtag` VALUES ('39', '朝鲜');
INSERT INTO `blogtag` VALUES ('40', '2');
INSERT INTO `blogtag` VALUES ('41', '2');
INSERT INTO `blogtag` VALUES ('41', 'er');
INSERT INTO `blogtag` VALUES ('42', '2');
INSERT INTO `blogtag` VALUES ('42', '3c');
INSERT INTO `blogtag` VALUES ('43', '囧');
INSERT INTO `blogtag` VALUES ('44', 'IT');
INSERT INTO `blogtag` VALUES ('48', 'it');
INSERT INTO `blogtag` VALUES ('49', 'it');
INSERT INTO `blogtag` VALUES ('50', 'it');
INSERT INTO `blogtag` VALUES ('50', '坑');
INSERT INTO `blogtag` VALUES ('53', 'it');
INSERT INTO `blogtag` VALUES ('54', '2');
INSERT INTO `blogtag` VALUES ('54', 'it');
INSERT INTO `blogtag` VALUES ('54', '朝鲜');
INSERT INTO `blogtag` VALUES ('55', 'gfvku');
INSERT INTO `blogtag` VALUES ('55', 'nhfc');

-- ----------------------------
-- Table structure for `boke`
-- ----------------------------
DROP TABLE IF EXISTS `boke`;
CREATE TABLE `boke` (
  `bokeid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `bokename` varchar(255) NOT NULL,
  PRIMARY KEY (`bokeid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boke
-- ----------------------------
INSERT INTO `boke` VALUES ('1', 'test@a.com', '八度空间');
INSERT INTO `boke` VALUES ('2', 'test2@a.com', 'gggd');
INSERT INTO `boke` VALUES ('3', 'test3@a.com', '满天数星斗');
INSERT INTO `boke` VALUES ('4', 'r@r.com', '真一般');
INSERT INTO `boke` VALUES ('5', '6@6.com', '这是??');
INSERT INTO `boke` VALUES ('6', '2@2.com', '我的风格');
INSERT INTO `boke` VALUES ('7', '8@8.com', '我的博客');
INSERT INTO `boke` VALUES ('8', 'd@d.com', '我的博客');
INSERT INTO `boke` VALUES ('9', 'r@q.com', '我的妞妞');
INSERT INTO `boke` VALUES ('10', 'a@b.cd', '我的博客');
INSERT INTO `boke` VALUES ('11', 'a@b.cn', '我的博客');
INSERT INTO `boke` VALUES ('12', 'a@c.com', '我的博客');
INSERT INTO `boke` VALUES ('13', '1@1.com', '我的博客');
INSERT INTO `boke` VALUES ('14', '2@2.com', '我的风格');
INSERT INTO `boke` VALUES ('15', '3@3.com', '万山红遍');

-- ----------------------------
-- Table structure for `childblog`
-- ----------------------------
DROP TABLE IF EXISTS `childblog`;
CREATE TABLE `childblog` (
  `blogid` int(11) NOT NULL,
  `childid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`childid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of childblog
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `blogid` int(11) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1@1.com', '42', 'dd');
INSERT INTO `comment` VALUES ('2', '1@1.com', '42', '不错啊');
INSERT INTO `comment` VALUES ('3', '1@1.com', '41', '闪');
INSERT INTO `comment` VALUES ('4', '1@1.com', '41', '闪客，有用插件');
INSERT INTO `comment` VALUES ('5', '1@1.com', '41', '闪客，有用插件');
INSERT INTO `comment` VALUES ('6', 'test@a.com', '41', '东北虎？');
INSERT INTO `comment` VALUES ('7', 'test@a.com', '40', 'zhen 2 a');
INSERT INTO `comment` VALUES ('8', 'test@a.com', '39', 'jkhgfvl\n\n\n');

-- ----------------------------
-- Table structure for `followtag`
-- ----------------------------
DROP TABLE IF EXISTS `followtag`;
CREATE TABLE `followtag` (
  `email` varchar(255) NOT NULL,
  `tagname` varchar(255) NOT NULL,
  PRIMARY KEY (`email`,`tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followtag
-- ----------------------------
INSERT INTO `followtag` VALUES ('2@2.com', '2');
INSERT INTO `followtag` VALUES ('2@2.com', 'it');
INSERT INTO `followtag` VALUES ('test@a.com', '2');
INSERT INTO `followtag` VALUES ('test@a.com', 'it');
INSERT INTO `followtag` VALUES ('test@a.com', '朝鲜');

-- ----------------------------
-- Table structure for `followuser`
-- ----------------------------
DROP TABLE IF EXISTS `followuser`;
CREATE TABLE `followuser` (
  `email` varchar(255) NOT NULL,
  `useremail` varchar(255) NOT NULL,
  PRIMARY KEY (`email`,`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of followuser
-- ----------------------------
INSERT INTO `followuser` VALUES ('2@2.com', '3@3.com');
INSERT INTO `followuser` VALUES ('2@2.com', 'test@a.com');
INSERT INTO `followuser` VALUES ('3@3.com', '1@1.com');
INSERT INTO `followuser` VALUES ('3@3.com', '2@2.com');
INSERT INTO `followuser` VALUES ('test@a.com', '2@2.com');
INSERT INTO `followuser` VALUES ('test@a.com', '3@3.com');

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
INSERT INTO `likes` VALUES ('1@1.com', '42');
INSERT INTO `likes` VALUES ('test@a.com', '40');
INSERT INTO `likes` VALUES ('test@a.com', '41');
INSERT INTO `likes` VALUES ('test@a.com', '42');
INSERT INTO `likes` VALUES ('test@a.com', '50');

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
INSERT INTO `user` VALUES ('1@1.com', 'qwerty', '1', 'upload/portrait/portrait.png');
INSERT INTO `user` VALUES ('2@2.com', 'qwerty', '测试2', 'upload/portrait/cat.jpg');
INSERT INTO `user` VALUES ('3@3.com', 'qwerty', '测试3', 'upload/portrait/dog.jpg');
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
INSERT INTO `user` VALUES ('test@a.com', 'qwerty', 'nick', 'upload/portrait/dog.jpg');
