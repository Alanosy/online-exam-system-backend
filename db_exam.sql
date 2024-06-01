/*
 Navicat Premium Data Transfer

 Source Server         : Aliyun
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40-log)
 Source Host           : 47.109.94.143:3306
 Source Schema         : db_exam

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40-log)
 File Encoding         : 65001

 Date: 23/05/2024 16:16:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_certificate
-- ----------------------------
DROP TABLE IF EXISTS `t_certificate`;
CREATE TABLE `t_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID   证书',
  `certificate_name` varchar(255) NOT NULL COMMENT '证数名称',
  `image` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `certification_nuit` varchar(50) NOT NULL COMMENT '认证单位',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_certificate
-- ----------------------------
BEGIN;
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (1, '计算机证书', 'http://dummyimage.com/400x400', '工职院', '2012-01-31 14:33:42');
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (2, '测试', 'http://dummyimage.com/400x400', 'amet', '2024-05-09 16:20:47');
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (3, '成绩优异奖', 'http://dummyimage.com/400x400', '成都工业职业技术学院', NULL);
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (5, '数学一等奖', 'http://dummyimage.com/400x400', '成都工业职业技术学院', '2024-05-06 10:18:26');
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (6, '数学一等奖', 'http://dummyimage.com/400x400', '成都工业职业技术学院', '2024-05-06 10:18:34');
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (7, '英语竞赛奖', 'http://dummyimage.com/400x400', '成都工业职业技术学院', '2024-05-06 15:23:08');
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (8, '英语第一名', 'http://dummyimage.com/400x400', '英语协会', '2024-05-06 15:41:14');
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (9, '计算机知识技能大赛一等奖', 'http://dummyimage.com/400x400', '工职院', '2024-05-09 15:29:49');
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (10, '计算机二级证书', 'http://dummyimage.com/400x300', '成都工业职业技术学院', '2024-05-11 13:43:48');
INSERT INTO `t_certificate` (`id`, `certificate_name`, `image`, `certification_nuit`, `create_time`) VALUES (50, 'abc', NULL, 'abc11', '2024-05-20 14:25:58');
COMMIT;

-- ----------------------------
-- Table structure for t_certificate_user
-- ----------------------------
DROP TABLE IF EXISTS `t_certificate_user`;
CREATE TABLE `t_certificate_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID   证书与用户关系表',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `exam_id` int(11) DEFAULT NULL COMMENT '考试id',
  `code` varchar(255) DEFAULT NULL COMMENT '证书编号',
  `certificate_id` int(11) DEFAULT NULL COMMENT '证书id',
  `create_time` datetime DEFAULT NULL COMMENT '获奖时间      YYYY-MM-DD hh:mm:ss',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_certificate_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_exam`;
CREATE TABLE `t_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id    考试表',
  `title` varchar(255) NOT NULL COMMENT '考试名称',
  `exam_duration` int(11) NOT NULL COMMENT '考试时长',
  `passed_score` int(11) NOT NULL COMMENT '及格分',
  `gross_score` int(11) NOT NULL COMMENT '总分数',
  `max_count` int(11) DEFAULT NULL COMMENT '最大切屏次数',
  `user_id` int(11) DEFAULT NULL COMMENT '创建者id',
  `certificate_id` int(11) DEFAULT NULL COMMENT '证书id',
  `radio_count` int(11) DEFAULT NULL COMMENT '单选题数量',
  `radio_score` int(11) DEFAULT NULL COMMENT '单选题成绩     数据库存储*100，前端正常输入和展示/100',
  `multi_count` int(11) DEFAULT NULL COMMENT '多选题数量 ',
  `multi_score` int(11) DEFAULT NULL COMMENT '多选题成绩     数据库存储*100，前端正常输入和展示/100',
  `judge_count` int(11) DEFAULT NULL COMMENT '判断题数量 ',
  `judge_score` int(11) DEFAULT NULL COMMENT '判断题成绩     数据库存储*100，前端正常输入和展示/100',
  `saq_count` int(11) DEFAULT NULL COMMENT '简答题数量',
  `saq_score` int(11) DEFAULT NULL COMMENT '简答题成绩     数据库存储*100，前端正常输入和展示/100',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间     YYYY-MM-DD hh:mm:ss',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间     YYYY-MM-DD hh:mm:ss',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间     YYYY-MM-DD hh:mm:ss  ',
  PRIMARY KEY (`id`,`passed_score`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exam
-- ----------------------------
BEGIN;
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (2, '形式政策考试1', 91, 78, 11, NULL, 1, 99, 6, 20, 50, 59, 93, 24, 19, 10, '2020-04-14 15:32:16', '2020-04-14 15:32:16', NULL);
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (3, '计算机基础考试2', 20, 3, 32, NULL, NULL, 37, 57, 38, 64, 59, 43, 63, 88, 10, '2020-04-14 15:32:16', '2020-04-14 15:32:16', NULL);
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (4, 'C语言', 20, 3, 32, NULL, NULL, 37, 57, 38, 64, 59, 43, 63, 88, 10, '2020-04-14 15:32:16', '2020-04-14 15:32:16', NULL);
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (5, 'Java语言', 20, 3, 32, NULL, NULL, 37, 57, 38, 64, 59, 43, 63, 88, 10, '2020-04-14 15:32:16', '2020-04-14 15:32:16', NULL);
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (6, '操作系统', 20, 3, 32, NULL, NULL, 37, 57, 38, 64, 59, 43, 63, 88, 10, '2020-04-14 15:32:16', '2020-04-14 15:32:16', NULL);
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (9, '数据结构', 24, 32, 57, NULL, 1, 50, 40, 34, 46, 76, 50, 83, 82, NULL, '1989-09-13 05:05:16', '2008-07-24 21:16:01', '2024-04-08 09:21:51');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (13, '设计模式', 1, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 1, 3, 1, NULL, '2016-03-04 12:21:46', '1997-09-28 10:44:54', '2024-04-08 09:44:33');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (14, '统计学', 1, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 1, 3, 1, NULL, '2016-03-04 12:21:46', '1997-09-28 10:44:54', '2024-04-08 09:46:03');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (15, '高等数学', 1, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 1, 3, 1, NULL, '2016-03-04 12:21:46', '1997-09-28 10:44:54', '2024-04-08 09:51:54');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (16, '线性代数', 1, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 1, 3, 1, NULL, '2016-03-04 12:21:46', '1997-09-28 10:44:54', '2024-04-08 10:41:11');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (17, '思想政治', 1, 1, 1, NULL, 1, 1, 1, 2, 1, 2, 1, 3, 1, NULL, '2016-03-04 12:21:46', '1997-09-28 10:44:54', '2024-04-08 10:42:49');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (27, '毛泽东思想', 10, 25, 6, NULL, 1, NULL, 3, 2, 0, 0, 0, 0, 0, 0, '1990-08-15 11:20:38', '2025-11-04 10:19:43', '2024-04-15 10:34:06');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (32, '历史考试', 60, 60, 200, 5, 1, NULL, 10, 5, 10, 10, 10, 5, 0, 0, '2018-04-28 18:40:34', '2042-12-15 23:31:20', '2024-05-07 20:52:30');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (42, '英语期末测试', 400, 78, 0, 61, 1, 59, 0, 26, 0, 8, 0, 88, 0, 221234, '1973-06-13 11:13:59', '2038-10-19 13:40:50', '2024-05-13 15:28:59');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (44, '测试考试', 60, 60, 86, 55, 1, 1, 3, 3, 4, 4, 5, 5, 6, 6, '2024-05-18 00:00:00', '2024-06-30 15:00:00', '2024-05-18 11:03:19');
INSERT INTO `t_exam` (`id`, `title`, `exam_duration`, `passed_score`, `gross_score`, `max_count`, `user_id`, `certificate_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `start_time`, `end_time`, `create_time`) VALUES (46, '测试考试3', 60, 6, 12, 3, 1, 1, 2, 2, 2, 2, 2, 2, 0, 0, '2024-05-13 16:00:00', '2024-06-27 16:00:00', '2024-05-20 15:28:04');
COMMIT;

-- ----------------------------
-- Table structure for t_exam_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_grade`;
CREATE TABLE `t_exam_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id   考试与班级关系表',
  `exam_id` int(11) DEFAULT NULL COMMENT '考试id  唯一',
  `grade_id` int(11) DEFAULT NULL COMMENT '班级id  唯一',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exam_grade
-- ----------------------------
BEGIN;
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (2, 1, 1);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (4, 13, 1);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (5, 13, 2);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (6, 14, 1);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (7, 14, 2);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (8, 15, 1);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (9, 15, 2);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (10, 16, 1);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (11, 16, 2);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (12, 17, 1);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (13, 17, 2);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (29, 27, 1);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (38, 32, 8);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (39, 32, 9);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (50, 42, 2);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (54, 44, 9);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (55, 44, 8);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (56, 44, 56);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (57, 44, 59);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (60, 46, 8);
INSERT INTO `t_exam_grade` (`id`, `exam_id`, `grade_id`) VALUES (61, 46, 9);
COMMIT;

-- ----------------------------
-- Table structure for t_exam_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_qu_answer`;
CREATE TABLE `t_exam_qu_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id  考试记录答案',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `exam_id` int(11) NOT NULL COMMENT '考试id',
  `question_id` int(11) NOT NULL COMMENT '试题id',
  `question_type` int(11) DEFAULT NULL COMMENT '题目类型',
  `answer_id` varchar(10) DEFAULT NULL COMMENT '答案id  用于客观题，多选题id使用“，”分隔',
  `answer_content` varchar(255) DEFAULT NULL COMMENT '答案内容    用于主观题',
  `checkout` int(11) DEFAULT NULL COMMENT '是否选中   0未选中  1选中',
  `is_sign` int(11) DEFAULT NULL COMMENT '是否标记   0未标记  1标记',
  `is_right` int(11) DEFAULT NULL COMMENT '是否正确   用于客观题，0错误 1正确',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exam_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (1, 1, 29, 19, 2, '58', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (2, 1, 28, 117, 1, '426', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (3, 1, 28, 210, 1, '785', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (4, 1, 28, 198, 1, '732', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (5, 1, 28, 230, 1, '857', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (6, 1, 28, 305, 1, '1152', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (7, 1, 28, 305, 1, '1152', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (8, 1, 28, 265, 1, '993', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (9, 1, 28, 37, 1, '107', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (10, 1, 28, 145, 1, '533', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (11, 1, 28, 289, 1, '1084', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (12, 1, 28, 229, 1, '854', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (13, 1, 44, 444, 1, '1710', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (14, 1, 44, 503, 1, '1944', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (15, 1, 44, 517, 1, '2002', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (16, 1, 44, 252, 2, '951', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (17, 1, 44, 140, 2, '510', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (26, 1, 44, 228, 2, '849', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (27, 1, 44, 125, 3, '457', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (28, 1, 44, 61, 3, '209', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (29, 1, 44, 126, 3, '459', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (30, 1, 44, 286, 3, '1080', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (31, 1, 44, 30, 3, '87', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (32, 1, 46, 289, 1, '1083', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (33, 1, 46, 297, 1, '1118', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (34, 1, 46, 307, 2, '1160,1162', NULL, NULL, NULL, 1);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (35, 1, 46, 125, 3, '458', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (36, 1, 46, 189, 3, '706', NULL, NULL, NULL, 0);
INSERT INTO `t_exam_qu_answer` (`id`, `user_id`, `exam_id`, `question_id`, `question_type`, `answer_id`, `answer_content`, `checkout`, `is_sign`, `is_right`) VALUES (37, 1, 46, 108, 2, '387', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for t_exam_question
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_question`;
CREATE TABLE `t_exam_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id  考试题目表',
  `exam_id` int(11) NOT NULL COMMENT '考试id',
  `question_id` int(11) NOT NULL COMMENT '题目id',
  `score` int(11) NOT NULL COMMENT '分值',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `type` int(11) DEFAULT NULL COMMENT '试题类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exam_question
-- ----------------------------
BEGIN;
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (16, 27, 5, 2, 0, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (17, 27, 6, 2, 1, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (18, 27, 4, 2, 2, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (81, 32, 81, 5, 0, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (82, 32, 86, 5, 1, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (83, 32, 205, 5, 2, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (84, 32, 233, 5, 3, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (85, 32, 234, 5, 4, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (86, 32, 206, 5, 5, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (87, 32, 121, 5, 6, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (88, 32, 217, 5, 7, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (89, 32, 197, 5, 8, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (90, 32, 278, 5, 9, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (91, 32, 204, 10, 0, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (92, 32, 208, 10, 1, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (93, 32, 199, 10, 2, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (94, 32, 247, 10, 3, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (95, 32, 156, 10, 4, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (96, 32, 299, 10, 5, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (97, 32, 252, 10, 6, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (98, 32, 123, 10, 7, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (99, 32, 140, 10, 8, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (100, 32, 307, 10, 9, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (101, 32, 93, 5, 0, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (102, 32, 61, 5, 1, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (103, 32, 285, 5, 2, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (104, 32, 62, 5, 3, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (105, 32, 254, 5, 4, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (106, 32, 158, 5, 5, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (107, 32, 30, 5, 6, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (108, 32, 94, 5, 7, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (109, 32, 222, 5, 8, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (110, 32, 286, 5, 9, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (111, 44, 503, 3, 0, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (112, 44, 444, 3, 1, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (113, 44, 517, 3, 2, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (114, 44, 252, 4, 0, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (115, 44, 47, 4, 1, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (116, 44, 140, 4, 2, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (117, 44, 228, 4, 3, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (118, 44, 61, 5, 0, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (119, 44, 125, 5, 1, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (120, 44, 126, 5, 2, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (121, 44, 30, 5, 3, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (122, 44, 286, 5, 4, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (123, 44, 224, 6, 0, 4);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (124, 44, 32, 6, 1, 4);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (125, 44, 160, 6, 2, 4);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (126, 44, 127, 6, 3, 4);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (127, 44, 159, 6, 4, 4);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (128, 44, 191, 6, 5, 4);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (131, 46, 289, 2, 0, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (132, 46, 297, 2, 1, 1);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (133, 46, 307, 2, 0, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (134, 46, 108, 2, 1, 2);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (135, 46, 125, 2, 0, 3);
INSERT INTO `t_exam_question` (`id`, `exam_id`, `question_id`, `score`, `sort`, `type`) VALUES (136, 46, 189, 2, 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for t_exam_repo
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_repo`;
CREATE TABLE `t_exam_repo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id  考试与题库',
  `exam_id` int(11) NOT NULL COMMENT '考试id  唯一',
  `repo_id` int(11) DEFAULT NULL COMMENT '题库id  唯一',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exam_repo
-- ----------------------------
BEGIN;
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (1, 13, 1);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (2, 14, 1);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (3, 15, 1);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (4, 16, 1);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (5, 17, 1);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (15, 27, 1);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (20, 32, 9);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (30, 42, 4);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (32, 44, 14);
INSERT INTO `t_exam_repo` (`id`, `exam_id`, `repo_id`) VALUES (34, 46, 14);
COMMIT;

-- ----------------------------
-- Table structure for t_exercise_record
-- ----------------------------
DROP TABLE IF EXISTS `t_exercise_record`;
CREATE TABLE `t_exercise_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` int(11) NOT NULL COMMENT '题库id',
  `question_id` int(11) NOT NULL COMMENT '试题id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `answer` varchar(255) DEFAULT NULL COMMENT '主观题答案',
  `question_type` int(11) NOT NULL COMMENT '题目类型',
  `options` varchar(255) DEFAULT NULL COMMENT '客观题答案集合  用于客观题,多选题id使用","分隔',
  `is_right` int(11) DEFAULT NULL COMMENT '客观题是否正确',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exercise_record
-- ----------------------------
BEGIN;
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (1, 6, 20, 1, '59', 2, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (7, 6, 539, 1, '2088', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (8, 6, 30, 1, '88', 3, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (9, 6, 538, 1, '2085', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (10, 6, 540, 1, '2095', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (11, 6, 541, 1, '2103', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (12, 6, 542, 1, '2096', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (13, 6, 543, 1, '2107', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (14, 6, 544, 1, '2108', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (15, 6, 545, 1, '2203', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (16, 6, 546, 1, '2112', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (17, 6, 547, 1, '2120', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (18, 6, 548, 1, '2128', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (19, 6, 549, 1, '2124', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (20, 6, 550, 1, '2132', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (21, 6, 551, 1, '2136', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (22, 6, 552, 1, '2143', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (23, 6, 553, 1, '2152', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (24, 6, 554, 1, '2144', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (25, 6, 555, 1, '2151', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (26, 6, 556, 1, '2156', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (27, 6, 557, 1, '2161', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (28, 6, 558, 1, '2166', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (29, 6, 561, 1, '2176', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (30, 6, 562, 1, '2183', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (31, 6, 559, 1, '2168', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (32, 6, 560, 1, '2173', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (33, 6, 563, 1, '2196', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (34, 6, 564, 1, '2187', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (35, 6, 565, 1, '2190', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (36, 6, 566, 1, '2192', 1, NULL, 1);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (37, 6, 567, 1, '62', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (38, 6, 568, 1, '2203', 1, NULL, 0);
INSERT INTO `t_exercise_record` (`id`, `repo_id`, `question_id`, `user_id`, `answer`, `question_type`, `options`, `is_right`) VALUES (39, 14, 83, 1, '292,293', 2, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id   班级表',
  `grade_name` varchar(255) NOT NULL COMMENT '班级名称',
  `user_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `code` varchar(255) NOT NULL COMMENT '班级口令',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `grade_name` (`grade_name`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
BEGIN;
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (8, '软件2202', 1, 'nfmrdMc6r5XPTlrZCI');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (9, '软件2201', 1, 'Q4kk3qbS0L8QGCadjH');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (10, '云计算2201', 2, '5Sd0Ad1XamAasLIzn2');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (11, '云计算2202', 2, 'SGFnvbak1xrhGdiJVs');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (12, '互联网2201', 3, '60afOji5mgtH65RBSp');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (13, '互联网2202', 3, 'xkEtUY8KiUCNyrfX7N');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (14, '物联网2208', 4, 'vJSJjHB1mbtb2dIPvi');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (15, '通信2201', 5, 'oCayzMmTohHcWgwmhm');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (16, '通信2202', 5, '9SS0a3dlATUfsolQn6');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (17, '通信2203', 5, '5u4SpVSqgheHmUCpx1');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (18, '移动2206', 6, 'Dk4Vif507ybgij0ZcV');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (19, '移动2207', 6, 'I455pZi2csMR6aL1b2');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (20, '移动2208', 6, 'Uf1gf7oirKcP83TKMj');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (21, '移动2209', 6, '5eNvUX1wR3lLgEChiM');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (22, '移动2202', 6, 'wTRUsIIExPT8i3oJUj');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (23, '移动2203', 6, 'GXVQN59ZMXyjjzKTGT');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (24, '移动2204', 6, '9ES86e90YaQngB7EqZ');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (25, '移动2205', 6, 'BN0V2liARyFKfun3yH');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (31, '物联网2204', 4, 'LJmsz3Ha8sRC4UhLDL');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (32, '物联网2205', 4, 'ZOs6s2uAF81zQqusfF');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (33, '物联网2206', 4, 'ONMkZSXkRc8pa7tMnu');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (34, '物联网2207', 4, 'VZuJrbtsdwbkmGJcHG');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (35, '移动2201', 6, 'K63u7izYxe2txmQcHI');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (43, '物联网2201', 4, '1IwgYfbmgfHi8iucc1');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (44, '物联网2202', 4, 'VcvhClOgxDkEtIezFU');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (45, '物联网2203', 4, 'PZCMfOELEAy2htDuQM');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (52, 'test', 1, 'KwgdHXFhJjNX9xWwb6');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (56, 'test1', 1, 'r2YRpyHLyfxdJDLPkj');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (57, 'test12', 1, 'Qu6OkmpkKVKHUQOpKo');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (58, 'test123', 1, 'F65e8nbG0uOlXQbMRo');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (59, 'test1234', 1, 'O8df3sDQk1zDyWB277');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (60, 'test12345', 1, '64UYSZt9NRxF9E3wEx');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (64, 'test123456789嗯嗯', 1, 'aJWIPQYP5ih3nOgvem');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (67, 'sdfc', 1, 'vR8S5YG2IxHHwNuhnp');
INSERT INTO `t_grade` (`id`, `grade_name`, `user_id`, `code`) VALUES (68, 'aaa', 1, 'FBVQjBJB18ZBSElQh9');
COMMIT;

-- ----------------------------
-- Table structure for t_grade_exercise
-- ----------------------------
DROP TABLE IF EXISTS `t_grade_exercise`;
CREATE TABLE `t_grade_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id  刷题表',
  `repo_id` int(11) DEFAULT NULL COMMENT '题库id',
  `grade_id` int(11) DEFAULT NULL COMMENT '班级id',
  `user_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_grade_exercise
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_manual_score
-- ----------------------------
DROP TABLE IF EXISTS `t_manual_score`;
CREATE TABLE `t_manual_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id   人工评分表',
  `exam_qu_answer_id` int(11) DEFAULT NULL COMMENT '考试记录答案id',
  `user_id` int(11) DEFAULT NULL COMMENT '批改人id',
  `score` int(11) DEFAULT NULL COMMENT '得分',
  `create_time` datetime DEFAULT NULL COMMENT '批改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_manual_score
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID   公告表',
  `title` varchar(255) NOT NULL COMMENT '公告标题',
  `image` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `content` text NOT NULL COMMENT '公告内容',
  `user_id` int(11) DEFAULT NULL COMMENT '创建用户ID   唯一',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
BEGIN;
INSERT INTO `t_notice` (`id`, `title`, `image`, `content`, `user_id`, `create_time`) VALUES (2, '己维群心状', NULL, 'ssssss id1', 1, '2024-04-15 09:44:03');
INSERT INTO `t_notice` (`id`, `title`, `image`, `content`, `user_id`, `create_time`) VALUES (3, '6月8日软件2022考试形式正常', NULL, '带好2b铅笔', 1, '2024-05-03 22:08:34');
INSERT INTO `t_notice` (`id`, `title`, `image`, `content`, `user_id`, `create_time`) VALUES (4, '6月2日软件2021考试形式正常', NULL, '带好2b铅笔', 1, '2024-05-03 22:08:44');
INSERT INTO `t_notice` (`id`, `title`, `image`, `content`, `user_id`, `create_time`) VALUES (5, '5月2日软件2021考试形式正常', NULL, '带好2b铅笔', 1, '2024-05-03 22:08:56');
INSERT INTO `t_notice` (`id`, `title`, `image`, `content`, `user_id`, `create_time`) VALUES (6, '5月21日软件2021考试形式政策', NULL, '带好2b铅笔', 1, '2024-05-03 22:09:05');
INSERT INTO `t_notice` (`id`, `title`, `image`, `content`, `user_id`, `create_time`) VALUES (7, '5月26日软件2022考试形式政策', NULL, '带好2b铅笔', 1, '2024-05-03 22:09:12');
INSERT INTO `t_notice` (`id`, `title`, `image`, `content`, `user_id`, `create_time`) VALUES (8, '5月26日软件2022考试形式政策', NULL, '带好2b铅笔', 1, '2024-05-03 22:09:16');
INSERT INTO `t_notice` (`id`, `title`, `image`, `content`, `user_id`, `create_time`) VALUES (9, '4月26日软件2022考试形式政策', NULL, '带好2b铅笔jjj', 1, '2024-05-03 22:09:20');
COMMIT;

-- ----------------------------
-- Table structure for t_notice_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_grade`;
CREATE TABLE `t_notice_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID   公告班级关联表',
  `notice_id` int(11) DEFAULT NULL COMMENT '公告id',
  `grade_id` int(11) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_notice_grade
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_option
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id   选项答案表',
  `qu_id` int(11) NOT NULL COMMENT '试题id',
  `is_right` int(11) DEFAULT NULL COMMENT '是否正确',
  `image` varchar(255) DEFAULT NULL COMMENT '图片地址   0错误 1正确',
  `content` varchar(255) NOT NULL COMMENT '选项内容',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2244 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_option
-- ----------------------------
BEGIN;
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (50, 18, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (51, 18, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (52, 18, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (53, 18, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (59, 20, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (60, 20, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (61, 20, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (62, 20, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (63, 21, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (64, 21, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (65, 22, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (66, 22, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (67, 24, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (76, 27, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (77, 27, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (78, 27, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (79, 27, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (80, 27, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (87, 30, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (88, 30, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (89, 32, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (90, 33, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (91, 33, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (92, 33, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (93, 33, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (94, 34, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (95, 34, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (96, 34, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (97, 34, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (98, 35, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (99, 35, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (100, 35, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (101, 35, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (102, 35, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (103, 36, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (104, 36, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (105, 36, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (106, 36, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (107, 37, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (108, 37, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (109, 37, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (110, 37, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (111, 38, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (112, 38, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (113, 38, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (114, 38, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (115, 39, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (116, 39, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (117, 39, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (118, 39, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (119, 39, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (120, 40, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (121, 40, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (122, 40, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (123, 40, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (124, 41, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (125, 41, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (126, 41, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (127, 41, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (128, 42, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (129, 42, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (130, 42, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (131, 42, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (132, 43, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (133, 43, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (134, 43, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (135, 43, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (136, 43, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (137, 44, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (138, 44, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (139, 44, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (140, 44, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (141, 45, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (142, 45, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (143, 45, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (144, 45, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (145, 46, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (146, 46, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (147, 46, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (148, 46, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (149, 47, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (150, 47, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (151, 47, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (152, 47, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (153, 47, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (154, 48, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (155, 48, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (156, 48, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (157, 48, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (158, 49, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (159, 49, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (160, 49, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (161, 49, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (162, 50, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (163, 50, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (164, 50, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (165, 50, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (166, 51, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (167, 51, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (168, 51, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (169, 51, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (170, 51, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (171, 52, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (172, 52, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (173, 52, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (174, 52, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (175, 53, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (176, 53, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (177, 53, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (178, 53, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (179, 54, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (180, 54, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (181, 54, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (182, 54, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (183, 55, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (184, 55, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (185, 55, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (186, 55, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (187, 55, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (188, 56, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (189, 56, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (190, 56, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (191, 56, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (192, 57, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (193, 57, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (194, 57, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (195, 57, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (196, 58, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (197, 58, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (198, 58, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (199, 58, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (200, 59, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (201, 59, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (202, 59, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (203, 59, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (204, 59, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (205, 60, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (206, 60, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (207, 60, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (208, 60, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (209, 61, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (210, 61, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (211, 62, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (212, 62, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (213, 64, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (214, 65, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (215, 65, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (216, 65, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (217, 65, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (218, 66, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (219, 66, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (220, 66, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (221, 66, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (222, 67, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (223, 67, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (224, 67, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (225, 67, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (226, 67, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (227, 68, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (228, 68, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (229, 68, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (230, 68, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (231, 69, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (232, 69, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (233, 69, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (234, 69, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (235, 70, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (236, 70, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (237, 70, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (238, 70, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (239, 71, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (240, 71, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (241, 71, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (242, 71, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (243, 71, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (244, 72, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (245, 72, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (246, 72, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (247, 72, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (248, 73, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (249, 73, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (250, 73, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (251, 73, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (252, 74, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (253, 74, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (254, 74, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (255, 74, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (256, 75, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (257, 75, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (258, 75, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (259, 75, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (260, 75, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (261, 76, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (262, 76, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (263, 76, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (264, 76, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (265, 77, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (266, 77, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (267, 77, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (268, 77, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (269, 78, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (270, 78, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (271, 78, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (272, 78, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (273, 79, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (274, 79, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (275, 79, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (276, 79, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (277, 79, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (278, 80, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (279, 80, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (280, 80, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (281, 80, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (282, 81, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (283, 81, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (284, 81, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (285, 81, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (286, 82, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (287, 82, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (288, 82, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (289, 82, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (290, 83, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (291, 83, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (292, 83, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (293, 83, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (294, 83, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (295, 84, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (296, 84, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (297, 84, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (298, 84, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (299, 85, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (300, 85, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (301, 85, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (302, 85, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (303, 86, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (304, 86, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (305, 86, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (306, 86, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (307, 87, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (308, 87, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (309, 87, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (310, 87, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (311, 87, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (312, 88, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (313, 88, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (314, 88, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (315, 88, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (316, 89, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (317, 89, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (318, 89, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (319, 89, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (320, 90, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (321, 90, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (322, 90, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (323, 90, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (324, 91, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (325, 91, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (326, 91, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (327, 91, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (328, 91, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (329, 92, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (330, 92, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (331, 92, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (332, 92, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (333, 93, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (334, 93, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (335, 94, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (336, 94, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (337, 96, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (338, 97, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (339, 97, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (340, 97, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (341, 97, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (342, 98, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (343, 98, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (344, 98, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (345, 98, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (346, 99, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (347, 99, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (348, 99, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (349, 99, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (350, 99, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (351, 100, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (352, 100, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (353, 100, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (354, 100, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (355, 101, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (356, 101, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (357, 101, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (358, 101, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (359, 102, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (360, 102, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (361, 102, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (362, 102, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (363, 103, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (364, 103, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (365, 103, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (366, 103, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (367, 103, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (368, 104, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (369, 104, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (370, 104, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (371, 104, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (372, 105, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (373, 105, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (374, 105, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (375, 105, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (376, 106, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (377, 106, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (378, 106, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (379, 106, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (380, 107, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (381, 107, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (382, 107, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (383, 107, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (384, 107, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (385, 108, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (386, 108, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (387, 108, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (388, 108, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (389, 109, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (390, 109, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (391, 109, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (392, 109, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (393, 110, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (394, 110, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (395, 110, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (396, 110, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (397, 111, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (398, 111, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (399, 111, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (400, 111, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (401, 111, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (402, 112, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (403, 112, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (404, 112, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (405, 112, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (406, 113, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (407, 113, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (408, 113, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (409, 113, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (410, 114, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (411, 114, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (412, 114, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (413, 114, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (414, 115, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (415, 115, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (416, 115, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (417, 115, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (418, 115, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (419, 116, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (420, 116, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (421, 116, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (422, 116, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (423, 117, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (424, 117, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (425, 117, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (426, 117, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (427, 118, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (428, 118, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (429, 118, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (430, 118, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (431, 119, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (432, 119, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (433, 119, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (434, 119, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (435, 119, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (436, 120, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (437, 120, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (438, 120, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (439, 120, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (440, 121, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (441, 121, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (442, 121, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (443, 121, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (444, 122, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (445, 122, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (446, 122, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (447, 122, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (448, 123, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (449, 123, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (450, 123, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (451, 123, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (452, 123, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (453, 124, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (454, 124, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (455, 124, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (456, 124, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (457, 125, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (458, 125, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (459, 126, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (460, 126, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (461, 128, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (462, 129, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (463, 129, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (464, 129, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (465, 129, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (466, 130, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (467, 130, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (468, 130, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (469, 130, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (470, 131, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (471, 131, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (472, 131, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (473, 131, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (474, 131, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (475, 132, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (476, 132, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (477, 132, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (478, 132, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (479, 133, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (480, 133, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (481, 133, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (482, 133, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (483, 134, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (484, 134, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (485, 134, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (486, 134, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (487, 135, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (488, 135, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (489, 135, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (490, 135, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (491, 135, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (492, 136, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (493, 136, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (494, 136, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (495, 136, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (496, 137, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (497, 137, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (498, 137, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (499, 137, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (500, 138, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (501, 138, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (502, 138, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (503, 138, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (504, 139, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (505, 139, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (506, 139, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (507, 139, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (508, 139, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (509, 140, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (510, 140, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (511, 140, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (512, 140, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (513, 141, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (514, 141, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (515, 141, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (516, 141, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (517, 142, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (518, 142, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (519, 142, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (520, 142, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (521, 143, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (522, 143, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (523, 143, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (524, 143, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (525, 143, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (526, 144, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (527, 144, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (528, 144, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (529, 144, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (530, 145, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (531, 145, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (532, 145, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (533, 145, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (534, 146, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (535, 146, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (536, 146, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (537, 146, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (538, 147, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (539, 147, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (540, 147, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (541, 147, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (542, 147, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (543, 148, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (544, 148, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (545, 148, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (546, 148, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (547, 149, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (548, 149, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (549, 149, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (550, 149, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (551, 150, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (552, 150, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (553, 150, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (554, 150, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (555, 151, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (556, 151, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (557, 151, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (558, 151, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (559, 151, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (560, 152, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (561, 152, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (562, 152, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (563, 152, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (564, 153, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (565, 153, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (566, 153, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (567, 153, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (568, 154, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (569, 154, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (570, 154, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (571, 154, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (572, 155, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (573, 155, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (574, 155, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (575, 155, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (576, 155, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (577, 156, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (578, 156, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (579, 156, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (580, 156, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (581, 157, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (582, 157, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (583, 158, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (584, 158, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (585, 160, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (586, 161, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (587, 161, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (588, 161, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (589, 161, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (590, 162, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (591, 162, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (592, 162, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (593, 162, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (594, 163, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (595, 163, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (596, 163, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (597, 163, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (598, 163, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (599, 164, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (600, 164, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (601, 164, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (602, 164, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (603, 165, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (604, 165, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (605, 165, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (606, 165, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (607, 166, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (608, 166, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (609, 166, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (610, 166, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (611, 167, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (612, 167, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (613, 167, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (614, 167, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (615, 167, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (616, 168, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (617, 168, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (618, 168, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (619, 168, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (620, 169, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (621, 169, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (622, 169, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (623, 169, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (624, 170, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (625, 170, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (626, 170, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (627, 170, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (628, 171, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (629, 171, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (630, 171, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (631, 171, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (632, 171, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (633, 172, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (634, 172, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (635, 172, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (636, 172, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (637, 173, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (638, 173, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (639, 173, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (640, 173, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (641, 174, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (642, 174, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (643, 174, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (644, 174, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (645, 175, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (646, 175, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (647, 175, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (648, 175, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (649, 175, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (650, 176, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (651, 176, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (652, 176, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (653, 176, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (654, 177, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (655, 177, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (656, 177, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (657, 177, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (658, 178, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (659, 178, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (660, 178, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (661, 178, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (662, 179, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (663, 179, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (664, 179, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (665, 179, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (666, 179, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (667, 180, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (668, 180, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (669, 180, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (670, 180, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (671, 181, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (672, 181, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (673, 181, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (674, 181, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (675, 182, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (676, 182, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (677, 182, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (678, 182, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (679, 183, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (680, 183, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (681, 183, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (682, 183, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (683, 183, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (684, 184, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (685, 184, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (686, 184, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (687, 184, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (688, 185, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (689, 185, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (690, 185, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (691, 185, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (692, 186, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (693, 186, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (694, 186, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (695, 186, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (696, 187, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (697, 187, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (698, 187, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (699, 187, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (700, 187, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (701, 188, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (702, 188, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (703, 188, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (704, 188, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (705, 189, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (706, 189, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (707, 190, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (708, 190, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (709, 192, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (710, 193, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (711, 193, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (712, 193, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (713, 193, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (714, 194, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (715, 194, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (716, 194, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (717, 194, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (718, 195, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (719, 195, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (720, 195, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (721, 195, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (722, 195, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (723, 196, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (724, 196, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (725, 196, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (726, 196, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (727, 197, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (728, 197, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (729, 197, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (730, 197, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (731, 198, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (732, 198, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (733, 198, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (734, 198, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (735, 199, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (736, 199, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (737, 199, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (738, 199, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (739, 199, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (740, 200, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (741, 200, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (742, 200, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (743, 200, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (744, 201, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (745, 201, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (746, 201, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (747, 201, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (748, 202, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (749, 202, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (750, 202, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (751, 202, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (752, 203, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (753, 203, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (754, 203, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (755, 203, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (756, 203, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (757, 204, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (758, 204, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (759, 204, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (760, 204, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (761, 205, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (762, 205, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (763, 205, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (764, 205, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (765, 206, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (766, 206, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (767, 206, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (768, 206, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (769, 207, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (770, 207, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (771, 207, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (772, 207, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (773, 207, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (774, 208, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (775, 208, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (776, 208, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (777, 208, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (778, 209, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (779, 209, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (780, 209, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (781, 209, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (782, 210, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (783, 210, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (784, 210, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (785, 210, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (786, 211, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (787, 211, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (788, 211, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (789, 211, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (790, 211, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (791, 212, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (792, 212, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (793, 212, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (794, 212, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (795, 213, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (796, 213, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (797, 213, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (798, 213, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (799, 214, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (800, 214, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (801, 214, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (802, 214, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (803, 215, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (804, 215, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (805, 215, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (806, 215, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (807, 215, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (808, 216, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (809, 216, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (810, 216, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (811, 216, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (812, 217, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (813, 217, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (814, 217, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (815, 217, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (816, 218, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (817, 218, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (818, 218, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (819, 218, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (820, 219, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (821, 219, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (822, 219, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (823, 219, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (824, 219, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (825, 220, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (826, 220, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (827, 220, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (828, 220, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (829, 221, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (830, 221, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (831, 222, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (832, 222, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (833, 224, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (834, 225, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (835, 225, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (836, 225, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (837, 225, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (838, 226, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (839, 226, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (840, 226, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (841, 226, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (842, 227, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (843, 227, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (844, 227, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (845, 227, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (846, 227, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (847, 228, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (848, 228, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (849, 228, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (850, 228, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (851, 229, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (852, 229, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (853, 229, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (854, 229, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (855, 230, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (856, 230, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (857, 230, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (858, 230, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (859, 231, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (860, 231, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (861, 231, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (862, 231, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (863, 231, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (864, 232, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (865, 232, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (866, 232, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (867, 232, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (868, 233, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (869, 233, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (870, 233, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (871, 233, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (872, 234, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (873, 234, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (874, 234, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (875, 234, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (876, 235, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (877, 235, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (878, 235, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (879, 235, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (880, 235, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (881, 236, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (882, 236, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (883, 236, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (884, 236, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (885, 237, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (886, 237, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (887, 237, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (888, 237, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (889, 238, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (890, 238, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (891, 238, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (892, 238, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (893, 239, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (894, 239, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (895, 239, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (896, 239, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (897, 239, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (898, 240, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (899, 240, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (900, 240, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (901, 240, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (902, 241, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (903, 241, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (904, 241, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (905, 241, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (906, 242, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (907, 242, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (908, 242, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (909, 242, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (910, 243, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (911, 243, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (912, 243, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (913, 243, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (914, 243, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (915, 244, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (916, 244, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (917, 244, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (918, 244, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (919, 245, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (920, 245, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (921, 245, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (922, 245, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (923, 246, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (924, 246, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (925, 246, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (926, 246, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (927, 247, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (928, 247, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (929, 247, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (930, 247, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (931, 247, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (932, 248, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (933, 248, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (934, 248, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (935, 248, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (936, 249, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (937, 249, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (938, 249, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (939, 249, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (940, 250, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (941, 250, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (942, 250, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (943, 250, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (944, 251, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (945, 251, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (946, 251, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (947, 251, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (948, 251, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (949, 252, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (950, 252, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (951, 252, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (952, 252, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (953, 253, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (954, 253, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (955, 254, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (956, 254, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (957, 256, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (958, 257, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (959, 257, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (960, 257, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (961, 257, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (962, 258, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (963, 258, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (964, 258, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (965, 258, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (966, 259, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (967, 259, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (968, 259, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (969, 259, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (970, 259, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (971, 260, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (972, 260, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (973, 260, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (974, 260, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (975, 261, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (976, 261, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (977, 261, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (978, 261, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (979, 262, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (980, 262, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (981, 262, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (982, 262, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (983, 263, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (984, 263, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (985, 263, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (986, 263, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (987, 263, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (988, 264, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (989, 264, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (990, 264, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (991, 264, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (992, 265, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (993, 265, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (994, 265, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (995, 265, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (996, 266, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (997, 266, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (998, 266, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (999, 266, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1000, 267, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1001, 267, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1002, 267, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1003, 267, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1004, 267, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1005, 268, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1006, 268, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1007, 268, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1008, 268, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1009, 269, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1010, 269, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1011, 269, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1012, 269, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1013, 270, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1014, 270, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1015, 270, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1016, 270, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1017, 271, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1018, 271, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1019, 271, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1020, 271, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1021, 271, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1022, 272, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1023, 272, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1024, 272, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1025, 272, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1026, 273, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1027, 273, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1028, 273, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1029, 273, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1030, 274, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1031, 274, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1032, 274, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1033, 274, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1034, 275, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1035, 275, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1036, 275, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1037, 275, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1038, 275, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1039, 276, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1040, 276, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1041, 276, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1042, 276, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1043, 277, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1044, 277, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1045, 277, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1046, 277, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1047, 278, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1048, 278, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1049, 278, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1050, 278, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1051, 279, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1052, 279, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1053, 279, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1054, 279, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1055, 279, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1056, 280, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1057, 280, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1058, 280, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1059, 280, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1060, 281, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1061, 281, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1062, 281, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1063, 281, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1064, 282, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1065, 282, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1066, 282, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1067, 282, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1068, 283, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1069, 283, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1070, 283, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1071, 283, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1072, 283, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1073, 284, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1074, 284, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1075, 284, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1076, 284, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1077, 285, 1, NULL, '批导判1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1078, 285, 0, NULL, '批导判1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1079, 286, 0, NULL, '批导判2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1080, 286, 1, NULL, '批导判2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1081, 288, NULL, NULL, '参考答案1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1082, 289, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1083, 289, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1084, 289, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1085, 289, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1086, 290, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1087, 290, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1088, 290, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1089, 290, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1090, 291, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1091, 291, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1092, 291, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1093, 291, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1094, 291, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1095, 292, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1096, 292, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1097, 292, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1098, 292, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1099, 293, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1100, 293, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1101, 293, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1102, 293, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1103, 294, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1104, 294, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1105, 294, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1106, 294, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1107, 295, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1108, 295, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1109, 295, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1110, 295, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1111, 295, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1112, 296, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1113, 296, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1114, 296, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1115, 296, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1116, 297, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1117, 297, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1118, 297, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1119, 297, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1120, 298, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1121, 298, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1122, 298, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1123, 298, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1124, 299, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1125, 299, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1126, 299, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1127, 299, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1128, 299, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1129, 300, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1130, 300, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1131, 300, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1132, 300, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1133, 301, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1134, 301, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1135, 301, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1136, 301, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1137, 302, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1138, 302, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1139, 302, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1140, 302, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1141, 303, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1142, 303, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1143, 303, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1144, 303, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1145, 303, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1146, 304, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1147, 304, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1148, 304, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1149, 304, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1150, 305, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1151, 305, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1152, 305, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1153, 305, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1154, 306, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1155, 306, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1156, 306, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1157, 306, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1158, 307, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1159, 307, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1160, 307, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1161, 307, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1162, 307, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1163, 308, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1164, 308, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1165, 308, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1166, 308, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1167, 309, 0, NULL, '批导单1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1168, 309, 1, NULL, '批导单1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1169, 309, 0, NULL, '批导单1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1170, 309, 0, NULL, '批导单1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1171, 310, 1, NULL, '批导单2选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1172, 310, 0, NULL, '批导单2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1173, 310, 0, NULL, '批导单2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1174, 310, 0, NULL, '批导单2选3', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1175, 311, 1, NULL, '批导多1选1', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1176, 311, 1, NULL, '批导多1选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1177, 311, 1, NULL, '批导多1选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1178, 311, 0, NULL, '批导多1选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1179, 311, 0, NULL, '批导多1选5', 4);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1180, 312, 1, NULL, '批导多2选2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1181, 312, 1, NULL, '批导多2选2', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1182, 312, 0, NULL, '批导多2选3', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1183, 312, 0, NULL, '批导多2选4', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1184, 313, 1, NULL, 'culpa dolor Ut ipsum12', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1185, 313, 0, NULL, 'culpa dolor Ut ipsum13', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1186, 313, 0, NULL, 'culpa dolor Ut ipsum14', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1187, 313, 0, NULL, 'culpa dolor Ut ipsum15', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1188, 314, 1, NULL, 'culpa dolor Ut ipsum2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1189, 314, 0, NULL, 'culpa dolor Ut ipsum3', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1190, 314, 0, NULL, 'culpa dolor Ut ipsum4', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1191, 314, 0, NULL, 'culpa dolor Ut ipsum5', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1192, 315, 1, NULL, 'culpa dolor Ut ipsum7', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1193, 315, 0, NULL, 'culpa dolor Ut ipsum8', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1194, 315, 0, NULL, 'culpa dolor Ut ipsum9', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1195, 315, 0, NULL, 'culpa dolor Ut ipsum10', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1196, 316, 1, NULL, 'culpa dolor Ut ipsum22', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1197, 316, 0, NULL, 'culpa dolor Ut ipsum23', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1198, 316, 0, NULL, 'culpa dolor Ut ipsum24', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1199, 316, 0, NULL, 'culpa dolor Ut ipsum25', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1200, 317, 1, NULL, 'culpa dolor Ut ipsum17', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1201, 317, 0, NULL, 'culpa dolor Ut ipsum18', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1202, 317, 0, NULL, 'culpa dolor Ut ipsum19', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1203, 317, 0, NULL, 'culpa dolor Ut ipsum20', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1204, 318, 1, NULL, 'culpa dolor Ut ipsum27', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1205, 318, 0, NULL, 'culpa dolor Ut ipsum28', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1206, 318, 0, NULL, 'culpa dolor Ut ipsum29', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1207, 318, 0, NULL, 'culpa dolor Ut ipsum30', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1208, 320, 1, NULL, 'culpa dolor Ut ipsum7', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1209, 320, 0, NULL, 'culpa dolor Ut ipsum8', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1210, 320, 0, NULL, 'culpa dolor Ut ipsum9', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1211, 320, 0, NULL, 'culpa dolor Ut ipsum10', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1212, 321, 1, NULL, 'culpa dolor Ut ipsum12', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1213, 321, 0, NULL, 'culpa dolor Ut ipsum13', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1214, 321, 0, NULL, 'culpa dolor Ut ipsum14', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1215, 321, 0, NULL, 'culpa dolor Ut ipsum15', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1216, 319, 1, NULL, 'culpa dolor Ut ipsum2', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1217, 319, 0, NULL, 'culpa dolor Ut ipsum3', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1218, 319, 0, NULL, 'culpa dolor Ut ipsum4', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1219, 319, 0, NULL, 'culpa dolor Ut ipsum5', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1220, 322, 1, NULL, 'culpa dolor Ut ipsum17', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1221, 322, 0, NULL, 'culpa dolor Ut ipsum18', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1222, 322, 0, NULL, 'culpa dolor Ut ipsum19', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1223, 322, 0, NULL, 'culpa dolor Ut ipsum20', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1224, 323, 1, NULL, 'culpa dolor Ut ipsum22', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1225, 323, 0, NULL, 'culpa dolor Ut ipsum23', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1226, 323, 0, NULL, 'culpa dolor Ut ipsum24', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1227, 323, 0, NULL, 'culpa dolor Ut ipsum25', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1228, 324, 1, NULL, 'culpa dolor Ut ipsum42', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1229, 324, 0, NULL, 'culpa dolor Ut ipsum43', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1230, 324, 0, NULL, 'culpa dolor Ut ipsum44', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1231, 324, 0, NULL, 'culpa dolor Ut ipsum45', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1232, 325, 1, NULL, 'culpa dolor Ut ipsum32', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1233, 325, 0, NULL, 'culpa dolor Ut ipsum33', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1234, 325, 0, NULL, 'culpa dolor Ut ipsum34', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1235, 325, 0, NULL, 'culpa dolor Ut ipsum35', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1236, 326, 1, NULL, 'culpa dolor Ut ipsum37', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1237, 326, 0, NULL, 'culpa dolor Ut ipsum38', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1238, 326, 0, NULL, 'culpa dolor Ut ipsum39', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1239, 326, 0, NULL, 'culpa dolor Ut ipsum40', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1240, 327, 1, NULL, 'culpa dolor Ut ipsum27', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1241, 327, 0, NULL, 'culpa dolor Ut ipsum28', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1242, 327, 0, NULL, 'culpa dolor Ut ipsum29', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1243, 327, 0, NULL, 'culpa dolor Ut ipsum30', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1244, 328, 1, NULL, 'culpa dolor Ut ipsum42', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1245, 328, 0, NULL, 'culpa dolor Ut ipsum43', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1246, 328, 0, NULL, 'culpa dolor Ut ipsum44', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1247, 328, 0, NULL, 'culpa dolor Ut ipsum45', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1248, 329, 1, NULL, 'culpa dolor Ut ipsum37', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1249, 329, 0, NULL, 'culpa dolor Ut ipsum38', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1250, 329, 0, NULL, 'culpa dolor Ut ipsum39', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1251, 329, 0, NULL, 'culpa dolor Ut ipsum40', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1252, 331, 1, NULL, 'culpa dolor Ut ipsum47', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1253, 331, 0, NULL, 'culpa dolor Ut ipsum48', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1254, 331, 0, NULL, 'culpa dolor Ut ipsum49', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1255, 331, 0, NULL, 'culpa dolor Ut ipsum50', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1256, 330, 1, NULL, 'culpa dolor Ut ipsum32', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1257, 330, 0, NULL, 'culpa dolor Ut ipsum33', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1258, 330, 0, NULL, 'culpa dolor Ut ipsum34', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1259, 330, 0, NULL, 'culpa dolor Ut ipsum35', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1260, 332, 1, NULL, 'culpa dolor Ut ipsum47', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1261, 332, 0, NULL, 'culpa dolor Ut ipsum48', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1262, 332, 0, NULL, 'culpa dolor Ut ipsum49', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1263, 332, 0, NULL, 'culpa dolor Ut ipsum50', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1264, 333, 1, NULL, 'culpa dolor Ut ipsum57', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1265, 333, 0, NULL, 'culpa dolor Ut ipsum58', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1266, 333, 0, NULL, 'culpa dolor Ut ipsum59', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1267, 333, 0, NULL, 'culpa dolor Ut ipsum60', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1268, 334, 1, NULL, 'culpa dolor Ut ipsum52', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1269, 334, 0, NULL, 'culpa dolor Ut ipsum53', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1270, 334, 0, NULL, 'culpa dolor Ut ipsum54', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1271, 334, 0, NULL, 'culpa dolor Ut ipsum55', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1272, 335, 1, NULL, 'culpa dolor Ut ipsum67', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1273, 335, 0, NULL, 'culpa dolor Ut ipsum68', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1274, 335, 0, NULL, 'culpa dolor Ut ipsum69', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1275, 335, 0, NULL, 'culpa dolor Ut ipsum70', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1276, 336, 1, NULL, 'culpa dolor Ut ipsum62', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1277, 336, 0, NULL, 'culpa dolor Ut ipsum63', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1278, 336, 0, NULL, 'culpa dolor Ut ipsum64', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1279, 336, 0, NULL, 'culpa dolor Ut ipsum65', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1280, 337, 1, NULL, 'culpa dolor Ut ipsum72', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1281, 337, 0, NULL, 'culpa dolor Ut ipsum73', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1282, 337, 0, NULL, 'culpa dolor Ut ipsum74', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1283, 337, 0, NULL, 'culpa dolor Ut ipsum75', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1284, 338, 1, NULL, 'culpa dolor Ut ipsum62', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1285, 338, 0, NULL, 'culpa dolor Ut ipsum63', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1286, 338, 0, NULL, 'culpa dolor Ut ipsum64', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1287, 338, 0, NULL, 'culpa dolor Ut ipsum65', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1288, 339, 1, NULL, 'culpa dolor Ut ipsum52', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1289, 339, 0, NULL, 'culpa dolor Ut ipsum53', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1290, 339, 0, NULL, 'culpa dolor Ut ipsum54', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1291, 339, 0, NULL, 'culpa dolor Ut ipsum55', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1292, 340, 1, NULL, 'culpa dolor Ut ipsum72', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1293, 340, 0, NULL, 'culpa dolor Ut ipsum73', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1294, 340, 0, NULL, 'culpa dolor Ut ipsum74', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1295, 340, 0, NULL, 'culpa dolor Ut ipsum75', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1296, 341, 1, NULL, 'culpa dolor Ut ipsum57', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1297, 341, 0, NULL, 'culpa dolor Ut ipsum58', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1298, 341, 0, NULL, 'culpa dolor Ut ipsum59', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1299, 341, 0, NULL, 'culpa dolor Ut ipsum60', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1300, 342, 1, NULL, 'culpa dolor Ut ipsum67', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1301, 342, 0, NULL, 'culpa dolor Ut ipsum68', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1302, 342, 0, NULL, 'culpa dolor Ut ipsum69', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1303, 342, 0, NULL, 'culpa dolor Ut ipsum70', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1304, 343, 1, NULL, 'culpa dolor Ut ipsum77', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1305, 343, 0, NULL, 'culpa dolor Ut ipsum78', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1306, 343, 0, NULL, 'culpa dolor Ut ipsum79', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1307, 343, 0, NULL, 'culpa dolor Ut ipsum80', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1308, 344, 1, NULL, 'culpa dolor Ut ipsum82', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1309, 344, 0, NULL, 'culpa dolor Ut ipsum83', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1310, 344, 0, NULL, 'culpa dolor Ut ipsum84', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1311, 344, 0, NULL, 'culpa dolor Ut ipsum85', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1312, 345, 1, NULL, 'culpa dolor Ut ipsum87', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1313, 345, 0, NULL, 'culpa dolor Ut ipsum88', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1314, 345, 0, NULL, 'culpa dolor Ut ipsum89', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1315, 345, 0, NULL, 'culpa dolor Ut ipsum90', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1316, 346, 1, NULL, 'culpa dolor Ut ipsum77', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1317, 346, 0, NULL, 'culpa dolor Ut ipsum78', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1318, 346, 0, NULL, 'culpa dolor Ut ipsum79', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1319, 346, 0, NULL, 'culpa dolor Ut ipsum80', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1320, 349, 1, NULL, 'culpa dolor Ut ipsum97', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1321, 349, 0, NULL, 'culpa dolor Ut ipsum98', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1322, 349, 0, NULL, 'culpa dolor Ut ipsum99', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1323, 349, 0, NULL, 'culpa dolor Ut ipsum100', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1324, 347, 1, NULL, 'culpa dolor Ut ipsum82', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1325, 347, 0, NULL, 'culpa dolor Ut ipsum83', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1326, 347, 0, NULL, 'culpa dolor Ut ipsum84', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1327, 347, 0, NULL, 'culpa dolor Ut ipsum85', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1328, 350, 1, NULL, 'culpa dolor Ut ipsum92', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1329, 350, 0, NULL, 'culpa dolor Ut ipsum93', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1330, 350, 0, NULL, 'culpa dolor Ut ipsum94', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1331, 350, 0, NULL, 'culpa dolor Ut ipsum95', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1332, 348, 1, NULL, 'culpa dolor Ut ipsum87', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1333, 348, 0, NULL, 'culpa dolor Ut ipsum88', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1334, 348, 0, NULL, 'culpa dolor Ut ipsum89', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1335, 348, 0, NULL, 'culpa dolor Ut ipsum90', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1336, 352, 1, NULL, 'culpa dolor Ut ipsum102', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1337, 352, 0, NULL, 'culpa dolor Ut ipsum103', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1338, 352, 0, NULL, 'culpa dolor Ut ipsum104', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1339, 352, 0, NULL, 'culpa dolor Ut ipsum105', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1340, 351, 1, NULL, 'culpa dolor Ut ipsum92', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1341, 351, 0, NULL, 'culpa dolor Ut ipsum93', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1342, 351, 0, NULL, 'culpa dolor Ut ipsum94', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1343, 351, 0, NULL, 'culpa dolor Ut ipsum95', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1344, 353, 1, NULL, 'culpa dolor Ut ipsum97', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1345, 353, 0, NULL, 'culpa dolor Ut ipsum98', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1346, 353, 0, NULL, 'culpa dolor Ut ipsum99', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1347, 353, 0, NULL, 'culpa dolor Ut ipsum100', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1348, 354, 1, NULL, 'culpa dolor Ut ipsum107', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1349, 354, 0, NULL, 'culpa dolor Ut ipsum108', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1350, 354, 0, NULL, 'culpa dolor Ut ipsum109', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1351, 354, 0, NULL, 'culpa dolor Ut ipsum110', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1352, 355, 1, NULL, 'culpa dolor Ut ipsum112', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1353, 355, 0, NULL, 'culpa dolor Ut ipsum113', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1354, 355, 0, NULL, 'culpa dolor Ut ipsum114', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1355, 355, 0, NULL, 'culpa dolor Ut ipsum115', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1356, 356, 1, NULL, 'culpa dolor Ut ipsum117', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1357, 356, 0, NULL, 'culpa dolor Ut ipsum118', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1358, 356, 0, NULL, 'culpa dolor Ut ipsum119', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1359, 356, 0, NULL, 'culpa dolor Ut ipsum120', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1360, 358, 1, NULL, 'culpa dolor Ut ipsum107', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1361, 358, 0, NULL, 'culpa dolor Ut ipsum108', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1362, 358, 0, NULL, 'culpa dolor Ut ipsum109', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1363, 358, 0, NULL, 'culpa dolor Ut ipsum110', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1364, 357, 1, NULL, 'culpa dolor Ut ipsum102', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1365, 357, 0, NULL, 'culpa dolor Ut ipsum103', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1366, 357, 0, NULL, 'culpa dolor Ut ipsum104', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1367, 357, 0, NULL, 'culpa dolor Ut ipsum105', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1368, 359, 1, NULL, 'culpa dolor Ut ipsum117', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1369, 359, 0, NULL, 'culpa dolor Ut ipsum118', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1370, 359, 0, NULL, 'culpa dolor Ut ipsum119', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1371, 359, 0, NULL, 'culpa dolor Ut ipsum120', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1372, 361, 1, NULL, 'culpa dolor Ut ipsum122', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1373, 361, 0, NULL, 'culpa dolor Ut ipsum123', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1374, 361, 0, NULL, 'culpa dolor Ut ipsum124', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1375, 361, 0, NULL, 'culpa dolor Ut ipsum125', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1376, 360, 1, NULL, 'culpa dolor Ut ipsum112', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1377, 360, 0, NULL, 'culpa dolor Ut ipsum113', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1378, 360, 0, NULL, 'culpa dolor Ut ipsum114', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1379, 360, 0, NULL, 'culpa dolor Ut ipsum115', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1380, 362, 1, NULL, 'culpa dolor Ut ipsum132', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1381, 362, 0, NULL, 'culpa dolor Ut ipsum133', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1382, 362, 0, NULL, 'culpa dolor Ut ipsum134', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1383, 362, 0, NULL, 'culpa dolor Ut ipsum135', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1384, 363, 1, NULL, 'culpa dolor Ut ipsum127', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1385, 363, 0, NULL, 'culpa dolor Ut ipsum128', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1386, 363, 0, NULL, 'culpa dolor Ut ipsum129', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1387, 363, 0, NULL, 'culpa dolor Ut ipsum130', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1388, 364, 1, NULL, 'culpa dolor Ut ipsum122', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1389, 364, 0, NULL, 'culpa dolor Ut ipsum123', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1390, 364, 0, NULL, 'culpa dolor Ut ipsum124', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1391, 364, 0, NULL, 'culpa dolor Ut ipsum125', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1392, 365, 1, NULL, 'culpa dolor Ut ipsum132', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1393, 365, 0, NULL, 'culpa dolor Ut ipsum133', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1394, 365, 0, NULL, 'culpa dolor Ut ipsum134', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1395, 365, 0, NULL, 'culpa dolor Ut ipsum135', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1396, 366, 1, NULL, 'culpa dolor Ut ipsum137', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1397, 366, 0, NULL, 'culpa dolor Ut ipsum138', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1398, 366, 0, NULL, 'culpa dolor Ut ipsum139', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1399, 366, 0, NULL, 'culpa dolor Ut ipsum140', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1400, 367, 1, NULL, 'culpa dolor Ut ipsum127', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1401, 367, 0, NULL, 'culpa dolor Ut ipsum128', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1402, 367, 0, NULL, 'culpa dolor Ut ipsum129', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1403, 367, 0, NULL, 'culpa dolor Ut ipsum130', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1404, 368, 1, NULL, 'culpa dolor Ut ipsum147', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1405, 368, 0, NULL, 'culpa dolor Ut ipsum148', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1406, 368, 0, NULL, 'culpa dolor Ut ipsum149', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1407, 368, 0, NULL, 'culpa dolor Ut ipsum150', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1408, 369, 1, NULL, 'culpa dolor Ut ipsum142', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1409, 369, 0, NULL, 'culpa dolor Ut ipsum143', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1410, 369, 0, NULL, 'culpa dolor Ut ipsum144', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1411, 369, 0, NULL, 'culpa dolor Ut ipsum145', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1412, 371, 1, NULL, 'culpa dolor Ut ipsum142', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1413, 371, 0, NULL, 'culpa dolor Ut ipsum143', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1414, 371, 0, NULL, 'culpa dolor Ut ipsum144', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1415, 371, 0, NULL, 'culpa dolor Ut ipsum145', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1416, 370, 1, NULL, 'culpa dolor Ut ipsum137', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1417, 370, 0, NULL, 'culpa dolor Ut ipsum138', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1418, 370, 0, NULL, 'culpa dolor Ut ipsum139', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1419, 370, 0, NULL, 'culpa dolor Ut ipsum140', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1420, 372, 1, NULL, 'culpa dolor Ut ipsum147', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1421, 372, 0, NULL, 'culpa dolor Ut ipsum148', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1422, 372, 0, NULL, 'culpa dolor Ut ipsum149', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1423, 372, 0, NULL, 'culpa dolor Ut ipsum150', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1424, 373, 1, NULL, 'culpa dolor Ut ipsum152', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1425, 373, 0, NULL, 'culpa dolor Ut ipsum153', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1426, 373, 0, NULL, 'culpa dolor Ut ipsum154', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1427, 373, 0, NULL, 'culpa dolor Ut ipsum155', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1428, 374, 1, NULL, 'culpa dolor Ut ipsum162', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1429, 374, 0, NULL, 'culpa dolor Ut ipsum163', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1430, 374, 0, NULL, 'culpa dolor Ut ipsum164', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1431, 374, 0, NULL, 'culpa dolor Ut ipsum165', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1432, 375, 1, NULL, 'culpa dolor Ut ipsum157', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1433, 375, 0, NULL, 'culpa dolor Ut ipsum158', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1434, 375, 0, NULL, 'culpa dolor Ut ipsum159', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1435, 375, 0, NULL, 'culpa dolor Ut ipsum160', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1436, 376, 1, NULL, 'culpa dolor Ut ipsum157', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1437, 376, 0, NULL, 'culpa dolor Ut ipsum158', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1438, 376, 0, NULL, 'culpa dolor Ut ipsum159', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1439, 376, 0, NULL, 'culpa dolor Ut ipsum160', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1440, 377, 1, NULL, 'culpa dolor Ut ipsum167', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1441, 377, 0, NULL, 'culpa dolor Ut ipsum168', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1442, 377, 0, NULL, 'culpa dolor Ut ipsum169', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1443, 377, 0, NULL, 'culpa dolor Ut ipsum170', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1444, 378, 1, NULL, 'culpa dolor Ut ipsum172', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1445, 378, 0, NULL, 'culpa dolor Ut ipsum173', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1446, 378, 0, NULL, 'culpa dolor Ut ipsum174', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1447, 378, 0, NULL, 'culpa dolor Ut ipsum175', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1448, 379, 1, NULL, 'culpa dolor Ut ipsum162', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1449, 379, 0, NULL, 'culpa dolor Ut ipsum163', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1450, 379, 0, NULL, 'culpa dolor Ut ipsum164', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1451, 379, 0, NULL, 'culpa dolor Ut ipsum165', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1452, 380, 1, NULL, 'culpa dolor Ut ipsum152', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1453, 380, 0, NULL, 'culpa dolor Ut ipsum153', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1454, 380, 0, NULL, 'culpa dolor Ut ipsum154', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1455, 380, 0, NULL, 'culpa dolor Ut ipsum155', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1456, 383, 1, NULL, 'culpa dolor Ut ipsum177', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1457, 383, 0, NULL, 'culpa dolor Ut ipsum178', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1458, 383, 0, NULL, 'culpa dolor Ut ipsum179', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1459, 383, 0, NULL, 'culpa dolor Ut ipsum180', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1460, 381, 1, NULL, 'culpa dolor Ut ipsum172', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1461, 381, 0, NULL, 'culpa dolor Ut ipsum173', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1462, 381, 0, NULL, 'culpa dolor Ut ipsum174', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1463, 381, 0, NULL, 'culpa dolor Ut ipsum175', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1464, 382, 1, NULL, 'culpa dolor Ut ipsum167', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1465, 382, 0, NULL, 'culpa dolor Ut ipsum168', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1466, 382, 0, NULL, 'culpa dolor Ut ipsum169', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1467, 382, 0, NULL, 'culpa dolor Ut ipsum170', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1468, 384, 1, NULL, 'culpa dolor Ut ipsum187', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1469, 384, 0, NULL, 'culpa dolor Ut ipsum188', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1470, 384, 0, NULL, 'culpa dolor Ut ipsum189', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1471, 384, 0, NULL, 'culpa dolor Ut ipsum190', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1472, 387, 1, NULL, 'culpa dolor Ut ipsum197', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1473, 387, 0, NULL, 'culpa dolor Ut ipsum198', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1474, 387, 0, NULL, 'culpa dolor Ut ipsum199', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1475, 387, 0, NULL, 'culpa dolor Ut ipsum200', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1476, 388, 1, NULL, 'culpa dolor Ut ipsum192', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1477, 388, 0, NULL, 'culpa dolor Ut ipsum193', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1478, 388, 0, NULL, 'culpa dolor Ut ipsum194', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1479, 388, 0, NULL, 'culpa dolor Ut ipsum195', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1480, 385, 1, NULL, 'culpa dolor Ut ipsum182', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1481, 385, 0, NULL, 'culpa dolor Ut ipsum183', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1482, 385, 0, NULL, 'culpa dolor Ut ipsum184', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1483, 385, 0, NULL, 'culpa dolor Ut ipsum185', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1484, 386, 1, NULL, 'culpa dolor Ut ipsum177', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1485, 386, 0, NULL, 'culpa dolor Ut ipsum178', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1486, 386, 0, NULL, 'culpa dolor Ut ipsum179', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1487, 386, 0, NULL, 'culpa dolor Ut ipsum180', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1488, 389, 1, NULL, 'culpa dolor Ut ipsum182', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1489, 389, 0, NULL, 'culpa dolor Ut ipsum183', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1490, 389, 0, NULL, 'culpa dolor Ut ipsum184', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1491, 389, 0, NULL, 'culpa dolor Ut ipsum185', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1492, 390, 1, NULL, 'culpa dolor Ut ipsum192', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1493, 390, 0, NULL, 'culpa dolor Ut ipsum193', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1494, 390, 0, NULL, 'culpa dolor Ut ipsum194', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1495, 390, 0, NULL, 'culpa dolor Ut ipsum195', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1496, 391, 1, NULL, 'culpa dolor Ut ipsum187', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1497, 391, 0, NULL, 'culpa dolor Ut ipsum188', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1498, 391, 0, NULL, 'culpa dolor Ut ipsum189', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1499, 391, 0, NULL, 'culpa dolor Ut ipsum190', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1500, 392, 1, NULL, 'culpa dolor Ut ipsum207', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1501, 392, 0, NULL, 'culpa dolor Ut ipsum208', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1502, 392, 0, NULL, 'culpa dolor Ut ipsum209', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1503, 392, 0, NULL, 'culpa dolor Ut ipsum210', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1504, 393, 1, NULL, 'culpa dolor Ut ipsum197', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1505, 393, 0, NULL, 'culpa dolor Ut ipsum198', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1506, 393, 0, NULL, 'culpa dolor Ut ipsum199', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1507, 393, 0, NULL, 'culpa dolor Ut ipsum200', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1508, 394, 1, NULL, 'culpa dolor Ut ipsum202', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1509, 394, 0, NULL, 'culpa dolor Ut ipsum203', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1510, 394, 0, NULL, 'culpa dolor Ut ipsum204', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1511, 394, 0, NULL, 'culpa dolor Ut ipsum205', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1512, 396, 1, NULL, 'culpa dolor Ut ipsum212', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1513, 396, 0, NULL, 'culpa dolor Ut ipsum213', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1514, 396, 0, NULL, 'culpa dolor Ut ipsum214', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1515, 396, 0, NULL, 'culpa dolor Ut ipsum215', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1516, 395, 1, NULL, 'culpa dolor Ut ipsum202', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1517, 395, 0, NULL, 'culpa dolor Ut ipsum203', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1518, 395, 0, NULL, 'culpa dolor Ut ipsum204', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1519, 395, 0, NULL, 'culpa dolor Ut ipsum205', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1520, 397, 1, NULL, 'culpa dolor Ut ipsum207', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1521, 397, 0, NULL, 'culpa dolor Ut ipsum208', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1522, 397, 0, NULL, 'culpa dolor Ut ipsum209', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1523, 397, 0, NULL, 'culpa dolor Ut ipsum210', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1524, 398, 1, NULL, 'culpa dolor Ut ipsum217', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1525, 398, 0, NULL, 'culpa dolor Ut ipsum218', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1526, 398, 0, NULL, 'culpa dolor Ut ipsum219', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1527, 398, 0, NULL, 'culpa dolor Ut ipsum220', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1528, 399, 1, NULL, 'culpa dolor Ut ipsum222', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1529, 399, 0, NULL, 'culpa dolor Ut ipsum223', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1530, 399, 0, NULL, 'culpa dolor Ut ipsum224', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1531, 399, 0, NULL, 'culpa dolor Ut ipsum225', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1532, 400, 1, NULL, 'culpa dolor Ut ipsum212', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1533, 400, 0, NULL, 'culpa dolor Ut ipsum213', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1534, 400, 0, NULL, 'culpa dolor Ut ipsum214', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1535, 400, 0, NULL, 'culpa dolor Ut ipsum215', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1536, 401, 1, NULL, 'culpa dolor Ut ipsum217', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1537, 401, 0, NULL, 'culpa dolor Ut ipsum218', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1538, 401, 0, NULL, 'culpa dolor Ut ipsum219', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1539, 401, 0, NULL, 'culpa dolor Ut ipsum220', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1540, 402, 1, NULL, 'culpa dolor Ut ipsum222', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1541, 402, 0, NULL, 'culpa dolor Ut ipsum223', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1542, 402, 0, NULL, 'culpa dolor Ut ipsum224', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1543, 402, 0, NULL, 'culpa dolor Ut ipsum225', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1544, 403, 1, NULL, 'culpa dolor Ut ipsum232', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1545, 403, 0, NULL, 'culpa dolor Ut ipsum233', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1546, 403, 0, NULL, 'culpa dolor Ut ipsum234', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1547, 403, 0, NULL, 'culpa dolor Ut ipsum235', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1548, 404, 1, NULL, 'culpa dolor Ut ipsum237', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1549, 404, 0, NULL, 'culpa dolor Ut ipsum238', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1550, 404, 0, NULL, 'culpa dolor Ut ipsum239', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1551, 404, 0, NULL, 'culpa dolor Ut ipsum240', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1552, 405, 1, NULL, 'culpa dolor Ut ipsum227', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1553, 405, 0, NULL, 'culpa dolor Ut ipsum228', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1554, 405, 0, NULL, 'culpa dolor Ut ipsum229', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1555, 405, 0, NULL, 'culpa dolor Ut ipsum230', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1556, 406, 1, NULL, 'culpa dolor Ut ipsum247', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1557, 406, 0, NULL, 'culpa dolor Ut ipsum248', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1558, 406, 0, NULL, 'culpa dolor Ut ipsum249', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1559, 406, 0, NULL, 'culpa dolor Ut ipsum250', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1560, 407, 1, NULL, 'culpa dolor Ut ipsum237', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1561, 407, 0, NULL, 'culpa dolor Ut ipsum238', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1562, 407, 0, NULL, 'culpa dolor Ut ipsum239', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1563, 407, 0, NULL, 'culpa dolor Ut ipsum240', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1564, 408, 1, NULL, 'culpa dolor Ut ipsum232', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1565, 408, 0, NULL, 'culpa dolor Ut ipsum233', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1566, 408, 0, NULL, 'culpa dolor Ut ipsum234', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1567, 408, 0, NULL, 'culpa dolor Ut ipsum235', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1568, 409, 1, NULL, 'culpa dolor Ut ipsum227', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1569, 409, 0, NULL, 'culpa dolor Ut ipsum228', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1570, 409, 0, NULL, 'culpa dolor Ut ipsum229', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1571, 409, 0, NULL, 'culpa dolor Ut ipsum230', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1572, 410, 1, NULL, 'culpa dolor Ut ipsum242', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1573, 410, 0, NULL, 'culpa dolor Ut ipsum243', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1574, 410, 0, NULL, 'culpa dolor Ut ipsum244', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1575, 410, 0, NULL, 'culpa dolor Ut ipsum245', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1576, 411, 1, NULL, 'culpa dolor Ut ipsum242', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1577, 411, 0, NULL, 'culpa dolor Ut ipsum243', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1578, 411, 0, NULL, 'culpa dolor Ut ipsum244', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1579, 411, 0, NULL, 'culpa dolor Ut ipsum245', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1580, 412, 1, NULL, 'culpa dolor Ut ipsum247', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1581, 412, 0, NULL, 'culpa dolor Ut ipsum248', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1582, 412, 0, NULL, 'culpa dolor Ut ipsum249', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1583, 412, 0, NULL, 'culpa dolor Ut ipsum250', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1584, 413, 1, NULL, 'culpa dolor Ut ipsum252', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1585, 413, 0, NULL, 'culpa dolor Ut ipsum253', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1586, 413, 0, NULL, 'culpa dolor Ut ipsum254', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1587, 413, 0, NULL, 'culpa dolor Ut ipsum255', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1588, 414, 1, NULL, 'culpa dolor Ut ipsum262', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1589, 414, 0, NULL, 'culpa dolor Ut ipsum263', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1590, 414, 0, NULL, 'culpa dolor Ut ipsum264', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1591, 414, 0, NULL, 'culpa dolor Ut ipsum265', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1592, 415, 1, NULL, 'culpa dolor Ut ipsum257', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1593, 415, 0, NULL, 'culpa dolor Ut ipsum258', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1594, 415, 0, NULL, 'culpa dolor Ut ipsum259', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1595, 415, 0, NULL, 'culpa dolor Ut ipsum260', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1596, 416, 1, NULL, 'culpa dolor Ut ipsum267', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1597, 416, 0, NULL, 'culpa dolor Ut ipsum268', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1598, 416, 0, NULL, 'culpa dolor Ut ipsum269', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1599, 416, 0, NULL, 'culpa dolor Ut ipsum270', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1600, 418, 1, NULL, 'culpa dolor Ut ipsum262', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1601, 418, 0, NULL, 'culpa dolor Ut ipsum263', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1602, 418, 0, NULL, 'culpa dolor Ut ipsum264', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1603, 418, 0, NULL, 'culpa dolor Ut ipsum265', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1604, 417, 1, NULL, 'culpa dolor Ut ipsum252', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1605, 417, 0, NULL, 'culpa dolor Ut ipsum253', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1606, 417, 0, NULL, 'culpa dolor Ut ipsum254', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1607, 417, 0, NULL, 'culpa dolor Ut ipsum255', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1608, 419, 1, NULL, 'culpa dolor Ut ipsum257', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1609, 419, 0, NULL, 'culpa dolor Ut ipsum258', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1610, 419, 0, NULL, 'culpa dolor Ut ipsum259', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1611, 419, 0, NULL, 'culpa dolor Ut ipsum260', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1612, 421, 1, NULL, 'culpa dolor Ut ipsum272', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1613, 421, 0, NULL, 'culpa dolor Ut ipsum273', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1614, 421, 0, NULL, 'culpa dolor Ut ipsum274', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1615, 421, 0, NULL, 'culpa dolor Ut ipsum275', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1616, 420, 1, NULL, 'culpa dolor Ut ipsum267', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1617, 420, 0, NULL, 'culpa dolor Ut ipsum268', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1618, 420, 0, NULL, 'culpa dolor Ut ipsum269', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1619, 420, 0, NULL, 'culpa dolor Ut ipsum270', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1620, 422, 1, NULL, 'culpa dolor Ut ipsum272', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1621, 422, 0, NULL, 'culpa dolor Ut ipsum273', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1622, 422, 0, NULL, 'culpa dolor Ut ipsum274', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1623, 422, 0, NULL, 'culpa dolor Ut ipsum275', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1624, 423, 1, NULL, 'culpa dolor Ut ipsum277', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1625, 423, 0, NULL, 'culpa dolor Ut ipsum278', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1626, 423, 0, NULL, 'culpa dolor Ut ipsum279', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1627, 423, 0, NULL, 'culpa dolor Ut ipsum280', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1628, 424, 1, NULL, 'culpa dolor Ut ipsum282', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1629, 424, 0, NULL, 'culpa dolor Ut ipsum283', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1630, 424, 0, NULL, 'culpa dolor Ut ipsum284', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1631, 424, 0, NULL, 'culpa dolor Ut ipsum285', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1632, 425, 1, NULL, 'culpa dolor Ut ipsum282', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1633, 425, 0, NULL, 'culpa dolor Ut ipsum283', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1634, 425, 0, NULL, 'culpa dolor Ut ipsum284', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1635, 425, 0, NULL, 'culpa dolor Ut ipsum285', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1636, 427, 1, NULL, 'culpa dolor Ut ipsum297', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1637, 427, 0, NULL, 'culpa dolor Ut ipsum298', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1638, 427, 0, NULL, 'culpa dolor Ut ipsum299', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1639, 427, 0, NULL, 'culpa dolor Ut ipsum300', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1640, 426, 1, NULL, 'culpa dolor Ut ipsum287', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1641, 426, 0, NULL, 'culpa dolor Ut ipsum288', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1642, 426, 0, NULL, 'culpa dolor Ut ipsum289', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1643, 426, 0, NULL, 'culpa dolor Ut ipsum290', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1644, 428, 1, NULL, 'culpa dolor Ut ipsum277', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1645, 428, 0, NULL, 'culpa dolor Ut ipsum278', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1646, 428, 0, NULL, 'culpa dolor Ut ipsum279', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1647, 428, 0, NULL, 'culpa dolor Ut ipsum280', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1648, 429, 1, NULL, 'culpa dolor Ut ipsum292', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1649, 429, 0, NULL, 'culpa dolor Ut ipsum293', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1650, 429, 0, NULL, 'culpa dolor Ut ipsum294', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1651, 429, 0, NULL, 'culpa dolor Ut ipsum295', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1652, 431, 1, NULL, 'culpa dolor Ut ipsum292', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1653, 431, 0, NULL, 'culpa dolor Ut ipsum293', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1654, 431, 0, NULL, 'culpa dolor Ut ipsum294', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1655, 431, 0, NULL, 'culpa dolor Ut ipsum295', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1656, 430, 1, NULL, 'culpa dolor Ut ipsum287', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1657, 430, 0, NULL, 'culpa dolor Ut ipsum288', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1658, 430, 0, NULL, 'culpa dolor Ut ipsum289', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1659, 430, 0, NULL, 'culpa dolor Ut ipsum290', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1660, 432, 1, NULL, 'culpa dolor Ut ipsum297', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1661, 432, 0, NULL, 'culpa dolor Ut ipsum298', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1662, 432, 0, NULL, 'culpa dolor Ut ipsum299', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1663, 432, 0, NULL, 'culpa dolor Ut ipsum300', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1664, 433, 1, NULL, 'culpa dolor Ut ipsum307', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1665, 433, 0, NULL, 'culpa dolor Ut ipsum308', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1666, 433, 0, NULL, 'culpa dolor Ut ipsum309', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1667, 433, 0, NULL, 'culpa dolor Ut ipsum310', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1668, 434, 1, NULL, 'culpa dolor Ut ipsum302', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1669, 434, 0, NULL, 'culpa dolor Ut ipsum303', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1670, 434, 0, NULL, 'culpa dolor Ut ipsum304', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1671, 434, 0, NULL, 'culpa dolor Ut ipsum305', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1672, 435, 1, NULL, 'culpa dolor Ut ipsum312', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1673, 435, 0, NULL, 'culpa dolor Ut ipsum313', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1674, 435, 0, NULL, 'culpa dolor Ut ipsum314', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1675, 435, 0, NULL, 'culpa dolor Ut ipsum315', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1676, 437, 1, NULL, 'culpa dolor Ut ipsum307', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1677, 437, 0, NULL, 'culpa dolor Ut ipsum308', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1678, 437, 0, NULL, 'culpa dolor Ut ipsum309', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1679, 437, 0, NULL, 'culpa dolor Ut ipsum310', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1680, 436, 1, NULL, 'culpa dolor Ut ipsum302', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1681, 436, 0, NULL, 'culpa dolor Ut ipsum303', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1682, 436, 0, NULL, 'culpa dolor Ut ipsum304', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1683, 436, 0, NULL, 'culpa dolor Ut ipsum305', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1684, 438, 1, NULL, 'culpa dolor Ut ipsum317', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1685, 438, 0, NULL, 'culpa dolor Ut ipsum318', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1686, 438, 0, NULL, 'culpa dolor Ut ipsum319', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1687, 438, 0, NULL, 'culpa dolor Ut ipsum320', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1688, 440, 1, NULL, 'culpa dolor Ut ipsum322', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1689, 440, 0, NULL, 'culpa dolor Ut ipsum323', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1690, 440, 0, NULL, 'culpa dolor Ut ipsum324', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1691, 440, 0, NULL, 'culpa dolor Ut ipsum325', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1692, 439, 1, NULL, 'culpa dolor Ut ipsum312', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1693, 439, 0, NULL, 'culpa dolor Ut ipsum313', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1694, 439, 0, NULL, 'culpa dolor Ut ipsum314', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1695, 439, 0, NULL, 'culpa dolor Ut ipsum315', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1696, 442, 1, NULL, 'culpa dolor Ut ipsum327', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1697, 442, 0, NULL, 'culpa dolor Ut ipsum328', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1698, 442, 0, NULL, 'culpa dolor Ut ipsum329', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1699, 442, 0, NULL, 'culpa dolor Ut ipsum330', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1700, 441, 1, NULL, 'culpa dolor Ut ipsum322', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1701, 441, 0, NULL, 'culpa dolor Ut ipsum323', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1702, 441, 0, NULL, 'culpa dolor Ut ipsum324', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1703, 441, 0, NULL, 'culpa dolor Ut ipsum325', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1704, 443, 1, NULL, 'culpa dolor Ut ipsum317', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1705, 443, 0, NULL, 'culpa dolor Ut ipsum318', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1706, 443, 0, NULL, 'culpa dolor Ut ipsum319', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1707, 443, 0, NULL, 'culpa dolor Ut ipsum320', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1708, 444, 1, NULL, 'culpa dolor Ut ipsum332', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1709, 444, 0, NULL, 'culpa dolor Ut ipsum333', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1710, 444, 0, NULL, 'culpa dolor Ut ipsum334', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1711, 444, 0, NULL, 'culpa dolor Ut ipsum335', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1712, 446, 1, NULL, 'culpa dolor Ut ipsum342', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1713, 446, 0, NULL, 'culpa dolor Ut ipsum343', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1714, 446, 0, NULL, 'culpa dolor Ut ipsum344', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1715, 446, 0, NULL, 'culpa dolor Ut ipsum345', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1716, 445, 1, NULL, 'culpa dolor Ut ipsum337', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1717, 445, 0, NULL, 'culpa dolor Ut ipsum338', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1718, 445, 0, NULL, 'culpa dolor Ut ipsum339', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1719, 445, 0, NULL, 'culpa dolor Ut ipsum340', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1720, 447, 1, NULL, 'culpa dolor Ut ipsum327', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1721, 447, 0, NULL, 'culpa dolor Ut ipsum328', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1722, 447, 0, NULL, 'culpa dolor Ut ipsum329', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1723, 447, 0, NULL, 'culpa dolor Ut ipsum330', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1724, 448, 1, NULL, 'culpa dolor Ut ipsum332', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1725, 448, 0, NULL, 'culpa dolor Ut ipsum333', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1726, 448, 0, NULL, 'culpa dolor Ut ipsum334', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1727, 448, 0, NULL, 'culpa dolor Ut ipsum335', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1728, 449, 1, NULL, 'culpa dolor Ut ipsum337', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1729, 449, 0, NULL, 'culpa dolor Ut ipsum338', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1730, 449, 0, NULL, 'culpa dolor Ut ipsum339', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1731, 449, 0, NULL, 'culpa dolor Ut ipsum340', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1732, 450, 1, NULL, 'culpa dolor Ut ipsum347', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1733, 450, 0, NULL, 'culpa dolor Ut ipsum348', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1734, 450, 0, NULL, 'culpa dolor Ut ipsum349', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1735, 450, 0, NULL, 'culpa dolor Ut ipsum350', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1736, 451, 1, NULL, 'culpa dolor Ut ipsum342', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1737, 451, 0, NULL, 'culpa dolor Ut ipsum343', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1738, 451, 0, NULL, 'culpa dolor Ut ipsum344', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1739, 451, 0, NULL, 'culpa dolor Ut ipsum345', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1740, 452, 1, NULL, 'culpa dolor Ut ipsum352', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1741, 452, 0, NULL, 'culpa dolor Ut ipsum353', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1742, 452, 0, NULL, 'culpa dolor Ut ipsum354', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1743, 452, 0, NULL, 'culpa dolor Ut ipsum355', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1744, 453, 1, NULL, 'culpa dolor Ut ipsum347', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1745, 453, 0, NULL, 'culpa dolor Ut ipsum348', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1746, 453, 0, NULL, 'culpa dolor Ut ipsum349', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1747, 453, 0, NULL, 'culpa dolor Ut ipsum350', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1748, 454, 1, NULL, 'culpa dolor Ut ipsum357', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1749, 454, 0, NULL, 'culpa dolor Ut ipsum358', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1750, 454, 0, NULL, 'culpa dolor Ut ipsum359', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1751, 454, 0, NULL, 'culpa dolor Ut ipsum360', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1752, 455, 1, NULL, 'culpa dolor Ut ipsum362', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1753, 455, 0, NULL, 'culpa dolor Ut ipsum363', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1754, 455, 0, NULL, 'culpa dolor Ut ipsum364', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1755, 455, 0, NULL, 'culpa dolor Ut ipsum365', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1756, 457, 1, NULL, 'culpa dolor Ut ipsum372', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1757, 457, 0, NULL, 'culpa dolor Ut ipsum373', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1758, 457, 0, NULL, 'culpa dolor Ut ipsum374', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1759, 457, 0, NULL, 'culpa dolor Ut ipsum375', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1760, 456, 1, NULL, 'culpa dolor Ut ipsum367', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1761, 456, 0, NULL, 'culpa dolor Ut ipsum368', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1762, 456, 0, NULL, 'culpa dolor Ut ipsum369', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1763, 456, 0, NULL, 'culpa dolor Ut ipsum370', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1764, 458, 1, NULL, 'culpa dolor Ut ipsum362', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1765, 458, 0, NULL, 'culpa dolor Ut ipsum363', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1766, 458, 0, NULL, 'culpa dolor Ut ipsum364', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1767, 458, 0, NULL, 'culpa dolor Ut ipsum365', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1768, 459, 1, NULL, 'culpa dolor Ut ipsum357', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1769, 459, 0, NULL, 'culpa dolor Ut ipsum358', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1770, 459, 0, NULL, 'culpa dolor Ut ipsum359', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1771, 459, 0, NULL, 'culpa dolor Ut ipsum360', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1772, 460, 1, NULL, 'culpa dolor Ut ipsum372', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1773, 460, 0, NULL, 'culpa dolor Ut ipsum373', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1774, 460, 0, NULL, 'culpa dolor Ut ipsum374', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1775, 460, 0, NULL, 'culpa dolor Ut ipsum375', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1776, 461, 1, NULL, 'culpa dolor Ut ipsum367', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1777, 461, 0, NULL, 'culpa dolor Ut ipsum368', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1778, 461, 0, NULL, 'culpa dolor Ut ipsum369', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1779, 461, 0, NULL, 'culpa dolor Ut ipsum370', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1780, 462, 1, NULL, 'culpa dolor Ut ipsum352', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1781, 462, 0, NULL, 'culpa dolor Ut ipsum353', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1782, 462, 0, NULL, 'culpa dolor Ut ipsum354', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1783, 462, 0, NULL, 'culpa dolor Ut ipsum355', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1784, 463, 1, NULL, 'culpa dolor Ut ipsum387', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1785, 463, 0, NULL, 'culpa dolor Ut ipsum388', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1786, 463, 0, NULL, 'culpa dolor Ut ipsum389', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1787, 463, 0, NULL, 'culpa dolor Ut ipsum390', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1788, 465, 1, NULL, 'culpa dolor Ut ipsum382', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1789, 465, 0, NULL, 'culpa dolor Ut ipsum383', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1790, 465, 0, NULL, 'culpa dolor Ut ipsum384', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1791, 465, 0, NULL, 'culpa dolor Ut ipsum385', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1792, 464, 1, NULL, 'culpa dolor Ut ipsum377', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1793, 464, 0, NULL, 'culpa dolor Ut ipsum378', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1794, 464, 0, NULL, 'culpa dolor Ut ipsum379', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1795, 464, 0, NULL, 'culpa dolor Ut ipsum380', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1796, 466, 1, NULL, 'culpa dolor Ut ipsum397', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1797, 466, 0, NULL, 'culpa dolor Ut ipsum398', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1798, 466, 0, NULL, 'culpa dolor Ut ipsum399', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1799, 466, 0, NULL, 'culpa dolor Ut ipsum400', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1800, 467, 1, NULL, 'culpa dolor Ut ipsum402', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1801, 467, 0, NULL, 'culpa dolor Ut ipsum403', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1802, 467, 0, NULL, 'culpa dolor Ut ipsum404', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1803, 467, 0, NULL, 'culpa dolor Ut ipsum405', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1804, 468, 1, NULL, 'culpa dolor Ut ipsum392', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1805, 468, 0, NULL, 'culpa dolor Ut ipsum393', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1806, 468, 0, NULL, 'culpa dolor Ut ipsum394', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1807, 468, 0, NULL, 'culpa dolor Ut ipsum395', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1808, 469, 1, NULL, 'culpa dolor Ut ipsum382', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1809, 469, 0, NULL, 'culpa dolor Ut ipsum383', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1810, 469, 0, NULL, 'culpa dolor Ut ipsum384', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1811, 469, 0, NULL, 'culpa dolor Ut ipsum385', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1812, 470, 1, NULL, 'culpa dolor Ut ipsum387', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1813, 470, 0, NULL, 'culpa dolor Ut ipsum388', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1814, 470, 0, NULL, 'culpa dolor Ut ipsum389', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1815, 470, 0, NULL, 'culpa dolor Ut ipsum390', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1816, 472, 1, NULL, 'culpa dolor Ut ipsum397', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1817, 472, 0, NULL, 'culpa dolor Ut ipsum398', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1818, 472, 0, NULL, 'culpa dolor Ut ipsum399', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1819, 472, 0, NULL, 'culpa dolor Ut ipsum400', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1820, 471, 1, NULL, 'culpa dolor Ut ipsum377', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1821, 471, 0, NULL, 'culpa dolor Ut ipsum378', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1822, 471, 0, NULL, 'culpa dolor Ut ipsum379', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1823, 471, 0, NULL, 'culpa dolor Ut ipsum380', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1824, 473, 1, NULL, 'culpa dolor Ut ipsum392', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1825, 473, 0, NULL, 'culpa dolor Ut ipsum393', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1826, 473, 0, NULL, 'culpa dolor Ut ipsum394', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1827, 473, 0, NULL, 'culpa dolor Ut ipsum395', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1828, 474, 1, NULL, 'culpa dolor Ut ipsum417', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1829, 474, 0, NULL, 'culpa dolor Ut ipsum418', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1830, 474, 0, NULL, 'culpa dolor Ut ipsum419', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1831, 474, 0, NULL, 'culpa dolor Ut ipsum420', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1832, 475, 1, NULL, 'culpa dolor Ut ipsum412', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1833, 475, 0, NULL, 'culpa dolor Ut ipsum413', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1834, 475, 0, NULL, 'culpa dolor Ut ipsum414', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1835, 475, 0, NULL, 'culpa dolor Ut ipsum415', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1836, 476, 1, NULL, 'culpa dolor Ut ipsum407', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1837, 476, 0, NULL, 'culpa dolor Ut ipsum408', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1838, 476, 0, NULL, 'culpa dolor Ut ipsum409', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1839, 476, 0, NULL, 'culpa dolor Ut ipsum410', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1840, 477, 1, NULL, 'culpa dolor Ut ipsum402', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1841, 477, 0, NULL, 'culpa dolor Ut ipsum403', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1842, 477, 0, NULL, 'culpa dolor Ut ipsum404', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1843, 477, 0, NULL, 'culpa dolor Ut ipsum405', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1844, 478, 1, NULL, 'culpa dolor Ut ipsum417', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1845, 478, 0, NULL, 'culpa dolor Ut ipsum418', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1846, 478, 0, NULL, 'culpa dolor Ut ipsum419', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1847, 478, 0, NULL, 'culpa dolor Ut ipsum420', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1848, 479, 1, NULL, 'culpa dolor Ut ipsum422', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1849, 479, 0, NULL, 'culpa dolor Ut ipsum423', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1850, 479, 0, NULL, 'culpa dolor Ut ipsum424', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1851, 479, 0, NULL, 'culpa dolor Ut ipsum425', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1852, 480, 1, NULL, 'culpa dolor Ut ipsum412', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1853, 480, 0, NULL, 'culpa dolor Ut ipsum413', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1854, 480, 0, NULL, 'culpa dolor Ut ipsum414', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1855, 480, 0, NULL, 'culpa dolor Ut ipsum415', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1856, 481, 1, NULL, 'culpa dolor Ut ipsum407', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1857, 481, 0, NULL, 'culpa dolor Ut ipsum408', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1858, 481, 0, NULL, 'culpa dolor Ut ipsum409', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1859, 481, 0, NULL, 'culpa dolor Ut ipsum410', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1860, 482, 1, NULL, 'culpa dolor Ut ipsum422', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1861, 482, 0, NULL, 'culpa dolor Ut ipsum423', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1862, 482, 0, NULL, 'culpa dolor Ut ipsum424', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1863, 482, 0, NULL, 'culpa dolor Ut ipsum425', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1864, 483, 1, NULL, 'culpa dolor Ut ipsum427', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1865, 483, 0, NULL, 'culpa dolor Ut ipsum428', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1866, 483, 0, NULL, 'culpa dolor Ut ipsum429', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1867, 483, 0, NULL, 'culpa dolor Ut ipsum430', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1868, 484, 1, NULL, 'culpa dolor Ut ipsum432', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1869, 484, 0, NULL, 'culpa dolor Ut ipsum433', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1870, 484, 0, NULL, 'culpa dolor Ut ipsum434', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1871, 484, 0, NULL, 'culpa dolor Ut ipsum435', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1872, 485, 1, NULL, 'culpa dolor Ut ipsum442', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1873, 485, 0, NULL, 'culpa dolor Ut ipsum443', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1874, 485, 0, NULL, 'culpa dolor Ut ipsum444', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1875, 485, 0, NULL, 'culpa dolor Ut ipsum445', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1876, 486, 1, NULL, 'culpa dolor Ut ipsum447', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1877, 486, 0, NULL, 'culpa dolor Ut ipsum448', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1878, 486, 0, NULL, 'culpa dolor Ut ipsum449', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1879, 486, 0, NULL, 'culpa dolor Ut ipsum450', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1880, 487, 1, NULL, 'culpa dolor Ut ipsum437', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1881, 487, 0, NULL, 'culpa dolor Ut ipsum438', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1882, 487, 0, NULL, 'culpa dolor Ut ipsum439', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1883, 487, 0, NULL, 'culpa dolor Ut ipsum440', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1884, 488, 1, NULL, 'culpa dolor Ut ipsum432', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1885, 488, 0, NULL, 'culpa dolor Ut ipsum433', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1886, 488, 0, NULL, 'culpa dolor Ut ipsum434', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1887, 488, 0, NULL, 'culpa dolor Ut ipsum435', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1888, 490, 1, NULL, 'culpa dolor Ut ipsum437', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1889, 490, 0, NULL, 'culpa dolor Ut ipsum438', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1890, 490, 0, NULL, 'culpa dolor Ut ipsum439', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1891, 490, 0, NULL, 'culpa dolor Ut ipsum440', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1892, 489, 1, NULL, 'culpa dolor Ut ipsum427', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1893, 489, 0, NULL, 'culpa dolor Ut ipsum428', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1894, 489, 0, NULL, 'culpa dolor Ut ipsum429', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1895, 489, 0, NULL, 'culpa dolor Ut ipsum430', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1896, 491, 1, NULL, 'culpa dolor Ut ipsum442', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1897, 491, 0, NULL, 'culpa dolor Ut ipsum443', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1898, 491, 0, NULL, 'culpa dolor Ut ipsum444', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1899, 491, 0, NULL, 'culpa dolor Ut ipsum445', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1900, 492, 1, NULL, 'culpa dolor Ut ipsum447', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1901, 492, 0, NULL, 'culpa dolor Ut ipsum448', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1902, 492, 0, NULL, 'culpa dolor Ut ipsum449', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1903, 492, 0, NULL, 'culpa dolor Ut ipsum450', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1904, 493, 1, NULL, 'culpa dolor Ut ipsum452', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1905, 493, 0, NULL, 'culpa dolor Ut ipsum453', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1906, 493, 0, NULL, 'culpa dolor Ut ipsum454', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1907, 493, 0, NULL, 'culpa dolor Ut ipsum455', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1908, 494, 1, NULL, 'culpa dolor Ut ipsum457', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1909, 494, 0, NULL, 'culpa dolor Ut ipsum458', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1910, 494, 0, NULL, 'culpa dolor Ut ipsum459', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1911, 494, 0, NULL, 'culpa dolor Ut ipsum460', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1912, 495, 1, NULL, 'culpa dolor Ut ipsum462', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1913, 495, 0, NULL, 'culpa dolor Ut ipsum463', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1914, 495, 0, NULL, 'culpa dolor Ut ipsum464', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1915, 495, 0, NULL, 'culpa dolor Ut ipsum465', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1916, 497, 1, NULL, 'culpa dolor Ut ipsum472', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1917, 497, 0, NULL, 'culpa dolor Ut ipsum473', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1918, 497, 0, NULL, 'culpa dolor Ut ipsum474', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1919, 497, 0, NULL, 'culpa dolor Ut ipsum475', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1920, 496, 1, NULL, 'culpa dolor Ut ipsum467', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1921, 496, 0, NULL, 'culpa dolor Ut ipsum468', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1922, 496, 0, NULL, 'culpa dolor Ut ipsum469', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1923, 496, 0, NULL, 'culpa dolor Ut ipsum470', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1924, 498, 1, NULL, 'culpa dolor Ut ipsum477', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1925, 498, 0, NULL, 'culpa dolor Ut ipsum478', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1926, 498, 0, NULL, 'culpa dolor Ut ipsum479', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1927, 498, 0, NULL, 'culpa dolor Ut ipsum480', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1928, 500, 1, NULL, 'culpa dolor Ut ipsum457', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1929, 500, 0, NULL, 'culpa dolor Ut ipsum458', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1930, 500, 0, NULL, 'culpa dolor Ut ipsum459', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1931, 500, 0, NULL, 'culpa dolor Ut ipsum460', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1932, 501, 1, NULL, 'culpa dolor Ut ipsum462', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1933, 501, 0, NULL, 'culpa dolor Ut ipsum463', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1934, 501, 0, NULL, 'culpa dolor Ut ipsum464', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1935, 501, 0, NULL, 'culpa dolor Ut ipsum465', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1936, 499, 1, NULL, 'culpa dolor Ut ipsum452', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1937, 499, 0, NULL, 'culpa dolor Ut ipsum453', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1938, 499, 0, NULL, 'culpa dolor Ut ipsum454', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1939, 499, 0, NULL, 'culpa dolor Ut ipsum455', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1940, 502, 1, NULL, 'culpa dolor Ut ipsum467', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1941, 502, 0, NULL, 'culpa dolor Ut ipsum468', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1942, 502, 0, NULL, 'culpa dolor Ut ipsum469', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1943, 502, 0, NULL, 'culpa dolor Ut ipsum470', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1944, 503, 1, NULL, 'culpa dolor Ut ipsum472', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1945, 503, 0, NULL, 'culpa dolor Ut ipsum473', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1946, 503, 0, NULL, 'culpa dolor Ut ipsum474', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1947, 503, 0, NULL, 'culpa dolor Ut ipsum475', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1948, 504, 1, NULL, 'culpa dolor Ut ipsum482', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1949, 504, 0, NULL, 'culpa dolor Ut ipsum483', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1950, 504, 0, NULL, 'culpa dolor Ut ipsum484', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1951, 504, 0, NULL, 'culpa dolor Ut ipsum485', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1952, 505, 1, NULL, 'culpa dolor Ut ipsum492', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1953, 505, 0, NULL, 'culpa dolor Ut ipsum493', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1954, 505, 0, NULL, 'culpa dolor Ut ipsum494', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1955, 505, 0, NULL, 'culpa dolor Ut ipsum495', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1956, 506, 1, NULL, 'culpa dolor Ut ipsum487', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1957, 506, 0, NULL, 'culpa dolor Ut ipsum488', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1958, 506, 0, NULL, 'culpa dolor Ut ipsum489', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1959, 506, 0, NULL, 'culpa dolor Ut ipsum490', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1960, 507, 1, NULL, 'culpa dolor Ut ipsum507', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1961, 507, 0, NULL, 'culpa dolor Ut ipsum508', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1962, 507, 0, NULL, 'culpa dolor Ut ipsum509', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1963, 507, 0, NULL, 'culpa dolor Ut ipsum510', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1964, 509, 1, NULL, 'culpa dolor Ut ipsum502', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1965, 509, 0, NULL, 'culpa dolor Ut ipsum503', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1966, 509, 0, NULL, 'culpa dolor Ut ipsum504', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1967, 509, 0, NULL, 'culpa dolor Ut ipsum505', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1968, 508, 1, NULL, 'culpa dolor Ut ipsum497', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1969, 508, 0, NULL, 'culpa dolor Ut ipsum498', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1970, 508, 0, NULL, 'culpa dolor Ut ipsum499', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1971, 508, 0, NULL, 'culpa dolor Ut ipsum500', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1972, 510, 1, NULL, 'culpa dolor Ut ipsum477', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1973, 510, 0, NULL, 'culpa dolor Ut ipsum478', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1974, 510, 0, NULL, 'culpa dolor Ut ipsum479', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1975, 510, 0, NULL, 'culpa dolor Ut ipsum480', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1976, 512, 1, NULL, 'culpa dolor Ut ipsum492', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1977, 512, 0, NULL, 'culpa dolor Ut ipsum493', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1978, 512, 0, NULL, 'culpa dolor Ut ipsum494', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1979, 512, 0, NULL, 'culpa dolor Ut ipsum495', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1980, 513, 1, NULL, 'culpa dolor Ut ipsum497', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1981, 513, 0, NULL, 'culpa dolor Ut ipsum498', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1982, 513, 0, NULL, 'culpa dolor Ut ipsum499', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1983, 513, 0, NULL, 'culpa dolor Ut ipsum500', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1984, 511, 1, NULL, 'culpa dolor Ut ipsum482', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1985, 511, 0, NULL, 'culpa dolor Ut ipsum483', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1986, 511, 0, NULL, 'culpa dolor Ut ipsum484', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1987, 511, 0, NULL, 'culpa dolor Ut ipsum485', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1988, 514, 1, NULL, 'culpa dolor Ut ipsum487', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1989, 514, 0, NULL, 'culpa dolor Ut ipsum488', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1990, 514, 0, NULL, 'culpa dolor Ut ipsum489', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1991, 514, 0, NULL, 'culpa dolor Ut ipsum490', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1992, 515, 1, NULL, 'culpa dolor Ut ipsum522', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1993, 515, 0, NULL, 'culpa dolor Ut ipsum523', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1994, 515, 0, NULL, 'culpa dolor Ut ipsum524', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1995, 515, 0, NULL, 'culpa dolor Ut ipsum525', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1996, 516, 1, NULL, 'culpa dolor Ut ipsum512', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1997, 516, 0, NULL, 'culpa dolor Ut ipsum513', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1998, 516, 0, NULL, 'culpa dolor Ut ipsum514', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (1999, 516, 0, NULL, 'culpa dolor Ut ipsum515', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2000, 517, 1, NULL, 'culpa dolor Ut ipsum517', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2001, 517, 0, NULL, 'culpa dolor Ut ipsum518', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2002, 517, 0, NULL, 'culpa dolor Ut ipsum519', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2003, 517, 0, NULL, 'culpa dolor Ut ipsum520', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2004, 518, 1, NULL, 'culpa dolor Ut ipsum527', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2005, 518, 0, NULL, 'culpa dolor Ut ipsum528', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2006, 518, 0, NULL, 'culpa dolor Ut ipsum529', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2007, 518, 0, NULL, 'culpa dolor Ut ipsum530', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2008, 519, 1, NULL, 'culpa dolor Ut ipsum537', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2009, 519, 0, NULL, 'culpa dolor Ut ipsum538', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2010, 519, 0, NULL, 'culpa dolor Ut ipsum539', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2011, 519, 0, NULL, 'culpa dolor Ut ipsum540', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2012, 520, 1, NULL, 'culpa dolor Ut ipsum532', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2013, 520, 0, NULL, 'culpa dolor Ut ipsum533', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2014, 520, 0, NULL, 'culpa dolor Ut ipsum534', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2015, 520, 0, NULL, 'culpa dolor Ut ipsum535', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2016, 521, 1, NULL, 'culpa dolor Ut ipsum512', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2017, 521, 0, NULL, 'culpa dolor Ut ipsum513', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2018, 521, 0, NULL, 'culpa dolor Ut ipsum514', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2019, 521, 0, NULL, 'culpa dolor Ut ipsum515', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2020, 523, 1, NULL, 'culpa dolor Ut ipsum517', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2021, 523, 0, NULL, 'culpa dolor Ut ipsum518', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2022, 523, 0, NULL, 'culpa dolor Ut ipsum519', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2023, 523, 0, NULL, 'culpa dolor Ut ipsum520', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2024, 524, 1, NULL, 'culpa dolor Ut ipsum522', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2025, 524, 0, NULL, 'culpa dolor Ut ipsum523', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2026, 524, 0, NULL, 'culpa dolor Ut ipsum524', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2027, 524, 0, NULL, 'culpa dolor Ut ipsum525', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2028, 522, 1, NULL, 'culpa dolor Ut ipsum502', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2029, 522, 0, NULL, 'culpa dolor Ut ipsum503', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2030, 522, 0, NULL, 'culpa dolor Ut ipsum504', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2031, 522, 0, NULL, 'culpa dolor Ut ipsum505', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2032, 525, 1, NULL, 'culpa dolor Ut ipsum507', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2033, 525, 0, NULL, 'culpa dolor Ut ipsum508', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2034, 525, 0, NULL, 'culpa dolor Ut ipsum509', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2035, 525, 0, NULL, 'culpa dolor Ut ipsum510', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2036, 526, 1, NULL, 'culpa dolor Ut ipsum542', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2037, 526, 0, NULL, 'culpa dolor Ut ipsum543', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2038, 526, 0, NULL, 'culpa dolor Ut ipsum544', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2039, 526, 0, NULL, 'culpa dolor Ut ipsum545', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2040, 527, 1, NULL, 'culpa dolor Ut ipsum547', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2041, 527, 0, NULL, 'culpa dolor Ut ipsum548', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2042, 527, 0, NULL, 'culpa dolor Ut ipsum549', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2043, 527, 0, NULL, 'culpa dolor Ut ipsum550', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2044, 528, 1, NULL, 'culpa dolor Ut ipsum552', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2045, 528, 0, NULL, 'culpa dolor Ut ipsum553', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2046, 528, 0, NULL, 'culpa dolor Ut ipsum554', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2047, 528, 0, NULL, 'culpa dolor Ut ipsum555', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2048, 529, 1, NULL, 'culpa dolor Ut ipsum562', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2049, 529, 0, NULL, 'culpa dolor Ut ipsum563', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2050, 529, 0, NULL, 'culpa dolor Ut ipsum564', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2051, 529, 0, NULL, 'culpa dolor Ut ipsum565', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2052, 530, 1, NULL, 'culpa dolor Ut ipsum557', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2053, 530, 0, NULL, 'culpa dolor Ut ipsum558', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2054, 530, 0, NULL, 'culpa dolor Ut ipsum559', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2055, 530, 0, NULL, 'culpa dolor Ut ipsum560', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2056, 531, 1, NULL, 'culpa dolor Ut ipsum567', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2057, 531, 0, NULL, 'culpa dolor Ut ipsum568', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2058, 531, 0, NULL, 'culpa dolor Ut ipsum569', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2059, 531, 0, NULL, 'culpa dolor Ut ipsum570', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2060, 532, 1, NULL, 'culpa dolor Ut ipsum527', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2061, 532, 0, NULL, 'culpa dolor Ut ipsum528', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2062, 532, 0, NULL, 'culpa dolor Ut ipsum529', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2063, 532, 0, NULL, 'culpa dolor Ut ipsum530', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2064, 533, 1, NULL, 'culpa dolor Ut ipsum532', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2065, 533, 0, NULL, 'culpa dolor Ut ipsum533', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2066, 533, 0, NULL, 'culpa dolor Ut ipsum534', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2067, 533, 0, NULL, 'culpa dolor Ut ipsum535', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2068, 535, 1, NULL, 'culpa dolor Ut ipsum547', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2069, 535, 0, NULL, 'culpa dolor Ut ipsum548', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2070, 535, 0, NULL, 'culpa dolor Ut ipsum549', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2071, 535, 0, NULL, 'culpa dolor Ut ipsum550', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2072, 534, 1, NULL, 'culpa dolor Ut ipsum542', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2073, 534, 0, NULL, 'culpa dolor Ut ipsum543', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2074, 534, 0, NULL, 'culpa dolor Ut ipsum544', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2075, 534, 0, NULL, 'culpa dolor Ut ipsum545', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2076, 536, 1, NULL, 'culpa dolor Ut ipsum537', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2077, 536, 0, NULL, 'culpa dolor Ut ipsum538', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2078, 536, 0, NULL, 'culpa dolor Ut ipsum539', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2079, 536, 0, NULL, 'culpa dolor Ut ipsum540', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2080, 537, 1, NULL, 'culpa dolor Ut ipsum582', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2081, 537, 0, NULL, 'culpa dolor Ut ipsum583', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2082, 537, 0, NULL, 'culpa dolor Ut ipsum584', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2083, 537, 0, NULL, 'culpa dolor Ut ipsum585', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2084, 538, 1, NULL, 'culpa dolor Ut ipsum572', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2085, 538, 0, NULL, 'culpa dolor Ut ipsum573', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2086, 538, 0, NULL, 'culpa dolor Ut ipsum574', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2087, 538, 0, NULL, 'culpa dolor Ut ipsum575', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2088, 539, 1, NULL, 'culpa dolor Ut ipsum577', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2089, 539, 0, NULL, 'culpa dolor Ut ipsum578', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2090, 539, 0, NULL, 'culpa dolor Ut ipsum579', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2091, 539, 0, NULL, 'culpa dolor Ut ipsum580', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2092, 540, 1, NULL, 'culpa dolor Ut ipsum552', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2093, 540, 0, NULL, 'culpa dolor Ut ipsum553', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2094, 540, 0, NULL, 'culpa dolor Ut ipsum554', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2095, 540, 0, NULL, 'culpa dolor Ut ipsum555', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2096, 542, 1, NULL, 'culpa dolor Ut ipsum567', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2097, 542, 0, NULL, 'culpa dolor Ut ipsum568', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2098, 542, 0, NULL, 'culpa dolor Ut ipsum569', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2099, 542, 0, NULL, 'culpa dolor Ut ipsum570', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2100, 541, 1, NULL, 'culpa dolor Ut ipsum562', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2101, 541, 0, NULL, 'culpa dolor Ut ipsum563', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2102, 541, 0, NULL, 'culpa dolor Ut ipsum564', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2103, 541, 0, NULL, 'culpa dolor Ut ipsum565', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2104, 543, 1, NULL, 'culpa dolor Ut ipsum557', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2105, 543, 0, NULL, 'culpa dolor Ut ipsum558', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2106, 543, 0, NULL, 'culpa dolor Ut ipsum559', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2107, 543, 0, NULL, 'culpa dolor Ut ipsum560', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2108, 544, 1, NULL, 'culpa dolor Ut ipsum572', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2109, 544, 0, NULL, 'culpa dolor Ut ipsum573', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2110, 544, 0, NULL, 'culpa dolor Ut ipsum574', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2111, 544, 0, NULL, 'culpa dolor Ut ipsum575', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2112, 546, 1, NULL, 'culpa dolor Ut ipsum597', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2113, 546, 0, NULL, 'culpa dolor Ut ipsum598', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2114, 546, 0, NULL, 'culpa dolor Ut ipsum599', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2115, 546, 0, NULL, 'culpa dolor Ut ipsum600', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2116, 545, 1, NULL, 'culpa dolor Ut ipsum587', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2117, 545, 0, NULL, 'culpa dolor Ut ipsum588', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2118, 545, 0, NULL, 'culpa dolor Ut ipsum589', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2119, 545, 0, NULL, 'culpa dolor Ut ipsum590', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2120, 547, 1, NULL, 'culpa dolor Ut ipsum592', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2121, 547, 0, NULL, 'culpa dolor Ut ipsum593', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2122, 547, 0, NULL, 'culpa dolor Ut ipsum594', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2123, 547, 0, NULL, 'culpa dolor Ut ipsum595', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2124, 549, 1, NULL, 'culpa dolor Ut ipsum607', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2125, 549, 0, NULL, 'culpa dolor Ut ipsum608', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2126, 549, 0, NULL, 'culpa dolor Ut ipsum609', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2127, 549, 0, NULL, 'culpa dolor Ut ipsum610', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2128, 548, 1, NULL, 'culpa dolor Ut ipsum602', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2129, 548, 0, NULL, 'culpa dolor Ut ipsum603', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2130, 548, 0, NULL, 'culpa dolor Ut ipsum604', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2131, 548, 0, NULL, 'culpa dolor Ut ipsum605', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2132, 550, 1, NULL, 'culpa dolor Ut ipsum612', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2133, 550, 0, NULL, 'culpa dolor Ut ipsum613', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2134, 550, 0, NULL, 'culpa dolor Ut ipsum614', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2135, 550, 0, NULL, 'culpa dolor Ut ipsum615', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2136, 551, 1, NULL, 'culpa dolor Ut ipsum577', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2137, 551, 0, NULL, 'culpa dolor Ut ipsum578', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2138, 551, 0, NULL, 'culpa dolor Ut ipsum579', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2139, 551, 0, NULL, 'culpa dolor Ut ipsum580', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2140, 552, 1, NULL, 'culpa dolor Ut ipsum587', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2141, 552, 0, NULL, 'culpa dolor Ut ipsum588', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2142, 552, 0, NULL, 'culpa dolor Ut ipsum589', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2143, 552, 0, NULL, 'culpa dolor Ut ipsum590', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2144, 554, 1, NULL, 'culpa dolor Ut ipsum592', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2145, 554, 0, NULL, 'culpa dolor Ut ipsum593', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2146, 554, 0, NULL, 'culpa dolor Ut ipsum594', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2147, 554, 0, NULL, 'culpa dolor Ut ipsum595', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2148, 555, 1, NULL, 'culpa dolor Ut ipsum597', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2149, 555, 0, NULL, 'culpa dolor Ut ipsum598', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2150, 555, 0, NULL, 'culpa dolor Ut ipsum599', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2151, 555, 0, NULL, 'culpa dolor Ut ipsum600', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2152, 553, 1, NULL, 'culpa dolor Ut ipsum582', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2153, 553, 0, NULL, 'culpa dolor Ut ipsum583', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2154, 553, 0, NULL, 'culpa dolor Ut ipsum584', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2155, 553, 0, NULL, 'culpa dolor Ut ipsum585', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2156, 556, 1, NULL, 'culpa dolor Ut ipsum622', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2157, 556, 0, NULL, 'culpa dolor Ut ipsum623', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2158, 556, 0, NULL, 'culpa dolor Ut ipsum624', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2159, 556, 0, NULL, 'culpa dolor Ut ipsum625', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2160, 557, 1, NULL, 'culpa dolor Ut ipsum617', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2161, 557, 0, NULL, 'culpa dolor Ut ipsum618', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2162, 557, 0, NULL, 'culpa dolor Ut ipsum619', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2163, 557, 0, NULL, 'culpa dolor Ut ipsum620', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2164, 558, 1, NULL, 'culpa dolor Ut ipsum627', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2165, 558, 0, NULL, 'culpa dolor Ut ipsum628', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2166, 558, 0, NULL, 'culpa dolor Ut ipsum629', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2167, 558, 0, NULL, 'culpa dolor Ut ipsum630', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2168, 559, 1, NULL, 'culpa dolor Ut ipsum632', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2169, 559, 0, NULL, 'culpa dolor Ut ipsum633', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2170, 559, 0, NULL, 'culpa dolor Ut ipsum634', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2171, 559, 0, NULL, 'culpa dolor Ut ipsum635', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2172, 560, 1, NULL, 'culpa dolor Ut ipsum642', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2173, 560, 0, NULL, 'culpa dolor Ut ipsum643', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2174, 560, 0, NULL, 'culpa dolor Ut ipsum644', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2175, 560, 0, NULL, 'culpa dolor Ut ipsum645', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2176, 561, 1, NULL, 'culpa dolor Ut ipsum637', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2177, 561, 0, NULL, 'culpa dolor Ut ipsum638', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2178, 561, 0, NULL, 'culpa dolor Ut ipsum639', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2179, 561, 0, NULL, 'culpa dolor Ut ipsum640', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2180, 562, 1, NULL, 'culpa dolor Ut ipsum612', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2181, 562, 0, NULL, 'culpa dolor Ut ipsum613', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2182, 562, 0, NULL, 'culpa dolor Ut ipsum614', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2183, 562, 0, NULL, 'culpa dolor Ut ipsum615', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2184, 564, 1, NULL, 'culpa dolor Ut ipsum607', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2185, 564, 0, NULL, 'culpa dolor Ut ipsum608', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2186, 564, 0, NULL, 'culpa dolor Ut ipsum609', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2187, 564, 0, NULL, 'culpa dolor Ut ipsum610', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2188, 565, 1, NULL, 'culpa dolor Ut ipsum617', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2189, 565, 0, NULL, 'culpa dolor Ut ipsum618', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2190, 565, 0, NULL, 'culpa dolor Ut ipsum619', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2191, 565, 0, NULL, 'culpa dolor Ut ipsum620', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2192, 566, 1, NULL, 'culpa dolor Ut ipsum622', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2193, 566, 0, NULL, 'culpa dolor Ut ipsum623', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2194, 566, 0, NULL, 'culpa dolor Ut ipsum624', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2195, 566, 0, NULL, 'culpa dolor Ut ipsum625', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2196, 563, 1, NULL, 'culpa dolor Ut ipsum602', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2197, 563, 0, NULL, 'culpa dolor Ut ipsum603', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2198, 563, 0, NULL, 'culpa dolor Ut ipsum604', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2199, 563, 0, NULL, 'culpa dolor Ut ipsum605', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2200, 568, 1, NULL, 'culpa dolor Ut ipsum657', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2201, 568, 0, NULL, 'culpa dolor Ut ipsum658', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2202, 568, 0, NULL, 'culpa dolor Ut ipsum659', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2203, 568, 0, NULL, 'culpa dolor Ut ipsum660', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2204, 567, 1, NULL, 'culpa dolor Ut ipsum647', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2205, 567, 0, NULL, 'culpa dolor Ut ipsum648', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2206, 567, 0, NULL, 'culpa dolor Ut ipsum649', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2207, 567, 0, NULL, 'culpa dolor Ut ipsum650', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2208, 569, 1, NULL, 'culpa dolor Ut ipsum652', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2209, 569, 0, NULL, 'culpa dolor Ut ipsum653', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2210, 569, 0, NULL, 'culpa dolor Ut ipsum654', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2211, 569, 0, NULL, 'culpa dolor Ut ipsum655', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2212, 570, 1, NULL, 'culpa dolor Ut ipsum672', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2213, 570, 0, NULL, 'culpa dolor Ut ipsum673', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2214, 570, 0, NULL, 'culpa dolor Ut ipsum674', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2215, 570, 0, NULL, 'culpa dolor Ut ipsum675', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2216, 571, 1, NULL, 'culpa dolor Ut ipsum667', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2217, 571, 0, NULL, 'culpa dolor Ut ipsum668', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2218, 571, 0, NULL, 'culpa dolor Ut ipsum669', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2219, 571, 0, NULL, 'culpa dolor Ut ipsum670', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2220, 572, 1, NULL, 'culpa dolor Ut ipsum662', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2221, 572, 0, NULL, 'culpa dolor Ut ipsum663', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2222, 572, 0, NULL, 'culpa dolor Ut ipsum664', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2223, 572, 0, NULL, 'culpa dolor Ut ipsum665', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2224, 573, 1, NULL, 'culpa dolor Ut ipsum642', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2225, 573, 0, NULL, 'culpa dolor Ut ipsum643', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2226, 573, 0, NULL, 'culpa dolor Ut ipsum644', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2227, 573, 0, NULL, 'culpa dolor Ut ipsum645', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2228, 574, 1, NULL, 'culpa dolor Ut ipsum637', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2229, 574, 0, NULL, 'culpa dolor Ut ipsum638', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2230, 574, 0, NULL, 'culpa dolor Ut ipsum639', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2231, 574, 0, NULL, 'culpa dolor Ut ipsum640', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2232, 575, 1, NULL, 'culpa dolor Ut ipsum647', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2233, 575, 0, NULL, 'culpa dolor Ut ipsum648', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2234, 575, 0, NULL, 'culpa dolor Ut ipsum649', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2235, 575, 0, NULL, 'culpa dolor Ut ipsum650', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2236, 576, 1, NULL, 'culpa dolor Ut ipsum632', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2237, 576, 0, NULL, 'culpa dolor Ut ipsum633', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2238, 576, 0, NULL, 'culpa dolor Ut ipsum634', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2239, 576, 0, NULL, 'culpa dolor Ut ipsum635', 3);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2240, 577, 1, NULL, 'culpa dolor Ut ipsum627', 0);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2241, 577, 0, NULL, 'culpa dolor Ut ipsum628', 1);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2242, 577, 0, NULL, 'culpa dolor Ut ipsum629', 2);
INSERT INTO `t_option` (`id`, `qu_id`, `is_right`, `image`, `content`, `sort`) VALUES (2243, 577, 0, NULL, 'culpa dolor Ut ipsum630', 3);
COMMIT;

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id   试题表',
  `qu_type` varchar(255) NOT NULL COMMENT '试题类型',
  `image` varchar(255) DEFAULT NULL COMMENT '试题图片',
  `content` varchar(255) NOT NULL COMMENT '题干',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `analysis` varchar(255) DEFAULT NULL COMMENT '题目分析',
  `repo_id` int(11) NOT NULL COMMENT '题库id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=578 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_question
-- ----------------------------
BEGIN;
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (18, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:22:11', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (20, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:22:11', '', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (21, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:22:11', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (22, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:22:11', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (23, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:22:11', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (24, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:22:11', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (27, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (30, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:13', '', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (31, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (32, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (33, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (34, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (35, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (36, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (37, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (38, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:13', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (39, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (40, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (41, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (42, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (43, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (44, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (45, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (46, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (47, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (48, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (49, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (50, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (51, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (52, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (53, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (54, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (55, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (56, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (57, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (58, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (59, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (60, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (61, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (62, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (63, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:14', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (64, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (65, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (66, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (67, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (68, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (69, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (70, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (71, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (72, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (73, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (74, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (75, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (76, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (77, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (78, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (79, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (80, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (81, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (82, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (83, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (84, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (85, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (86, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (87, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:15', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (88, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (89, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (90, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (91, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (92, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (93, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (94, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (95, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (96, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (97, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (98, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (99, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (100, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (101, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (102, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (103, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (104, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (105, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (106, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (107, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (108, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (109, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (110, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (111, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (112, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (113, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (114, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (115, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:16', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (116, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (117, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (118, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (119, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (120, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (121, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (122, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (123, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (124, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (125, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (126, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (127, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (128, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (129, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (130, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (131, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (132, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (133, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (134, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (135, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (136, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (137, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:17', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (138, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (139, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (140, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (141, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (142, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (143, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (144, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (145, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (146, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (147, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (148, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (149, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (150, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (151, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (152, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (153, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (154, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (155, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (156, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (157, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (158, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (159, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (160, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (161, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (162, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (163, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (164, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:18', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (165, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (166, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (167, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (168, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (169, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (170, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (171, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (172, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (173, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (174, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (175, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (176, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (177, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (178, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (179, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (180, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (181, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (182, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (183, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (184, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (185, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (186, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (187, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (188, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (189, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (190, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (191, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (192, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (193, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:19', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (194, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (195, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (196, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (197, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (198, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (199, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (200, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (201, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (202, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (203, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (204, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (205, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (206, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (207, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (208, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (209, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (210, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (211, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (212, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (213, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (214, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (215, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (216, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (217, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (218, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (219, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (220, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (221, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:43:20', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (222, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (223, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (224, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (225, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (226, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (227, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (228, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (229, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (230, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (231, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (232, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (233, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (234, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (235, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (236, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (237, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (238, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (239, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (240, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (241, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (242, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (243, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (244, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (245, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (246, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (247, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (248, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:21', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (249, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (250, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (251, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (252, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (253, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (254, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (255, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (256, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (257, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (258, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (259, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (260, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (261, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (262, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (263, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (264, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (265, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (266, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (267, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (268, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (269, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (270, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (271, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (272, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (273, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (274, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (275, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (276, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:22', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (277, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (278, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (279, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (280, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (281, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (282, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (283, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (284, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (285, '3', NULL, '测试批量导入判断题1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (286, '3', NULL, '测试批量导入判断题2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (287, '4', NULL, '测试批量导入简答题1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (288, '4', NULL, '测试批量导入简答题2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (289, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (290, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (291, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (292, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (293, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (294, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (295, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (296, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (297, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (298, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (299, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (300, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (301, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (302, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (303, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (304, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:23', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (305, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:24', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (306, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:24', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (307, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:24', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (308, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:24', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (309, '1', NULL, '测试批量导入试题单选1', '2024-05-06 09:43:24', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (310, '1', NULL, '测试批量导入试题单选2', '2024-05-06 09:43:24', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (311, '2', NULL, '测试批量导入多选题1', '2024-05-06 09:43:24', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (312, '2', NULL, '测试批量导入多选题2', '2024-05-06 09:43:24', '', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (313, '1', NULL, 'test question11', '2024-05-06 15:51:02', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (314, '1', NULL, 'test question1', '2024-05-06 15:51:02', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (315, '1', NULL, 'test question6', '2024-05-06 15:51:02', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (316, '1', NULL, 'test question21', '2024-05-06 15:51:04', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (317, '1', NULL, 'test question16', '2024-05-06 15:51:04', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (318, '1', NULL, 'test question26', '2024-05-06 15:51:04', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (319, '1', NULL, 'test question1', '2024-05-06 15:51:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (320, '1', NULL, 'test question6', '2024-05-06 15:51:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (321, '1', NULL, 'test question11', '2024-05-06 15:51:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (322, '1', NULL, 'test question16', '2024-05-06 15:51:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (323, '1', NULL, 'test question21', '2024-05-06 15:51:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (324, '1', NULL, 'test question41', '2024-05-06 15:51:06', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (325, '1', NULL, 'test question31', '2024-05-06 15:51:06', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (326, '1', NULL, 'test question36', '2024-05-06 15:51:06', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (327, '1', NULL, 'test question26', '2024-05-06 15:51:07', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (328, '1', NULL, 'test question41', '2024-05-06 15:51:07', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (329, '1', NULL, 'test question36', '2024-05-06 15:51:07', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (330, '1', NULL, 'test question31', '2024-05-06 15:51:07', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (331, '1', NULL, 'test question46', '2024-05-06 15:51:07', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (332, '1', NULL, 'test question46', '2024-05-06 15:51:07', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (333, '1', NULL, 'test question56', '2024-05-06 15:51:07', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (334, '1', NULL, 'test question51', '2024-05-06 15:51:07', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (335, '1', NULL, 'test question66', '2024-05-06 15:51:09', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (336, '1', NULL, 'test question61', '2024-05-06 15:51:09', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (337, '1', NULL, 'test question71', '2024-05-06 15:51:09', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (338, '1', NULL, 'test question61', '2024-05-06 15:51:10', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (339, '1', NULL, 'test question51', '2024-05-06 15:51:10', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (340, '1', NULL, 'test question71', '2024-05-06 15:51:10', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (341, '1', NULL, 'test question56', '2024-05-06 15:51:10', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (342, '1', NULL, 'test question66', '2024-05-06 15:51:10', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (343, '1', NULL, 'test question76', '2024-05-06 15:51:11', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (344, '1', NULL, 'test question81', '2024-05-06 15:51:11', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (345, '1', NULL, 'test question86', '2024-05-06 15:51:11', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (346, '1', NULL, 'test question76', '2024-05-06 15:51:12', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (347, '1', NULL, 'test question81', '2024-05-06 15:51:12', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (348, '1', NULL, 'test question86', '2024-05-06 15:51:12', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (349, '1', NULL, 'test question96', '2024-05-06 15:51:12', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (350, '1', NULL, 'test question91', '2024-05-06 15:51:12', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (351, '1', NULL, 'test question91', '2024-05-06 15:51:12', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (352, '1', NULL, 'test question101', '2024-05-06 15:51:12', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (353, '1', NULL, 'test question96', '2024-05-06 15:51:12', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (354, '1', NULL, 'test question106', '2024-05-06 15:51:14', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (355, '1', NULL, 'test question111', '2024-05-06 15:51:14', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (356, '1', NULL, 'test question116', '2024-05-06 15:51:14', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (357, '1', NULL, 'test question101', '2024-05-06 15:51:15', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (358, '1', NULL, 'test question106', '2024-05-06 15:51:15', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (359, '1', NULL, 'test question116', '2024-05-06 15:51:15', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (360, '1', NULL, 'test question111', '2024-05-06 15:51:15', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (361, '1', NULL, 'test question121', '2024-05-06 15:51:15', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (362, '1', NULL, 'test question131', '2024-05-06 15:51:16', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (363, '1', NULL, 'test question126', '2024-05-06 15:51:16', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (364, '1', NULL, 'test question121', '2024-05-06 15:51:16', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (365, '1', NULL, 'test question131', '2024-05-06 15:51:17', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (366, '1', NULL, 'test question136', '2024-05-06 15:51:17', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (367, '1', NULL, 'test question126', '2024-05-06 15:51:17', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (368, '1', NULL, 'test question146', '2024-05-06 15:51:17', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (369, '1', NULL, 'test question141', '2024-05-06 15:51:17', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (370, '1', NULL, 'test question136', '2024-05-06 15:51:18', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (371, '1', NULL, 'test question141', '2024-05-06 15:51:18', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (372, '1', NULL, 'test question146', '2024-05-06 15:51:18', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (373, '1', NULL, 'test question151', '2024-05-06 15:51:20', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (374, '1', NULL, 'test question161', '2024-05-06 15:51:20', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (375, '1', NULL, 'test question156', '2024-05-06 15:51:20', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (376, '1', NULL, 'test question156', '2024-05-06 15:51:20', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (377, '1', NULL, 'test question166', '2024-05-06 15:51:20', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (378, '1', NULL, 'test question171', '2024-05-06 15:51:20', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (379, '1', NULL, 'test question161', '2024-05-06 15:51:20', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (380, '1', NULL, 'test question151', '2024-05-06 15:51:20', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (381, '1', NULL, 'test question171', '2024-05-06 15:51:22', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (382, '1', NULL, 'test question166', '2024-05-06 15:51:22', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (383, '1', NULL, 'test question176', '2024-05-06 15:51:22', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (384, '1', NULL, 'test question186', '2024-05-06 15:51:23', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (385, '1', NULL, 'test question181', '2024-05-06 15:51:23', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (386, '1', NULL, 'test question176', '2024-05-06 15:51:23', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (387, '1', NULL, 'test question196', '2024-05-06 15:51:23', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (388, '1', NULL, 'test question191', '2024-05-06 15:51:23', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (389, '1', NULL, 'test question181', '2024-05-06 15:51:23', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (390, '1', NULL, 'test question191', '2024-05-06 15:51:23', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (391, '1', NULL, 'test question186', '2024-05-06 15:51:23', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (392, '1', NULL, 'test question206', '2024-05-06 15:51:25', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (393, '1', NULL, 'test question196', '2024-05-06 15:51:25', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (394, '1', NULL, 'test question201', '2024-05-06 15:51:25', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (395, '1', NULL, 'test question201', '2024-05-06 15:51:26', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (396, '1', NULL, 'test question211', '2024-05-06 15:51:26', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (397, '1', NULL, 'test question206', '2024-05-06 15:51:26', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (398, '1', NULL, 'test question216', '2024-05-06 15:51:26', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (399, '1', NULL, 'test question221', '2024-05-06 15:51:26', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (400, '1', NULL, 'test question211', '2024-05-06 15:51:27', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (401, '1', NULL, 'test question216', '2024-05-06 15:51:27', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (402, '1', NULL, 'test question221', '2024-05-06 15:51:27', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (403, '1', NULL, 'test question231', '2024-05-06 15:51:28', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (404, '1', NULL, 'test question236', '2024-05-06 15:51:28', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (405, '1', NULL, 'test question226', '2024-05-06 15:51:28', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (406, '1', NULL, 'test question246', '2024-05-06 15:51:29', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (407, '1', NULL, 'test question236', '2024-05-06 15:51:29', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (408, '1', NULL, 'test question231', '2024-05-06 15:51:29', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (409, '1', NULL, 'test question226', '2024-05-06 15:51:29', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (410, '1', NULL, 'test question241', '2024-05-06 15:51:29', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (411, '1', NULL, 'test question241', '2024-05-06 15:51:30', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (412, '1', NULL, 'test question246', '2024-05-06 15:51:30', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (413, '1', NULL, 'test question251', '2024-05-06 15:51:30', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (414, '1', NULL, 'test question261', '2024-05-06 15:51:32', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (415, '1', NULL, 'test question256', '2024-05-06 15:51:32', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (416, '1', NULL, 'test question266', '2024-05-06 15:51:32', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (417, '1', NULL, 'test question251', '2024-05-06 15:51:32', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (418, '1', NULL, 'test question261', '2024-05-06 15:51:32', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (419, '1', NULL, 'test question256', '2024-05-06 15:51:32', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (420, '1', NULL, 'test question266', '2024-05-06 15:51:32', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (421, '1', NULL, 'test question271', '2024-05-06 15:51:32', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (422, '1', NULL, 'test question271', '2024-05-06 15:51:34', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (423, '1', NULL, 'test question276', '2024-05-06 15:51:34', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (424, '1', NULL, 'test question281', '2024-05-06 15:51:34', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (425, '1', NULL, 'test question281', '2024-05-06 15:51:35', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (426, '1', NULL, 'test question286', '2024-05-06 15:51:35', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (427, '1', NULL, 'test question296', '2024-05-06 15:51:35', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (428, '1', NULL, 'test question276', '2024-05-06 15:51:35', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (429, '1', NULL, 'test question291', '2024-05-06 15:51:35', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (430, '1', NULL, 'test question286', '2024-05-06 15:51:36', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (431, '1', NULL, 'test question291', '2024-05-06 15:51:36', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (432, '1', NULL, 'test question296', '2024-05-06 15:51:36', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (433, '1', NULL, 'test question306', '2024-05-06 15:51:38', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (434, '1', NULL, 'test question301', '2024-05-06 15:51:38', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (435, '1', NULL, 'test question311', '2024-05-06 15:51:38', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (436, '1', NULL, 'test question301', '2024-05-06 15:51:39', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (437, '1', NULL, 'test question306', '2024-05-06 15:51:39', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (438, '1', NULL, 'test question316', '2024-05-06 15:51:39', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (439, '1', NULL, 'test question311', '2024-05-06 15:51:39', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (440, '1', NULL, 'test question321', '2024-05-06 15:51:39', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (441, '1', NULL, 'test question321', '2024-05-06 15:51:39', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (442, '1', NULL, 'test question326', '2024-05-06 15:51:39', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (443, '1', NULL, 'test question316', '2024-05-06 15:51:39', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (444, '1', NULL, 'test question331', '2024-05-06 15:51:41', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (445, '1', NULL, 'test question336', '2024-05-06 15:51:41', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (446, '1', NULL, 'test question341', '2024-05-06 15:51:41', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (447, '1', NULL, 'test question326', '2024-05-06 15:51:42', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (448, '1', NULL, 'test question331', '2024-05-06 15:51:42', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (449, '1', NULL, 'test question336', '2024-05-06 15:51:42', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (450, '1', NULL, 'test question346', '2024-05-06 15:51:42', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (451, '1', NULL, 'test question341', '2024-05-06 15:51:42', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (452, '1', NULL, 'test question351', '2024-05-06 15:51:43', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (453, '1', NULL, 'test question346', '2024-05-06 15:51:43', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (454, '1', NULL, 'test question356', '2024-05-06 15:51:43', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (455, '1', NULL, 'test question361', '2024-05-06 15:51:45', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (456, '1', NULL, 'test question366', '2024-05-06 15:51:45', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (457, '1', NULL, 'test question371', '2024-05-06 15:51:45', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (458, '1', NULL, 'test question361', '2024-05-06 15:51:45', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (459, '1', NULL, 'test question356', '2024-05-06 15:51:45', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (460, '1', NULL, 'test question371', '2024-05-06 15:51:45', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (461, '1', NULL, 'test question366', '2024-05-06 15:51:45', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (462, '1', NULL, 'test question351', '2024-05-06 15:51:45', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (463, '1', NULL, 'test question386', '2024-05-06 15:51:46', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (464, '1', NULL, 'test question376', '2024-05-06 15:51:46', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (465, '1', NULL, 'test question381', '2024-05-06 15:51:46', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (466, '1', NULL, 'test question396', '2024-05-06 15:51:48', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (467, '1', NULL, 'test question401', '2024-05-06 15:51:48', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (468, '1', NULL, 'test question391', '2024-05-06 15:51:48', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (469, '1', NULL, 'test question381', '2024-05-06 15:51:48', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (470, '1', NULL, 'test question386', '2024-05-06 15:51:48', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (471, '1', NULL, 'test question376', '2024-05-06 15:51:48', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (472, '1', NULL, 'test question396', '2024-05-06 15:51:48', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (473, '1', NULL, 'test question391', '2024-05-06 15:51:48', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (474, '1', NULL, 'test question416', '2024-05-06 15:51:50', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (475, '1', NULL, 'test question411', '2024-05-06 15:51:50', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (476, '1', NULL, 'test question406', '2024-05-06 15:51:50', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (477, '1', NULL, 'test question401', '2024-05-06 15:51:51', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (478, '1', NULL, 'test question416', '2024-05-06 15:51:51', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (479, '1', NULL, 'test question421', '2024-05-06 15:51:51', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (480, '1', NULL, 'test question411', '2024-05-06 15:51:51', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (481, '1', NULL, 'test question406', '2024-05-06 15:51:51', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (482, '1', NULL, 'test question421', '2024-05-06 15:51:52', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (483, '1', NULL, 'test question426', '2024-05-06 15:51:52', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (484, '1', NULL, 'test question431', '2024-05-06 15:51:52', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (485, '1', NULL, 'test question441', '2024-05-06 15:51:54', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (486, '1', NULL, 'test question446', '2024-05-06 15:51:54', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (487, '1', NULL, 'test question436', '2024-05-06 15:51:54', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (488, '1', NULL, 'test question431', '2024-05-06 15:51:55', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (489, '1', NULL, 'test question426', '2024-05-06 15:51:55', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (490, '1', NULL, 'test question436', '2024-05-06 15:51:55', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (491, '1', NULL, 'test question441', '2024-05-06 15:51:55', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (492, '1', NULL, 'test question446', '2024-05-06 15:51:55', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (493, '1', NULL, 'test question451', '2024-05-06 15:51:55', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (494, '1', NULL, 'test question456', '2024-05-06 15:51:55', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (495, '1', NULL, 'test question461', '2024-05-06 15:51:55', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (496, '1', NULL, 'test question466', '2024-05-06 15:51:57', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (497, '1', NULL, 'test question471', '2024-05-06 15:51:57', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (498, '1', NULL, 'test question476', '2024-05-06 15:51:57', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (499, '1', NULL, 'test question451', '2024-05-06 15:51:58', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (500, '1', NULL, 'test question456', '2024-05-06 15:51:58', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (501, '1', NULL, 'test question461', '2024-05-06 15:51:58', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (502, '1', NULL, 'test question466', '2024-05-06 15:51:58', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (503, '1', NULL, 'test question471', '2024-05-06 15:51:58', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (504, '1', NULL, 'test question481', '2024-05-06 15:51:59', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (505, '1', NULL, 'test question491', '2024-05-06 15:51:59', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (506, '1', NULL, 'test question486', '2024-05-06 15:51:59', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (507, '1', NULL, 'test question506', '2024-05-06 15:52:01', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (508, '1', NULL, 'test question496', '2024-05-06 15:52:01', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (509, '1', NULL, 'test question501', '2024-05-06 15:52:01', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (510, '1', NULL, 'test question476', '2024-05-06 15:52:02', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (511, '1', NULL, 'test question481', '2024-05-06 15:52:02', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (512, '1', NULL, 'test question491', '2024-05-06 15:52:02', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (513, '1', NULL, 'test question496', '2024-05-06 15:52:02', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (514, '1', NULL, 'test question486', '2024-05-06 15:52:02', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (515, '1', NULL, 'test question521', '2024-05-06 15:52:03', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (516, '1', NULL, 'test question511', '2024-05-06 15:52:03', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (517, '1', NULL, 'test question516', '2024-05-06 15:52:03', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (518, '1', NULL, 'test question526', '2024-05-06 15:52:04', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (519, '1', NULL, 'test question536', '2024-05-06 15:52:04', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (520, '1', NULL, 'test question531', '2024-05-06 15:52:04', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (521, '1', NULL, 'test question511', '2024-05-06 15:52:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (522, '1', NULL, 'test question501', '2024-05-06 15:52:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (523, '1', NULL, 'test question516', '2024-05-06 15:52:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (524, '1', NULL, 'test question521', '2024-05-06 15:52:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (525, '1', NULL, 'test question506', '2024-05-06 15:52:05', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (526, '1', NULL, 'test question541', '2024-05-06 15:52:06', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (527, '1', NULL, 'test question546', '2024-05-06 15:52:06', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (528, '1', NULL, 'test question551', '2024-05-06 15:52:06', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (529, '1', NULL, 'test question561', '2024-05-06 15:52:08', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (530, '1', NULL, 'test question556', '2024-05-06 15:52:08', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (531, '1', NULL, 'test question566', '2024-05-06 15:52:08', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (532, '1', NULL, 'test question526', '2024-05-06 15:52:08', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (533, '1', NULL, 'test question531', '2024-05-06 15:52:08', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (534, '1', NULL, 'test question541', '2024-05-06 15:52:08', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (535, '1', NULL, 'test question546', '2024-05-06 15:52:08', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (536, '1', NULL, 'test question536', '2024-05-06 15:52:08', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (537, '1', NULL, 'test question581', '2024-05-06 15:52:10', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (538, '1', NULL, 'test question571', '2024-05-06 15:52:10', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (539, '1', NULL, 'test question576', '2024-05-06 15:52:10', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (540, '1', NULL, 'test question551', '2024-05-06 15:52:12', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (541, '1', NULL, 'test question561', '2024-05-06 15:52:12', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (542, '1', NULL, 'test question566', '2024-05-06 15:52:12', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (543, '1', NULL, 'test question556', '2024-05-06 15:52:12', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (544, '1', NULL, 'test question571', '2024-05-06 15:52:12', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (545, '1', NULL, 'test question586', '2024-05-06 15:52:12', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (546, '1', NULL, 'test question596', '2024-05-06 15:52:12', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (547, '1', NULL, 'test question591', '2024-05-06 15:52:12', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (548, '1', NULL, 'test question601', '2024-05-06 15:52:14', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (549, '1', NULL, 'test question606', '2024-05-06 15:52:14', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (550, '1', NULL, 'test question611', '2024-05-06 15:52:14', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (551, '1', NULL, 'test question576', '2024-05-06 15:52:15', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (552, '1', NULL, 'test question586', '2024-05-06 15:52:15', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (553, '1', NULL, 'test question581', '2024-05-06 15:52:15', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (554, '1', NULL, 'test question591', '2024-05-06 15:52:15', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (555, '1', NULL, 'test question596', '2024-05-06 15:52:15', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (556, '1', NULL, 'test question621', '2024-05-06 15:52:16', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (557, '1', NULL, 'test question616', '2024-05-06 15:52:16', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (558, '1', NULL, 'test question626', '2024-05-06 15:52:16', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (559, '1', NULL, 'test question631', '2024-05-06 15:52:18', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (560, '1', NULL, 'test question641', '2024-05-06 15:52:18', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (561, '1', NULL, 'test question636', '2024-05-06 15:52:18', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (562, '1', NULL, 'test question611', '2024-05-06 15:52:18', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (563, '1', NULL, 'test question601', '2024-05-06 15:52:18', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (564, '1', NULL, 'test question606', '2024-05-06 15:52:18', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (565, '1', NULL, 'test question616', '2024-05-06 15:52:18', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (566, '1', NULL, 'test question621', '2024-05-06 15:52:18', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (567, '1', NULL, 'test question646', '2024-05-06 15:52:19', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (568, '1', NULL, 'test question656', '2024-05-06 15:52:19', 'magna dolor', 6, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (569, '1', NULL, 'test question651', '2024-05-06 15:52:19', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (570, '1', NULL, 'test question671', '2024-05-06 15:52:21', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (571, '1', NULL, 'test question666', '2024-05-06 15:52:21', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (572, '1', NULL, 'test question661', '2024-05-06 15:52:21', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (573, '1', NULL, 'test question641', '2024-05-06 15:52:22', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (574, '1', NULL, 'test question636', '2024-05-06 15:52:22', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (575, '1', NULL, 'test question646', '2024-05-06 15:52:22', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (576, '1', NULL, 'test question631', '2024-05-06 15:52:22', 'magna dolor', 14, 1);
INSERT INTO `t_question` (`id`, `qu_type`, `image`, `content`, `create_time`, `analysis`, `repo_id`, `user_id`) VALUES (577, '1', NULL, 'test question626', '2024-05-06 15:52:22', 'magna dolor', 14, 1);
COMMIT;

-- ----------------------------
-- Table structure for t_repo
-- ----------------------------
DROP TABLE IF EXISTS `t_repo`;
CREATE TABLE `t_repo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id   题库表',
  `user_id` int(11) NOT NULL COMMENT '创建人id',
  `title` varchar(255) NOT NULL COMMENT '题库标题',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_repo
-- ----------------------------
BEGIN;
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (6, 1, '好不本阶感节', '2024-05-13 16:06:15');
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (7, 1, '32', '2024-04-22 11:20:04');
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (8, 1, '12131', '2024-04-22 11:20:32');
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (9, 1, 'wewe', '2024-04-22 11:20:41');
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (14, 1, '测试题库', '2024-05-09 15:59:41');
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (18, 1, 'test', '2024-05-10 10:06:21');
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (20, 1, '给第三方', '2024-05-11 14:20:16');
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (21, 1, 'fdf', '2024-05-11 14:20:17');
INSERT INTO `t_repo` (`id`, `user_id`, `title`, `create_time`) VALUES (23, 1, 'hgf', '2024-05-11 14:21:28');
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID  角色表',
  `role_name` varchar(10) NOT NULL COMMENT '角色名称',
  `code` varchar(10) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` (`id`, `role_name`, `code`) VALUES (1, '学生', 'student');
INSERT INTO `t_role` (`id`, `role_name`, `code`) VALUES (2, '教师', 'teacher');
INSERT INTO `t_role` (`id`, `role_name`, `code`) VALUES (3, '管理员', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `real_name` varchar(5) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `role_id` int(11) DEFAULT '1' COMMENT '角色id',
  `grade_id` int(11) DEFAULT NULL COMMENT '班级id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间   YYYY-MM-DD hh:mm:ss',
  `status` int(11) DEFAULT '1' COMMENT '状态  1正常0禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (1, 'admin', '管理员', '$2a$10$pileUO5bi/3rJkG//sigEO0upGy3WjLV.ehT7zssRcFvadsc3VKPe', 'https://online-exam-system-backend.oss-cn-beijing.aliyuncs.com/da93c2a6-6879-46c3-b38f-a99956f70d22.jpg', 3, 8, '2024-05-23 16:06:07', 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (2, 'zhangsan', '张三', '$2a$10$61ogZY7EXsMDWeVGQpDq3OBF1.phaUu7.xrwLyWFTOu8woE08zMIW', NULL, 2, 8, '2024-05-06 15:35:23', 0);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (3, 'abc', 'adf', '$2a$10$61ogZY7EXsMDWeVGQpDq3OBF1.phaUu7.xrwLyWFTOu8woE08zMIW', NULL, 1, 10, NULL, 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (4, '地方', '是为对方', '$2a$10$wZVpSnaaPJGz5xnmO7YwZ.5t6FdptApQFcYzRZb2pmiIyGU7/HJnu', NULL, 1, 9, '2024-05-13 11:19:41', 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (5, '显得十分', '士大夫', '$2a$10$RF2qOZhK20nOhxT9y2CmauhM3ofsqZPOv7bvGf7FEVXtiKtH9NiY.', NULL, 1, 9, '2024-05-13 11:22:18', 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (15, 'lisi', '李四', '$2a$10$OmgPV5i8rUmj5KWs5ILDyuz3JXXkMUqxoWaqD/iHQpI.s4hV47aYu', NULL, NULL, NULL, '2024-05-13 15:04:02', 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (17, 'wangwu', '王五', '$2a$10$DmvS9HAYbwuaxiTbP3PaZ.34ccf.Sws/dgOUcDdSlWVfhsQugak7e', NULL, NULL, NULL, NULL, 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (18, '11356', '王五', '$2a$10$c9Lj1X40uO8T12zlBZPZyuEBqM8cOaoEhjQk.0pgsRmWPZj.4Xg0O', NULL, NULL, NULL, '2024-05-13 15:41:45', 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (20, 'w156521211', '张三', '$2a$10$Ov4Q5ikaTX2BFDONV/Y6AO8dmHJt6/jE7mHPwNRSwGAlE3Nk4WFs2', NULL, NULL, NULL, '2024-05-18 00:43:58', 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (21, '156415612211', '多选题', '$2a$10$6uCPinXKEqbO9Kl9Wtac4OcCrxj3OriF6kvQ9jciL.PlL89OtnLiC', NULL, NULL, NULL, '2024-05-18 00:43:58', 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (22, 'thomsa11', '李四', '$2a$10$D1YYMMbFDEverfUP28tIR.ck11XV6gcZA9O0BuPnmRLN2k/imRXgi', NULL, NULL, NULL, '2024-05-18 00:43:58', 1);
INSERT INTO `t_user` (`id`, `user_name`, `real_name`, `password`, `avatar`, `role_id`, `grade_id`, `create_time`, `status`) VALUES (23, 'aobaoma11', '王五', '$2a$10$ekzbC38jstUxp2KadoOXhOzcdGCLjJJVf1TM945Gbfvh66U2Kxu5.', NULL, NULL, NULL, '2024-05-18 00:43:58', 1);
COMMIT;

-- ----------------------------
-- Table structure for t_user_book
-- ----------------------------
DROP TABLE IF EXISTS `t_user_book`;
CREATE TABLE `t_user_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID   错题本',
  `exam_id` int(11) DEFAULT NULL COMMENT '考试id  唯一',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id    唯一',
  `qu_id` int(11) DEFAULT NULL COMMENT '题目id    唯一',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间    YYYY-MM-DD hh:mm:ss',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user_book
-- ----------------------------
BEGIN;
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (1, 1, 1, 2, '2024-05-04 00:44:11');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (2, 2, 1, 2, '2024-05-04 00:44:14');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (3, 2, 1, 3, '2024-05-04 00:44:17');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (4, 2, 2, 3, '2024-05-04 00:44:20');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (5, 3, 1, 1, '2024-05-04 00:44:23');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (6, 28, 1, 265, '2024-05-11 19:27:48');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (7, 28, 1, 265, '2024-05-11 19:31:53');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (8, 28, 1, 117, '2024-05-13 11:00:42');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (9, 28, 1, 265, '2024-05-13 11:00:42');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (10, 28, 1, 265, '2024-05-13 14:12:23');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (11, 44, 1, 503, '2024-05-20 11:28:21');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (12, 44, 1, 252, '2024-05-20 11:28:21');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (13, 44, 1, 228, '2024-05-20 11:28:21');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (14, 44, 1, 125, '2024-05-20 11:28:21');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (15, 44, 1, 126, '2024-05-20 11:28:21');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (16, 44, 1, 286, '2024-05-20 11:28:21');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (17, 44, 1, 503, '2024-05-20 11:43:20');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (18, 44, 1, 252, '2024-05-20 11:43:20');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (19, 44, 1, 228, '2024-05-20 11:43:20');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (20, 44, 1, 125, '2024-05-20 11:43:20');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (21, 44, 1, 126, '2024-05-20 11:43:20');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (22, 44, 1, 286, '2024-05-20 11:43:20');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (23, 44, 1, 30, '2024-05-20 11:43:20');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (24, 44, 1, 503, '2024-05-20 11:44:18');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (25, 44, 1, 252, '2024-05-20 11:44:18');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (26, 44, 1, 228, '2024-05-20 11:44:18');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (27, 44, 1, 125, '2024-05-20 11:44:18');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (28, 44, 1, 126, '2024-05-20 11:44:18');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (29, 44, 1, 286, '2024-05-20 11:44:18');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (30, 44, 1, 30, '2024-05-20 11:44:18');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (31, 44, 1, 503, '2024-05-20 11:45:30');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (32, 44, 1, 252, '2024-05-20 11:45:30');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (33, 44, 1, 228, '2024-05-20 11:45:30');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (34, 44, 1, 125, '2024-05-20 11:45:30');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (35, 44, 1, 126, '2024-05-20 11:45:30');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (36, 44, 1, 286, '2024-05-20 11:45:30');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (37, 44, 1, 30, '2024-05-20 11:45:30');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (38, 46, 1, 289, '2024-05-20 15:29:50');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (39, 46, 1, 125, '2024-05-20 15:29:50');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (40, 46, 1, 189, '2024-05-20 15:29:50');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (41, 46, 1, 108, '2024-05-20 15:29:50');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (42, 46, 1, 289, '2024-05-20 15:39:59');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (43, 46, 1, 125, '2024-05-20 15:39:59');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (44, 46, 1, 189, '2024-05-20 15:39:59');
INSERT INTO `t_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`) VALUES (45, 46, 1, 108, '2024-05-20 15:39:59');
COMMIT;

-- ----------------------------
-- Table structure for t_user_exams_score
-- ----------------------------
DROP TABLE IF EXISTS `t_user_exams_score`;
CREATE TABLE `t_user_exams_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id  用户考试成绩表',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id  唯一',
  `exam_id` int(11) DEFAULT NULL COMMENT '试卷id  唯一',
  `total_time` int(11) DEFAULT NULL COMMENT '总时长  YYYY-MM-DD hh:mm:ss',
  `user_time` int(11) DEFAULT NULL COMMENT '用户用时  YYYY-MM-DD hh:mm:ss',
  `user_score` int(11) unsigned DEFAULT '0' COMMENT '用户得分',
  `limit_time` datetime DEFAULT NULL COMMENT '交卷时间  YYYY-MM-DD hh:mm:ss',
  `count` int(11) DEFAULT NULL COMMENT '切屏次数',
  `state` int(11) DEFAULT NULL COMMENT '状态   0正在考试 1考试完成',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间  YYYY-MM-DD hh:mm:ss',
  `whether_mark` int(11) DEFAULT NULL COMMENT '是否阅卷-1无简答题、0未阅卷、1阅卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user_exams_score
-- ----------------------------
BEGIN;
INSERT INTO `t_user_exams_score` (`id`, `user_id`, `exam_id`, `total_time`, `user_time`, `user_score`, `limit_time`, `count`, `state`, `create_time`, `whether_mark`) VALUES (69, 1, 32, 60, NULL, 0, NULL, NULL, 0, '2024-05-23 13:55:23', NULL);
INSERT INTO `t_user_exams_score` (`id`, `user_id`, `exam_id`, `total_time`, `user_time`, `user_score`, `limit_time`, `count`, `state`, `create_time`, `whether_mark`) VALUES (70, 1, 46, 60, NULL, 0, NULL, NULL, 0, '2024-05-23 15:00:00', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_user_exercise_record
-- ----------------------------
DROP TABLE IF EXISTS `t_user_exercise_record`;
CREATE TABLE `t_user_exercise_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id   用户刷题记录表',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `repo_id` int(11) DEFAULT NULL COMMENT '题库id',
  `total_count` int(11) DEFAULT NULL COMMENT '总题数',
  `exercise_count` int(11) DEFAULT NULL COMMENT '已刷题数',
  `create_time` datetime DEFAULT NULL COMMENT '刷题时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user_exercise_record
-- ----------------------------
BEGIN;
INSERT INTO `t_user_exercise_record` (`id`, `user_id`, `repo_id`, `total_count`, `exercise_count`, `create_time`) VALUES (1, 1, 6, 33, 33, '2024-05-20 14:29:21');
INSERT INTO `t_user_exercise_record` (`id`, `user_id`, `repo_id`, `total_count`, `exercise_count`, `create_time`) VALUES (2, 1, 14, 522, 1, '2024-05-20 19:05:21');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
