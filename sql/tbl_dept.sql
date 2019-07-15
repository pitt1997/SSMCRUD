/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2019-07-15 11:56:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1', '开发部');
INSERT INTO `tbl_dept` VALUES ('2', '人事部');
INSERT INTO `tbl_dept` VALUES ('3', '开发部02');
INSERT INTO `tbl_dept` VALUES ('4', '测试部');
INSERT INTO `tbl_dept` VALUES ('5', '开发部03');
INSERT INTO `tbl_dept` VALUES ('6', '测试部02');
