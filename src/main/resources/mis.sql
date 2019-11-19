/*
 Navicat Premium Data Transfer

 Source Server         : fvck
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : mis

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 19/11/2019 15:21:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NULL DEFAULT NULL,
  `activity_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activity_date` date NULL DEFAULT NULL,
  `activity_item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activity_duration` decimal(2, 1) NULL DEFAULT NULL,
  `activity_status` int(11) NULL DEFAULT NULL,
  `activity_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE,
  INDEX `FK_Reference_6`(`branch_id`) USING BTREE,
  INDEX `FK_Reference_19`(`activity_status`) USING BTREE,
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`activity_status`) REFERENCES `activity_status_map` (`activity_status`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, 2, '活动名', '2019-11-19', '阿斯顿', 1.5, 2, 'asd');

-- ----------------------------
-- Table structure for activity_status_map
-- ----------------------------
DROP TABLE IF EXISTS `activity_status_map`;
CREATE TABLE `activity_status_map`  (
  `activity_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`activity_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_status_map
-- ----------------------------
INSERT INTO `activity_status_map` VALUES (1, '未开始');
INSERT INTO `activity_status_map` VALUES (2, '进行中');
INSERT INTO `activity_status_map` VALUES (3, '已结束');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `user_account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_tel` decimal(11, 0) NULL DEFAULT NULL,
  `admin_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE,
  INDEX `FK_Reference_1`(`user_id`, `user_account`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`, `user_account`) REFERENCES `user` (`user_id`, `user_account`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1, 'admin', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `student_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `answer_option` int(11) NULL DEFAULT NULL,
  INDEX `FK_Reference_10`(`student_id`) USING BTREE,
  INDEX `FK_Reference_11`(`question_id`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `apply_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`) USING BTREE,
  INDEX `FK_Reference_12`(`student_id`) USING BTREE,
  INDEX `FK_Reference_16`(`apply_status`) USING BTREE,
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`apply_status`) REFERENCES `apply_status_map` (`apply_status`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES (1, 1, 3);
INSERT INTO `apply` VALUES (7, 2, 3);

-- ----------------------------
-- Table structure for apply_status_map
-- ----------------------------
DROP TABLE IF EXISTS `apply_status_map`;
CREATE TABLE `apply_status_map`  (
  `apply_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apply_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply_status_map
-- ----------------------------
INSERT INTO `apply_status_map` VALUES (1, '未提交申请');
INSERT INTO `apply_status_map` VALUES (2, '审核中');
INSERT INTO `apply_status_map` VALUES (3, '提交申请书阶段');
INSERT INTO `apply_status_map` VALUES (4, '党课培训阶段');
INSERT INTO `apply_status_map` VALUES (5, '提交思想汇报');
INSERT INTO `apply_status_map` VALUES (6, '申请转正');

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `activity_id` int(11) NOT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `attendance_status` int(11) NULL DEFAULT NULL,
  `attendance_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE,
  INDEX `FK_Reference_17`(`attendance_status`) USING BTREE,
  INDEX `FK_Reference_7`(`student_id`) USING BTREE,
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`attendance_status`) REFERENCES `attendance_status_map` (`attendance_status`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, 1, 6, NULL);

-- ----------------------------
-- Table structure for attendance_status_map
-- ----------------------------
DROP TABLE IF EXISTS `attendance_status_map`;
CREATE TABLE `attendance_status_map`  (
  `attendance_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance_status_map
-- ----------------------------
INSERT INTO `attendance_status_map` VALUES (1, '待参加');
INSERT INTO `attendance_status_map` VALUES (2, '待签到');
INSERT INTO `attendance_status_map` VALUES (3, '已签到');
INSERT INTO `attendance_status_map` VALUES (4, '待审核');
INSERT INTO `attendance_status_map` VALUES (5, '缺席');
INSERT INTO `attendance_status_map` VALUES (6, '请假');

-- ----------------------------
-- Table structure for branch
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch`  (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES (1, '无');
INSERT INTO `branch` VALUES (2, '服算1');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NULL DEFAULT NULL,
  `question_problem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_option_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_option_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_option_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_option_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_answer` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `FK_Reference_9`(`test_id`) USING BTREE,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_num` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `branch_id` int(11) NULL DEFAULT NULL,
  `student_permission` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `user_account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_status` int(11) NULL DEFAULT NULL,
  `student_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_tel` decimal(11, 0) NULL DEFAULT NULL,
  `student_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `FK_Reference_13`(`student_status`) USING BTREE,
  INDEX `FK_Reference_14`(`student_permission`) USING BTREE,
  INDEX `FK_Reference_15`(`user_id`, `user_account`) USING BTREE,
  INDEX `FK_Reference_8`(`branch_id`) USING BTREE,
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`student_status`) REFERENCES `student_status_map` (`student_status`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`student_permission`) REFERENCES `student_permission_map` (`student_permission`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`user_id`, `user_account`) REFERENCES `user` (`user_id`, `user_account`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '1', 2, 2, 2, 'stu', 2, 'student', '男', 123, '速度');
INSERT INTO `student` VALUES (2, '2', 2, 1, 3, 'stu2', 3, 'asd', '女', 74896, 'asd');

-- ----------------------------
-- Table structure for student_permission_map
-- ----------------------------
DROP TABLE IF EXISTS `student_permission_map`;
CREATE TABLE `student_permission_map`  (
  `student_permission` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_permission`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_permission_map
-- ----------------------------
INSERT INTO `student_permission_map` VALUES (1, '普通学生');
INSERT INTO `student_permission_map` VALUES (2, '管理员学生');

-- ----------------------------
-- Table structure for student_status_map
-- ----------------------------
DROP TABLE IF EXISTS `student_status_map`;
CREATE TABLE `student_status_map`  (
  `student_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_status_map
-- ----------------------------
INSERT INTO `student_status_map` VALUES (1, NULL);
INSERT INTO `student_status_map` VALUES (2, '非党员');
INSERT INTO `student_status_map` VALUES (3, '入党积极分子');
INSERT INTO `student_status_map` VALUES (4, '预备党员');
INSERT INTO `student_status_map` VALUES (5, '正式党员');

-- ----------------------------
-- Table structure for study
-- ----------------------------
DROP TABLE IF EXISTS `study`;
CREATE TABLE `study`  (
  `study_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_status` int(11) NULL DEFAULT NULL,
  `study_path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`study_id`) USING BTREE,
  INDEX `FK_Reference_18`(`study_status`) USING BTREE,
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`study_status`) REFERENCES `study_status_map` (`study_status`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for study_status_map
-- ----------------------------
DROP TABLE IF EXISTS `study_status_map`;
CREATE TABLE `study_status_map`  (
  `study_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`study_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `test_date_start` datetime(0) NULL DEFAULT NULL,
  `test_date_end` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`test_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_wechat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '1：管理员用户，2：学生用户',
  PRIMARY KEY (`user_id`, `user_account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'YWRtaW4=', 'admin', 1);
INSERT INTO `user` VALUES (2, 'stu', 'c3R1', 'stu', 2);
INSERT INTO `user` VALUES (3, 'stu2', 'c3R1', 'asd', 2);

-- ----------------------------
-- View structure for activity_view
-- ----------------------------
DROP VIEW IF EXISTS `activity_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `activity_view` AS select `activity`.`activity_id` AS `activity_id`,`branch`.`branch_id` AS `branch_id`,`branch`.`branch_name` AS `branch_name`,`activity_status_map`.`means` AS `means`,`activity`.`activity_name` AS `activity_name`,`activity`.`activity_date` AS `activity_date`,`activity`.`activity_item` AS `activity_item`,`activity`.`activity_duration` AS `activity_duration`,`activity`.`activity_location` AS `activity_location`,`activity_status_map`.`activity_status` AS `activity_status` from ((`activity` join `activity_status_map` on((`activity`.`activity_status` = `activity_status_map`.`activity_status`))) join `branch` on((`activity`.`branch_id` = `branch`.`branch_id`)));

-- ----------------------------
-- View structure for apply_view
-- ----------------------------
DROP VIEW IF EXISTS `apply_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `apply_view` AS select `apply_status_map`.`means` AS `apply_status`,`student`.`student_id` AS `student_id`,`student_status_map`.`means` AS `student_status`,`student_status_map`.`student_status` AS `permission` from (((`student` join `apply` on((`apply`.`student_id` = `student`.`student_id`))) join `apply_status_map` on((`apply`.`apply_status` = `apply_status_map`.`apply_status`))) join `student_status_map` on((`student`.`student_status` = `student_status_map`.`student_status`)));

-- ----------------------------
-- View structure for attendance_view
-- ----------------------------
DROP VIEW IF EXISTS `attendance_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `attendance_view` AS select `student`.`student_id` AS `student_id`,`activity`.`activity_id` AS `activity_id`,`activity`.`activity_name` AS `activity_name`,`activity`.`activity_date` AS `activity_date`,`activity`.`activity_item` AS `activity_item`,`activity`.`activity_duration` AS `activity_duration`,`attendance_status_map`.`means` AS `attendance_status`,`attendance`.`attendance_status` AS `attendance_status_id`,`activity`.`branch_id` AS `branch_id`,`branch`.`branch_name` AS `branch_name`,`student`.`student_num` AS `student_num`,`student`.`student_name` AS `student_name`,`student_status_map`.`means` AS `student_status`,`student_status_map`.`student_status` AS `student_status_id` from (((((`student` join `attendance` on((`attendance`.`student_id` = `student`.`student_id`))) join `attendance_status_map` on((`attendance`.`attendance_status` = `attendance_status_map`.`attendance_status`))) join `activity` on((`attendance`.`activity_id` = `activity`.`activity_id`))) join `branch` on(((`student`.`branch_id` = `branch`.`branch_id`) and (`activity`.`branch_id` = `branch`.`branch_id`)))) join `student_status_map` on((`student`.`student_status` = `student_status_map`.`student_status`)));

-- ----------------------------
-- View structure for student_view
-- ----------------------------
DROP VIEW IF EXISTS `student_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `student_view` AS select `student`.`student_id` AS `student_id`,`student`.`student_num` AS `student_num`,`student`.`student_name` AS `student_name`,`student`.`student_tel` AS `student_tel`,`student`.`student_email` AS `student_email`,`branch`.`branch_name` AS `branch_name`,`student_permission_map`.`means` AS `student_permission`,`student_status_map`.`means` AS `student_status`,`student`.`student_gender` AS `student_gender` from (((`student` join `branch` on((`student`.`branch_id` = `branch`.`branch_id`))) join `student_permission_map` on((`student`.`student_permission` = `student_permission_map`.`student_permission`))) join `student_status_map` on((`student`.`student_status` = `student_status_map`.`student_status`)));

SET FOREIGN_KEY_CHECKS = 1;
