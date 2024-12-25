/*
 Navicat Premium Dump SQL

 Source Server         : library
 Source Server Type    : MySQL
 Source Server Version : 80403 (8.4.3)
 Source Host           : localhost:3306
 Source Schema         : book-manage-sys

 Target Server Type    : MySQL
 Target Server Version : 80403 (8.4.3)
 File Encoding         : 65001

 Date: 22/12/2024 19:19:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '书籍表主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书籍名',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书籍封面',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '出版社',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书籍的作者',
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '国际标准书号',
  `num` int NULL DEFAULT NULL COMMENT '馆藏数量',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书籍简介',
  `bookshelf_id` int NULL DEFAULT NULL COMMENT '书架ID',
  `category_id` int NULL DEFAULT NULL COMMENT '书籍类别ID',
  `is_plan_buy` tinyint(1) NULL DEFAULT NULL COMMENT '是否计划购买',
  `plan_buy_time` date NULL DEFAULT NULL COMMENT '计划购买时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '红岩', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=6365596-fm.jpg', '中国青年出版社', '罗广斌/杨益言', '9787515373850', 3, '雄踞我国红色经典作品高峰数十载，激励了一代又一代青年的爱国情怀和奋斗热情', 3, 6, 1, '2024-12-17', '2024-12-17 11:44:36');
INSERT INTO `book` VALUES (2, '雪国', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=5910400-fm.jpg', '南海出版公司', '川端康成', '9787573503510', 4, '《雪国》是为纪念诺贝尔文学奖得主川端康成逝世50周年，全新推出的川端康成小说精选集。', 3, 6, 1, '2024-12-18', '2024-12-18 22:29:33');
INSERT INTO `book` VALUES (3, '谈美', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=6187317-fm.jpg', '海南出版社', '朱光潜', '9787573014108', 6, '朱光潜先生以一种对老朋友的语气，阐释了他对艺术与人生关系的深刻理解，将复杂的学术问题写得生动易懂，帮助读者构建出完整的美学图景。', 3, 6, 1, '2024-12-19', '2024-12-19 22:40:19');
INSERT INTO `book` VALUES (4, '商战', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=6102533-fm.jpg', '机械工业出版社', '(美)艾·里斯//杰克·特劳特', '9787111578239', 4, '重点阐述了商战中的四种常用战略形式，如防御战、进攻战、侧翼战和游击战', 4, 5, 1, '2024-12-20', '2024-12-20 22:43:32');
INSERT INTO `book` VALUES (5, '中华人民共和国民事诉讼法', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=6104846-fm.jpg', '法律出版社', '张红蕊', '9787519781088', 5, '本书收录新修正的《中华人民共和国民事诉讼法》的全部内容', 5, 3, 0, NULL, '2024-12-22 22:45:46');
INSERT INTO `book` VALUES (6, '大话中国艺术史', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=5459317-fm.jpg', '海南出版社', '意公子', '9787544394796', 2, '本书从原始社会的陶器说起，内容涵盖了陶器、玉器、青铜器、草书、行书、山水画、工笔画等多种中国特有的艺术形式', 1, 7, 0, NULL, '2024-12-22 14:57:56');
INSERT INTO `book` VALUES (7, '自然笔记', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=5109120-fm.jpg', '湖南科学技术出版社', '芮东莉', '9787571005955', 10, '这是一扇神奇的转门，它让我们像狸，像獾，一头扎进灌木丛深处，用身体和心灵的全部去亲近叶片、花朵和虫虫们的世界', 7, 9, 0, NULL, '2024-12-22 14:58:58');
INSERT INTO `book` VALUES (8, '这里是中国', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=6389145-fm.jpg', '中信出版社', '星球研究所', '9787521751086', 6, '《这里是中国3》从中华文明的角度，讲述正在或曾经生活在中华大地上的200亿中国人，如何用智慧缔造出独属于自己的非凡家园', 6, 8, 0, NULL, '2024-12-22 15:43:16');
INSERT INTO `book` VALUES (9, '了不起的盖茨比', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=6246307-fm.jpg', '译林出版社', '(美国)弗朗西斯·斯科特·菲茨杰拉德', '9787544799409', 7, '《了不起的盖茨比》是饱具“美国梦”精神内涵的作品，亦是一部富有韵味和美感的“动人的美国悲剧”，一直被世人推崇为“经典中的经典”', 3, 6, 0, NULL, '2024-12-22 12:42:16');
INSERT INTO `book` VALUES (10, '朝花夕拾野草', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=5244485-fm.jpg', '江苏文艺出版社', '鲁迅', '9787559453211', 12, '《野草》各篇主要描写了北洋军阀政府统治下的社会状态，以及对革命力量的热烈呼唤，对劳动人民的深切同情，对国民劣根性不留情面的批评，和对自我严格的解剖。', 3, 6, 1, '2024-12-22', '2024-12-22 12:42:22');

-- ----------------------------
-- Table structure for book_order_history
-- ----------------------------
DROP TABLE IF EXISTS `book_order_history`;
CREATE TABLE `book_order_history`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图书预约历史ID',
  `book_id` int NULL DEFAULT NULL COMMENT '图书ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `deadline_num` int NULL DEFAULT NULL COMMENT '借书的数量',
  `is_return` tinyint(1) NULL DEFAULT NULL COMMENT '是否已经归还',
  `return_time` date NULL DEFAULT NULL COMMENT '归还时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '借书时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book_order_history
-- ----------------------------
INSERT INTO `book_order_history` VALUES (27, 14, 2, 1, 1, '2024-12-17', '2024-12-08 15:54:45');
INSERT INTO `book_order_history` VALUES (28, 14, 2, 1, 1, '2024-12-16', '2024-12-08 16:43:54');
INSERT INTO `book_order_history` VALUES (29, 3, 16, 1, 1, '2024-12-21', '2024-12-22 12:53:14');

-- ----------------------------
-- Table structure for book_rss_history
-- ----------------------------
DROP TABLE IF EXISTS `book_rss_history`;
CREATE TABLE `book_rss_history`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图书订阅ID',
  `book_id` int NULL DEFAULT NULL COMMENT '图书ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订阅时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book_rss_history
-- ----------------------------
INSERT INTO `book_rss_history` VALUES (11, 4, 24, '2024-12-22 15:02:04');
INSERT INTO `book_rss_history` VALUES (12, 3, 24, '2024-12-22 15:02:21');

-- ----------------------------
-- Table structure for book_save
-- ----------------------------
DROP TABLE IF EXISTS `book_save`;
CREATE TABLE `book_save`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图书收藏主键ID',
  `book_id` int NULL DEFAULT NULL COMMENT '图书ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book_save
-- ----------------------------
INSERT INTO `book_save` VALUES (16, 15, 2);
INSERT INTO `book_save` VALUES (17, 14, 2);
INSERT INTO `book_save` VALUES (18, 3, 16);

-- ----------------------------
-- Table structure for bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `bookshelf`;
CREATE TABLE `bookshelf`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '书架表主键ID',
  `floor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书架所在的楼层',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书架所属的区域',
  `frame` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '书架名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookshelf
-- ----------------------------
INSERT INTO `bookshelf` VALUES (1, '1楼', '南区', 'A1');
INSERT INTO `bookshelf` VALUES (3, '2楼', '北区', 'A2');
INSERT INTO `bookshelf` VALUES (4, '3楼', '东区', 'B1');
INSERT INTO `bookshelf` VALUES (5, '4楼', '西区', 'C1');
INSERT INTO `bookshelf` VALUES (6, '4楼', '东区', 'C1');
INSERT INTO `bookshelf` VALUES (7, '4楼', '南区', 'C2');

-- ----------------------------
-- Table structure for bookshelf_category
-- ----------------------------
DROP TABLE IF EXISTS `bookshelf_category`;
CREATE TABLE `bookshelf_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '书架种类关联表主键',
  `bookshelf_id` int NULL DEFAULT NULL COMMENT '书架ID',
  `category_id` int NULL DEFAULT NULL COMMENT '书籍类别ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookshelf_category
-- ----------------------------
INSERT INTO `bookshelf_category` VALUES (1, 1, 7);
INSERT INTO `bookshelf_category` VALUES (2, 3, 6);
INSERT INTO `bookshelf_category` VALUES (3, 4, 5);
INSERT INTO `bookshelf_category` VALUES (4, 5, 3);
INSERT INTO `bookshelf_category` VALUES (5, 6, 8);
INSERT INTO `bookshelf_category` VALUES (6, 7, 9);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '书籍类别主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '类别名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '哲学');
INSERT INTO `category` VALUES (2, '社会学');
INSERT INTO `category` VALUES (3, '政治，法律');
INSERT INTO `category` VALUES (5, '经济');
INSERT INTO `category` VALUES (6, '文学');
INSERT INTO `category` VALUES (7, '艺术');
INSERT INTO `category` VALUES (8, '历史，地理');
INSERT INTO `category` VALUES (9, '自然科学');
INSERT INTO `category` VALUES (10, '马克思主义');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '图书馆设施升级通知', '<p><span style=\"color: rgb(0, 0, 0); background-color: rgb(253, 253, 254); font-size: 15px;\">尊敬的读者，为了提升您的阅读体验，我们的图书馆正在进行设施升级。</span></p>\n<p><span style=\"color: rgb(0, 0, 0); background-color: rgb(253, 253, 254); font-size: 15px;\">升级内容包括增设自助借还书机、更新阅读区座椅、增加无线网络覆盖等。</span></p>\n<p><span style=\"color: rgb(0, 0, 0); background-color: rgb(253, 253, 254); font-size: 15px;\">在升级期间，可能会有部分区域暂时关闭，我们对给您带来的不便深表歉意，并感谢您的理解与支持。</span></p>', '2024-12-22 12:23:30');
INSERT INTO `notice` VALUES (5, '【重要通知】图书馆开放时间调整', '<p><span style=\"color: rgb(0, 0, 0); background-color: rgb(253, 253, 254); font-size: 15px;\">尊敬的读者，为了更好地服务大家，自2024年1月1日起，图书馆的开放时间将调整为每周一至周六，上午9:00至晚上8:00，周日闭馆。请大家合理安排时间，感谢您的理解与支持。</span></p>', '2024-12-22 12:24:16');
INSERT INTO `notice` VALUES (6, '图书馆开放时间调整通知', '<p><span style=\"color: rgb(0, 0, 0); background-color: rgb(253, 253, 254); font-size: 15px;\">亲爱的读者们，我们很高兴地宣布，图书馆新上架了一批涵盖科技、文学、历史等多个领域的新书。包括《人工智能的未来》、《百年孤独》、《世界历史概览》等热门书籍。快来图书馆，享受阅读的乐趣吧！</span></p>', '2024-12-22 12:24:31');
INSERT INTO `notice` VALUES (14, '图书馆2024年第四季度的重要更新和活动公布', '<h4 style=\"text-align: start;\">尊敬的读者们：</h4>\n<p style=\"text-align: start;\">为了让大家更好地利用图书馆资源，现将图书馆在2024年第四季度的重要更新和活动公布如下，请各位读者知悉。</p>\n<h3 style=\"text-align: start;\">一、新服务与资源扩展</h3>\n<ol>\n    <li style=\"text-align: start;\">电子资源升级：本季度，我们新增了数千种电子书籍和学术期刊，覆盖科学、艺术、文学等多个领域。读者们现在可以通过图书馆网站或移动应用访问这些资源。</li>\n    <li style=\"text-align: start;\">阅读空间改造：为了提供更舒适的阅读环境，我们对图书馆的阅读区进行了全面改造，新增了舒适的座椅和更多的自然光线。</li>\n    <li style=\"text-align: start;\">社区合作项目：图书馆与当地学校和社区组织合作，推出了一系列阅读推广活动，包括儿童故事会、作家讲座和读书俱乐部。</li>\n</ol>\n<h3 style=\"text-align: start;\">二、图书馆管理与服务</h3>\n<ol>\n    <li style=\"text-align: start;\">借阅制度优化：我们更新了借阅制度，现在每位读者可以借阅的书籍数量增加到10本，借阅期限延长至30天。</li>\n    <li style=\"text-align: start;\">在线预约系统：为了方便读者预约书籍，我们推出了在线预约系统。读者可以在家中通过图书馆网站预约所需书籍，并在到达图书馆时直接领取。</li>\n    <li style=\"text-align: start;\">志愿者招募：图书馆正在招募志愿者，参与图书整理、活动组织等工作。我们期待热爱阅读、乐于助人的你加入我们的团队。</li>\n</ol>\n<h3 style=\"text-align: start;\">三、文化活动与社区参与</h3>\n<ol>\n    <li style=\"text-align: start;\">文化讲座系列：本季度，我们将举办多场文化讲座，邀请专家学者分享知识，涵盖历史、科技、艺术等多个主题。</li>\n    <li style=\"text-align: start;\">社区阅读挑战：鼓励社区成员参与我们的阅读挑战，通过阅读指定书籍来提高阅读兴趣和文化素养。</li>\n</ol>\n<h3 style=\"text-align: start;\">四、未来展望</h3>\n<p style=\"text-align: start;\">随着上述服务的不断优化和新活动的推出，我们相信图书馆将成为社区知识和文化交流的中心。感谢所有支持图书馆的读者们！让我们共同期待图书馆的美好未来！</p>', '2024-12-22 12:26:23');

-- ----------------------------
-- Table structure for reader_proposal
-- ----------------------------
DROP TABLE IF EXISTS `reader_proposal`;
CREATE TABLE `reader_proposal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '读者反馈ID',
  `user_id` int NULL DEFAULT NULL COMMENT '反馈者用户ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '反馈的问题内容',
  `is_publish` tinyint(1) NULL DEFAULT NULL COMMENT '是否公开',
  `reply_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `is_reply` tinyint(1) NULL DEFAULT NULL COMMENT '是否已经回复',
  `create_time` datetime NULL DEFAULT NULL COMMENT '用户反馈时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reader_proposal
-- ----------------------------
INSERT INTO `reader_proposal` VALUES (2, 1, '图书馆的电子资源对我的研究非常有帮助，但有时网站加载速度慢，影响检索效率。希望IT部门能优化一下', 1, '感谢您的反馈，我们已注意到电子资源网站加载速度的问题。IT部门正在努力优化系统，以提高检索效率。请您耐心等待，感谢您的理解与支持。', '2024-09-07 14:31:13', 1, '2024-09-07 14:30:52');
INSERT INTO `reader_proposal` VALUES (3, 8, '图书馆的自习室环境很好，但是座位预约系统有时候会出现故障。有一次我预约了座位，但到图书馆后发现被其他人占用了', 1, '对于座位预约系统的问题，我们深表歉意。我们正在调查原因并加强管理，以确保预约系统的准确性。同时，我们也在考虑增加现场管理人员，以更好地协调座位使用。', NULL, 0, '2024-09-07 16:26:19');
INSERT INTO `reader_proposal` VALUES (4, 3, '图书馆的噪音问题越来越严重了，有时候根本没办法专心学习。希望图书馆能加强管理，保持一个安静的学习环境', 1, '我们对图书馆噪音问题给您带来的不便深表歉意。图书馆将加强管理，确保学习环境的安静。我们也鼓励学生自觉维护图书馆的安静', '2024-09-12 16:57:41', 1, '2024-09-07 16:26:59');
INSERT INTO `reader_proposal` VALUES (5, 15, '图书馆的开放时间虽然长，但是晚上关门太早了，有时候作业多的时候根本来不及。希望能延长晚上的开放时间。', 1, '开放的。周天全天', '2024-09-07 16:32:43', 1, '2024-09-07 16:32:19');
INSERT INTO `reader_proposal` VALUES (6, 22, '我对图书馆的历史书籍非常满意，但有时候发现一些书籍的信息在目录系统中更新不够及时', 1, '我们对给您带来的不便表示歉意。图书馆正在努力改进目录系统的实时更新。同时，我们也会加强图书管理员的培训，确保书籍信息的准确性', '2024-09-11 18:01:02', 1, '2024-09-11 15:19:10');
INSERT INTO `reader_proposal` VALUES (7, 14, '我喜欢阅读小说，但图书馆的小说区更新不够频繁，很多新出版的小说都找不到。', 1, '感谢您的反馈。我们已经注意到小说区更新的问题，并正在与供应商沟通以加快新书的采购和上架速度', NULL, 0, '2024-09-12 17:00:54');
INSERT INTO `reader_proposal` VALUES (8, 22, '图书馆的文学藏书真是宝藏，尤其是经典文学作品的收藏，让我能够深入研究和欣赏。感谢图书馆的精心挑选和维护！', 1, '感谢您对图书馆文学藏书的赞赏。我们会继续丰富文学类藏书，为文学爱好者提供更多优质的阅读选择。', '2024-12-05 19:55:21', 1, '2024-10-19 06:46:44');
INSERT INTO `reader_proposal` VALUES (9, 16, '图书馆的跨学科资源非常丰富，为我的研究提供了多角度的视野。这种多元化的藏书策略值得称赞！', 1, NULL, NULL, 0, '2024-10-19 06:46:51');

-- ----------------------------
-- Table structure for rss_notification
-- ----------------------------
DROP TABLE IF EXISTS `rss_notification`;
CREATE TABLE `rss_notification`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '预约通知ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '通知的内容',
  `is_read` tinyint(1) NULL DEFAULT NULL COMMENT '用户是否已经阅读',
  `create_time` datetime NULL DEFAULT NULL COMMENT '通知的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rss_notification
-- ----------------------------
INSERT INTO `rss_notification` VALUES (15, 24, '您好，您订阅的由鲁迅创作的书籍【狂人日记】已经上线，可以借阅了', 1, '2024-12-08 15:31:02');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `user_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `user_role` int NULL DEFAULT NULL COMMENT '用户角色',
  `is_login` tinyint(1) NULL DEFAULT NULL COMMENT '可登录状态(0：可用，1：不可用)',
  `is_word` tinyint(1) NULL DEFAULT NULL COMMENT '禁言状态(0：可用，1：不可用)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '用户注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1018 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '第五组', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=u1281621366.png', '123456@qq.com', 1, 0, 0, '2024-12-04 12:53:05');
INSERT INTO `user` VALUES (2, 'Zhang Xiaochen', '张晓晨', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=ba728e7pic_6.jpg', '12311323@qq.com', 2, 1, 0, '2024-08-16 16:12:12');
INSERT INTO `user` VALUES (3, 'Liu Siyuan', '刘思远', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=5ee4cb8熊猫.png', '12434@qq.com', 1, 1, 1, '2024-10-19 06:39:12');
INSERT INTO `user` VALUES (4, 'Chen Xinyi', '陈心怡', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=109bac7pic_7.jpg', '12345@qq.com', 2, 1, 0, '2024-12-05 15:44:45');
INSERT INTO `user` VALUES (5, 'Yang Zihan', '杨子涵', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=b76542cpic_8.jpg', '1234@qq.com', 2, 1, 1, '2024-12-05 15:45:12');
INSERT INTO `user` VALUES (6, 'Qian Lina', '钱丽娜', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=c7568c2pic_5.jpg', '4532432@qq.com', 2, 1, 0, '2024-12-05 15:46:46');
INSERT INTO `user` VALUES (7, 'Sun Haoran', '孙浩然', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=cdf71ffSnipaste_2024-11-29_18-22-44.png', '123432@qq.com', 2, 1, 0, '2024-12-05 15:47:08');
INSERT INTO `user` VALUES (8, 'hututu', '胡图图', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=e694502Snipaste_2024-11-22_00-47-41.png', '4343@qq.com', 2, 1, 0, '2024-12-05 15:47:26');
INSERT INTO `user` VALUES (9, 'Zhou Zimo', '周子墨', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=3e28f7cSnipaste_2024-11-22_00-47-32.png', '43423@qq.com', 2, 1, 0, '2024-12-05 15:51:13');
INSERT INTO `user` VALUES (10, 'Wu Yutong', '吴雨桐', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=e9a35efpic_7.jpg', '124343@qq.com', 2, 1, 0, '2024-12-05 15:54:50');
INSERT INTO `user` VALUES (11, 'Xu Mengqi', '徐梦琪', '14e1b600b1fd579f47433b88e8d85291', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=be0e757Snipaste_2024-11-22_00-46-13.png', '654456@qq.com', 2, 1, 1, '2024-12-05 15:55:12');
INSERT INTO `user` VALUES (12, 'Liao Jiehong', '廖杰宏', 'g6nkk1phlc', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=u3195216561.png', 'jliao@gmail.com', 2, 1, 0, '2024-12-22 21:07:40');
INSERT INTO `user` VALUES (13, 'Du Jialun', '杜嘉伦', 'kOAzlpXAbl', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=u2283464982.png', 'du1991@icloud.com', 2, 1, 0, '2024-12-22 22:35:11');
INSERT INTO `user` VALUES (14, 'Pan Yuning', '潘宇宁', 'W3N7qePQZH', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=u1704366238.png', 'yuningpan1@icloud.com', 2, 1, 0, '2024-12-22 03:14:53');
INSERT INTO `user` VALUES (15, 'Wang Ziyi', '汪子异', 'Jk6JpmQYPv', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=u306839329.png', 'ziyiwang@yahoo.com', 2, 1, 0, '2024-12-22 05:15:50');
INSERT INTO `user` VALUES (16, 'Cao Zhiyuan', '曹致远', 'QvhvBSXJRS', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=u4075199248.png', 'zhiyucao@gmail.com', 2, 1, 0, '2024-12-22 16:37:20');
INSERT INTO `user` VALUES (17, 'Wei Anqi', '韦安琪', 'hKGU3QKFi1', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=1.jpg', 'weianqi10@gmail.com', 2, 1, 0, '2024-12-22 21:43:14');
INSERT INTO `user` VALUES (18, 'Peng Yuning', '彭宇宁', 'GBfzFT0orb', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=2.jpg', 'pengyuning2019@gmail.com', 2, 1, 0, '2024-12-22 00:17:25');
INSERT INTO `user` VALUES (19, 'Jiang Shihan', '江诗涵', 'hn7el6cKbD', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=3.jpg', 'shihajiang@gmail.com', 2, 1, 0, '2024-12-22 16:28:34');
INSERT INTO `user` VALUES (20, 'Qiu Lu', '邱璐', 'PWiXRIyqds', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=4.jpg', 'qilu1952@outlook.com', 2, 1, 0, '2024-12-22 09:56:18');
INSERT INTO `user` VALUES (21, 'Deng Jialun', '邓嘉伦', 'siSOpJZzig', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=77094b36aca.png', 'jiaden@gmail.com', 2, 1, 0, '2024-12-22 14:50:11');
INSERT INTO `user` VALUES (22, 'Sun Lan', '孙岚', '0LXrxchHAL', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=d043ad4bd.png', 'lasun13@icloud.com', 2, 1, 0, '2024-12-22 22:17:02');
INSERT INTO `user` VALUES (23, 'zhang', '张', '123', '/api/book-manage-sys-api/v1.0/file/getFile?fileName=4ec2d5628.png', 'ld75@mail.com', 2, 1, 0, '2024-12-22 14:16:16');
INSERT INTO `user` VALUES (24, 'zhang1', '张', 'd9b1d7db4cd6e70935368a1efb10e377', NULL, NULL, 2, 0, 0, '2024-12-22 13:35:43');

-- ----------------------------
-- Table structure for user_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_log`;
CREATE TABLE `user_operation_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户行为日志表主键ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '行为描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_operation_log
-- ----------------------------
INSERT INTO `user_operation_log` VALUES (1, 2, '借书操作', '2024-09-04 15:06:49');
INSERT INTO `user_operation_log` VALUES (4, 2, '向系统提交建议', '2024-09-11 15:19:10');
INSERT INTO `user_operation_log` VALUES (10, 2, '向系统提交建议', '2024-12-05 21:38:15');
INSERT INTO `user_operation_log` VALUES (12, 2, '借阅书籍', '2024-12-07 15:03:13');
INSERT INTO `user_operation_log` VALUES (13, 2, '借阅书籍', '2024-12-07 15:05:21');
INSERT INTO `user_operation_log` VALUES (14, 2, '借阅书籍', '2024-12-07 15:05:24');
INSERT INTO `user_operation_log` VALUES (15, 2, '借阅书籍', '2024-12-07 15:05:26');
INSERT INTO `user_operation_log` VALUES (16, 2, '借阅书籍', '2024-12-07 15:06:02');
INSERT INTO `user_operation_log` VALUES (17, 2, '借阅书籍', '2024-12-07 15:07:48');
INSERT INTO `user_operation_log` VALUES (18, 2, '借阅书籍', '2024-12-07 15:08:01');
INSERT INTO `user_operation_log` VALUES (19, 2, '借阅书籍', '2024-12-07 15:08:30');
INSERT INTO `user_operation_log` VALUES (20, 2, '借阅书籍', '2024-12-07 15:09:02');
INSERT INTO `user_operation_log` VALUES (21, 2, '借阅书籍', '2024-12-07 15:10:18');
INSERT INTO `user_operation_log` VALUES (22, 2, '借阅书籍', '2024-12-07 15:11:07');
INSERT INTO `user_operation_log` VALUES (23, 2, '借阅书籍', '2024-12-07 15:11:18');
INSERT INTO `user_operation_log` VALUES (25, 2, '归还书籍', '2024-12-07 15:46:14');
INSERT INTO `user_operation_log` VALUES (26, 2, '归还书籍', '2024-12-07 15:46:39');
INSERT INTO `user_operation_log` VALUES (27, 2, '借阅书籍', '2024-12-07 15:53:02');
INSERT INTO `user_operation_log` VALUES (28, 2, '借阅书籍', '2024-12-07 15:59:16');
INSERT INTO `user_operation_log` VALUES (29, 2, '借阅书籍', '2024-12-07 15:59:24');
INSERT INTO `user_operation_log` VALUES (30, 2, '归还书籍', '2024-12-07 15:59:29');
INSERT INTO `user_operation_log` VALUES (31, 2, '借阅书籍', '2024-12-07 16:03:10');
INSERT INTO `user_operation_log` VALUES (32, 2, '归还书籍', '2024-12-07 16:03:15');
INSERT INTO `user_operation_log` VALUES (33, 2, '借阅书籍', '2024-12-07 16:03:47');
INSERT INTO `user_operation_log` VALUES (34, 2, '借阅书籍', '2024-12-07 16:04:41');
INSERT INTO `user_operation_log` VALUES (35, 2, '借阅书籍', '2024-12-07 16:04:41');
INSERT INTO `user_operation_log` VALUES (36, 2, '借阅书籍', '2024-12-07 16:05:09');
INSERT INTO `user_operation_log` VALUES (37, 2, '借阅书籍', '2024-12-07 16:05:17');
INSERT INTO `user_operation_log` VALUES (38, 2, '归还书籍', '2024-12-07 16:05:21');
INSERT INTO `user_operation_log` VALUES (39, 2, '借阅书籍', '2024-12-07 16:09:24');
INSERT INTO `user_operation_log` VALUES (40, 2, '归还书籍', '2024-12-07 16:09:29');
INSERT INTO `user_operation_log` VALUES (41, 2, '借阅书籍', '2024-12-07 16:13:35');
INSERT INTO `user_operation_log` VALUES (42, 2, '归还书籍', '2024-12-07 16:13:40');
INSERT INTO `user_operation_log` VALUES (43, 2, '借阅书籍', '2024-12-07 16:13:48');
INSERT INTO `user_operation_log` VALUES (44, 2, '归还书籍', '2024-12-07 16:13:51');
INSERT INTO `user_operation_log` VALUES (45, 2, '借阅书籍', '2024-12-07 16:14:20');
INSERT INTO `user_operation_log` VALUES (46, 2, '归还书籍', '2024-12-07 16:14:24');
INSERT INTO `user_operation_log` VALUES (47, 2, '借阅书籍', '2024-12-07 16:14:30');
INSERT INTO `user_operation_log` VALUES (48, 2, '归还书籍', '2024-12-07 16:14:32');
INSERT INTO `user_operation_log` VALUES (49, 2, '借阅书籍', '2024-12-07 16:17:15');
INSERT INTO `user_operation_log` VALUES (50, 2, '借阅书籍', '2024-12-07 16:17:36');
INSERT INTO `user_operation_log` VALUES (51, 2, '借阅书籍', '2024-12-08 15:54:45');
INSERT INTO `user_operation_log` VALUES (52, 2, '归还书籍', '2024-12-08 15:54:49');
INSERT INTO `user_operation_log` VALUES (53, 2, '借阅书籍', '2024-12-08 16:43:54');
INSERT INTO `user_operation_log` VALUES (54, 2, '归还书籍', '2024-12-08 16:44:03');
INSERT INTO `user_operation_log` VALUES (55, 16, '借阅书籍', '2024-12-22 12:53:14');
INSERT INTO `user_operation_log` VALUES (56, 16, '归还书籍', '2024-12-22 12:54:47');

SET FOREIGN_KEY_CHECKS = 1;
