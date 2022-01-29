/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : go_blog

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2022-01-29 15:13:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '分类名',
  `intro` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `cate_id` int DEFAULT NULL COMMENT '分类Id',
  `kind` int DEFAULT NULL COMMENT '类型1-文章，2-页面',
  `status` int DEFAULT NULL COMMENT '状态1-草稿，2-已发布',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `summary` text COMMENT '摘要',
  `markdown` mediumtext COMMENT 'markdown内容',
  `richtext` mediumtext COMMENT '富文本内容',
  `allow` tinyint DEFAULT '1' COMMENT '允许评论',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_post_path` (`path`),
  KEY `create_time` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('3', '0', '2', '2', '友链', 'links', '', '> 站内自用\n\n[<img src=\"/favicon.ico\" width=\"30px\">](/dashboard/)\n', '<blockquote>\n<p>站内自用</p>\n</blockquote>\n<p><a href=\"/dashboard/\" target=\"_blank\"><img src=\"/favicon.ico\" width=\"30px\"></a></p>\n', '0', '2017-04-07 10:31:06', '2022-01-29 14:56:08');
INSERT INTO `post` VALUES ('4', '0', '2', '2', '关于', 'about', '', '# Jimmy Pan\n## TODO\n- [ ] 完善简历', '<h1><a id=\"Jimmy_Pan_0\"></a>Jimmy Pan</h1>\n<h2><a id=\"TODO_1\"></a>TODO</h2>\n<ul class=\"contains-task-list\">\n<li class=\"task-list-item\"><input class=\"task-list-item-checkbox\" disabled=\"\" type=\"checkbox\"> 完善简历</li>\n</ul>\n', '1', '2017-04-07 10:31:28', '2022-01-29 15:12:14');
INSERT INTO `post` VALUES ('68', '0', '2', '2', ' ', 'tool', '', '<script>\nvar nums=[\'\'];\nfunction get(){\nvar idx=Math.floor(Math.random()*nums.length);\ndocument.getElementById(\'ctn\').innerHTML=nums[idx];\n}\n</script>\n\n<p id=\"ctn\">----</p>\n<button onclick=\"get()\">  ☠️  </button>', '&lt;script&gt;\nvar nums=[\'\'];\nfunction get(){\nvar idx=Math.floor(Math.random()*nums.length);\ndocument.getElementById(\'ctn\').innerHTML=nums[idx];\n}\n&lt;/script&gt;\n<p>----</p>\n&lt;button onclick=\"get()\"&gt;  ☠️  &lt;/button&gt;', '0', '2018-09-10 11:12:43', '2022-01-29 15:08:40');
INSERT INTO `post` VALUES ('77', '0', '2', '2', '测试', 'testt', '', '# 这是测试页面\n- [ ] 待写入', '<h1><a id=\"_0\"></a>这是测试页面</h1>\n<ul class=\"contains-task-list\">\n<li class=\"task-list-item\"><input class=\"task-list-item-checkbox\" disabled=\"\" type=\"checkbox\"> 待写入</li>\n</ul>\n', '0', '2022-01-29 15:10:00', '2022-01-29 15:10:00');

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tag` (`post_id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of post_tag
-- ----------------------------
INSERT INTO `post_tag` VALUES ('55', '8', '1');
INSERT INTO `post_tag` VALUES ('52', '10', '6');
INSERT INTO `post_tag` VALUES ('253', '13', '11');
INSERT INTO `post_tag` VALUES ('50', '14', '6');
INSERT INTO `post_tag` VALUES ('43', '19', '1');
INSERT INTO `post_tag` VALUES ('44', '19', '2');
INSERT INTO `post_tag` VALUES ('45', '19', '4');
INSERT INTO `post_tag` VALUES ('46', '19', '6');
INSERT INTO `post_tag` VALUES ('48', '19', '9');
INSERT INTO `post_tag` VALUES ('54', '22', '2');
INSERT INTO `post_tag` VALUES ('427', '30', '3');
INSERT INTO `post_tag` VALUES ('116', '31', '1');
INSERT INTO `post_tag` VALUES ('443', '33', '1');
INSERT INTO `post_tag` VALUES ('78', '35', '4');
INSERT INTO `post_tag` VALUES ('79', '35', '10');
INSERT INTO `post_tag` VALUES ('441', '36', '11');
INSERT INTO `post_tag` VALUES ('424', '37', '12');
INSERT INTO `post_tag` VALUES ('425', '37', '13');
INSERT INTO `post_tag` VALUES ('147', '38', '14');
INSERT INTO `post_tag` VALUES ('157', '39', '2');
INSERT INTO `post_tag` VALUES ('158', '39', '15');
INSERT INTO `post_tag` VALUES ('155', '40', '16');
INSERT INTO `post_tag` VALUES ('202', '41', '17');
INSERT INTO `post_tag` VALUES ('185', '43', '1');
INSERT INTO `post_tag` VALUES ('186', '43', '3');
INSERT INTO `post_tag` VALUES ('259', '44', '3');
INSERT INTO `post_tag` VALUES ('260', '44', '4');
INSERT INTO `post_tag` VALUES ('434', '47', '1');
INSERT INTO `post_tag` VALUES ('435', '47', '2');
INSERT INTO `post_tag` VALUES ('436', '47', '4');
INSERT INTO `post_tag` VALUES ('426', '48', '1');
INSERT INTO `post_tag` VALUES ('372', '51', '4');
INSERT INTO `post_tag` VALUES ('373', '52', '2');
INSERT INTO `post_tag` VALUES ('374', '52', '4');
INSERT INTO `post_tag` VALUES ('428', '53', '2');
INSERT INTO `post_tag` VALUES ('433', '57', '2');
INSERT INTO `post_tag` VALUES ('439', '59', '2');
INSERT INTO `post_tag` VALUES ('438', '60', '2');
INSERT INTO `post_tag` VALUES ('376', '61', '2');
INSERT INTO `post_tag` VALUES ('401', '66', '19');
INSERT INTO `post_tag` VALUES ('412', '67', '12');
INSERT INTO `post_tag` VALUES ('413', '67', '20');
INSERT INTO `post_tag` VALUES ('456', '71', '3');
INSERT INTO `post_tag` VALUES ('457', '75', '2');
INSERT INTO `post_tag` VALUES ('459', '75', '21');
INSERT INTO `post_tag` VALUES ('461', '76', '2');
INSERT INTO `post_tag` VALUES ('460', '76', '21');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `key` varchar(64) NOT NULL COMMENT '唯一Key',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `inner` tinyint DEFAULT NULL COMMENT '内部禁止删除',
  `intro` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`key`),
  UNIQUE KEY `UQE_sys_dict_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('tmp-mod', '{\"begin\":\"2021-08-08 19:18\",\"end\":\"2021-08-08 19:18\",\"span\":0.3}', '0', '');

-- ----------------------------
-- Table structure for sys_global
-- ----------------------------
DROP TABLE IF EXISTS `sys_global`;
CREATE TABLE `sys_global` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  `page_size` int DEFAULT '6' COMMENT '分页大小',
  `comment` varchar(1024) DEFAULT NULL COMMENT '评论脚本',
  `github_url` varchar(255) DEFAULT NULL COMMENT 'githu地址',
  `weibo_url` varchar(255) DEFAULT NULL COMMENT '微博地址',
  `analytic` varchar(1024) DEFAULT NULL COMMENT '统计脚本',
  `author` varchar(255) DEFAULT NULL COMMENT '网站作者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_global
-- ----------------------------
INSERT INTO `sys_global` VALUES ('1', 'http://jimmypan.cn', '/static/logo.jpg', 'jimmy_pan', 'jimmy,jimmypan,pan', 'jimmy,jimmy pan,jimmy blog,jimmy pan blog', '/favicon.ico', '蜀ICP备16011344号-2', '', '', 'console.log(\"http://jimmypan.cn\")', '', '6', '{\"clientID\": \"2d028c155cbc14d10f53\",\"clientSecret\": \"e503c3d371fb046b2ec9ca99253c10b320be0052\",\"repo\": \"comments\",\"owner\": \"zxysilent\",\"admin\":[\"zxysilent\"],\"distractionFreeMode\":true,\"githubUserName\":\"zxysilent\"}', 'https://github.com/Panseng', 'https://weibo.com/1630098327', '<script async src=\"//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js\"></script> ', 'jimmy_pan');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `num` varchar(255) DEFAULT NULL COMMENT '账号',
  `passwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `ecount` int DEFAULT '0' COMMENT '错误次数',
  `ltime` datetime DEFAULT NULL COMMENT '上次登录时间',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `openid_qq` varchar(64) DEFAULT NULL COMMENT 'qq_openid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_sys_user_num` (`num`),
  UNIQUE KEY `UQE_sys_user_openid_qq` (`openid_qq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'jimmy', 'jimmy', '10adc3949ba59abbe56e057f20f883', '', '', '2', '2022-01-28 21:29:29', '2021-04-06 17:47:16', null);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '标签名',
  `intro` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
