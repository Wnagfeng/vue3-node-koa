/*
 Navicat Premium Data Transfer

 Source Server         : test01
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : wfcms

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 16/08/2023 14:11:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `leader` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parentId` int NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`parentId` ASC) USING BTREE,
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '人事部', NULL, '汪枫', 1, '2023-08-10 22:17:04', '2023-08-10 22:18:31');
INSERT INTO `department` VALUES (2, '总裁办', NULL, 'lily', 2, '2023-08-10 22:17:30', '2023-08-11 20:35:01');
INSERT INTO `department` VALUES (3, '开发部', NULL, '汪枫', 1, '2023-08-10 22:18:08', '2023-08-10 22:18:08');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` tinyint(1) NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT 100,
  `parentId` int NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `url`(`url` ASC) USING BTREE,
  UNIQUE INDEX `icon`(`icon` ASC) USING BTREE,
  INDEX `parentId`(`parentId` ASC) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统总览', 1, '/main/analysis', 'el-icon-monitor', 1, NULL, NULL, '2023-08-10 12:58:15', '2023-08-10 12:58:15');
INSERT INTO `menu` VALUES (2, '核心技术', 2, '/main/analysis/overview', NULL, 101, 1, NULL, '2023-08-10 13:18:39', '2023-08-10 13:35:26');
INSERT INTO `menu` VALUES (3, '商品统计', 2, '/main/analysis/dashboard', NULL, 102, 1, NULL, '2023-08-10 13:30:25', '2023-08-10 13:35:30');
INSERT INTO `menu` VALUES (4, '系统管理', 1, '/main/system', 'el-icon-setting', 2, NULL, NULL, '2023-08-10 13:32:06', '2023-08-10 13:36:11');
INSERT INTO `menu` VALUES (9, '用户管理', 2, '/main/system/user', NULL, 103, 4, NULL, '2023-08-10 13:36:29', '2023-08-10 13:36:29');
INSERT INTO `menu` VALUES (10, '部门管理', 2, '/main/system/department', NULL, 104, 4, NULL, '2023-08-10 13:37:40', '2023-08-10 13:37:40');
INSERT INTO `menu` VALUES (11, '菜单管理', 2, '/main/system/menu', NULL, 106, 4, NULL, '2023-08-10 13:38:45', '2023-08-10 13:38:45');
INSERT INTO `menu` VALUES (12, '角色管理', 2, '/main/system/role', NULL, 107, 4, NULL, '2023-08-10 13:39:22', '2023-08-10 13:39:22');
INSERT INTO `menu` VALUES (14, '商品中心', 1, '/main/product', 'el-icon-goods', 3, NULL, NULL, '2023-08-10 13:45:23', '2023-08-10 13:45:23');
INSERT INTO `menu` VALUES (15, '商品类别', 2, '/main/product/category', NULL, 108, 14, NULL, '2023-08-10 13:47:06', '2023-08-10 13:48:10');
INSERT INTO `menu` VALUES (16, '商品信息', 2, '/main/product/goods', NULL, 109, 14, NULL, '2023-08-10 13:48:02', '2023-08-10 13:48:02');
INSERT INTO `menu` VALUES (17, '公司通告', 1, '/main/story', 'el-icon-chat-line-round', 4, NULL, NULL, '2023-08-10 13:48:55', '2023-08-10 13:51:03');
INSERT INTO `menu` VALUES (18, '发布通告', 2, '/main/story/chat', NULL, 110, 17, NULL, '2023-08-10 13:49:56', '2023-08-10 13:51:55');
INSERT INTO `menu` VALUES (20, '通告列表', 2, '/main/story/list', NULL, 111, 17, NULL, '2023-08-10 13:51:49', '2023-08-10 13:51:49');
INSERT INTO `menu` VALUES (21, '创建用户', 3, NULL, NULL, 112, 9, 'system:users:create', '2023-08-10 13:54:09', '2023-08-10 14:35:34');
INSERT INTO `menu` VALUES (22, '删除用户', 3, NULL, NULL, 113, 9, 'system:users:delete', '2023-08-10 13:55:43', '2023-08-10 14:35:43');
INSERT INTO `menu` VALUES (23, '修改用户', 3, NULL, NULL, 114, 9, 'system:role:update', '2023-08-10 13:55:54', '2023-08-10 14:37:26');
INSERT INTO `menu` VALUES (24, '查询用户', 3, NULL, NULL, 115, 9, 'system:role:query', '2023-08-10 13:56:10', '2023-08-10 14:37:49');
INSERT INTO `menu` VALUES (25, '创建部门', 3, NULL, NULL, 116, 10, 'system:department:create', '2023-08-10 13:56:52', '2023-08-10 14:37:58');
INSERT INTO `menu` VALUES (26, '删除部门', 3, NULL, NULL, 117, 10, 'system:department:delete', '2023-08-10 13:57:07', '2023-08-10 14:38:00');
INSERT INTO `menu` VALUES (27, '修改部门', 3, NULL, NULL, 118, 10, 'system:department:update', '2023-08-10 13:57:18', '2023-08-10 14:38:14');
INSERT INTO `menu` VALUES (28, '查询部门', 3, NULL, NULL, 119, 10, 'system:department:query', '2023-08-10 13:57:26', '2023-08-10 14:38:16');
INSERT INTO `menu` VALUES (29, '创建菜单', 3, NULL, NULL, 120, 11, 'system:menu:create', '2023-08-10 13:58:18', '2023-08-10 14:38:24');
INSERT INTO `menu` VALUES (30, '删除菜单', 3, NULL, NULL, 121, 11, 'system:menu:delete', '2023-08-10 13:58:31', '2023-08-10 14:38:35');
INSERT INTO `menu` VALUES (31, '修改菜单', 3, NULL, NULL, 122, 11, 'system:menu:update', '2023-08-10 13:58:38', '2023-08-10 14:38:37');
INSERT INTO `menu` VALUES (32, '查询菜单', 3, NULL, NULL, 123, 11, 'system:menu:query', '2023-08-10 13:59:30', '2023-08-10 14:38:47');
INSERT INTO `menu` VALUES (33, '创建角色', 3, NULL, NULL, 124, 12, 'system:role:create', '2023-08-10 14:00:04', '2023-08-10 14:38:57');
INSERT INTO `menu` VALUES (34, '删除角色', 3, NULL, NULL, 125, 12, 'system:role:delete', '2023-08-10 14:00:29', '2023-08-10 14:39:04');
INSERT INTO `menu` VALUES (35, '修改角色', 3, NULL, NULL, 126, 12, 'system:role:update', '2023-08-10 14:00:45', '2023-08-10 14:39:18');
INSERT INTO `menu` VALUES (36, '查询角色', 3, NULL, NULL, 127, 12, 'system:role:query', '2023-08-10 14:00:55', '2023-08-10 14:39:25');
INSERT INTO `menu` VALUES (37, '创建类别', 3, NULL, NULL, 128, 15, 'system:category:create', '2023-08-10 14:02:52', '2023-08-10 14:40:10');
INSERT INTO `menu` VALUES (38, '删除类别', 3, NULL, NULL, 129, 15, 'system:category:delete', '2023-08-10 14:03:22', '2023-08-10 14:40:19');
INSERT INTO `menu` VALUES (39, '修改类别', 3, NULL, NULL, 130, 15, 'system:category:update', '2023-08-10 14:03:36', '2023-08-10 14:40:31');
INSERT INTO `menu` VALUES (40, '查询类别', 3, NULL, NULL, 131, 15, 'system:category:query', '2023-08-10 14:03:44', '2023-08-10 14:40:42');
INSERT INTO `menu` VALUES (41, '创建商品', 3, NULL, NULL, 132, 16, 'system:goods:create', '2023-08-10 14:04:51', '2023-08-10 14:40:43');
INSERT INTO `menu` VALUES (42, '删除商品', 3, NULL, NULL, 133, 16, 'system:goods:delete', '2023-08-10 14:05:01', '2023-08-10 14:40:51');
INSERT INTO `menu` VALUES (43, '修改商品', 3, NULL, NULL, 134, 16, 'system:goods:update', '2023-08-10 14:05:10', '2023-08-10 14:40:58');
INSERT INTO `menu` VALUES (44, '查询商品', 3, NULL, NULL, 135, 16, 'system:goods:query', '2023-08-10 14:05:18', '2023-08-10 14:41:07');
INSERT INTO `menu` VALUES (45, '发布通告', 3, NULL, NULL, 136, 20, 'system:announce:create', '2023-08-10 14:06:34', '2023-08-10 14:42:36');
INSERT INTO `menu` VALUES (46, '修改通告', 3, NULL, NULL, 137, 20, 'system:announce:updata', '2023-08-10 14:06:45', '2023-08-10 14:42:43');
INSERT INTO `menu` VALUES (47, '删除通告', 3, NULL, NULL, 138, 20, 'system:announce:delete', '2023-08-10 14:06:54', '2023-08-10 14:42:48');
INSERT INTO `menu` VALUES (48, 'test测试1', 1, 'xxx', 'xxx', 139, 1, 'xxxx', '2023-08-10 14:07:03', '2023-08-11 23:16:05');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (2, '周杰伦1', '日常事务', '2023-08-10 20:30:33', '2023-08-11 20:17:53');
INSERT INTO `role` VALUES (3, '汪枫', '管理部门', '2023-08-10 20:30:39', '2023-08-10 20:30:39');
INSERT INTO `role` VALUES (5, '小明', '管理部门', '2023-08-10 20:39:36', '2023-08-10 20:39:36');
INSERT INTO `role` VALUES (7, '小红', '管理部门', '2023-08-10 20:41:05', '2023-08-10 20:41:05');
INSERT INTO `role` VALUES (8, '小白', '管理部门', '2023-08-10 20:44:49', '2023-08-10 20:44:49');
INSERT INTO `role` VALUES (9, '小黑', '管理部门', '2023-08-10 20:47:26', '2023-08-10 20:47:26');
INSERT INTO `role` VALUES (11, '小蓝', '管理部门', '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role` VALUES (12, '运营', '日常管理', '2023-08-10 20:52:11', '2023-08-10 20:52:11');
INSERT INTO `role` VALUES (14, '运营1', '日常管理', '2023-08-10 20:52:27', '2023-08-10 20:52:27');
INSERT INTO `role` VALUES (15, '客服', '日常管理', '2023-08-10 20:54:39', '2023-08-10 20:54:39');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `roleId` int NOT NULL,
  `menuId` int NOT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`roleId`, `menuId`) USING BTREE,
  INDEX `menuId`(`menuId` ASC) USING BTREE,
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (11, 1, '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role_menu` VALUES (11, 2, '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role_menu` VALUES (11, 3, '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role_menu` VALUES (11, 4, '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role_menu` VALUES (11, 9, '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role_menu` VALUES (11, 25, '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role_menu` VALUES (11, 38, '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role_menu` VALUES (11, 41, '2023-08-10 20:48:17', '2023-08-10 20:48:17');
INSERT INTO `role_menu` VALUES (12, 1, '2023-08-10 20:52:11', '2023-08-10 20:52:11');
INSERT INTO `role_menu` VALUES (12, 2, '2023-08-10 20:52:11', '2023-08-10 20:52:11');
INSERT INTO `role_menu` VALUES (12, 3, '2023-08-10 20:52:11', '2023-08-10 20:52:11');
INSERT INTO `role_menu` VALUES (12, 4, '2023-08-10 20:52:11', '2023-08-10 20:52:11');
INSERT INTO `role_menu` VALUES (14, 1, '2023-08-10 20:52:27', '2023-08-10 20:52:27');
INSERT INTO `role_menu` VALUES (14, 2, '2023-08-10 20:52:27', '2023-08-10 20:52:27');
INSERT INTO `role_menu` VALUES (14, 3, '2023-08-10 20:52:27', '2023-08-10 20:52:27');
INSERT INTO `role_menu` VALUES (14, 4, '2023-08-10 20:52:27', '2023-08-10 20:52:27');
INSERT INTO `role_menu` VALUES (15, 1, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 2, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 3, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 4, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 9, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 10, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 11, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 12, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 14, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 15, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 16, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 17, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 18, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 20, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 21, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 22, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 23, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 24, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 25, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 26, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 27, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 28, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 29, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 30, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 31, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 32, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 33, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 34, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 35, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 36, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 37, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 38, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 39, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 40, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 41, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 42, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 43, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 44, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 45, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 46, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 47, '2023-08-10 20:54:39', '2023-08-10 20:54:39');
INSERT INTO `role_menu` VALUES (15, 48, '2023-08-10 20:54:39', '2023-08-10 20:54:39');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cellphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `roleid` int NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `departmentId` int NULL DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE,
  INDEX `roleid`(`roleid` ASC) USING BTREE,
  INDEX `departmentId`(`departmentId` ASC) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (19, '小红', 'e10adc3949ba59abbe56e057f20f883e', '13322223338', 2, '詹姆斯', 1, '2023-08-11 20:29:44', '2023-08-11 20:29:44', NULL);
INSERT INTO `user` VALUES (20, '小红1', 'e10adc3949ba59abbe56e057f20f883e', '13322223338', 3, '詹姆斯', 1, '2023-08-11 20:29:55', '2023-08-11 20:29:55', NULL);

SET FOREIGN_KEY_CHECKS = 1;
