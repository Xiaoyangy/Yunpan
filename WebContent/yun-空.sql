/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : yun

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2017-11-03 14:46:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for `office`
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office` (
  `officeid` varchar(32) NOT NULL,
  `officeMd5` varchar(32) NOT NULL,
  PRIMARY KEY (`officeMd5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of office
-- ----------------------------
INSERT INTO `office` VALUES ('doc-hi2m3psn08i4smn', '3AC0DD267D32943CF839077793B7CEB5');
INSERT INTO `office` VALUES ('doc-hjkmw0rhhqj1b9a', 'C9F575B30E794F8A10DE898ACFFC906A');
INSERT INTO `office` VALUES ('doc-hjar6mysr2et8ep', 'E82BC0449F096AD446B20F2516DAE912');

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `shareId` int(11) NOT NULL AUTO_INCREMENT,
  `shareUrl` varchar(32) NOT NULL,
  `path` varchar(255) NOT NULL,
  `shareUser` varchar(20) NOT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1公开 2加密 -1已取消',
  `command` varchar(4) DEFAULT NULL COMMENT '提取码',
  PRIMARY KEY (`shareId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `countSize` varchar(20) DEFAULT '0.0B',
  `totalSize` varchar(20) DEFAULT '10.0GB',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1234', '81DC9BDB52D04DC20036DBD8313ED055', '10.9MB', '10.0GB');
