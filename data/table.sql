/*
Navicat MariaDB Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 100505
Source Host           : 127.0.0.1:3306
Source Database       : blog

Target Server Type    : MariaDB
Target Server Version : 100505
File Encoding         : 65001

Date: 2021-08-08 20:00:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` varchar(255) DEFAULT '' COMMENT '分类名',
                        `intro` varchar(255) DEFAULT NULL COMMENT '描述',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cate
-- ----------------------------
INSERT INTO `cate` VALUES ('1', 'article', '博客文章');
INSERT INTO `cate` VALUES ('3', 'learn', '学习笔记');
INSERT INTO `cate` VALUES ('4', 'goweb', '动态网站');
INSERT INTO `cate` VALUES ('5', 'python', 'python');
INSERT INTO `cate` VALUES ('6', 'javascript', 'javascript');
INSERT INTO `cate` VALUES ('7', 'mpg', '微信小程序');
INSERT INTO `cate` VALUES ('8', 'gzh', '微信公众号');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `cate_id` int(11) DEFAULT NULL COMMENT '分类Id',
                        `kind` int(11) DEFAULT NULL COMMENT '类型1-文章，2-页面',
                        `status` int(11) DEFAULT NULL COMMENT '状态1-草稿，2-已发布',
                        `title` varchar(255) DEFAULT NULL COMMENT '标题',
                        `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
                        `summary` text DEFAULT NULL COMMENT '摘要',
                        `markdown` mediumtext DEFAULT NULL COMMENT 'markdown内容',
                        `richtext` mediumtext DEFAULT NULL COMMENT '富文本内容',
                        `allow` tinyint(4) DEFAULT 1 COMMENT '允许评论',
                        `created` datetime DEFAULT NULL COMMENT '创建时间',
                        `updated` datetime DEFAULT NULL COMMENT '修改时间',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `UQE_post_path` (`path`),
                        KEY `create_time` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tag` (`post_id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `key` varchar(64) NOT NULL COMMENT '唯一Key',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `inner` tinyint(4) DEFAULT NULL COMMENT '内部禁止删除',
  `intro` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`key`),
  UNIQUE KEY `UQE_sys_dict_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('tmp-mod', '{\"begin\":\"2021-08-08 19:18\",\"end\":\"2021-08-08 19:18\",\"span\":0.3}', '0', '');

-- ----------------------------
-- Table structure for sys_global
-- ----------------------------
DROP TABLE IF EXISTS `sys_global`;
CREATE TABLE `sys_global` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site_url` varchar(255) DEFAULT NULL COMMENT '网站地址',
  `logo_url` varchar(255) DEFAULT NULL COMMENT 'Logo地址',
  `title` varchar(255) DEFAULT NULL COMMENT '网站标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '网站关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '网站描述',
  `favicon_url` varchar(255) DEFAULT NULL COMMENT 'Favicon地址',
  `beian_miit` varchar(255) DEFAULT NULL COMMENT 'ICP备案',
  `beian_nism` varchar(255) DEFAULT NULL COMMENT '公安备案',
  `copyright` varchar(255) DEFAULT NULL COMMENT '版权',
  `site_js` varchar(512) DEFAULT NULL COMMENT '全局js',
  `site_css` varchar(512) DEFAULT NULL COMMENT '全局css',
  `page_size` int(11) DEFAULT 6 COMMENT '分页大小',
  `comment` varchar(1024) DEFAULT NULL COMMENT '评论脚本',
  `github_url` varchar(255) DEFAULT NULL COMMENT 'githu地址',
  `weibo_url` varchar(255) DEFAULT NULL COMMENT '微博地址',
  `analytic` varchar(1024) DEFAULT NULL COMMENT '统计脚本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `num` varchar(255) DEFAULT NULL COMMENT '账号',
  `passwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `ecount` int(11) DEFAULT 0 COMMENT '错误次数',
  `ltime` datetime DEFAULT NULL COMMENT '上次登录时间',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `openid_qq` varchar(64) DEFAULT NULL COMMENT 'qq_openid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_sys_user_num` (`num`),
  UNIQUE KEY `UQE_sys_user_openid_qq` (`openid_qq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'zxysilent', 'zxysilent', '3b861abeaa25fba9d03898324463f7', '', '', '1', '2021-07-24 22:36:23', '2021-04-06 17:47:16', null);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '标签名',
  `intro` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', 'web', 'web');
INSERT INTO `tag` VALUES ('2', 'go', 'go');
INSERT INTO `tag` VALUES ('3', 'c', 'c');
INSERT INTO `tag` VALUES ('4', 'mysql', 'mysql');
INSERT INTO `tag` VALUES ('6', 'teach', 'teach');
INSERT INTO `tag` VALUES ('7', 'learn', 'learn');
INSERT INTO `tag` VALUES ('9', 'beego', 'beego');
INSERT INTO `tag` VALUES ('10', 'node', 'node');
INSERT INTO `tag` VALUES ('11', 'nginx', 'nginx');
INSERT INTO `tag` VALUES ('12', 'python', 'python');
INSERT INTO `tag` VALUES ('13', 'numpy', 'numpy');
INSERT INTO `tag` VALUES ('14', 'javascript', 'javascript');
INSERT INTO `tag` VALUES ('15', 'ga', 'ga');
INSERT INTO `tag` VALUES ('16', 'java', 'java');
INSERT INTO `tag` VALUES ('17', 'machinelearning', 'ml');
INSERT INTO `tag` VALUES ('18', 'ds', 'ds');
INSERT INTO `tag` VALUES ('19', 'matplotlib', 'matplotlib');
INSERT INTO `tag` VALUES ('20', 'opencv', 'opencv');
INSERT INTO `tag` VALUES ('21', 'mpg', '小程序');
INSERT INTO `tag` VALUES ('22', 'gzh', '公众号');
