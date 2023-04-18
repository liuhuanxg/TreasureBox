/*
 Navicat Premium Data Transfer

 Source Server         : MyOwn
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 39.96.23.94:3306
 Source Schema         : msb_db

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 24/04/2021 02:02:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `tags` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, 'xiaomi phone', 'shouji zhong de zhandouji', 3999, '2021-06-01', '\"xingjiabi\", \"fashao\",\"buka\"');
INSERT INTO `product` VALUES (2, 'xiaomi nfc phone', 'zhichi quangongneng nfc,shouji zhong de jianjiji', 4999, '2021-06-02', '\"xingjiabi\", \"fashao\",\"gongjiaoka\"');
INSERT INTO `product` VALUES (3, 'nfc phone', 'shouji zhong de hongzhaji ', 2999, '2021-06-03', '\"xingjiabi\", \"fashao\",\n\"menjinka\"');
INSERT INTO `product` VALUES (4, 'xiaomi erji', 'erji zhong de huangmenji', 999, '2021-04-15', '\"low\", \"bufangshui\",\"yinzhicha\"');
INSERT INTO `product` VALUES (5, 'hongmi erji', 'erji zhong de kendeji nfc', 399, '2021-04-16', '\"lowbee\",\"xuhangduan\",\n \"zhiliangx\"');
INSERT INTO `product` VALUES (6, NULL, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
