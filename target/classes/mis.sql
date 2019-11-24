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

 Date: 24/11/2019 15:01:49
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
  `activity_item` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activity_duration` decimal(2, 1) NULL DEFAULT NULL,
  `activity_status` int(11) NULL DEFAULT NULL,
  `activity_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE,
  INDEX `FK_Reference_6`(`branch_id`) USING BTREE,
  INDEX `FK_Reference_19`(`activity_status`) USING BTREE,
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`activity_status`) REFERENCES `activity_status_map` (`activity_status`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `activity` VALUES (2, 2, '这是个活动名称', '2019-11-21', '<p>阿斯顿<br/></p>', 1.0, 2, '主教1811');
INSERT INTO `activity` VALUES (3, 2, '阿斯达斯', '2019-11-23', '<p><img title=\"1574506854946091059.png\" alt=\"乾隆.png\" src=\"/mis/upload/image/20191123/1574506854946091059.png\"/></p>', 2.0, 2, 'asd ');
INSERT INTO `activity` VALUES (4, 2, '今天补上吧', '2019-11-23', '<p>阿斯顿请问<br/></p>', 2.0, 2, '真心的');
INSERT INTO `activity` VALUES (5, 2, '七万二请问', '2019-11-24', '', 1.0, 2, '大苏打');
INSERT INTO `activity` VALUES (6, 2, '什么哦', '2019-11-24', '<p style=\"line-height: 16px;\"><img src=\"/mis/utf8-jsp/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/upload/file/20191124/1574571863096053617.jpg\" title=\"包拯.jpg\">包拯.jpg</a></p><p><br/></p>', 1.5, 2, '安全');

-- ----------------------------
-- Table structure for activity_status_map
-- ----------------------------
DROP TABLE IF EXISTS `activity_status_map`;
CREATE TABLE `activity_status_map`  (
  `activity_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`activity_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `test_id` int(11) NULL DEFAULT NULL,
  `answer_date` date NULL DEFAULT NULL,
  INDEX `FK_Reference_10`(`student_id`) USING BTREE,
  INDEX `FK_Reference_11`(`question_id`) USING BTREE,
  INDEX `FK_Reference_test`(`test_id`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_test` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (2, 1, 1, 4, '2019-11-22');
INSERT INTO `answer` VALUES (2, 2, 1, 4, '2019-11-22');
INSERT INTO `answer` VALUES (3, 1, 3, 4, '2019-11-23');
INSERT INTO `answer` VALUES (3, 2, 3, 4, '2019-11-23');

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES (9, 3, 3);
INSERT INTO `apply` VALUES (10, 3, 3);
INSERT INTO `apply` VALUES (11, 1, 3);
INSERT INTO `apply` VALUES (12, 2, 3);

-- ----------------------------
-- Table structure for apply_status_map
-- ----------------------------
DROP TABLE IF EXISTS `apply_status_map`;
CREATE TABLE `apply_status_map`  (
  `apply_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`apply_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `attendance_status` int(11) NULL DEFAULT NULL,
  `attendance_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `FK_Reference_attendance_status`(`attendance_status`) USING BTREE,
  INDEX `FK_Reference_activity_id`(`activity_id`) USING BTREE,
  INDEX `FK_Reference_student_id`(`student_id`) USING BTREE,
  CONSTRAINT `FK_Reference_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_attendance_status` FOREIGN KEY (`attendance_status`) REFERENCES `attendance_status_map` (`attendance_status`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (3, 2, 1, 4, 'E:\\ProgramStation\\eclipse\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mis\\\\upload_attendance_pic\\1_2.jpg');
INSERT INTO `attendance` VALUES (4, 2, 1, 3, NULL);
INSERT INTO `attendance` VALUES (5, 3, 1, 3, NULL);
INSERT INTO `attendance` VALUES (6, 3, 3, 2, NULL);
INSERT INTO `attendance` VALUES (7, 4, 1, 2, NULL);
INSERT INTO `attendance` VALUES (8, 4, 3, 3, 'C:\\mis\\data\\upload_attendance_pic\\3_4.jpg');
INSERT INTO `attendance` VALUES (9, 5, 2, 2, NULL);
INSERT INTO `attendance` VALUES (10, 5, 3, 2, NULL);
INSERT INTO `attendance` VALUES (11, 6, 2, 2, NULL);
INSERT INTO `attendance` VALUES (12, 6, 3, 2, NULL);

-- ----------------------------
-- Table structure for attendance_status_map
-- ----------------------------
DROP TABLE IF EXISTS `attendance_status_map`;
CREATE TABLE `attendance_status_map`  (
  `attendance_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES (1, '无');
INSERT INTO `branch` VALUES (2, '服算1');

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `FK_Reference_test_id`(`test_id`) USING BTREE,
  INDEX `FK_Reference_question_id`(`question_id`) USING BTREE,
  CONSTRAINT `FK_Reference_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_test_id` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES (1, 2, 1);
INSERT INTO `examination` VALUES (2, 2, 2);
INSERT INTO `examination` VALUES (3, 4, 1);
INSERT INTO `examination` VALUES (4, 4, 2);
INSERT INTO `examination` VALUES (5, NULL, 2);
INSERT INTO `examination` VALUES (6, NULL, 4);
INSERT INTO `examination` VALUES (7, 5, 1);
INSERT INTO `examination` VALUES (8, 5, 2);
INSERT INTO `examination` VALUES (9, 5, 4);

-- ----------------------------
-- Table structure for material_type_map
-- ----------------------------
DROP TABLE IF EXISTS `material_type_map`;
CREATE TABLE `material_type_map`  (
  `material_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `material_type_from` int(255) NULL DEFAULT NULL,
  `student_status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`material_type_id`) USING BTREE,
  INDEX `student_status`(`student_status`) USING BTREE,
  CONSTRAINT `student_status` FOREIGN KEY (`student_status`) REFERENCES `student_status_map` (`student_status`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material_type_map
-- ----------------------------
INSERT INTO `material_type_map` VALUES (1, '入党申请书', 1, 2);
INSERT INTO `material_type_map` VALUES (2, '个人自传', 1, 2);
INSERT INTO `material_type_map` VALUES (3, '推荐表', 1, 2);
INSERT INTO `material_type_map` VALUES (4, '入党积极分子结业证', 1, 2);
INSERT INTO `material_type_map` VALUES (5, '积极分子思想汇报', 1, 2);
INSERT INTO `material_type_map` VALUES (6, '入党积极分子公示表', 2, 2);
INSERT INTO `material_type_map` VALUES (7, '入党前征求党内外群众意见记录表', 2, 3);
INSERT INTO `material_type_map` VALUES (8, '发展对象票决情况汇总表', 2, 3);
INSERT INTO `material_type_map` VALUES (9, '课程成绩证明', 2, 3);
INSERT INTO `material_type_map` VALUES (10, '本人政审材料', 2, 3);
INSERT INTO `material_type_map` VALUES (11, '家庭主要成员政治审查材料', 2, 3);
INSERT INTO `material_type_map` VALUES (12, '入党前公示表', 2, 3);
INSERT INTO `material_type_map` VALUES (13, '入党积极分子培养教育考察登记簿', 2, 3);
INSERT INTO `material_type_map` VALUES (14, '入党志愿书', 2, 4);
INSERT INTO `material_type_map` VALUES (15, '接收预备党员票决情况汇总表', 2, 4);
INSERT INTO `material_type_map` VALUES (16, '预备党员教育考察登记簿', 2, 5);
INSERT INTO `material_type_map` VALUES (17, '预备党员思想汇报', 1, 5);
INSERT INTO `material_type_map` VALUES (18, '转正申请书', 1, 5);
INSERT INTO `material_type_map` VALUES (19, '预备党员拟转正公示表', 2, 5);
INSERT INTO `material_type_map` VALUES (20, '转正票决汇总', 2, 5);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_problem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_option_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_option_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_option_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_option_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_answer` int(11) NULL DEFAULT NULL,
  `question_status` int(1) NULL DEFAULT NULL COMMENT '0:被移出题库 1：在题库中',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '问题1das问题1das问题1das问题1das问题1das问题1das问题1das问题1das问题1das', '答案是Ad答案是Ad答案是Ad', '答案是Add答案是Ad', '答案是dd答案是Ad', '答案是d答案是d答案是d', 4, 0);
INSERT INTO `question` VALUES (2, '问题2', '答c', '答案cc', '答案是c', 'c', 3, 0);
INSERT INTO `question` VALUES (4, '王博韬是谁？？', '不知道', '傻逼', '韬神', '以上都对', 4, 1);
INSERT INTO `question` VALUES (5, '张子旭是谁？', '帅哥', '旭神', '前端之王', '以上都对', 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '1', 1, 1, 2, 'stu', 6, '正式党员牛牛', '男', 18002337921, '664037252@qq.com');
INSERT INTO `student` VALUES (2, '2', 2, 1, 3, 'stu2', 2, '非党员的小张', '男', 18002337921, '664037252@qq.com');
INSERT INTO `student` VALUES (3, '3', 2, 2, 4, 'stu3', 6, '学生管理员大狗', '女', 18002337921, '664037252@qq.com');

-- ----------------------------
-- Table structure for student_permission_map
-- ----------------------------
DROP TABLE IF EXISTS `student_permission_map`;
CREATE TABLE `student_permission_map`  (
  `student_permission` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`student_permission`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_status_map
-- ----------------------------
INSERT INTO `student_status_map` VALUES (1, ' ');
INSERT INTO `student_status_map` VALUES (2, '非党员');
INSERT INTO `student_status_map` VALUES (3, '入党积极分子');
INSERT INTO `student_status_map` VALUES (4, '拟发展对象');
INSERT INTO `student_status_map` VALUES (5, '预备党员');
INSERT INTO `student_status_map` VALUES (6, '正式党员');

-- ----------------------------
-- Table structure for student_status_material
-- ----------------------------
DROP TABLE IF EXISTS `student_status_material`;
CREATE TABLE `student_status_material`  (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_type_id` int(11) NULL DEFAULT NULL,
  `material_date` date NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `material_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`material_id`) USING BTREE,
  INDEX `student_status_material_Reference_material_type_id`(`material_type_id`) USING BTREE,
  INDEX `student_status_material_Reference_student_id`(`student_id`) USING BTREE,
  CONSTRAINT `student_status_material_Reference_material_type_id` FOREIGN KEY (`material_type_id`) REFERENCES `material_type_map` (`material_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_status_material_Reference_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_status_material
-- ----------------------------
INSERT INTO `student_status_material` VALUES (102, 1, '2019-11-23', 1, '已提交');
INSERT INTO `student_status_material` VALUES (103, 2, '2019-11-23', 1, 'C:\\mis\\dataupload_join_material\\1_2.pdf');
INSERT INTO `student_status_material` VALUES (104, 3, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (105, 4, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (106, 5, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (107, 6, '2019-11-23', 1, '已提交');
INSERT INTO `student_status_material` VALUES (108, 7, '2019-11-23', 1, '已提交');
INSERT INTO `student_status_material` VALUES (109, 8, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (110, 9, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (111, 10, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (112, 11, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (113, 12, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (114, 13, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (115, 14, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (116, 15, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (117, 16, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (118, 17, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (119, 18, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (120, 19, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (121, 20, NULL, 1, NULL);
INSERT INTO `student_status_material` VALUES (122, 1, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (123, 2, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (124, 3, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (125, 4, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (126, 5, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (127, 6, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (128, 7, '2019-11-24', 2, '已提交');
INSERT INTO `student_status_material` VALUES (129, 8, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (130, 9, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (131, 10, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (132, 11, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (133, 12, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (134, 13, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (135, 14, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (136, 15, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (137, 16, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (138, 17, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (139, 18, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (140, 19, NULL, 2, NULL);
INSERT INTO `student_status_material` VALUES (141, 20, NULL, 2, NULL);

-- ----------------------------
-- Table structure for student_status_record
-- ----------------------------
DROP TABLE IF EXISTS `student_status_record`;
CREATE TABLE `student_status_record`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `student_status` int(11) NULL DEFAULT NULL,
  `record_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `student_status_record_Reference_student_id`(`student_id`) USING BTREE,
  INDEX `student_status_record_Reference_student_status`(`student_status`) USING BTREE,
  CONSTRAINT `student_status_record_Reference_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_status_record_Reference_student_status` FOREIGN KEY (`student_status`) REFERENCES `student_status_map` (`student_status`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_status_record
-- ----------------------------
INSERT INTO `student_status_record` VALUES (1, 1, 2, '2019-11-17');
INSERT INTO `student_status_record` VALUES (2, 1, 3, '2019-11-18');
INSERT INTO `student_status_record` VALUES (3, 3, 6, '2019-11-01');
INSERT INTO `student_status_record` VALUES (4, 2, 6, '2019-11-20');

-- ----------------------------
-- Table structure for study
-- ----------------------------
DROP TABLE IF EXISTS `study`;
CREATE TABLE `study`  (
  `study_id` int(11) NOT NULL AUTO_INCREMENT,
  `study_status` int(11) NULL DEFAULT NULL,
  `study_content` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `study_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `study_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`study_id`) USING BTREE,
  INDEX `FK_Reference_18`(`study_status`) USING BTREE,
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`study_status`) REFERENCES `study_status_map` (`study_status`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of study
-- ----------------------------
INSERT INTO `study` VALUES (4, 3, '<p>	</p><p><br/></p><p><br/></p><p><br/></p><p style=\"text-align: center; font-family: 宋体; font-size: 12pt;\"><span style=\"font-family: 宋体; font-size: 12pt;\"><span style=\"font-family: 宋体; font-size: 12pt;\"><span style=\"color: rgb(128, 0, 0); font-family: 宋体; font-size: 12pt; font-weight: bold;\">习近平在学习贯彻党的十九大精神研讨班开班式上发表重要讲话强调<br/></span></span></span><span style=\"color: rgb(128, 0, 0); font-size: 12pt; font-weight: bold;\">以时不我待只争朝夕的精神投入工作<br/></span><span style=\"color: rgb(128, 0, 0); font-size: 12pt; font-weight: bold;\">开创新时代中国特色社会主义事业新局面</span></p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\"><span style=\"color: rgb(128, 0, 0); font-family: 宋体; font-size: 12pt; font-weight: bold;\">习近平强调，建设好我们这样的大党，领导好我们这样的大国，中央委员会成员和省部级主要领导干部至关重要，必须提高政治站位、树立历史眼光、强化理论思维、增强大局观念、丰富知识素养、坚持问题导向，从历史和现实相贯通、国际和国内相关联、理论和实际相结合的宽广视角，对一些重大理论和实践问题进行思考和把握，做到坚持和发展中国特色社会主义要一以贯之，推进党的建设新的伟大工程要一以贯之，增强忧患意识、防范风险挑战要一以贯之，以时不我待、只争朝夕的精神投入工作，推动全党全国各族人民把思想统一到党的十九大精神上来，把力量凝聚到实现党的十九大确定的目标任务上来，不断开创新时代中国特色社会主义事业新局面。</span></p><p style=\"text-align: center; font-family: 宋体; font-size: 12pt;\"><span style=\"color: rgb(128, 0, 0); font-family: 宋体; font-size: 12pt; font-weight: bold;\">李克强主持 栗战书汪洋王沪宁赵乐际韩正出席</span></p><p style=\"text-align: center;\"><img title=\"1574161083185083341.png\" alt=\"图片.png\" src=\"/mis/upload/image/20191119/1574161083185083341.png\"/><br/></p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">新华社北京1月5日电\r\n \r\n新进中央委员会的委员、候补委员和省部级主要领导干部学习贯彻习近平新时代中国特色社会主义思想和党的十九大精神研讨班5日上午在中央党校开班。中共中央总书记、国家主席、中央军委主席习近平在开班式上发表重要讲话强调，建设好我们这样的大党，领导好我们这样的大国，中央委员会成员和省部级主要领导干部至关重要，必须提高政治站位、树立历史眼光、强化理论思维、增强大局观念、丰富知识素养、坚持问题导向，从历史和现实相贯通、国际和国内相关联、理论和实际相结合的宽广视角，对一些重大理论和实践问题进行思考和把握，做到坚持和发展中国特色社会主义要一以贯之，推进党的建设新的伟大工程要一以贯之，增强忧患意识、防范风险挑战要一以贯之，以时不我待、只争朝夕的精神投入工作，推动全党全国各族人民把思想统一到党的十九大精神上来，把力量凝聚到实现党的十九大确定的目标任务上来，不断开创新时代中国特色社会主义事业新局面。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">开班式由中共中央政治局常委李克强主持，中共中央政治局常委栗战书、汪洋、王沪宁、赵乐际、韩正出席。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平在讲话中强调，新时代中国特色社会主义是我们党领导人民进行伟大社会革命的成果，也是我们党领导人民进行伟大社会革命的继续，必须一以贯之进行下去。历史和现实都告诉我们，一场社会革命要取得最终胜利，往往需要一个漫长的历史过程。只有回看走过的路、比较别人的路、远眺前行的路，弄清楚我们从哪儿来、往哪儿去，很多问题才能看得深、把得准。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平强调，中国特色社会主义不是从天上掉下来的，而是在改革开放40年的伟大实践中得来的，是在中华人民共和国成立近70年的持续探索中得来的，是在我们党领导人民进行伟大社会革命97年的实践中得来的，是在近代以来中华民族由衰到盛170多年的历史进程中得来的，是对中华文明5000多年的传承发展中得来的，是党和人民历经千辛万苦、付出各种代价取得的宝贵成果。得到这个成果极不容易。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平指出，科学社会主义在中国的成功，对马克思主义、科学社会主义的意义，对世界社会主义的意义，是十分重大的。党的十九大作出中国特色社会主义进入新时代这个重大政治论断，我们必须认识到，这个新时代是中国特色社会主义新时代，而不是别的什么新时代。党要在新的历史方位上实现新时代党的历史使命，最根本的就是要高举中国特色社会主义伟大旗帜。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平强调，不忘初心，牢记使命，就不要忘记我们是共产党人，我们是革命者，不要丧失了革命精神。昨天的成功并不代表着今后能够永远成功，过去的辉煌并不意味着未来可以永远辉煌。时代是出卷人，我们是答卷人，人民是阅卷人。要实现党和国家兴旺发达、长治久安，全党同志必须保持革命精神、革命斗志，勇于把我们党领导人民进行了97年的伟大社会革命继续推进下去，决不能因为胜利而骄傲，决不能因为成就而懈怠，决不能因为困难而退缩，努力使中国特色社会主义展现更加强大、更有说服力的真理力量。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平指出，要把新时代坚持和发展中国特色社会主义这场伟大社会革命进行好，我们党必须勇于进行自我革命，把党建设得更加坚强有力。勇于自我革命，从严管党治党，是我们党最鲜明的品格，全面从严治党永远在路上。在统揽伟大斗争、伟大工程、伟大事业、伟大梦想中，起决定性作用的是新时代党的建设新的伟大工程。在新时代，我们党必须以党的自我革命来推动党领导人民进行的伟大社会革命，把党建设成为始终走在时代前列、人民衷心拥护、勇于自我革命、经得起各种风浪考验、朝气蓬勃的马克思主义执政党，这既是我们党领导人民进行伟大社会革命的客观要求，也是我们党作为马克思主义政党建设和发展的内在需要。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平强调，必须看到，决胜全面建成小康社会的艰巨任务、实现中华民族伟大复兴的历史使命，对我们党提出了前所未有的新挑战新要求，影响党的先进性、弱化党的纯洁性的各种因素具有很强的危险性和破坏性。这决定了新时代党的建设新的伟大工程，既要培元固本，也要开拓创新，既要把住关键重点，也要形成整体态势，特别是要发挥彻底的自我革命精神。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平指出，以史为鉴可以知兴替。功成名就时做到居安思危、保持创业初期那种励精图治的精神状态不容易，执掌政权后做到节俭内敛、敬终如始不容易，承平时期严以治吏、防腐戒奢不容易，重大变革关头顺乎潮流、顺应民心不容易。我们党要始终成为时代先锋、民族脊梁，始终成为马克思主义执政党，自身必须始终过硬。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平强调，要把我们党建设好，必须抓住“关键少数”。中央委员会成员和省部级主要领导干部必须做到信念过硬，带头做共产主义远大理想和中国特色社会主义共同理想的坚定信仰者和忠实实践者；必须做到政治过硬，牢固树立“四个意识”，在思想政治上讲政治立场、政治方向、政治原则、政治道路，在行动实践上讲维护党中央权威、执行党的政治路线、严格遵守党的政治纪律和政治规矩；必须做到责任过硬，树立正确政绩观，发扬求真务实、真抓实干的作风，以钉钉子精神担当尽责，真正做到对历史和人民负责；必须做到能力过硬，不断掌握新知识、熟悉新领域、开拓新视野，全面提高领导能力和执政水平；必须做到作风过硬，把人民群众放在心中，广泛开展调查研究，在全心全意为人民服务中提升政治站位、提高工作能力，在真心实意向人民学习中拓展工作视野、丰富工作经验、提高理论联系实际的水平，在倾听人民呼声、虚心接受人民监督中自觉进行自我反省、自我批评、自我教育，在服务人民中不断完善自己，持之以恒克服形式主义、官僚主义，久久为功祛除享乐主义和奢靡之风。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平指出，领导干部要把践行“三严三实”贯穿于全部工作生活中，养成一种习惯、化为一种境界。要加强道德修养，带头弘扬社会主义核心价值观，明辨是非善恶，追求健康情趣，不断向廉洁自律的高标准看齐，做到心有所戒、行有所止，守住底线、不碰高压线。每个领导干部都应该把洁身自好作为第一关，从小事小节上加强约束、规范自己，坚决反对特权思想、特权现象，习惯在受监督和约束的环境中工作生活，炼就过硬的作风。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">习近平强调，“备豫不虞，为国常道”。当前，我国正处于一个大有可为的历史机遇期，发展形势总的是好的，但前进道路不可能一帆风顺，越是取得成绩的时候，越是要有如履薄冰的谨慎，越是要有居安思危的忧患，绝不能犯战略性、颠覆性错误。面对波谲云诡的国际形势、复杂敏感的周边环境、艰巨繁重的改革发展稳定任务，我们既要有防范风险的先手，也要有应对和化解风险挑战的高招；既要打好防范和抵御风险的有准备之战，也要打好化险为夷、转危为机的战略主动战。我们要继续进行具有许多新的历史特点的伟大斗争，准备战胜一切艰难险阻，朝着我们党确立的伟大目标奋勇前进。</p><p style=\"text-align: center;\"><img title=\"1574161174663051535.png\" alt=\"图片.png\" src=\"/mis/upload/image/20191119/1574161174663051535.png\"/></p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\"><span style=\"text-indent: 2em; font-size: 12pt;\">李克强在主持开班式时指出，习近平总书记十分重要的讲话深刻阐述了坚持和发展中国特色社会主义要一以贯之、推进党的建设新的伟大工程要一以贯之、增强忧患意识防范风险挑战要一以贯之等重大问题，对我们深入理解和贯彻落实党的十九大精神，深入理解和把握习近平新时代中国特色社会主义思想，深入理解和贯彻党中央推进全面从严治党的决策部署，进一步增强新时代坚持和发展中国特色社会主义、实现中华民族伟大复兴中国梦的信心和定力，具有十分重大的指导意义。一定要认真学习、深刻领会、切实贯彻。</span></p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">中共中央政治局委员、中央书记处书记，是十九届中央委员的其他党和国家领导同志、中央军委委员出席开班式。</p><p style=\"text-indent: 2em; font-family: 宋体; font-size: 12pt;\">新进中央委员会的委员、候补委员，各省区市和新疆生产建设兵团、中央和国家机关有关部门主要负责同志，军队各大单位、中央军委机关各部门主要负责同志参加研讨班。各民主党派中央、全国工商联及有关方面负责同志列席开班式。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;\r\n &nbsp; &nbsp; &nbsp; &nbsp;	<span style=\"color: rgb(0, 0, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<br/></span></p><p><br/></p><p><br/></p><p><br/></p><p>	</p>', '傻逼张子旭', '2019-11-19 18:59:55');
INSERT INTO `study` VALUES (6, 3, '<p>	</p><p>难受<img src=\"/mis/upload/image/20191119/1574177755204080018.jpg\" title=\"1574177755204080018.jpg\" alt=\"包拯.jpg\"/></p><p>	</p>', '包拯测试', '2019-11-19 23:35:59');
INSERT INTO `study` VALUES (7, 2, '<p style=\"margin: 15px 8px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: 0.544px; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; background-color: rgb(255, 255, 255); line-height: 1.75em; text-align: center; overflow-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 18px;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; letter-spacing: 0.5px; color: rgb(123, 12, 0); overflow-wrap: break-word !important;\">概率分布概述</span></strong></span></p><p style=\"margin: 15px 8px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; clear: both; min-height: 1em; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 17px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: 0.544px; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; background-color: rgb(255, 255, 255); line-height: 1.75em; overflow-wrap: break-word !important;\"><img class=\"\" src=\"https://mmbiz.qpic.cn/mmbiz_png/bicdMLzImlibQeibcTAuRACNicGu4icHQicWXI3icNokDveHAyicxWIY1LMPrRedxhvVPJzp7jLwrbQISrHzWevOZxmACA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1\"/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; clear: both; min-height: 1em;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px;\">共轭意味着它有共轭分布的关系。</span><br/></p></li></ul><blockquote style=\"margin: 1em 0px; padding: 4px 0px 0px 10px; border-left: 3px solid rgb(219, 219, 219); color: rgba(0, 0, 0, 0.498039); font-size: 15px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: 0.544px; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; background-color: rgb(255, 255, 255);\"><p style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; clear: both; min-height: 1em; text-align: left;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px;\">在贝叶斯概率论中，如果后验分布 p（θx）与先验概率分布 p（θ）在同一概率分布族中，则先验和后验称为共轭分布，先验称为似然函数的共轭先验。</span><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; font-size: 16px;\">共轭先验维基百科在这里（https://en.wikipedia.org/wiki/Conjugate_prior）。</span></p></blockquote><p><br/></p>', '历史资料', '2019-11-19 23:40:40');
INSERT INTO `study` VALUES (8, 2, '<p style=\"margin: 15px 8px;max-width: 100%;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;box-sizing: border-box !important;overflow-wrap: break-word !important;\"><span style=\"font-size: 17px;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">1. 均匀分布（连续）</span></strong></span><span style=\"font-size: 18px;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;\"></span></strong></span></p><p style=\"margin: 15px 8px;max-width: 100%;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);line-height: normal;text-align: left;box-sizing: border-box !important;overflow-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(217, 33, 66);letter-spacing: 0.5px;font-size: 16px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">代码：</span></p><p style=\"margin: 15px 8px;max-width: 100%;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);line-height: normal;text-align: left;box-sizing: border-box !important;overflow-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(217, 33, 66);letter-spacing: 0.5px;font-size: 16px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">https://github.com/graykode/distribution-is-all-you-need/blob/master/uniform.py</span></p><p style=\"margin: 15px 8px;max-width: 100%;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;box-sizing: border-box !important;overflow-wrap: break-word !important;\"><span style=\"max-width: 100%;letter-spacing: 0.5px;font-size: 16px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">均匀分布在 [a，b] 上具有相同的概率值，是简单概率分布。</span></p><p style=\"margin: 15px 8px;max-width: 100%;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;box-sizing: border-box !important;overflow-wrap: break-word !important;\"><img class=\"\" src=\"https://mmbiz.qpic.cn/mmbiz_png/bicdMLzImlibQeibcTAuRACNicGu4icHQicWXIbr8NZoC6cj9rrK1u8ibeZhX0Yue7LlrFicbnxLuCOacpSxGUTuL9wBrQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1\"/></p><p><section><br/></section></p><p style=\"margin: 15px 8px;max-width: 100%;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;box-sizing: border-box !important;overflow-wrap: break-word !important;\"><span style=\"font-size: 17px;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">2. 伯努利分布（离散）</span></strong></span><span style=\"font-size: 18px;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;\"></span></strong></span></p><p style=\"margin: 15px 8px;max-width: 100%;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;text-align: left;box-sizing: border-box !important;overflow-wrap: break-word !important;\"><span style=\"max-width: 100%;letter-spacing: 0.5px;color: rgb(217, 33, 66);font-size: 16px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">代码：</span><span style=\"max-width: 100%;color: rgb(217, 33, 66);letter-spacing: 0.5px;font-size: 16px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">https://github.com/graykode/distribution-is-all-you-need/blob/master/bernoulli.py&nbsp;</span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p><span style=\"max-width: 100%;letter-spacing: 0.5px;font-size: 16px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">先验概率 p（x）不考虑伯努利分布。因此，如果我们对最大似然进行优化，那么我们很容易被过度拟合。</span><br/></p></li><li><p><span style=\"max-width: 100%;letter-spacing: 0.5px;font-size: 16px;box-sizing: border-box !important;overflow-wrap: break-word !important;\">利用二元交叉熵对二项分类进行分类。它的形式与伯努利分布的负对数相同。</span><br/></p></li></ul><p><section></section><section></section></p><p style=\"margin: 15px 8px;max-width: 100%;font-family: -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif;letter-spacing: 0.544px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;box-sizing: border-box !important;overflow-wrap: break-word !important;\"><img class=\"\" src=\"https://mmbiz.qpic.cn/mmbiz_png/bicdMLzImlibQeibcTAuRACNicGu4icHQicWXIwQ8jiaUFicXZiaaia2v9dbHxNUJYk2WygS2VevQOniaNjh6dVGQicaibPKN7Q/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1\"/></p><p><section><br/></section><span style=\"font-size: 17px;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;letter-spacing: 0.5px;box-sizing: border-box !important;overflow-wrap: break-word !important;\"></span></strong></span></p><p><br/></p>', '加个图加个图加个图加个图加个图', '2019-11-19 23:48:01');
INSERT INTO `study` VALUES (9, 3, '<p>驱蚊器无去<br/></p>', '阿斯顿阿斯顿', '2019-11-23 22:58:25');
INSERT INTO `study` VALUES (19, 2, NULL, '', '2019-11-24 12:55:50');

-- ----------------------------
-- Table structure for study_status_map
-- ----------------------------
DROP TABLE IF EXISTS `study_status_map`;
CREATE TABLE `study_status_map`  (
  `study_status` int(11) NOT NULL AUTO_INCREMENT,
  `means` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`study_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of study_status_map
-- ----------------------------
INSERT INTO `study_status_map` VALUES (2, '新闻共享');
INSERT INTO `study_status_map` VALUES (3, '党员必读');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, '测验1', '2019-11-04 00:57:46', '2019-11-06 00:57:48');
INSERT INTO `test` VALUES (2, '试卷', '2019-11-19 00:00:00', '2019-11-23 00:00:00');
INSERT INTO `test` VALUES (3, '试卷1111', '2019-11-03 00:00:00', '2019-11-09 00:00:00');
INSERT INTO `test` VALUES (4, 'asd', '2019-11-23 00:00:00', '2019-11-26 00:00:00');
INSERT INTO `test` VALUES (5, '阿斯达', '2019-11-24 00:00:00', '2019-11-25 00:00:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'YWRtaW4=', 'admin', 1);
INSERT INTO `user` VALUES (2, 'stu', 'c3R1', 'stu', 2);
INSERT INTO `user` VALUES (3, 'stu2', 'c3R1', 'asd', 2);
INSERT INTO `user` VALUES (4, 'stu3', 'c3R1', 'wbt', 2);

-- ----------------------------
-- View structure for activity_view
-- ----------------------------
DROP VIEW IF EXISTS `activity_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `activity_view` AS select `activity`.`activity_id` AS `activity_id`,`branch`.`branch_id` AS `branch_id`,`branch`.`branch_name` AS `branch_name`,`activity_status_map`.`means` AS `means`,`activity`.`activity_name` AS `activity_name`,`activity`.`activity_date` AS `activity_date`,`activity`.`activity_item` AS `activity_item`,`activity`.`activity_duration` AS `activity_duration`,`activity`.`activity_location` AS `activity_location`,`activity_status_map`.`activity_status` AS `activity_status` from ((`activity` join `activity_status_map` on((`activity`.`activity_status` = `activity_status_map`.`activity_status`))) join `branch` on((`activity`.`branch_id` = `branch`.`branch_id`)));

-- ----------------------------
-- View structure for answer_view
-- ----------------------------
DROP VIEW IF EXISTS `answer_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `answer_view` AS select `student`.`student_num` AS `student_num`,`student`.`student_name` AS `student_name`,`test`.`test_id` AS `test_id`,`test`.`test_name` AS `test_name`,`question`.`question_id` AS `question_id`,`question`.`question_answer` AS `question_answer`,`answer`.`answer_option` AS `answer_option`,`answer`.`answer_date` AS `answer_date` from (((`student` join `answer` on((`answer`.`student_id` = `student`.`student_id`))) join `test` on((`answer`.`test_id` = `test`.`test_id`))) join `question` on((`answer`.`question_id` = `question`.`question_id`)));

-- ----------------------------
-- View structure for apply_view
-- ----------------------------
DROP VIEW IF EXISTS `apply_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `apply_view` AS select `apply_status_map`.`means` AS `apply_status`,`student`.`student_id` AS `student_id`,`student_status_map`.`means` AS `student_status`,`student_status_map`.`student_status` AS `permission` from (((`student` join `apply` on((`apply`.`student_id` = `student`.`student_id`))) join `apply_status_map` on((`apply`.`apply_status` = `apply_status_map`.`apply_status`))) join `student_status_map` on((`student`.`student_status` = `student_status_map`.`student_status`)));

-- ----------------------------
-- View structure for attendance_view
-- ----------------------------
DROP VIEW IF EXISTS `attendance_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `attendance_view` AS select `student`.`student_id` AS `student_id`,`activity`.`activity_id` AS `activity_id`,`activity`.`activity_name` AS `activity_name`,`activity`.`activity_date` AS `activity_date`,`activity`.`activity_item` AS `activity_item`,`activity`.`activity_duration` AS `activity_duration`,`attendance_status_map`.`means` AS `attendance_status`,`attendance`.`attendance_status` AS `attendance_status_id`,`activity`.`branch_id` AS `branch_id`,`branch`.`branch_name` AS `branch_name`,`student`.`student_num` AS `student_num`,`student`.`student_name` AS `student_name`,`student_status_map`.`means` AS `student_status`,`student_status_map`.`student_status` AS `student_status_id`,`activity`.`activity_location` AS `activity_location`,`activity`.`activity_status` AS `activity_status` from (((((`student` join `attendance` on((`attendance`.`student_id` = `student`.`student_id`))) join `attendance_status_map` on((`attendance`.`attendance_status` = `attendance_status_map`.`attendance_status`))) join `activity` on((`attendance`.`activity_id` = `activity`.`activity_id`))) join `branch` on(((`student`.`branch_id` = `branch`.`branch_id`) and (`activity`.`branch_id` = `branch`.`branch_id`)))) join `student_status_map` on((`student`.`student_status` = `student_status_map`.`student_status`)));

-- ----------------------------
-- View structure for correct_answer_view
-- ----------------------------
DROP VIEW IF EXISTS `correct_answer_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `correct_answer_view` AS select count(0) AS `correct_num`,`answer_view`.`student_num` AS `student_num`,`answer_view`.`student_name` AS `student_name`,`answer_view`.`test_id` AS `test_id`,`answer_view`.`test_name` AS `test_name`,`answer_view`.`answer_date` AS `answer_date` from `answer_view` where (`answer_view`.`question_answer` = `answer_view`.`answer_option`) group by `answer_view`.`student_num`,`answer_view`.`test_id`,`answer_view`.`test_name`,`answer_view`.`student_name`,`answer_view`.`answer_date`;

-- ----------------------------
-- View structure for examination_view
-- ----------------------------
DROP VIEW IF EXISTS `examination_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `examination_view` AS select `question`.`question_problem` AS `question_problem`,`question`.`question_option_a` AS `question_option_a`,`question`.`question_option_b` AS `question_option_b`,`question`.`question_option_c` AS `question_option_c`,`question`.`question_option_d` AS `question_option_d`,`test`.`test_name` AS `test_name`,`test`.`test_date_start` AS `test_date_start`,`test`.`test_date_end` AS `test_date_end`,`test`.`test_id` AS `test_id`,`question`.`question_id` AS `question_id` from ((`question` join `examination` on((`examination`.`question_id` = `question`.`question_id`))) join `test` on((`examination`.`test_id` = `test`.`test_id`)));

-- ----------------------------
-- View structure for student_status_material_view
-- ----------------------------
DROP VIEW IF EXISTS `student_status_material_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `student_status_material_view` AS select `student`.`student_num` AS `student_num`,`student`.`branch_id` AS `branch_id`,`student`.`student_name` AS `student_name`,`student_status_map`.`means` AS `means`,`material_type_map`.`material_type_name` AS `material_type_name`,ifnull(`student_status_material`.`material_date`,'无') AS `material_date`,ifnull(`student_status_material`.`material_url`,'无') AS `material_url`,`branch`.`branch_name` AS `branch_name`,`student`.`student_status` AS `student_status`,`material_type_map`.`material_type_id` AS `material_type_id`,`student`.`student_id` AS `student_id`,`material_type_map`.`material_type_from` AS `material_type_from`,`material_type_map`.`student_status` AS `student_status_limite` from ((((`student` join `student_status_material` on((`student_status_material`.`student_id` = `student`.`student_id`))) join `student_status_map` on((`student`.`student_status` = `student_status_map`.`student_status`))) join `material_type_map` on((`student_status_material`.`material_type_id` = `material_type_map`.`material_type_id`))) join `branch` on((`student`.`branch_id` = `branch`.`branch_id`)));

-- ----------------------------
-- View structure for student_view
-- ----------------------------
DROP VIEW IF EXISTS `student_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `student_view` AS select `student`.`student_id` AS `student_id`,`student`.`student_num` AS `student_num`,`student`.`student_name` AS `student_name`,`student`.`student_tel` AS `student_tel`,`student`.`student_email` AS `student_email`,`branch`.`branch_name` AS `branch_name`,`student_permission_map`.`means` AS `student_permission`,`student_status_map`.`means` AS `student_status`,`student`.`student_gender` AS `student_gender` from (((`student` join `branch` on((`student`.`branch_id` = `branch`.`branch_id`))) join `student_permission_map` on((`student`.`student_permission` = `student_permission_map`.`student_permission`))) join `student_status_map` on((`student`.`student_status` = `student_status_map`.`student_status`)));

-- ----------------------------
-- View structure for study_view
-- ----------------------------
DROP VIEW IF EXISTS `study_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `study_view` AS select `study`.`study_id` AS `study_id`,`study`.`study_status` AS `study_status`,`study_status_map`.`means` AS `means`,`study`.`study_title` AS `study_title`,`study`.`study_date` AS `study_date`,`study`.`study_content` AS `study_content` from (`study` join `study_status_map` on((`study`.`study_status` = `study_status_map`.`study_status`)));

-- ----------------------------
-- View structure for test_view
-- ----------------------------
DROP VIEW IF EXISTS `test_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `test_view` AS select count(0) AS `total_num`,`answer_view`.`test_id` AS `test_id`,`answer_view`.`student_num` AS `student_num`,`answer_view`.`test_name` AS `test_name`,`answer_view`.`student_name` AS `student_name`,`answer_view`.`answer_date` AS `answer_date` from `answer_view` group by `answer_view`.`test_id`,`answer_view`.`student_num`,`answer_view`.`student_name`,`answer_view`.`test_name`,`answer_view`.`answer_date`;

-- ----------------------------
-- View structure for test_view_all
-- ----------------------------
DROP VIEW IF EXISTS `test_view_all`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `test_view_all` AS select `table1`.`correct_num` AS `correct_num`,`test_view`.`total_num` AS `total_num`,`test_view`.`test_id` AS `test_id`,`test_view`.`test_name` AS `test_name`,`test_view`.`student_num` AS `student_num`,`test_view`.`student_name` AS `student_name`,`test_view`.`answer_date` AS `answer_date` from (`test_view` left join (select count(0) AS `correct_num`,`answer_view`.`test_id` AS `test_id`,`answer_view`.`student_num` AS `student_num`,`answer_view`.`test_name` AS `test_name`,`answer_view`.`student_name` AS `student_name`,`answer_view`.`answer_date` AS `answer_date` from `answer_view` where (`answer_view`.`question_answer` = `answer_view`.`answer_option`) group by `answer_view`.`test_id`,`answer_view`.`student_num`,`answer_view`.`student_name`,`answer_view`.`test_name`,`answer_view`.`answer_date`) `table1` on(((`table1`.`test_id` = `test_view`.`test_id`) and (`table1`.`student_num` = `test_view`.`student_num`))));

SET FOREIGN_KEY_CHECKS = 1;
