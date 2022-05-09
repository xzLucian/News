/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50515
 Source Host           : localhost:3306
 Source Schema         : sk_three

 Target Server Type    : MySQL
 Target Server Version : 50515
 File Encoding         : 65001

 Date: 28/04/2022 11:03:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `aid` int(12) NOT NULL AUTO_INCREMENT,
  `atitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `astate` int(255) NOT NULL,
  `atype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `astar` int(255) NOT NULL DEFAULT 0,
  `imgSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (7, '高以翔去世', '测试编辑', '11月27日凌晨，有知名博主爆料，演员高以翔在节目录制过程中晕倒抢救，该博主还晒出了救护车的照片，并表示高以翔已经送到医院抢救。本端证实高以翔抢救无效去世。\r\n\r\n网上曝出高以翔就医的细节，情况十分危险。爆料者透露，高以翔到医院是瞳孔已经到放大到边缘。', '2019-11-28', 1, '要闻', 1, 'https://s2.ax1x.com/2019/12/10/QD8ckD.jpg');
INSERT INTO `article` VALUES (14, 'test', '测试编辑', 'test', '2022-2-10', 1, '要闻', 0, 'https://s2.ax1x.com/2019/12/10/QDYs00.jpg');
INSERT INTO `article` VALUES (15, '123', '测试编辑', '123123', '2022-2-11', 1, '要闻', 0, 'https://s2.ax1x.com/2019/12/10/QDYIn1.jpg');
INSERT INTO `article` VALUES (16, '奥巴马吃西瓜', 'test2', '奥巴马吃西瓜西西瓜', '2021-12-11', 1, '游戏', 0, 'https://images.unsplash.com/photo-1576000844795-109adb192b68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60');
INSERT INTO `article` VALUES (17, '萨达姆切西瓜', '测试编辑', '看我左手右手一个慢动作', '2022-3-8', 1, '要闻', 0, 'https://t1.picb.cc/uploads/2019/12/11/kejCY6.png');
INSERT INTO `article` VALUES (19, '海贼王RED', '测试编辑', '时隔两年的海贼王剧场版终于有新情报了，海贼王新一期的剧场版终于要来了，这也是为了庆祝《海贼王》动画1000话的上映，特意准备草帽团船员的系列海报。而每张海报中都有一个字是特意标红的，连在一起便是“op film soon”，所以海贼王大电影要来了。随后官方便正式官宣了，海贼王最新剧场版，作者尾田担任综合制片人，定档时间为2022年8月6日，并且尾田亲自给剧场版命名为《red》', '2022-03-30', 1, '要闻', 1, 'https://inews.gtimg.com/newsapp_bt/0/14211971859/1000');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `uid` int(11) NULL DEFAULT NULL,
  `aid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (8, 1);
INSERT INTO `collection` VALUES (4, 7);
INSERT INTO `collection` VALUES (7, 10);
INSERT INTO `collection` VALUES (13, 7);
INSERT INTO `collection` VALUES (1, 7);
INSERT INTO `collection` VALUES (8, 14);
INSERT INTO `collection` VALUES (4, 19);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `aid` int(12) NOT NULL,
  `cid` int(12) NOT NULL AUTO_INCREMENT,
  `cauthor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, '测试评论', '这是一条测试评论');
INSERT INTO `comment` VALUES (1, 11, 'admin', '来自admin用户的评论');
INSERT INTO `comment` VALUES (2, 12, '测试编辑', '来自测试编辑的评论');
INSERT INTO `comment` VALUES (3, 15, 'test2', '哈哈哈');
INSERT INTO `comment` VALUES (1, 16, 'admin', 'qqqq');
INSERT INTO `comment` VALUES (1, 17, '1234', '啊啊啊啊');
INSERT INTO `comment` VALUES (7, 18, '测试编辑', '111');
INSERT INTO `comment` VALUES (15, 19, '测试编辑', '12231');
INSERT INTO `comment` VALUES (7, 20, '1234', 'qqqqq');
INSERT INTO `comment` VALUES (7, 21, '1234', '');
INSERT INTO `comment` VALUES (7, 22, '1234', '');
INSERT INTO `comment` VALUES (7, 23, 'test', '111\r\n');
INSERT INTO `comment` VALUES (19, 24, 'test', '期待');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `uid` int(11) NULL DEFAULT NULL,
  `aid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, 3);
INSERT INTO `history` VALUES (7, 3);
INSERT INTO `history` VALUES (1, 1);
INSERT INTO `history` VALUES (8, 1);
INSERT INTO `history` VALUES (7, 10);
INSERT INTO `history` VALUES (8, 7);
INSERT INTO `history` VALUES (2, 7);
INSERT INTO `history` VALUES (1, 7);
INSERT INTO `history` VALUES (7, 16);
INSERT INTO `history` VALUES (7, 7);
INSERT INTO `history` VALUES (8, 16);
INSERT INTO `history` VALUES (2, 19);
INSERT INTO `history` VALUES (4, 7);
INSERT INTO `history` VALUES (4, 17);
INSERT INTO `history` VALUES (8, 14);
INSERT INTO `history` VALUES (4, 19);

-- ----------------------------
-- Table structure for star
-- ----------------------------
DROP TABLE IF EXISTS `star`;
CREATE TABLE `star`  (
  `uid` int(11) NOT NULL,
  `aid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of star
-- ----------------------------
INSERT INTO `star` VALUES (4, 7);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '要闻');
INSERT INTO `type` VALUES (2, '生活');
INSERT INTO `type` VALUES (3, '娱乐');
INSERT INTO `type` VALUES (4, '游戏');
INSERT INTO `type` VALUES (6, '军事');
INSERT INTO `type` VALUES (7, '动漫');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(255) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upower` int(255) NULL DEFAULT 2,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (2, 'abc', 'abc', '测试编辑', 1);
INSERT INTO `user` VALUES (4, 'test', 'test', 'test', 2);
INSERT INTO `user` VALUES (7, 'test2', 'test2', 'test2', 1);
INSERT INTO `user` VALUES (8, '1234', '1234', '1234', 2);
INSERT INTO `user` VALUES (9, '12345', '12345', '12345', 1);
INSERT INTO `user` VALUES (10, '12346', '12345', '12345', 2);
INSERT INTO `user` VALUES (14, '456', '456', '456', 1);
INSERT INTO `user` VALUES (15, 'aaaaaa', 'aaaaaa', 'bbbbbb', 2);
INSERT INTO `user` VALUES (17, 'lvlei', 'lvlei', 'lvlei', 1);

SET FOREIGN_KEY_CHECKS = 1;
