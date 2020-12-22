/*
 Navicat Premium Data Transfer

 Source Server         : Cookit
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : 34.73.129.101:3306
 Source Schema         : ci_001

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 10/05/2019 11:00:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_activity_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_activity_log`;
CREATE TABLE `admin_activity_log`  (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `time_log` datetime(0) NULL DEFAULT NULL,
  `data_log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `func_log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '[] array of role : 0 : root ; 1 : user view, 2: user change data, 3 : user delete, 4 ....',
  `created` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (1, 'root', 'root123$', 'CookitRoot', '[999]', '2019-04-18 08:30:49', 'Imsoft', '0977585914'), (2, 'cookit', 'cookit1234', 'Cookit', '[1]', '2019-05-03 10:11:48', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_data_sync_category
-- ----------------------------
DROP TABLE IF EXISTS `config_data_sync_category`;
CREATE TABLE `config_data_sync_category`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of config_data_sync_category
-- ----------------------------
BEGIN;
INSERT INTO `config_data_sync_category` VALUES (0, 'Basic data', 'Basic data cdcxc'), (1, 'Burger Restaurant', ''), (2, 'Cakeshop Restaurant', ''), (3, 'Mexican Restaurant', ''), (4, 'Donut Restaurant', ''), (5, 'Deli Restaurant', ''), (6, 'Sushi Restaurant', ''), (7, 'Pizza Restaurant', ''), (8, 'Seafood Restaurant', ''), (9, 'Icream Restaurant', ''), (10, 'Indian Restaurant', ''), (11, 'Dữ liệu tutorial', NULL), (12, 'Dữ liệu achivement', NULL), (13, 'Dữ liệu cơ bản ', 'Ví dụ rate, '), (14, 'Dữ liệu merge', 'Những dữ liệu quan trọng, như user_type, money....'), (15, 'Du lieu Daily goal', NULL), (16, 'Du lieu happiness', NULL), (9998, 'Merge subscription', NULL), (9999, 'Not category', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_data_sync_type
-- ----------------------------
DROP TABLE IF EXISTS `config_data_sync_type`;
CREATE TABLE `config_data_sync_type`  (
  `id` int(11) NOT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value_type` int(255) NULL DEFAULT 0 COMMENT '0: int, 1: float, 2 string',
  `cate_type` int(255) NULL DEFAULT 0 COMMENT '0: basic data',
  `is_not_sync` int(255) NULL DEFAULT NULL COMMENT '0 : đồng bộ bình thường, 1 : không đồng bộ',
  `level` int(255) NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Records of config_data_sync_type
-- ----------------------------
BEGIN;
INSERT INTO `config_data_sync_type` VALUES (0, 'is_merged_cloud_data', 'ci_0', 0, 0, 0, NULL, 'check user đã push dữ liệu cloudsync lên  server hay chưa'), (1, 'PlayerCoins', 'ci_1', 0, 0, 0, NULL, 'coin của player'), (2, 'PlayerGems1', 'ci_2', 0, 0, 0, NULL, 'gem của player'), (3, 'PlayerCard', 'ci_3', 0, 0, 0, NULL, 'card của player'), (4, 'PlayerStar', 'ci_4', 0, 0, 0, NULL, 'sao hiện tại'), (5, 'PlayerHeart', 'ci_5', 0, 0, 0, NULL, 'số heart'), (6, 'Levels', 'ci_6', 0, 0, 0, NULL, 'level hiện tại'), (7, 'LevelUnlock', 'ci_7', 0, 0, 0, NULL, 'level unlock hiện tại'), (8, 'numberNotFire', 'ci_8', 0, 0, 0, NULL, 'boost chống cháy'), (9, 'numberDoubleCoin', 'ci_9', 0, 0, 0, NULL, 'boost double coin'), (10, 'numberFastCook', 'ci_10', 0, 0, 0, NULL, 'boost nấu nhanh (Fast Cook)'), (11, 'BoostTimeCharacter', 'ci_11', 0, 0, 0, NULL, 'boost đóng băng khách hàng (Ice)'), (12, 'BoostFastFood', 'ci_12', 0, 0, 0, NULL, 'boost phục vụ nhanh nhiều khác hàng ( Groceries)'), (13, 'NumberCupcake', 'ci_13', 0, 0, 0, NULL, 'boost phục vụ nhanh một khách hàng ( Lollipop)'), (14, 'DayBuyVip1', 'ci_14', 2, 9998, 0, NULL, 'thời gian mua gói vip 1'), (15, 'DayBuyVip2', 'ci_15', 2, 9998, 0, NULL, 'thời gian mua gói vip 2'), (16, 'com.fme.cookit.vip1new', 'ci_16', 0, 9998, 0, NULL, 'số lần reward nhận được gói vip 1'), (17, 'com.fme.cookit.vip2', 'ci_17', 0, 9998, 0, NULL, 'số lần reward nhận được gói vip 2'), (18, 'is_buy_starter_pack', 'ci_18', 0, 13, 0, NULL, 'đã mua starter pack'), (19, 'isAlreadyRateGame', 'ci_19', 0, 13, 0, NULL, 'Đã rate game'), (20, 'isReward5GemFB', 'ci_20', 0, 13, 0, NULL, 'Reward like facebook'), (21, 'LikeFB', 'ci_21', 0, 13, 0, NULL, 'Like Facebook'), (22, 'Pinterest', 'ci_22', 0, 13, 0, NULL, 'Follow Pinterest'), (23, 'Pan1', 'ci_23', 0, 1, 0, NULL, NULL), (24, 'Disk1', 'ci_24', 0, 1, 0, NULL, NULL), (25, 'BurgerUp', 'ci_25', 0, 1, 0, NULL, NULL), (26, 'MeatUp', 'ci_26', 0, 1, 0, NULL, NULL), (27, 'BaconUp', 'ci_27', 0, 1, 0, NULL, NULL), (28, 'CokeUp', 'ci_28', 0, 1, 0, NULL, NULL), (29, 'SodaUp', 'ci_29', 0, 1, 0, NULL, NULL), (30, 'CheeseUp', 'ci_30', 0, 1, 0, NULL, NULL), (31, 'LettuceUp', 'ci_31', 0, 1, 0, NULL, NULL), (32, 'TomatoUp', 'ci_32', 0, 1, 0, NULL, NULL), (33, 'CakeShopPanVanillaUp', 'ci_33', 0, 2, 0, NULL, NULL), (34, 'CakeShopDishCakeUp', 'ci_34', 0, 2, 0, NULL, NULL), (35, 'CakeShopDishCanolliUp', 'ci_35', 0, 2, 0, NULL, NULL), (36, 'CakeShopStrawBerryUp', 'ci_36', 0, 2, 0, NULL, NULL), (37, 'CakeShopChocolateFlakeUp', 'ci_37', 0, 2, 0, NULL, NULL), (38, 'CakeShopBlueBurryUp', 'ci_38', 0, 2, 0, NULL, NULL), (39, 'CakeShopPinkUp', 'ci_39', 0, 2, 0, NULL, NULL), (40, 'CakeShopChocolateIcingUp', 'ci_40', 0, 2, 0, NULL, NULL), (41, 'CakeShopWhiteUp', 'ci_41', 0, 2, 0, NULL, NULL), (42, 'CakeShopCreamUp', 'ci_42', 0, 2, 0, NULL, NULL), (43, 'CakeShopCreamMachineUp', 'ci_43', 0, 2, 0, NULL, NULL), (44, 'CakeShopCanolliUp', 'ci_44', 0, 2, 0, NULL, NULL), (45, 'CakeShopVanillaUp', 'ci_45', 0, 2, 0, NULL, NULL), (46, 'RiceUp', 'ci_46', 0, 3, 0, NULL, NULL), (47, 'SeaweedUp', 'ci_47', 0, 3, 0, NULL, NULL), (48, 'AvocadoUp', 'ci_48', 0, 3, 0, NULL, NULL), (49, 'TunaUp', 'ci_49', 0, 3, 0, NULL, NULL), (50, 'SalmonUp', 'ci_50', 0, 3, 0, NULL, NULL), (51, 'WasabiUp', 'ci_51', 0, 3, 0, NULL, NULL), (52, 'OnionUp', 'ci_52', 0, 3, 0, NULL, NULL), (53, 'TeaUp', 'ci_53', 0, 3, 0, NULL, NULL), (54, 'TeaMachineUp', 'ci_54', 0, 3, 0, NULL, NULL), (55, 'PanSushiUp', 'ci_55', 0, 6, 0, NULL, NULL), (56, 'DishSushiUp', 'ci_56', 0, 6, 0, NULL, NULL), (57, 'PanSoupUp', 'ci_57', 0, 6, 0, NULL, NULL), (58, 'SoupUp', 'ci_58', 0, 6, 0, NULL, NULL), (59, 'MexicanBurritoUp', 'ci_59', 0, 3, 0, NULL, NULL), (60, 'MexicanTacoUp', 'ci_60', 0, 3, 0, NULL, NULL), (61, 'MexicanSaladUp', 'ci_61', 0, 3, 0, NULL, NULL), (62, 'MexicanCheeseUp', 'ci_62', 0, 3, 0, NULL, NULL), (63, 'MexicanTomatoUp', 'ci_63', 0, 3, 0, NULL, NULL), (64, 'MexicanMeatTacoUp', 'ci_64', 0, 3, 0, NULL, NULL), (65, 'MexicanMeatBurritoUp', 'ci_65', 0, 3, 0, NULL, NULL), (66, 'MexicanRiceUp', 'ci_66', 0, 3, 0, NULL, NULL), (67, 'MexicanSodaUp', 'ci_67', 0, 3, 0, NULL, NULL), (68, 'MexicanGuacamolUp', 'ci_68', 0, 3, 0, NULL, NULL), (69, 'MexicanSodaMachineUp', 'ci_69', 0, 3, 0, NULL, NULL), (70, 'MexicanGuacamolMachineUp', 'ci_70', 0, 3, 0, NULL, NULL), (71, 'MexicanPanBurrito', 'ci_71', 0, 3, 0, NULL, NULL), (72, 'MexicanPanTaco', 'ci_72', 0, 3, 0, NULL, NULL), (73, 'MexicanDishTaco', 'ci_73', 0, 3, 0, NULL, NULL), (74, 'MexicanDishBurrito', 'ci_74', 0, 3, 0, NULL, NULL), (75, 'DonutPanDonut', 'ci_75', 0, 4, 0, NULL, NULL), (76, 'DonutDishDonut', 'ci_76', 0, 4, 0, NULL, NULL), (77, 'DonutVanillaUp', 'ci_77', 0, 4, 0, NULL, NULL), (78, 'DonutChocolateUp', 'ci_78', 0, 4, 0, NULL, NULL), (79, 'DonutChocolateIcingUp', 'ci_79', 0, 4, 0, NULL, NULL), (80, 'DonutSugarUp', 'ci_80', 0, 4, 0, NULL, NULL), (81, 'DonutJellyUp', 'ci_81', 0, 4, 0, NULL, NULL), (82, 'DonutSwirlUp', 'ci_82', 0, 4, 0, NULL, NULL), (83, 'DonutHoleUp', 'ci_83', 0, 4, 0, NULL, NULL), (84, 'DonutHoleMachineUp', 'ci_84', 0, 4, 0, NULL, NULL), (85, 'DonutCoffeUp', 'ci_85', 0, 4, 0, NULL, NULL), (86, 'DonutCoffeMachineUp', 'ci_86', 0, 4, 0, NULL, NULL), (87, 'DonutPan7', 'ci_87', 0, 4, 0, NULL, NULL), (88, 'DishDonut7', 'ci_88', 0, 4, 0, NULL, NULL), (89, 'SubwayPan', 'ci_89', 0, 5, 0, NULL, NULL), (90, 'SubwayDish', 'ci_90', 0, 5, 0, NULL, NULL), (91, 'Donut7Up', 'ci_91', 0, 5, 0, NULL, NULL), (92, 'Bun7Up', 'ci_92', 0, 5, 0, NULL, NULL), (93, 'Soda7Up', 'ci_93', 0, 5, 0, NULL, NULL), (94, 'MachineSoda7Up', 'ci_94', 0, 5, 0, NULL, NULL), (95, 'Salad7Up', 'ci_95', 0, 5, 0, NULL, NULL), (96, 'Meat7Up', 'ci_96', 0, 5, 0, NULL, NULL), (97, 'Cheese7Up', 'ci_97', 0, 5, 0, NULL, NULL), (98, 'Tomato7Up', 'ci_98', 0, 5, 0, NULL, NULL), (99, 'Soup7Up', 'ci_99', 0, 5, 0, NULL, NULL), (100, 'MachineSoup7Up', 'ci_100', 0, 5, 0, NULL, NULL), (101, 'OvenPizza', 'ci_101', 0, 7, 0, NULL, NULL), (102, 'DishPizza', 'ci_102', 0, 7, 0, NULL, NULL), (103, 'PeppersUp', 'ci_103', 0, 7, 0, NULL, NULL), (104, 'ChickenUp', 'ci_104', 0, 7, 0, NULL, NULL), (105, 'ChickenMachineUp', 'ci_105', 0, 7, 0, NULL, NULL), (106, 'BunPizzaUp', 'ci_106', 0, 7, 0, NULL, NULL), (107, 'PepperoniUp', 'ci_107', 0, 7, 0, NULL, NULL), (108, 'MozarellaUp', 'ci_108', 0, 7, 0, NULL, NULL), (109, 'SauceUp', 'ci_109', 0, 7, 0, NULL, NULL), (110, 'SodaPizzaUp', 'ci_110', 0, 7, 0, NULL, NULL), (111, 'MushroomsUp', 'ci_111', 0, 7, 0, NULL, NULL), (112, 'MSodaPizzaUp', 'ci_112', 0, 7, 0, NULL, NULL), (113, 'FishPan', 'ci_113', 0, 8, 0, NULL, NULL), (114, 'ShrimpPan', 'ci_114', 0, 8, 0, NULL, NULL), (115, 'FishPlate', 'ci_115', 0, 8, 0, NULL, NULL), (116, 'ShrimpPlate', 'ci_116', 0, 8, 0, NULL, NULL), (117, 'FishUp', 'ci_117', 0, 8, 0, NULL, NULL), (118, 'ShrimpUp', 'ci_118', 0, 8, 0, NULL, NULL), (119, 'MazineUp', 'ci_119', 0, 8, 0, NULL, NULL), (120, 'Soda3Up', 'ci_120', 0, 8, 0, NULL, NULL), (121, 'CokeMachineUp', 'ci_121', 0, 8, 0, NULL, NULL), (122, 'SoupMachineUp', 'ci_122', 0, 8, 0, NULL, NULL), (123, 'SaladsUp', 'ci_123', 0, 8, 0, NULL, NULL), (124, 'LemondUp', 'ci_124', 0, 8, 0, NULL, NULL), (125, 'Lettuce2Up', 'ci_125', 0, 8, 0, NULL, NULL), (126, 'SoupUp2', 'ci_126', 0, 8, 0, NULL, NULL), (127, 'IceCreamWaffleUp', 'ci_127', 0, 9, 0, NULL, NULL), (128, 'IceCreamCreamWaffleUp', 'ci_128', 0, 9, 0, NULL, NULL), (129, 'IceCreamCherryUp', 'ci_129', 0, 9, 0, NULL, NULL), (130, 'IceCreamSauceUp', 'ci_130', 0, 9, 0, NULL, NULL), (131, 'IceCreamCookieUp', 'ci_131', 0, 9, 0, NULL, NULL), (132, 'IceCreamCreamCookieUp', 'ci_132', 0, 9, 0, NULL, NULL), (133, 'IceCreamChocolateUp', 'ci_133', 0, 9, 0, NULL, NULL), (134, 'IceCreamSprinkesUp', 'ci_134', 0, 9, 0, NULL, NULL), (135, 'IceCreamBeerUp', 'ci_135', 0, 9, 0, NULL, NULL), (136, 'IceCreamBeerMachineUp', 'ci_136', 0, 9, 0, NULL, NULL), (137, 'IceCreamPanWaffle', 'ci_137', 0, 9, 0, NULL, NULL), (138, 'IceCreamPanCookie', 'ci_138', 0, 9, 0, NULL, NULL), (139, 'IceCreamDishWaffle', 'ci_139', 0, 9, 0, NULL, NULL), (140, 'IceCreamDishCookie', 'ci_140', 0, 9, 0, NULL, NULL), (141, 'DecorateBurgercar1', 'ci_141', 0, 1, 0, NULL, NULL), (142, 'DecorateBurgercar2', 'ci_142', 0, 1, 0, NULL, NULL), (143, 'DecorateBurgercar3', 'ci_143', 0, 1, 0, NULL, NULL), (144, 'DecorateBurgerchar1', 'ci_144', 0, 1, 0, NULL, NULL), (145, 'DecorateBurgerchar2', 'ci_145', 0, 1, 0, NULL, NULL), (146, 'DecorateBurgerchar3', 'ci_146', 0, 1, 0, NULL, NULL), (147, 'DecorateBurgertable1', 'ci_147', 0, 1, 0, NULL, NULL), (148, 'DecorateBurgertable2', 'ci_148', 0, 1, 0, NULL, NULL), (149, 'DecorateBurgertable3', 'ci_149', 0, 1, 0, NULL, NULL), (150, 'DecorateBurgerflower1', 'ci_150', 0, 1, 0, NULL, NULL), (151, 'DecorateBurgerflower2', 'ci_151', 0, 1, 0, NULL, NULL), (152, 'DecorateBurgerflower3', 'ci_152', 0, 1, 0, NULL, NULL), (153, 'DecorateBurgermachine1', 'ci_153', 0, 1, 0, NULL, NULL), (154, 'DecorateBurgermachine2', 'ci_154', 0, 1, 0, NULL, NULL), (155, 'DecorateBurgermachine3', 'ci_155', 0, 1, 0, NULL, NULL), (156, 'DecorateBurgerLevel', 'ci_156', 0, 1, 0, NULL, NULL), (157, 'KEY_CLAIM_BURGER', 'ci_157', 0, 1, 0, NULL, NULL), (158, 'DecorateBurgeUsercar', 'ci_158', 0, 1, 0, NULL, NULL), (159, 'DecorateBurgerUsechar', 'ci_159', 0, 1, 0, NULL, NULL), (160, 'DecorateBurgerUsetable', 'ci_160', 0, 1, 0, NULL, NULL), (161, 'DecorateBurgerUseflower', 'ci_161', 0, 1, 0, NULL, NULL), (162, 'DecorateBurgerUsemachine', 'ci_162', 0, 1, 0, NULL, NULL), (163, 'DecorateCakecrown1', 'ci_163', 0, 2, 0, NULL, NULL), (164, 'DecorateCakecrown2', 'ci_164', 0, 2, 0, NULL, NULL), (165, 'DecorateCakecrown3', 'ci_165', 0, 2, 0, NULL, NULL), (166, 'DecorateCakebag1', 'ci_166', 0, 2, 0, NULL, NULL), (167, 'DecorateCakebag2', 'ci_167', 0, 2, 0, NULL, NULL), (168, 'DecorateCakebag3', 'ci_168', 0, 2, 0, NULL, NULL), (169, 'DecorateCaketable1', 'ci_169', 0, 2, 0, NULL, NULL), (170, 'DecorateCaketable2', 'ci_170', 0, 2, 0, NULL, NULL), (171, 'DecorateCaketable3', 'ci_171', 0, 2, 0, NULL, NULL), (172, 'DecorateCakeflower1', 'ci_172', 0, 2, 0, NULL, NULL), (173, 'DecorateCakeflower2', 'ci_173', 0, 2, 0, NULL, NULL), (174, 'DecorateCakeflower3', 'ci_174', 0, 2, 0, NULL, NULL), (175, 'DecorateCakepicture1', 'ci_175', 0, 2, 0, NULL, NULL), (176, 'DecorateCakepicture2', 'ci_176', 0, 2, 0, NULL, NULL), (177, 'DecorateCakepicture3', 'ci_177', 0, 2, 0, NULL, NULL), (178, 'DecorateCakeLevel', 'ci_178', 0, 2, 0, NULL, NULL), (179, 'KEY_CLAIM_CAKE', 'ci_179', 0, 2, 0, NULL, NULL), (180, 'DecorateCakeUsecrown', 'ci_180', 0, 2, 0, NULL, NULL), (181, 'DecorateCakeUsebag', 'ci_181', 0, 2, 0, NULL, NULL), (182, 'DecorateCakeUsetable', 'ci_182', 0, 2, 0, NULL, NULL), (183, 'DecorateCakeUseflower', 'ci_183', 0, 2, 0, NULL, NULL), (184, 'DecorateCakeUsepicture', 'ci_184', 0, 2, 0, NULL, NULL), (185, 'DecorateMexicananimal1', 'ci_185', 0, 3, 0, NULL, NULL), (186, 'DecorateMexicananimal2', 'ci_186', 0, 3, 0, NULL, NULL), (187, 'DecorateMexicananimal3', 'ci_187', 0, 3, 0, NULL, NULL), (188, 'DecorateMexicanchar1', 'ci_188', 0, 3, 0, NULL, NULL), (189, 'DecorateMexicanchar2', 'ci_189', 0, 3, 0, NULL, NULL), (190, 'DecorateMexicanchar3', 'ci_190', 0, 3, 0, NULL, NULL), (191, 'DecorateMexicantable1', 'ci_191', 0, 3, 0, NULL, NULL), (192, 'DecorateMexicantable2', 'ci_192', 0, 3, 0, NULL, NULL), (193, 'DecorateMexicantable3', 'ci_193', 0, 3, 0, NULL, NULL), (194, 'DecorateMexicantree1', 'ci_194', 0, 3, 0, NULL, NULL), (195, 'DecorateMexicantree2', 'ci_195', 0, 3, 0, NULL, NULL), (196, 'DecorateMexicantree3', 'ci_196', 0, 3, 0, NULL, NULL), (197, 'DecorateMexicanpicture1', 'ci_197', 0, 3, 0, NULL, NULL), (198, 'DecorateMexicanpicture2', 'ci_198', 0, 3, 0, NULL, NULL), (199, 'DecorateMexicanpicture3', 'ci_199', 0, 3, 0, NULL, NULL), (200, 'DecorateMexicanLevel', 'ci_200', 0, 3, 0, NULL, NULL), (201, 'KEY_CLAIM_MEXICAN', 'ci_201', 0, 3, 0, NULL, NULL), (202, 'DecorateMexicanUseanimal', 'ci_202', 0, 3, 0, NULL, NULL), (203, 'DecorateMexicanUsechar', 'ci_203', 0, 3, 0, NULL, NULL), (204, 'DecorateMexicanUsetable', 'ci_204', 0, 3, 0, NULL, NULL), (205, 'DecorateMexicanUsetree', 'ci_205', 0, 3, 0, NULL, NULL), (206, 'DecorateMexicanUsepicture', 'ci_206', 0, 3, 0, NULL, NULL), (207, 'DecorateSushitree1', 'ci_207', 0, 6, 0, NULL, NULL), (208, 'DecorateSushitree2', 'ci_208', 0, 6, 0, NULL, NULL), (209, 'DecorateSushitree3', 'ci_209', 0, 6, 0, NULL, NULL), (210, 'DecorateSushichar1', 'ci_210', 0, 6, 0, NULL, NULL), (211, 'DecorateSushichar2', 'ci_211', 0, 6, 0, NULL, NULL), (212, 'DecorateSushichar3', 'ci_212', 0, 6, 0, NULL, NULL), (213, 'DecorateSushitable1', 'ci_213', 0, 6, 0, NULL, NULL), (214, 'DecorateSushitable2', 'ci_214', 0, 6, 0, NULL, NULL), (215, 'DecorateSushitable3', 'ci_215', 0, 6, 0, NULL, NULL), (216, 'DecorateSushiplant1', 'ci_216', 0, 6, 0, NULL, NULL), (217, 'DecorateSushiplant2', 'ci_217', 0, 6, 0, NULL, NULL), (218, 'DecorateSushiplant3', 'ci_218', 0, 6, 0, NULL, NULL), (219, 'DecorateSushipicture1', 'ci_219', 0, 6, 0, NULL, NULL), (220, 'DecorateSushipicture2', 'ci_220', 0, 6, 0, NULL, NULL), (221, 'DecorateSushipicture3', 'ci_221', 0, 6, 0, NULL, NULL), (222, 'DecorateSushiLevel', 'ci_222', 0, 6, 0, NULL, NULL), (223, 'KEY_CLAIM_SUSHI', 'ci_223', 0, 6, 0, NULL, NULL), (224, 'DecorateSushiUsetree', 'ci_224', 0, 6, 0, NULL, NULL), (225, 'DecorateSushiUsechar', 'ci_225', 0, 6, 0, NULL, NULL), (226, 'DecorateSushiUsetable', 'ci_226', 0, 6, 0, NULL, NULL), (227, 'DecorateSushiUseplant', 'ci_227', 0, 6, 0, NULL, NULL), (228, 'DecorateSushiUsepicture', 'ci_228', 0, 6, 0, NULL, NULL), (229, 'DecorateDonutcandy1', 'ci_229', 0, 4, 0, NULL, NULL), (230, 'DecorateDonutcandy2', 'ci_230', 0, 4, 0, NULL, NULL), (231, 'DecorateDonutcandy3', 'ci_231', 0, 4, 0, NULL, NULL), (232, 'DecorateDonuttable1', 'ci_232', 0, 4, 0, NULL, NULL), (233, 'DecorateDonuttable2', 'ci_233', 0, 4, 0, NULL, NULL), (234, 'DecorateDonuttable3', 'ci_234', 0, 4, 0, NULL, NULL), (235, 'DecorateDonuttree1', 'ci_235', 0, 4, 0, NULL, NULL), (236, 'DecorateDonuttree2', 'ci_236', 0, 4, 0, NULL, NULL), (237, 'DecorateDonuttree3', 'ci_237', 0, 4, 0, NULL, NULL), (238, 'DecorateDonutanimal1', 'ci_238', 0, 4, 0, NULL, NULL), (239, 'DecorateDonutanimal2', 'ci_239', 0, 4, 0, NULL, NULL), (240, 'DecorateDonutanimal3', 'ci_240', 0, 4, 0, NULL, NULL), (241, 'DecorateDonutLevel', 'ci_241', 0, 4, 0, NULL, NULL), (242, 'KEY_CLAIM_DONUT', 'ci_242', 0, 4, 0, NULL, NULL), (243, 'DecorateDonutUsecandy', 'ci_243', 0, 4, 0, NULL, NULL), (244, 'DecorateDonutUsetable', 'ci_244', 0, 4, 0, NULL, NULL), (245, 'DecorateDonutUsetree', 'ci_245', 0, 4, 0, NULL, NULL), (246, 'DecorateDonutUseanimal', 'ci_246', 0, 4, 0, NULL, NULL), (247, 'DecorateSubwaycandy1', 'ci_247', 0, 5, 0, NULL, NULL), (248, 'DecorateSubwaycandy2', 'ci_248', 0, 5, 0, NULL, NULL), (249, 'DecorateSubwaycandy3', 'ci_249', 0, 5, 0, NULL, NULL), (250, 'DecorateSubwaybox1', 'ci_250', 0, 5, 0, NULL, NULL), (251, 'DecorateSubwaybox2', 'ci_251', 0, 5, 0, NULL, NULL), (252, 'DecorateSubwaybox3', 'ci_252', 0, 5, 0, NULL, NULL), (253, 'DecorateSubwaytable1', 'ci_253', 0, 5, 0, NULL, NULL), (254, 'DecorateSubwaytable2', 'ci_254', 0, 5, 0, NULL, NULL), (255, 'DecorateSubwaytable3', 'ci_255', 0, 5, 0, NULL, NULL), (256, 'DecorateSubwaytree1', 'ci_256', 0, 5, 0, NULL, NULL), (257, 'DecorateSubwaytree2', 'ci_257', 0, 5, 0, NULL, NULL), (258, 'DecorateSubwaytree3', 'ci_258', 0, 5, 0, NULL, NULL), (259, 'DecorateSubwaymachine1', 'ci_259', 0, 5, 0, NULL, NULL), (260, 'DecorateSubwaymachine2', 'ci_260', 0, 5, 0, NULL, NULL), (261, 'DecorateSubwaymachine3', 'ci_261', 0, 5, 0, NULL, NULL), (262, 'DecorateSubwayLevel', 'ci_262', 0, 5, 0, NULL, NULL), (263, 'KEY_CLAIM_SUBWAY', 'ci_263', 0, 5, 0, NULL, NULL), (264, 'DecorateSubwayUsecandy', 'ci_264', 0, 5, 0, NULL, NULL), (265, 'DecorateSubwayUsebox', 'ci_265', 0, 5, 0, NULL, NULL), (266, 'DecorateSubwayUsetable', 'ci_266', 0, 5, 0, NULL, NULL), (267, 'DecorateSubwayUsetree', 'ci_267', 0, 5, 0, NULL, NULL), (268, 'DecorateSubwayUsemachine', 'ci_268', 0, 5, 0, NULL, NULL), (269, 'DecoratePizzaleft1', 'ci_269', 0, 7, 0, NULL, NULL), (270, 'DecoratePizzaleft2', 'ci_270', 0, 7, 0, NULL, NULL), (271, 'DecoratePizzaleft3', 'ci_271', 0, 7, 0, NULL, NULL), (272, 'DecoratePizzaright1', 'ci_272', 0, 7, 0, NULL, NULL), (273, 'DecoratePizzaright2', 'ci_273', 0, 7, 0, NULL, NULL), (274, 'DecoratePizzaright3', 'ci_274', 0, 7, 0, NULL, NULL), (275, 'DecoratePizzatable1', 'ci_275', 0, 7, 0, NULL, NULL), (276, 'DecoratePizzatable2', 'ci_276', 0, 7, 0, NULL, NULL), (277, 'DecoratePizzatable3', 'ci_277', 0, 7, 0, NULL, NULL), (278, 'DecoratePizzatree1', 'ci_278', 0, 7, 0, NULL, NULL), (279, 'DecoratePizzatree2', 'ci_279', 0, 7, 0, NULL, NULL), (280, 'DecoratePizzatree3', 'ci_280', 0, 7, 0, NULL, NULL), (281, 'DecoratePizzapicture1', 'ci_281', 0, 7, 0, NULL, NULL), (282, 'DecoratePizzapicture2', 'ci_282', 0, 7, 0, NULL, NULL), (283, 'DecoratePizzapicture3', 'ci_283', 0, 7, 0, NULL, NULL), (284, 'DecoratePizzaLevel', 'ci_284', 0, 7, 0, NULL, NULL), (285, 'KEY_CLAIM_PIZZA', 'ci_285', 0, 7, 0, NULL, NULL), (286, 'DecoratePizzaUseleft', 'ci_286', 0, 7, 0, NULL, NULL), (287, 'DecoratePizzaUseright', 'ci_287', 0, 7, 0, NULL, NULL), (288, 'DecoratePizzaUsetable', 'ci_288', 0, 7, 0, NULL, NULL), (289, 'DecoratePizzaUsetree', 'ci_289', 0, 7, 0, NULL, NULL), (290, 'DecoratePizzaUsepicture', 'ci_290', 0, 7, 0, NULL, NULL), (291, 'DecorateSeafoodbottle1', 'ci_291', 0, 8, 0, NULL, NULL), (292, 'DecorateSeafoodbottle2', 'ci_292', 0, 8, 0, NULL, NULL), (293, 'DecorateSeafoodbottle3', 'ci_293', 0, 8, 0, NULL, NULL), (294, 'DecorateSeafoodchar1', 'ci_294', 0, 8, 0, NULL, NULL), (295, 'DecorateSeafoodchar2', 'ci_295', 0, 8, 0, NULL, NULL), (296, 'DecorateSeafoodchar3', 'ci_296', 0, 8, 0, NULL, NULL), (297, 'DecorateSeafoodtable1', 'ci_297', 0, 8, 0, NULL, NULL), (298, 'DecorateSeafoodtable2', 'ci_298', 0, 8, 0, NULL, NULL), (299, 'DecorateSeafoodtable3', 'ci_299', 0, 8, 0, NULL, NULL), (300, 'DecorateSeafoodtree1', 'ci_300', 0, 8, 0, NULL, NULL), (301, 'DecorateSeafoodtree2', 'ci_301', 0, 8, 0, NULL, NULL), (302, 'DecorateSeafoodtree3', 'ci_302', 0, 8, 0, NULL, NULL), (303, 'DecorateSeafoodpicture1', 'ci_303', 0, 8, 0, NULL, NULL), (304, 'DecorateSeafoodpicture2', 'ci_304', 0, 8, 0, NULL, NULL), (305, 'DecorateSeafoodpicture3', 'ci_305', 0, 8, 0, NULL, NULL), (306, 'DecorateSeafoodLevel', 'ci_306', 0, 8, 0, NULL, NULL), (307, 'KEY_CLAIM_SEAFOOD', 'ci_307', 0, 8, 0, NULL, NULL), (308, 'DecorateSeafoodUsebottle', 'ci_308', 0, 8, 0, NULL, NULL), (309, 'DecorateSeafoodUsechar', 'ci_309', 0, 8, 0, NULL, NULL), (310, 'DecorateSeafoodUsetable', 'ci_310', 0, 8, 0, NULL, NULL), (311, 'DecorateSeafoodUsetree', 'ci_311', 0, 8, 0, NULL, NULL), (312, 'DecorateSeafoodUsepicture', 'ci_312', 0, 8, 0, NULL, NULL), (313, 'DecorateCreamcandy1', 'ci_313', 0, 9, 0, NULL, NULL), (314, 'DecorateCreamcandy2', 'ci_314', 0, 9, 0, NULL, NULL), (315, 'DecorateCreamcandy3', 'ci_315', 0, 9, 0, NULL, NULL), (316, 'DecorateCreambear1', 'ci_316', 0, 9, 0, NULL, NULL), (317, 'DecorateCreambear2', 'ci_317', 0, 9, 0, NULL, NULL), (318, 'DecorateCreambear3', 'ci_318', 0, 9, 0, NULL, NULL), (319, 'DecorateCreamtable1', 'ci_319', 0, 9, 0, NULL, NULL), (320, 'DecorateCreamtable2', 'ci_320', 0, 9, 0, NULL, NULL), (321, 'DecorateCreamtable3', 'ci_321', 0, 9, 0, NULL, NULL), (322, 'DecorateCreamflower1', 'ci_322', 0, 9, 0, NULL, NULL), (323, 'DecorateCreamflower2', 'ci_323', 0, 9, 0, NULL, NULL), (324, 'DecorateCreamflower3', 'ci_324', 0, 9, 0, NULL, NULL), (325, 'DecorateCreampicture1', 'ci_325', 0, 9, 0, NULL, NULL), (326, 'DecorateCreampicture2', 'ci_326', 0, 9, 0, NULL, NULL), (327, 'DecorateCreampicture3', 'ci_327', 0, 9, 0, NULL, NULL), (328, 'DecorateCreamLevel', 'ci_328', 0, 9, 0, NULL, NULL), (329, 'KEY_CLAIM_CREAM', 'ci_329', 0, 9, 0, NULL, NULL), (330, 'DecorateCreamUsecandy', 'ci_330', 0, 9, 0, NULL, NULL), (331, 'DecorateCreamUsebear', 'ci_331', 0, 9, 0, NULL, NULL), (332, 'DecorateCreamUsetable', 'ci_332', 0, 9, 0, NULL, NULL), (333, 'DecorateCreamUseflower', 'ci_333', 0, 9, 0, NULL, NULL), (334, 'DecorateCreamUsepicture', 'ci_334', 0, 9, 0, NULL, NULL), (335, 'NUM_TICKET_ENDLESS', 'ci_335', 0, 0, 0, NULL, NULL), (336, 'KEY_OPEN_ENDLESS', 'ci_336', 0, 11, 0, NULL, NULL), (337, 'OPEN_ENDLESS_BURGER', 'ci_337', 0, 11, 0, NULL, NULL), (338, 'OPEN_ENDLESS_CAKE', 'ci_338', 0, 11, 0, NULL, NULL), (339, 'OPEN_ENDLESS_MEXICAN', 'ci_339', 0, 11, 0, NULL, NULL), (340, 'OPEN_ENDLESS_DONUT', 'ci_340', 0, 11, 0, NULL, NULL), (341, 'OPEN_ENDLESS_SUBWAY', 'ci_341', 0, 11, 0, NULL, NULL), (342, 'OPEN_ENDLESS_SUSHI', 'ci_342', 0, 11, 0, NULL, NULL), (343, 'OPEN_ENDLESS_PIZZA', 'ci_343', 0, 11, 0, NULL, NULL), (344, 'OPEN_ENDLESS_SEAFOOD', 'ci_344', 0, 11, 0, NULL, NULL), (345, 'OPEN_ENDLESS_CREAM', 'ci_345', 0, 11, 0, NULL, NULL), (346, 'BEST_SCORE_BURGER', 'ci_346', 0, 11, 0, NULL, NULL), (347, 'BEST_SCORE_CAKE', 'ci_347', 0, 11, 0, NULL, NULL), (348, 'BEST_SCORE_MEXICAN', 'ci_348', 0, 11, 0, NULL, NULL), (349, 'BEST_SCORE_DONUT', 'ci_349', 0, 11, 0, NULL, NULL), (350, 'BEST_SCORE_SUBWAY', 'ci_350', 0, 11, 0, NULL, NULL), (351, 'BEST_SCORE_SUSHI', 'ci_351', 0, 11, 0, NULL, NULL), (352, 'BEST_SCORE_PIZZA', 'ci_352', 0, 11, 0, NULL, NULL), (353, 'BEST_SCORE_SEAFOOD', 'ci_353', 0, 11, 0, NULL, NULL), (354, 'BEST_SCORE_CREAM', 'ci_354', 0, 11, 0, NULL, NULL), (355, 'COIN_EARN_ENDLESS', 'ci_355', 0, 11, 0, NULL, NULL), (356, 'KEY_LEVEL_ENDLESS', 'ci_356', 0, 11, 0, NULL, NULL), (357, 'KEY_INDEX_RESTAURANT', 'ci_357', 0, 11, 0, NULL, NULL), (358, 'LevelDoneType1', 'ci_358', 0, 12, 0, NULL, NULL), (359, 'LevelDoneType2', 'ci_359', 0, 12, 0, NULL, NULL), (360, 'LevelDoneType3', 'ci_360', 0, 12, 0, NULL, NULL), (361, 'LevelDoneType4', 'ci_361', 0, 12, 0, NULL, NULL), (362, 'LevelDoneType5', 'ci_362', 0, 12, 0, NULL, NULL), (363, 'LevelDoneType6', 'ci_363', 0, 12, 0, NULL, NULL), (364, 'LevelDoneType7', 'ci_364', 0, 12, 0, NULL, NULL), (365, 'LevelDoneType8', 'ci_365', 0, 12, 0, NULL, NULL), (366, 'LevelDoneType9', 'ci_366', 0, 12, 0, NULL, NULL), (367, 'LevelDoneType10', 'ci_367', 0, 12, 0, NULL, NULL), (368, 'LevelDoneType11', 'ci_368', 0, 12, 0, NULL, NULL), (369, 'LevelDoneType12', 'ci_369', 0, 12, 0, NULL, NULL), (370, 'LevelDoneType13', 'ci_370', 0, 12, 0, NULL, NULL), (371, 'LevelDoneType14', 'ci_371', 0, 12, 0, NULL, NULL), (372, 'LevelDoneType15', 'ci_372', 0, 12, 0, NULL, NULL), (373, 'LevelDoneType16', 'ci_373', 0, 12, 0, NULL, NULL), (374, 'LevelDoneType17', 'ci_374', 0, 12, 0, NULL, NULL), (375, 'LevelDoneType18', 'ci_375', 0, 12, 0, NULL, NULL), (376, 'LevelDoneType19', 'ci_376', 0, 12, 0, NULL, NULL), (377, 'LevelDoneType20', 'ci_377', 0, 12, 0, NULL, NULL), (378, 'LevelDoneType21', 'ci_378', 0, 12, 0, NULL, NULL), (379, 'LevelDoneType22', 'ci_379', 0, 12, 0, NULL, NULL), (380, 'LevelDoneType23', 'ci_380', 0, 12, 0, NULL, NULL), (381, 'LevelDoneType24', 'ci_381', 0, 12, 0, NULL, NULL), (382, 'LevelDoneType25', 'ci_382', 0, 12, 0, NULL, NULL), (383, 'LevelDoneType26', 'ci_383', 0, 12, 0, NULL, NULL), (384, 'LevelDoneType27', 'ci_384', 0, 12, 0, NULL, NULL), (385, 'LevelDoneType28', 'ci_385', 0, 12, 0, NULL, NULL), (386, 'LevelDoneType29', 'ci_386', 0, 12, 0, NULL, NULL), (387, 'LevelDoneType30', 'ci_387', 0, 12, 0, NULL, NULL), (388, 'LevelDoneType31', 'ci_388', 0, 12, 0, NULL, NULL), (389, 'LevelDoneType32', 'ci_389', 0, 12, 0, NULL, NULL), (390, 'LevelDoneType33', 'ci_390', 0, 12, 0, NULL, NULL), (391, 'LevelDoneType34', 'ci_391', 0, 12, 0, NULL, NULL), (392, 'LevelDoneType35', 'ci_392', 0, 12, 0, NULL, NULL), (393, 'LevelDoneType36', 'ci_393', 0, 12, 0, NULL, NULL), (394, 'LevelDoneType37', 'ci_394', 0, 12, 0, NULL, NULL), (395, 'LevelDoneType38', 'ci_395', 0, 12, 0, NULL, NULL), (396, 'LevelDoneType39', 'ci_396', 0, 12, 0, NULL, NULL), (397, 'LevelDoneType40', 'ci_397', 0, 12, 0, NULL, NULL), (398, 'LevelDoneType41', 'ci_398', 0, 12, 0, NULL, NULL), (399, 'LevelDoneType42', 'ci_399', 0, 12, 0, NULL, NULL), (400, 'LevelDoneType43', 'ci_400', 0, 12, 0, NULL, NULL), (401, 'LevelDoneType44', 'ci_401', 0, 12, 0, NULL, NULL), (402, 'LevelDoneType45', 'ci_402', 0, 12, 0, NULL, NULL), (403, 'LevelDoneType46', 'ci_403', 0, 12, 0, NULL, NULL), (404, 'LevelDoneType47', 'ci_404', 0, 12, 0, NULL, NULL), (405, 'LevelDoneType48', 'ci_405', 0, 12, 0, NULL, NULL), (406, 'LevelDoneType49', 'ci_406', 0, 12, 0, NULL, NULL), (407, 'LevelDoneType50', 'ci_407', 0, 12, 0, NULL, NULL), (408, 'LevelDoneType51', 'ci_408', 0, 12, 0, NULL, NULL), (409, 'LevelDoneType52', 'ci_409', 0, 12, 0, NULL, NULL), (410, 'LevelDoneType53', 'ci_410', 0, 12, 0, NULL, NULL), (411, 'LevelDoneType54', 'ci_411', 0, 12, 0, NULL, NULL), (412, 'LevelDoneType55', 'ci_412', 0, 12, 0, NULL, NULL), (413, 'LevelDoneType56', 'ci_413', 0, 12, 0, NULL, NULL), (414, 'LevelDoneType57', 'ci_414', 0, 12, 0, NULL, NULL), (415, 'LevelDoneType58', 'ci_415', 0, 12, 0, NULL, NULL), (416, 'LevelDoneType59', 'ci_416', 0, 12, 0, NULL, NULL), (417, 'LevelDoneType60', 'ci_417', 0, 12, 0, NULL, NULL), (418, 'LevelDoneType61', 'ci_418', 0, 12, 0, NULL, NULL), (419, 'LevelDoneType62', 'ci_419', 0, 12, 0, NULL, NULL), (420, 'LevelDoneType63', 'ci_420', 0, 12, 0, NULL, NULL), (421, 'LevelDoneType64', 'ci_421', 0, 12, 0, NULL, NULL), (422, 'LevelDoneType65', 'ci_422', 0, 12, 0, NULL, NULL), (423, 'ScoreType1', 'ci_423', 0, 12, 0, NULL, NULL), (424, 'ScoreType2', 'ci_424', 0, 12, 0, NULL, NULL), (425, 'ScoreType3', 'ci_425', 0, 12, 0, NULL, NULL), (426, 'ScoreType4', 'ci_426', 0, 12, 0, NULL, NULL), (427, 'ScoreType5', 'ci_427', 0, 12, 0, NULL, NULL), (428, 'ScoreType6', 'ci_428', 0, 12, 0, NULL, NULL), (429, 'ScoreType7', 'ci_429', 0, 12, 0, NULL, NULL), (430, 'ScoreType8', 'ci_430', 0, 12, 0, NULL, NULL), (431, 'ScoreType9', 'ci_431', 0, 12, 0, NULL, NULL), (432, 'ScoreType10', 'ci_432', 0, 12, 0, NULL, NULL), (433, 'ScoreType11', 'ci_433', 0, 12, 0, NULL, NULL), (434, 'ScoreType12', 'ci_434', 0, 12, 0, NULL, NULL), (435, 'ScoreType13', 'ci_435', 0, 12, 0, NULL, NULL), (436, 'ScoreType14', 'ci_436', 0, 12, 0, NULL, NULL), (437, 'ScoreType15', 'ci_437', 0, 12, 0, NULL, NULL), (438, 'ScoreType16', 'ci_438', 0, 12, 0, NULL, NULL), (439, 'ScoreType17', 'ci_439', 0, 12, 0, NULL, NULL), (440, 'ScoreType18', 'ci_440', 0, 12, 0, NULL, NULL), (441, 'ScoreType19', 'ci_441', 0, 12, 0, NULL, NULL), (442, 'ScoreType20', 'ci_442', 0, 12, 0, NULL, NULL), (443, 'ScoreType21', 'ci_443', 0, 12, 0, NULL, NULL), (444, 'ScoreType22', 'ci_444', 0, 12, 0, NULL, NULL), (445, 'ScoreType23', 'ci_445', 0, 12, 0, NULL, NULL), (446, 'ScoreType24', 'ci_446', 0, 12, 0, NULL, NULL), (447, 'ScoreType25', 'ci_447', 0, 12, 0, NULL, NULL), (448, 'ScoreType26', 'ci_448', 0, 12, 0, NULL, NULL), (449, 'ScoreType27', 'ci_449', 0, 12, 0, NULL, NULL), (450, 'ScoreType28', 'ci_450', 0, 12, 0, NULL, NULL), (451, 'ScoreType29', 'ci_451', 0, 12, 0, NULL, NULL), (452, 'ScoreType30', 'ci_452', 0, 12, 0, NULL, NULL), (453, 'ScoreType31', 'ci_453', 0, 12, 0, NULL, NULL), (454, 'ScoreType32', 'ci_454', 0, 12, 0, NULL, NULL), (455, 'ScoreType33', 'ci_455', 0, 12, 0, NULL, NULL), (456, 'ScoreType34', 'ci_456', 0, 12, 0, NULL, NULL), (457, 'ScoreType35', 'ci_457', 0, 12, 0, NULL, NULL), (458, 'ScoreType36', 'ci_458', 0, 12, 0, NULL, NULL), (459, 'ScoreType37', 'ci_459', 0, 12, 0, NULL, NULL), (460, 'ScoreType38', 'ci_460', 0, 12, 0, NULL, NULL), (461, 'ScoreType39', 'ci_461', 0, 12, 0, NULL, NULL), (462, 'ScoreType40', 'ci_462', 0, 12, 0, NULL, NULL), (463, 'ScoreType41', 'ci_463', 0, 12, 0, NULL, NULL), (464, 'ScoreType42', 'ci_464', 0, 12, 0, NULL, NULL), (465, 'ScoreType43', 'ci_465', 0, 12, 0, NULL, NULL), (466, 'ScoreType44', 'ci_466', 0, 12, 0, NULL, NULL), (467, 'ScoreType45', 'ci_467', 0, 12, 0, NULL, NULL), (468, 'ScoreType46', 'ci_468', 0, 12, 0, NULL, NULL), (469, 'ScoreType47', 'ci_469', 0, 12, 0, NULL, NULL), (470, 'ScoreType48', 'ci_470', 0, 12, 0, NULL, NULL), (471, 'ScoreType49', 'ci_471', 0, 12, 0, NULL, NULL), (472, 'ScoreType50', 'ci_472', 0, 12, 0, NULL, NULL), (473, 'ScoreType51', 'ci_473', 0, 12, 0, NULL, NULL), (474, 'ScoreType52', 'ci_474', 0, 12, 0, NULL, NULL), (475, 'ScoreType53', 'ci_475', 0, 12, 0, NULL, NULL), (476, 'ScoreType54', 'ci_476', 0, 12, 0, NULL, NULL), (477, 'ScoreType55', 'ci_477', 0, 12, 0, NULL, NULL), (478, 'ScoreType56', 'ci_478', 0, 12, 0, NULL, NULL), (479, 'ScoreType57', 'ci_479', 0, 12, 0, NULL, NULL), (480, 'ScoreType58', 'ci_480', 0, 12, 0, NULL, NULL), (481, 'ScoreType59', 'ci_481', 0, 12, 0, NULL, NULL), (482, 'ScoreType60', 'ci_482', 0, 12, 0, NULL, NULL), (483, 'ScoreType61', 'ci_483', 0, 12, 0, NULL, NULL), (484, 'ScoreType62', 'ci_484', 0, 12, 0, NULL, NULL), (485, 'ScoreType63', 'ci_485', 0, 12, 0, NULL, NULL), (486, 'ScoreType64', 'ci_486', 0, 12, 0, NULL, NULL), (487, 'ScoreType65', 'ci_487', 0, 12, 0, NULL, NULL), (488, 'LevelUp1', 'ci_488', 0, 1, 0, NULL, NULL), (489, 'LevelUp2', 'ci_489', 0, 1, 0, NULL, NULL), (490, 'LevelUp3', 'ci_490', 0, 1, 0, NULL, NULL), (491, 'LevelUp4', 'ci_491', 0, 1, 0, NULL, NULL), (492, 'LevelUp5', 'ci_492', 0, 1, 0, NULL, NULL), (493, 'LevelUp6', 'ci_493', 0, 1, 0, NULL, NULL), (494, 'LevelUp7', 'ci_494', 0, 1, 0, NULL, NULL), (495, 'LevelUp8', 'ci_495', 0, 1, 0, NULL, NULL), (496, 'LevelUp9', 'ci_496', 0, 1, 0, NULL, NULL), (497, 'LevelUp10', 'ci_497', 0, 1, 0, NULL, NULL), (498, 'LevelUp11', 'ci_498', 0, 1, 0, NULL, NULL), (499, 'LevelUp12', 'ci_499', 0, 1, 0, NULL, NULL), (500, 'LevelUp13', 'ci_500', 0, 1, 0, NULL, NULL), (501, 'LevelUp14', 'ci_501', 0, 1, 0, NULL, NULL), (502, 'LevelUp15', 'ci_502', 0, 1, 0, NULL, NULL), (503, 'LevelUp16', 'ci_503', 0, 2, 0, NULL, NULL), (504, 'LevelUp17', 'ci_504', 0, 2, 0, NULL, NULL), (505, 'LevelUp18', 'ci_505', 0, 2, 0, NULL, NULL), (506, 'LevelUp19', 'ci_506', 0, 2, 0, NULL, NULL), (507, 'LevelUp20', 'ci_507', 0, 2, 0, NULL, NULL), (508, 'LevelUp21', 'ci_508', 0, 2, 0, NULL, NULL), (509, 'LevelUp22', 'ci_509', 0, 2, 0, NULL, NULL), (510, 'LevelUp23', 'ci_510', 0, 2, 0, NULL, NULL), (511, 'LevelUp24', 'ci_511', 0, 2, 0, NULL, NULL), (512, 'LevelUp25', 'ci_512', 0, 2, 0, NULL, NULL), (513, 'LevelUp26', 'ci_513', 0, 2, 0, NULL, NULL), (514, 'LevelUp27', 'ci_514', 0, 2, 0, NULL, NULL), (515, 'LevelUp28', 'ci_515', 0, 2, 0, NULL, NULL), (516, 'LevelUp29', 'ci_516', 0, 2, 0, NULL, NULL), (517, 'LevelUp30', 'ci_517', 0, 2, 0, NULL, NULL), (518, 'LevelUp31', 'ci_518', 0, 2, 0, NULL, NULL), (519, 'LevelUp32', 'ci_519', 0, 2, 0, NULL, NULL), (520, 'LevelUp33', 'ci_520', 0, 2, 0, NULL, NULL), (521, 'LevelUp34', 'ci_521', 0, 2, 0, NULL, NULL), (522, 'LevelUp35', 'ci_522', 0, 2, 0, NULL, NULL), (523, 'LevelUp36', 'ci_523', 0, 2, 0, NULL, NULL), (524, 'LevelUp37', 'ci_524', 0, 2, 0, NULL, NULL), (525, 'LevelUp38', 'ci_525', 0, 2, 0, NULL, NULL), (526, 'LevelUp39', 'ci_526', 0, 2, 0, NULL, NULL), (527, 'LevelUp40', 'ci_527', 0, 2, 0, NULL, NULL), (528, 'LevelUp41', 'ci_528', 0, 3, 0, NULL, NULL), (529, 'LevelUp42', 'ci_529', 0, 3, 0, NULL, NULL), (530, 'LevelUp43', 'ci_530', 0, 3, 0, NULL, NULL), (531, 'LevelUp44', 'ci_531', 0, 3, 0, NULL, NULL), (532, 'LevelUp45', 'ci_532', 0, 3, 0, NULL, NULL), (533, 'LevelUp46', 'ci_533', 0, 3, 0, NULL, NULL), (534, 'LevelUp47', 'ci_534', 0, 3, 0, NULL, NULL), (535, 'LevelUp48', 'ci_535', 0, 3, 0, NULL, NULL), (536, 'LevelUp49', 'ci_536', 0, 3, 0, NULL, NULL), (537, 'LevelUp50', 'ci_537', 0, 3, 0, NULL, NULL), (538, 'LevelUp51', 'ci_538', 0, 3, 0, NULL, NULL), (539, 'LevelUp52', 'ci_539', 0, 3, 0, NULL, NULL), (540, 'LevelUp53', 'ci_540', 0, 3, 0, NULL, NULL), (541, 'LevelUp54', 'ci_541', 0, 3, 0, NULL, NULL), (542, 'LevelUp55', 'ci_542', 0, 3, 0, NULL, NULL), (543, 'LevelUp56', 'ci_543', 0, 3, 0, NULL, NULL), (544, 'LevelUp57', 'ci_544', 0, 3, 0, NULL, NULL), (545, 'LevelUp58', 'ci_545', 0, 3, 0, NULL, NULL), (546, 'LevelUp59', 'ci_546', 0, 3, 0, NULL, NULL), (547, 'LevelUp60', 'ci_547', 0, 3, 0, NULL, NULL), (548, 'LevelUp61', 'ci_548', 0, 3, 0, NULL, NULL), (549, 'LevelUp62', 'ci_549', 0, 3, 0, NULL, NULL), (550, 'LevelUp63', 'ci_550', 0, 3, 0, NULL, NULL), (551, 'LevelUp64', 'ci_551', 0, 3, 0, NULL, NULL), (552, 'LevelUp65', 'ci_552', 0, 3, 0, NULL, NULL), (553, 'LevelUp66', 'ci_553', 0, 3, 0, NULL, NULL), (554, 'LevelUp67', 'ci_554', 0, 3, 0, NULL, NULL), (555, 'LevelUp68', 'ci_555', 0, 3, 0, NULL, NULL), (556, 'LevelUp69', 'ci_556', 0, 3, 0, NULL, NULL), (557, 'LevelUp70', 'ci_557', 0, 3, 0, NULL, NULL), (558, 'LevelUp71', 'ci_558', 0, 4, 0, NULL, NULL), (559, 'LevelUp72', 'ci_559', 0, 4, 0, NULL, NULL), (560, 'LevelUp73', 'ci_560', 0, 4, 0, NULL, NULL), (561, 'LevelUp74', 'ci_561', 0, 4, 0, NULL, NULL), (562, 'LevelUp75', 'ci_562', 0, 4, 0, NULL, NULL), (563, 'LevelUp76', 'ci_563', 0, 4, 0, NULL, NULL), (564, 'LevelUp77', 'ci_564', 0, 4, 0, NULL, NULL), (565, 'LevelUp78', 'ci_565', 0, 4, 0, NULL, NULL), (566, 'LevelUp79', 'ci_566', 0, 4, 0, NULL, NULL), (567, 'LevelUp80', 'ci_567', 0, 4, 0, NULL, NULL), (568, 'LevelUp81', 'ci_568', 0, 4, 0, NULL, NULL), (569, 'LevelUp82', 'ci_569', 0, 4, 0, NULL, NULL), (570, 'LevelUp83', 'ci_570', 0, 4, 0, NULL, NULL), (571, 'LevelUp84', 'ci_571', 0, 4, 0, NULL, NULL), (572, 'LevelUp85', 'ci_572', 0, 4, 0, NULL, NULL), (573, 'LevelUp86', 'ci_573', 0, 4, 0, NULL, NULL), (574, 'LevelUp87', 'ci_574', 0, 4, 0, NULL, NULL), (575, 'LevelUp88', 'ci_575', 0, 4, 0, NULL, NULL), (576, 'LevelUp89', 'ci_576', 0, 4, 0, NULL, NULL), (577, 'LevelUp90', 'ci_577', 0, 4, 0, NULL, NULL), (578, 'LevelUp91', 'ci_578', 0, 4, 0, NULL, NULL), (579, 'LevelUp92', 'ci_579', 0, 4, 0, NULL, NULL), (580, 'LevelUp93', 'ci_580', 0, 4, 0, NULL, NULL), (581, 'LevelUp94', 'ci_581', 0, 4, 0, NULL, NULL), (582, 'LevelUp95', 'ci_582', 0, 4, 0, NULL, NULL), (583, 'LevelUp96', 'ci_583', 0, 4, 0, NULL, NULL), (584, 'LevelUp97', 'ci_584', 0, 4, 0, NULL, NULL), (585, 'LevelUp98', 'ci_585', 0, 4, 0, NULL, NULL), (586, 'LevelUp99', 'ci_586', 0, 4, 0, NULL, NULL), (587, 'LevelUp100', 'ci_587', 0, 4, 0, NULL, NULL), (588, 'LevelUp101', 'ci_588', 0, 5, 0, NULL, NULL), (589, 'LevelUp102', 'ci_589', 0, 5, 0, NULL, NULL), (590, 'LevelUp103', 'ci_590', 0, 5, 0, NULL, NULL), (591, 'LevelUp104', 'ci_591', 0, 5, 0, NULL, NULL), (592, 'LevelUp105', 'ci_592', 0, 5, 0, NULL, NULL), (593, 'LevelUp106', 'ci_593', 0, 5, 0, NULL, NULL), (594, 'LevelUp107', 'ci_594', 0, 5, 0, NULL, NULL), (595, 'LevelUp108', 'ci_595', 0, 5, 0, NULL, NULL), (596, 'LevelUp109', 'ci_596', 0, 5, 0, NULL, NULL), (597, 'LevelUp110', 'ci_597', 0, 5, 0, NULL, NULL), (598, 'LevelUp111', 'ci_598', 0, 5, 0, NULL, NULL), (599, 'LevelUp112', 'ci_599', 0, 5, 0, NULL, NULL), (600, 'LevelUp113', 'ci_600', 0, 5, 0, NULL, NULL), (601, 'LevelUp114', 'ci_601', 0, 5, 0, NULL, NULL), (602, 'LevelUp115', 'ci_602', 0, 5, 0, NULL, NULL), (603, 'LevelUp116', 'ci_603', 0, 5, 0, NULL, NULL), (604, 'LevelUp117', 'ci_604', 0, 5, 0, NULL, NULL), (605, 'LevelUp118', 'ci_605', 0, 5, 0, NULL, NULL), (606, 'LevelUp119', 'ci_606', 0, 5, 0, NULL, NULL), (607, 'LevelUp120', 'ci_607', 0, 5, 0, NULL, NULL), (608, 'LevelUp121', 'ci_608', 0, 5, 0, NULL, NULL), (609, 'LevelUp122', 'ci_609', 0, 5, 0, NULL, NULL), (610, 'LevelUp123', 'ci_610', 0, 5, 0, NULL, NULL), (611, 'LevelUp124', 'ci_611', 0, 5, 0, NULL, NULL), (612, 'LevelUp125', 'ci_612', 0, 5, 0, NULL, NULL), (613, 'LevelUp126', 'ci_613', 0, 5, 0, NULL, NULL), (614, 'LevelUp127', 'ci_614', 0, 5, 0, NULL, NULL), (615, 'LevelUp128', 'ci_615', 0, 5, 0, NULL, NULL), (616, 'LevelUp129', 'ci_616', 0, 5, 0, NULL, NULL), (617, 'LevelUp130', 'ci_617', 0, 5, 0, NULL, NULL), (618, 'LevelUp131', 'ci_618', 0, 5, 0, NULL, NULL), (619, 'LevelUp132', 'ci_619', 0, 6, 0, NULL, NULL), (620, 'LevelUp133', 'ci_620', 0, 6, 0, NULL, NULL), (621, 'LevelUp134', 'ci_621', 0, 6, 0, NULL, NULL), (622, 'LevelUp135', 'ci_622', 0, 6, 0, NULL, NULL), (623, 'LevelUp136', 'ci_623', 0, 6, 0, NULL, NULL), (624, 'LevelUp137', 'ci_624', 0, 6, 0, NULL, NULL), (625, 'LevelUp138', 'ci_625', 0, 6, 0, NULL, NULL), (626, 'LevelUp139', 'ci_626', 0, 6, 0, NULL, NULL), (627, 'LevelUp140', 'ci_627', 0, 6, 0, NULL, NULL), (628, 'LevelUp141', 'ci_628', 0, 6, 0, NULL, NULL), (629, 'LevelUp142', 'ci_629', 0, 6, 0, NULL, NULL), (630, 'LevelUp143', 'ci_630', 0, 6, 0, NULL, NULL), (631, 'LevelUp144', 'ci_631', 0, 6, 0, NULL, NULL), (632, 'LevelUp145', 'ci_632', 0, 6, 0, NULL, NULL), (633, 'LevelUp146', 'ci_633', 0, 6, 0, NULL, NULL), (634, 'LevelUp147', 'ci_634', 0, 6, 0, NULL, NULL), (635, 'LevelUp148', 'ci_635', 0, 6, 0, NULL, NULL), (636, 'LevelUp149', 'ci_636', 0, 6, 0, NULL, NULL), (637, 'LevelUp150', 'ci_637', 0, 6, 0, NULL, NULL), (638, 'LevelUp151', 'ci_638', 0, 6, 0, NULL, NULL), (639, 'LevelUp152', 'ci_639', 0, 6, 0, NULL, NULL), (640, 'LevelUp153', 'ci_640', 0, 6, 0, NULL, NULL), (641, 'LevelUp154', 'ci_641', 0, 6, 0, NULL, NULL), (642, 'LevelUp155', 'ci_642', 0, 6, 0, NULL, NULL), (643, 'LevelUp156', 'ci_643', 0, 6, 0, NULL, NULL), (644, 'LevelUp157', 'ci_644', 0, 6, 0, NULL, NULL), (645, 'LevelUp158', 'ci_645', 0, 6, 0, NULL, NULL), (646, 'LevelUp159', 'ci_646', 0, 6, 0, NULL, NULL), (647, 'LevelUp160', 'ci_647', 0, 6, 0, NULL, NULL), (648, 'LevelUp161', 'ci_648', 0, 7, 0, NULL, NULL), (649, 'LevelUp162', 'ci_649', 0, 7, 0, NULL, NULL), (650, 'LevelUp163', 'ci_650', 0, 7, 0, NULL, NULL), (651, 'LevelUp164', 'ci_651', 0, 7, 0, NULL, NULL), (652, 'LevelUp165', 'ci_652', 0, 7, 0, NULL, NULL), (653, 'LevelUp166', 'ci_653', 0, 7, 0, NULL, NULL), (654, 'LevelUp167', 'ci_654', 0, 7, 0, NULL, NULL), (655, 'LevelUp168', 'ci_655', 0, 7, 0, NULL, NULL), (656, 'LevelUp169', 'ci_656', 0, 7, 0, NULL, NULL), (657, 'LevelUp170', 'ci_657', 0, 7, 0, NULL, NULL), (658, 'LevelUp171', 'ci_658', 0, 7, 0, NULL, NULL), (659, 'LevelUp172', 'ci_659', 0, 7, 0, NULL, NULL), (660, 'LevelUp173', 'ci_660', 0, 7, 0, NULL, NULL), (661, 'LevelUp174', 'ci_661', 0, 7, 0, NULL, NULL), (662, 'LevelUp175', 'ci_662', 0, 7, 0, NULL, NULL), (663, 'LevelUp176', 'ci_663', 0, 7, 0, NULL, NULL), (664, 'LevelUp177', 'ci_664', 0, 7, 0, NULL, NULL), (665, 'LevelUp178', 'ci_665', 0, 7, 0, NULL, NULL), (666, 'LevelUp179', 'ci_666', 0, 7, 0, NULL, NULL), (667, 'LevelUp180', 'ci_667', 0, 7, 0, NULL, NULL), (668, 'LevelUp181', 'ci_668', 0, 7, 0, NULL, NULL), (669, 'LevelUp182', 'ci_669', 0, 7, 0, NULL, NULL), (670, 'LevelUp183', 'ci_670', 0, 7, 0, NULL, NULL), (671, 'LevelUp184', 'ci_671', 0, 7, 0, NULL, NULL), (672, 'LevelUp185', 'ci_672', 0, 7, 0, NULL, NULL), (673, 'LevelUp186', 'ci_673', 0, 7, 0, NULL, NULL), (674, 'LevelUp187', 'ci_674', 0, 7, 0, NULL, NULL), (675, 'LevelUp188', 'ci_675', 0, 7, 0, NULL, NULL), (676, 'LevelUp189', 'ci_676', 0, 7, 0, NULL, NULL), (677, 'LevelUp190', 'ci_677', 0, 7, 0, NULL, NULL), (678, 'LevelUp191', 'ci_678', 0, 8, 0, NULL, NULL), (679, 'LevelUp192', 'ci_679', 0, 8, 0, NULL, NULL), (680, 'LevelUp193', 'ci_680', 0, 8, 0, NULL, NULL), (681, 'LevelUp194', 'ci_681', 0, 8, 0, NULL, NULL), (682, 'LevelUp195', 'ci_682', 0, 8, 0, NULL, NULL), (683, 'LevelUp196', 'ci_683', 0, 8, 0, NULL, NULL), (684, 'LevelUp197', 'ci_684', 0, 8, 0, NULL, NULL), (685, 'LevelUp198', 'ci_685', 0, 8, 0, NULL, NULL), (686, 'LevelUp199', 'ci_686', 0, 8, 0, NULL, NULL), (687, 'LevelUp200', 'ci_687', 0, 8, 0, NULL, NULL), (688, 'LevelUp201', 'ci_688', 0, 8, 0, NULL, NULL), (689, 'LevelUp202', 'ci_689', 0, 8, 0, NULL, NULL), (690, 'LevelUp203', 'ci_690', 0, 8, 0, NULL, NULL), (691, 'LevelUp204', 'ci_691', 0, 8, 0, NULL, NULL), (692, 'LevelUp205', 'ci_692', 0, 8, 0, NULL, NULL), (693, 'LevelUp206', 'ci_693', 0, 8, 0, NULL, NULL), (694, 'LevelUp207', 'ci_694', 0, 8, 0, NULL, NULL), (695, 'LevelUp208', 'ci_695', 0, 8, 0, NULL, NULL), (696, 'LevelUp209', 'ci_696', 0, 8, 0, NULL, NULL), (697, 'LevelUp210', 'ci_697', 0, 8, 0, NULL, NULL), (698, 'LevelUp211', 'ci_698', 0, 8, 0, NULL, NULL), (699, 'LevelUp212', 'ci_699', 0, 8, 0, NULL, NULL), (700, 'LevelUp213', 'ci_700', 0, 8, 0, NULL, NULL), (701, 'LevelUp214', 'ci_701', 0, 8, 0, NULL, NULL), (702, 'LevelUp215', 'ci_702', 0, 8, 0, NULL, NULL), (703, 'LevelUp216', 'ci_703', 0, 8, 0, NULL, NULL), (704, 'LevelUp217', 'ci_704', 0, 8, 0, NULL, NULL), (705, 'LevelUp218', 'ci_705', 0, 8, 0, NULL, NULL), (706, 'LevelUp219', 'ci_706', 0, 8, 0, NULL, NULL), (707, 'LevelUp220', 'ci_707', 0, 8, 0, NULL, NULL), (708, 'LevelUp221', 'ci_708', 0, 9, 0, NULL, NULL), (709, 'LevelUp222', 'ci_709', 0, 9, 0, NULL, NULL), (710, 'LevelUp223', 'ci_710', 0, 9, 0, NULL, NULL), (711, 'LevelUp224', 'ci_711', 0, 9, 0, NULL, NULL), (712, 'LevelUp225', 'ci_712', 0, 9, 0, NULL, NULL), (713, 'LevelUp226', 'ci_713', 0, 9, 0, NULL, NULL), (714, 'LevelUp227', 'ci_714', 0, 9, 0, NULL, NULL), (715, 'LevelUp228', 'ci_715', 0, 9, 0, NULL, NULL), (716, 'LevelUp229', 'ci_716', 0, 9, 0, NULL, NULL), (717, 'LevelUp230', 'ci_717', 0, 9, 0, NULL, NULL), (718, 'LevelUp231', 'ci_718', 0, 9, 0, NULL, NULL), (719, 'LevelUp232', 'ci_719', 0, 9, 0, NULL, NULL), (720, 'LevelUp233', 'ci_720', 0, 9, 0, NULL, NULL), (721, 'LevelUp234', 'ci_721', 0, 9, 0, NULL, NULL), (722, 'LevelUp235', 'ci_722', 0, 9, 0, NULL, NULL), (723, 'LevelUp236', 'ci_723', 0, 9, 0, NULL, NULL), (724, 'LevelUp237', 'ci_724', 0, 9, 0, NULL, NULL), (725, 'LevelUp238', 'ci_725', 0, 9, 0, NULL, NULL), (726, 'LevelUp239', 'ci_726', 0, 9, 0, NULL, NULL), (727, 'LevelUp240', 'ci_727', 0, 9, 0, NULL, NULL), (728, 'LevelUp241', 'ci_728', 0, 9, 0, NULL, NULL), (729, 'LevelUp242', 'ci_729', 0, 9, 0, NULL, NULL), (730, 'LevelUp243', 'ci_730', 0, 9, 0, NULL, NULL), (731, 'LevelUp244', 'ci_731', 0, 9, 0, NULL, NULL), (732, 'LevelUp245', 'ci_732', 0, 9, 0, NULL, NULL), (733, 'LevelUp246', 'ci_733', 0, 9, 0, NULL, NULL), (734, 'LevelUp247', 'ci_734', 0, 9, 0, NULL, NULL), (735, 'LevelUp248', 'ci_735', 0, 9, 0, NULL, NULL), (736, 'LevelUp249', 'ci_736', 0, 9, 0, NULL, NULL), (737, 'LevelUp250', 'ci_737', 0, 9, 0, NULL, NULL), (738, 'LevelUp251', 'ci_738', 0, 10, 0, NULL, NULL), (739, 'LevelUp252', 'ci_739', 0, 10, 0, NULL, NULL), (740, 'LevelUp253', 'ci_740', 0, 10, 0, NULL, NULL), (741, 'LevelUp254', 'ci_741', 0, 10, 0, NULL, NULL), (742, 'LevelUp255', 'ci_742', 0, 10, 0, NULL, NULL), (743, 'LevelUp256', 'ci_743', 0, 10, 0, NULL, NULL), (744, 'LevelUp257', 'ci_744', 0, 10, 0, NULL, NULL), (745, 'LevelUp258', 'ci_745', 0, 10, 0, NULL, NULL), (746, 'LevelUp259', 'ci_746', 0, 10, 0, NULL, NULL), (747, 'LevelUp260', 'ci_747', 0, 10, 0, NULL, NULL), (748, 'LevelUp261', 'ci_748', 0, 10, 0, NULL, NULL), (749, 'LevelUp262', 'ci_749', 0, 10, 0, NULL, NULL), (750, 'LevelUp263', 'ci_750', 0, 10, 0, NULL, NULL), (751, 'LevelUp264', 'ci_751', 0, 10, 0, NULL, NULL), (752, 'LevelUp265', 'ci_752', 0, 10, 0, NULL, NULL), (753, 'LevelUp266', 'ci_753', 0, 10, 0, NULL, NULL), (754, 'LevelUp267', 'ci_754', 0, 10, 0, NULL, NULL), (755, 'LevelUp268', 'ci_755', 0, 10, 0, NULL, NULL), (756, 'LevelUp269', 'ci_756', 0, 10, 0, NULL, NULL), (757, 'LevelUp270', 'ci_757', 0, 10, 0, NULL, NULL), (758, 'LevelUp271', 'ci_758', 0, 10, 0, NULL, NULL), (759, 'LevelUp272', 'ci_759', 0, 10, 0, NULL, NULL), (760, 'LevelUp273', 'ci_760', 0, 10, 0, NULL, NULL), (761, 'LevelUp274', 'ci_761', 0, 10, 0, NULL, NULL), (762, 'LevelUp275', 'ci_762', 0, 10, 0, NULL, NULL), (763, 'LevelUp276', 'ci_763', 0, 10, 0, NULL, NULL), (764, 'LevelUp277', 'ci_764', 0, 10, 0, NULL, NULL), (765, 'LevelUp278', 'ci_765', 0, 10, 0, NULL, NULL), (766, 'LevelUp279', 'ci_766', 0, 10, 0, NULL, NULL), (767, 'LevelUp280', 'ci_767', 0, 10, 0, NULL, NULL), (768, 'TutorialDay1', 'ci_768', 0, 11, 0, 1, NULL), (769, 'TutorialCombo', 'ci_769', 0, 11, 0, 3, NULL), (770, 'TutorialRushHour', 'ci_770', 0, 11, 0, 4, NULL), (771, 'TutorialBaconCheese', 'ci_771', 0, 11, 0, 5, NULL), (772, 'TutorialUseCake', 'ci_772', 0, 11, 0, 8, NULL), (773, 'TutorialTomato', 'ci_773', 0, 11, 0, 9, NULL), (774, 'TutorialBoostHappyHour', 'ci_774', 0, 11, 0, 10, NULL), (775, 'TutorialBoostGroceries', 'ci_775', 0, 11, 0, 15, NULL), (776, 'CakeShopChocolateIcing', 'ci_776', 0, 11, 0, 15, NULL), (777, 'TutorialDay1Res4', 'ci_777', 0, 11, 0, 131, NULL), (778, 'TutorialDay2Res4', 'ci_778', 0, 11, 0, 132, NULL), (779, 'TutorialRes2Day1', 'ci_779', 0, 11, 0, 41, NULL), (780, 'TutorialDay1Res3', 'ci_780', 0, 11, 0, 71, NULL), (781, 'TutorialSubwayDay1', 'ci_781', 0, 11, 0, 101, NULL), (782, 'TutorialPizzaDay1', 'ci_782', 0, 11, 0, 161, NULL), (783, 'TutorialSeafoodDay1', 'ci_783', 0, 11, 0, 191, NULL), (784, 'CreamDay1', 'ci_784', 0, 11, 0, 221, NULL), (785, 'TutorialConnectFB', 'ci_785', 0, 11, 0, 11, NULL), (786, 'TutorialLevel13', 'ci_786', 0, 11, 0, 14, NULL), (787, 'TutorialLevel8', 'ci_787', 0, 11, 0, 8, NULL), (788, 'TutorialSpinWheel', 'ci_788', 0, 11, 0, 2, NULL), (789, 'TutorialOpenRestaurant', 'ci_789', 0, 11, 0, 0, NULL), (790, 'TutorialEnterStar2', 'ci_790', 0, 11, 0, 0, NULL), (791, 'TutorialEnterStar1', 'ci_791', 0, 11, 0, 0, NULL), (792, 'TutorialLevel3', 'ci_792', 0, 11, 0, 3, NULL), (793, 'TutorialLevel4', 'ci_793', 0, 11, 0, 4, NULL), (794, 'TutorialUpgrade', 'ci_794', 0, 11, 0, 5, NULL), (795, 'TutorialLevel6', 'ci_795', 0, 11, 0, 6, NULL), (796, 'TutorialLevel7', 'ci_796', 0, 11, 0, 7, NULL), (797, 'TutorialDecorate', 'ci_797', 0, 11, 0, 7, NULL), (798, 'TutorialLevel7Time', 'ci_798', 0, 11, 0, 7, NULL), (799, 'TutorialLevel12', 'ci_799', 0, 11, 0, 12, NULL), (800, 'TutorialLevel14', 'ci_800', 0, 11, 0, 14, NULL), (801, 'TutorialLevel15', 'ci_801', 0, 11, 0, 15, NULL), (802, 'TutorialLevel19', 'ci_802', 0, 11, 0, 19, NULL), (803, 'TypeCustomer', 'ci_803', 2, 13, 0, NULL, NULL), (804, 'DEFAULT_LANGUAGE', 'ci_804', 2, 13, 0, NULL, NULL), (805, 'TimeLogin', 'ci_805', 2, 13, 0, NULL, NULL), (806, 'TIME_SPIN_WHEEL', 'ci_806', 2, 13, 0, NULL, NULL), (807, 'WheelDate', 'ci_807', 2, 13, 0, NULL, NULL), (808, 'WheelTime', 'ci_808', 2, 13, 0, NULL, NULL), (809, 'PRC_UQID', 'ci_809', 2, 13, 0, NULL, NULL), (810, 'TutorialCustomerAngry', 'ci_810', 0, 11, 0, NULL, NULL), (811, 'TutorialDay2', 'ci_811', 0, 11, 0, NULL, NULL), (812, 'TutorialHeart', 'ci_812', 0, 11, 0, NULL, NULL), (813, 'TutorialGem', 'ci_813', 0, 11, 0, NULL, NULL), (814, 'TutorialCustomerHungry', 'ci_814', 0, 11, 0, NULL, NULL), (815, 'TutorialItemBurn', 'ci_815', 0, 11, 0, NULL, NULL), (816, 'TutorialBin', 'ci_816', 0, 11, 0, NULL, NULL), (817, 'TutorialTimeBar', 'ci_817', 0, 11, 0, NULL, NULL), (818, 'TutorialTimer', 'ci_818', 0, 11, 0, NULL, NULL), (819, 'TIME_QUEST_WEEKEND', 'ci_819', 2, 13, 0, NULL, NULL), (820, 'FIRST_TIME_OPEN_QUEST_WEEKEND', 'ci_820', 0, 13, 0, NULL, NULL), (821, 'TOTAL_WIN_LEVEL_QUEST_WEEKEND', 'ci_821', 0, 13, 0, NULL, NULL), (822, 'TIME_LEFT_NEXT_QUEST_WEEKEND', 'ci_822', 2, 13, 0, NULL, NULL), (823, 'DailyBonus', 'ci_823', 0, 13, 0, NULL, NULL), (824, 'ShowDaily', 'ci_824', 0, 13, 0, NULL, NULL), (825, 'CLAIM_QUEST_WEEKEND_1', 'ci_825', 0, 13, 0, NULL, NULL), (826, 'CLAIM_QUEST_WEEKEND_2', 'ci_826', 0, 13, 0, NULL, NULL), (827, 'OpenSalmon', 'ci_827', 0, 6, 0, NULL, NULL), (828, 'OpenGinger', 'ci_828', 0, 6, 0, NULL, NULL), (829, 'OpenAvocado', 'ci_829', 0, 6, 0, NULL, NULL), (830, 'OpenSeaweed', 'ci_830', 0, 6, 0, NULL, NULL), (831, 'OpenSoup', 'ci_831', 0, 6, 0, NULL, NULL), (832, 'OpenOnion', 'ci_832', 0, 6, 0, NULL, NULL), (833, 'TutorialRiceMexican', 'ci_833', 0, 3, 0, NULL, NULL), (834, 'TutorialTaco', 'ci_834', 0, 3, 0, NULL, NULL), (835, 'TutorialLettuceMexcian', 'ci_835', 0, 3, 0, NULL, NULL), (836, 'TutorialTomatoMexcian', 'ci_836', 0, 3, 0, NULL, NULL), (837, 'TutorialCheeseMexcian', 'ci_837', 0, 3, 0, NULL, NULL), (838, 'TutorialGuacamole', 'ci_838', 0, 3, 0, NULL, NULL), (839, 'TutorialSugar', 'ci_839', 0, 4, 0, NULL, NULL), (840, 'TutorialJelly', 'ci_840', 0, 4, 0, NULL, NULL), (841, 'TutorialSwirl', 'ci_841', 0, 4, 0, NULL, NULL), (842, 'TutorialChocolateDonut', 'ci_842', 0, 4, 0, NULL, NULL), (843, 'TutorialDonutHole', 'ci_843', 0, 4, 0, NULL, NULL), (844, 'TutorialSalmon', 'ci_844', 0, 6, 0, NULL, NULL), (845, 'TutorialAvocado', 'ci_845', 0, 6, 0, NULL, NULL), (846, 'TutorialSeaweed', 'ci_846', 0, 6, 0, NULL, NULL), (847, 'TutorialSoupSushi', 'ci_847', 0, 6, 0, NULL, NULL), (848, 'TutorialOnion', 'ci_848', 0, 6, 0, NULL, NULL), (849, 'TutorialMozarella', 'ci_849', 0, 7, 0, NULL, NULL), (850, 'TutorialPeppers', 'ci_850', 0, 7, 0, NULL, NULL), (851, 'TutorialMushroom', 'ci_851', 0, 7, 0, NULL, NULL), (852, 'TutorialPepperoni', 'ci_852', 0, 7, 0, NULL, NULL), (853, 'TutorialDonut7', 'ci_853', 0, 5, 0, NULL, NULL), (854, 'TutorialCheese7', 'ci_854', 0, 5, 0, NULL, NULL), (855, 'TutorialTomato7', 'ci_855', 0, 5, 0, NULL, NULL), (856, 'TutorialSoup7', 'ci_856', 0, 5, 0, NULL, NULL), (857, 'CakeShopChocolateFlake', 'ci_857', 0, 5, 0, NULL, NULL), (858, 'CakeShopBlueBurry', 'ci_858', 0, 2, 0, NULL, NULL), (859, 'CakeShopPink', 'ci_859', 0, 2, 0, NULL, NULL), (860, 'CakeShopWhite', 'ci_860', 0, 2, 0, NULL, NULL), (861, 'CakeShopStrawberry', 'ci_861', 0, 2, 0, NULL, NULL), (862, 'CreamSauce', 'ci_862', 0, 9, 0, NULL, NULL), (863, 'CreamChocolate', 'ci_863', 0, 9, 0, NULL, NULL), (864, 'CreamCherry', 'ci_864', 0, 9, 0, NULL, NULL), (865, 'CreamSprinkes', 'ci_865', 0, 9, 0, NULL, NULL), (866, 'TutorialShrimp', 'ci_866', 0, 8, 0, NULL, NULL), (867, 'TutorialMazine', 'ci_867', 0, 8, 0, NULL, NULL), (868, 'TutorialLettuce', 'ci_868', 0, 8, 0, NULL, NULL), (869, 'TutorialSoup', 'ci_869', 0, 8, 0, NULL, NULL), (870, 'TutorialSalad', 'ci_870', 0, 8, 0, NULL, NULL), (871, 'TutorialLemon', 'ci_871', 0, 8, 0, NULL, NULL), (872, 'TutorialCustomer', 'ci_872', 0, 13, 0, NULL, NULL), (873, 'day_spine_open', 'ci_873', 0, 13, 0, NULL, NULL), (874, 'com.fme.cookit.vip3new', 'ci_874', 0, 9998, 0, NULL, NULL), (875, 'DayBuyVip3', 'ci_875', 2, 9998, 0, NULL, NULL), (876, 'rewardChangeRestaurant', 'ci_876', 0, 13, 0, NULL, NULL), (877, 'TimeCountCupcake', 'ci_877', 2, 13, 0, NULL, NULL), (878, 'TIME_PANTRY', 'ci_878', 2, 13, 0, NULL, NULL), (879, 'first_time_unlock_pantry', 'ci_879', 0, 13, 0, NULL, NULL), (880, 'TIME_DAILY_HAPPINESS', 'ci_880', 2, 13, 0, NULL, NULL), (881, 'time_daily_reward_iap', 'ci_881', 2, 13, 0, NULL, NULL), (882, 'TIME_DAILY_REWARD_IAP_BOX', 'ci_882', 2, 13, 0, NULL, NULL), (883, 'TIME_ROTATIONAL_SALE_IAP', 'ci_883', 2, 13, 0, NULL, NULL), (884, 'ITEM_SALE_BOOST', 'ci_884', 2, 13, 0, NULL, NULL), (885, 'Dem1car1', 'ci_885', 2, 1, 0, NULL, NULL), (886, 'Dem1car2', 'ci_886', 2, 1, 0, NULL, NULL), (887, 'Dem1car3', 'ci_887', 2, 1, 0, NULL, NULL), (888, 'Dem1char1', 'ci_888', 2, 1, 0, NULL, NULL), (889, 'Dem1char2', 'ci_889', 2, 1, 0, NULL, NULL), (890, 'Dem1char3', 'ci_890', 2, 1, 0, NULL, NULL), (891, 'Dem1table1', 'ci_891', 2, 1, 0, NULL, NULL), (892, 'Dem1table2', 'ci_892', 2, 1, 0, NULL, NULL), (893, 'Dem1table3', 'ci_893', 2, 1, 0, NULL, NULL), (894, 'Dem1flower1', 'ci_894', 2, 1, 0, NULL, NULL), (895, 'Dem1flower2', 'ci_895', 2, 1, 0, NULL, NULL), (896, 'Dem1flower3', 'ci_896', 2, 1, 0, NULL, NULL), (897, 'Dem1machine1', 'ci_897', 2, 1, 0, NULL, NULL), (898, 'Dem1machine2', 'ci_898', 2, 1, 0, NULL, NULL), (899, 'Dem1machine3', 'ci_899', 2, 1, 0, NULL, NULL), (900, 'Dem2crown1', 'ci_900', 2, 2, 0, NULL, NULL), (901, 'Dem2crown2', 'ci_901', 2, 2, 0, NULL, NULL), (902, 'Dem2crown3', 'ci_902', 2, 2, 0, NULL, NULL), (903, 'Dem2bag1', 'ci_903', 2, 2, 0, NULL, NULL), (904, 'Dem2bag2', 'ci_904', 2, 2, 0, NULL, NULL), (905, 'Dem2bag3', 'ci_905', 2, 2, 0, NULL, NULL), (906, 'Dem2table1', 'ci_906', 2, 2, 0, NULL, NULL), (907, 'Dem2table2', 'ci_907', 2, 2, 0, NULL, NULL), (908, 'Dem2table3', 'ci_908', 2, 2, 0, NULL, NULL), (909, 'Dem2flower1', 'ci_909', 2, 2, 0, NULL, NULL), (910, 'Dem2flower2', 'ci_910', 2, 2, 0, NULL, NULL), (911, 'Dem2flower3', 'ci_911', 2, 2, 0, NULL, NULL), (912, 'Dem2picture1', 'ci_912', 2, 2, 0, NULL, NULL), (913, 'Dem2picture2', 'ci_913', 2, 2, 0, NULL, NULL), (914, 'Dem2picture3', 'ci_914', 2, 2, 0, NULL, NULL), (915, 'Dem4animal1', 'ci_915', 2, 3, 0, NULL, NULL), (916, 'Dem4animal2', 'ci_916', 2, 3, 0, NULL, NULL), (917, 'Dem4animal3', 'ci_917', 2, 3, 0, NULL, NULL), (918, 'Dem4char1', 'ci_918', 2, 3, 0, NULL, NULL), (919, 'Dem4char2', 'ci_919', 2, 3, 0, NULL, NULL), (920, 'Dem4char3', 'ci_920', 2, 3, 0, NULL, NULL), (921, 'Dem4table1', 'ci_921', 2, 3, 0, NULL, NULL), (922, 'Dem4table2', 'ci_922', 2, 3, 0, NULL, NULL), (923, 'Dem4table3', 'ci_923', 2, 3, 0, NULL, NULL), (924, 'Dem4tree1', 'ci_924', 2, 3, 0, NULL, NULL), (925, 'Dem4tree2', 'ci_925', 2, 3, 0, NULL, NULL), (926, 'Dem4tree3', 'ci_926', 2, 3, 0, NULL, NULL), (927, 'Dem4picture1', 'ci_927', 2, 3, 0, NULL, NULL), (928, 'Dem4picture2', 'ci_928', 2, 3, 0, NULL, NULL), (929, 'Dem4picture3', 'ci_929', 2, 3, 0, NULL, NULL), (930, 'Dem5candy1', 'ci_930', 2, 4, 0, NULL, NULL), (931, 'Dem5candy2', 'ci_931', 2, 4, 0, NULL, NULL), (932, 'Dem5candy3', 'ci_932', 2, 4, 0, NULL, NULL), (933, 'Dem5table1', 'ci_933', 2, 4, 0, NULL, NULL), (934, 'Dem5table2', 'ci_934', 2, 4, 0, NULL, NULL), (935, 'Dem5table3', 'ci_935', 2, 4, 0, NULL, NULL), (936, 'Dem5tree1', 'ci_936', 2, 4, 0, NULL, NULL), (937, 'Dem5tree2', 'ci_937', 2, 4, 0, NULL, NULL), (938, 'Dem5tree3', 'ci_938', 2, 4, 0, NULL, NULL), (939, 'Dem5animal1', 'ci_939', 2, 4, 0, NULL, NULL), (940, 'Dem5animal2', 'ci_940', 2, 4, 0, NULL, NULL), (941, 'Dem5animal3', 'ci_941', 2, 4, 0, NULL, NULL), (942, 'Dem6candy1', 'ci_942', 2, 5, 0, NULL, NULL), (943, 'Dem6candy2', 'ci_943', 2, 5, 0, NULL, NULL), (944, 'Dem6candy3', 'ci_944', 2, 5, 0, NULL, NULL), (945, 'Dem6box1', 'ci_945', 2, 5, 0, NULL, NULL), (946, 'Dem6box2', 'ci_946', 2, 5, 0, NULL, NULL), (947, 'Dem6box3', 'ci_947', 2, 5, 0, NULL, NULL), (948, 'Dem6table1', 'ci_948', 2, 5, 0, NULL, NULL), (949, 'Dem6table2', 'ci_949', 2, 5, 0, NULL, NULL), (950, 'Dem6table3', 'ci_950', 2, 5, 0, NULL, NULL), (951, 'Dem6tree1', 'ci_951', 2, 5, 0, NULL, NULL), (952, 'Dem6tree2', 'ci_952', 2, 5, 0, NULL, NULL), (953, 'Dem6tree3', 'ci_953', 2, 5, 0, NULL, NULL), (954, 'Dem6machine1', 'ci_954', 2, 5, 0, NULL, NULL), (955, 'Dem6machine2', 'ci_955', 2, 5, 0, NULL, NULL), (956, 'Dem6machine3', 'ci_956', 2, 5, 0, NULL, NULL), (957, 'Dem3tree1', 'ci_957', 2, 6, 0, NULL, NULL), (958, 'Dem3tree2', 'ci_958', 2, 6, 0, NULL, NULL), (959, 'Dem3tree3', 'ci_959', 2, 6, 0, NULL, NULL), (960, 'Dem3char1', 'ci_960', 2, 6, 0, NULL, NULL), (961, 'Dem3char2', 'ci_961', 2, 6, 0, NULL, NULL), (962, 'Dem3char3', 'ci_962', 2, 6, 0, NULL, NULL), (963, 'Dem3table1', 'ci_963', 2, 6, 0, NULL, NULL), (964, 'Dem3table2', 'ci_964', 2, 6, 0, NULL, NULL), (965, 'Dem3table3', 'ci_965', 2, 6, 0, NULL, NULL), (966, 'Dem3plant1', 'ci_966', 2, 6, 0, NULL, NULL), (967, 'Dem3plant2', 'ci_967', 2, 6, 0, NULL, NULL), (968, 'Dem3plant3', 'ci_968', 2, 6, 0, NULL, NULL), (969, 'Dem3picture1', 'ci_969', 2, 6, 0, NULL, NULL), (970, 'Dem3picture2', 'ci_970', 2, 6, 0, NULL, NULL), (971, 'Dem3picture3', 'ci_971', 2, 6, 0, NULL, NULL), (972, 'Dem7left1', 'ci_972', 2, 7, 0, NULL, NULL), (973, 'Dem7left2', 'ci_973', 2, 7, 0, NULL, NULL), (974, 'Dem7left3', 'ci_974', 2, 7, 0, NULL, NULL), (975, 'Dem7right1', 'ci_975', 2, 7, 0, NULL, NULL), (976, 'Dem7right2', 'ci_976', 2, 7, 0, NULL, NULL), (977, 'Dem7right3', 'ci_977', 2, 7, 0, NULL, NULL), (978, 'Dem7table1', 'ci_978', 2, 7, 0, NULL, NULL), (979, 'Dem7table2', 'ci_979', 2, 7, 0, NULL, NULL), (980, 'Dem7table3', 'ci_980', 2, 7, 0, NULL, NULL), (981, 'Dem7tree1', 'ci_981', 2, 7, 0, NULL, NULL), (982, 'Dem7tree2', 'ci_982', 2, 7, 0, NULL, NULL), (983, 'Dem7tree3', 'ci_983', 2, 7, 0, NULL, NULL), (984, 'Dem7picture1', 'ci_984', 2, 7, 0, NULL, NULL), (985, 'Dem7picture2', 'ci_985', 2, 7, 0, NULL, NULL), (986, 'Dem7picture3', 'ci_986', 2, 7, 0, NULL, NULL), (987, 'Dem8bottle1', 'ci_987', 2, 8, 0, NULL, NULL), (988, 'Dem8bottle2', 'ci_988', 2, 8, 0, NULL, NULL), (989, 'Dem8bottle3', 'ci_989', 2, 8, 0, NULL, NULL), (990, 'Dem8char1', 'ci_990', 2, 8, 0, NULL, NULL), (991, 'Dem8char2', 'ci_991', 2, 8, 0, NULL, NULL), (992, 'Dem8char3', 'ci_992', 2, 8, 0, NULL, NULL), (993, 'Dem8table1', 'ci_993', 2, 8, 0, NULL, NULL), (994, 'Dem8table2', 'ci_994', 2, 8, 0, NULL, NULL), (995, 'Dem8table3', 'ci_995', 2, 8, 0, NULL, NULL), (996, 'Dem8tree1', 'ci_996', 2, 8, 0, NULL, NULL), (997, 'Dem8tree2', 'ci_997', 2, 8, 0, NULL, NULL), (998, 'Dem8tree3', 'ci_998', 2, 8, 0, NULL, NULL), (999, 'Dem8picture1', 'ci_999', 2, 8, 0, NULL, NULL), (1000, 'Dem8picture2', 'ci_1000', 2, 8, 0, NULL, NULL), (1001, 'Dem8picture3', 'ci_1001', 2, 8, 0, NULL, NULL), (1002, 'Dem9candy1', 'ci_1002', 2, 9, 0, NULL, NULL), (1003, 'Dem9candy2', 'ci_1003', 2, 9, 0, NULL, NULL), (1004, 'Dem9candy3', 'ci_1004', 2, 9, 0, NULL, NULL), (1005, 'Dem9bear1', 'ci_1005', 2, 9, 0, NULL, NULL), (1006, 'Dem9bear2', 'ci_1006', 2, 9, 0, NULL, NULL), (1007, 'Dem9bear3', 'ci_1007', 2, 9, 0, NULL, NULL), (1008, 'Dem9table1', 'ci_1008', 2, 9, 0, NULL, NULL), (1009, 'Dem9table2', 'ci_1009', 2, 9, 0, NULL, NULL), (1010, 'Dem9table3', 'ci_1010', 2, 9, 0, NULL, NULL), (1011, 'Dem9flower1', 'ci_1011', 2, 9, 0, NULL, NULL), (1012, 'Dem9flower2', 'ci_1012', 2, 9, 0, NULL, NULL), (1013, 'Dem9flower3', 'ci_1013', 2, 9, 0, NULL, NULL), (1014, 'Dem9picture1', 'ci_1014', 2, 9, 0, NULL, NULL), (1015, 'Dem9picture2', 'ci_1015', 2, 9, 0, NULL, NULL), (1016, 'Dem9picture3', 'ci_1016', 2, 9, 0, NULL, NULL), (1017, 'DailyScoreType1', 'ci_1017', 0, 15, 0, NULL, NULL), (1018, 'DailyScoreType2', 'ci_1018', 0, 15, 0, NULL, NULL), (1019, 'DailyScoreType3', 'ci_1019', 0, 15, 0, NULL, NULL), (1020, 'DailyScoreType4', 'ci_1020', 0, 15, 0, NULL, NULL), (1021, 'DailyScoreType5', 'ci_1021', 0, 15, 0, NULL, NULL), (1022, 'DailyScoreType6', 'ci_1022', 0, 15, 0, NULL, NULL), (1023, 'DailyScoreType7', 'ci_1023', 0, 15, 0, NULL, NULL), (1024, 'DailyScoreType8', 'ci_1024', 0, 15, 0, NULL, NULL), (1025, 'DailyScoreType9', 'ci_1025', 0, 15, 0, NULL, NULL), (1026, 'DailyScoreType10', 'ci_1026', 0, 15, 0, NULL, NULL), (1027, 'DailyScoreType11', 'ci_1027', 0, 15, 0, NULL, NULL), (1028, 'DailyScoreType12', 'ci_1028', 0, 15, 0, NULL, NULL), (1029, 'DailyScoreType13', 'ci_1029', 0, 15, 0, NULL, NULL), (1030, 'DailyScoreType14', 'ci_1030', 0, 15, 0, NULL, NULL), (1031, 'DailyScoreType15', 'ci_1031', 0, 15, 0, NULL, NULL), (1032, 'DailyScoreType16', 'ci_1032', 0, 15, 0, NULL, NULL), (1033, 'DailyScoreType17', 'ci_1033', 0, 15, 0, NULL, NULL), (1034, 'DailyScoreType18', 'ci_1034', 0, 15, 0, NULL, NULL), (1035, 'DailyScoreType19', 'ci_1035', 0, 15, 0, NULL, NULL), (1036, 'DailyScoreType20', 'ci_1036', 0, 15, 0, NULL, NULL), (1037, 'DailyScoreType21', 'ci_1037', 0, 15, 0, NULL, NULL), (1038, 'DailyScoreType22', 'ci_1038', 0, 15, 0, NULL, NULL), (1039, 'DailyScoreType23', 'ci_1039', 0, 15, 0, NULL, NULL), (1040, 'DailyScoreType24', 'ci_1040', 0, 15, 0, NULL, NULL), (1041, 'DailyScoreType25', 'ci_1041', 0, 15, 0, NULL, NULL), (1042, 'DailyScoreType26', 'ci_1042', 0, 15, 0, NULL, NULL), (1043, 'DailyScoreType27', 'ci_1043', 0, 15, 0, NULL, NULL), (1044, 'DailyScoreType28', 'ci_1044', 0, 15, 0, NULL, NULL), (1045, 'DailyScoreType29', 'ci_1045', 0, 15, 0, NULL, NULL), (1046, 'DailyScoreType30', 'ci_1046', 0, 15, 0, NULL, NULL), (1047, 'DailyScoreType31', 'ci_1047', 0, 15, 0, NULL, NULL), (1048, 'DailyScoreType32', 'ci_1048', 0, 15, 0, NULL, NULL), (1049, 'DailyScoreType33', 'ci_1049', 0, 15, 0, NULL, NULL), (1050, 'DailyScoreType34', 'ci_1050', 0, 15, 0, NULL, NULL), (1051, 'DailyScoreType35', 'ci_1051', 0, 15, 0, NULL, NULL), (1052, 'DailyScoreType36', 'ci_1052', 0, 15, 0, NULL, NULL), (1053, 'DailyScoreType37', 'ci_1053', 0, 15, 0, NULL, NULL), (1054, 'DailyScoreType38', 'ci_1054', 0, 15, 0, NULL, NULL), (1055, 'DailyScoreType39', 'ci_1055', 0, 15, 0, NULL, NULL), (1056, 'DailyScoreType40', 'ci_1056', 0, 15, 0, NULL, NULL), (1057, 'DailyScoreType41', 'ci_1057', 0, 15, 0, NULL, NULL), (1058, 'DailyScoreType42', 'ci_1058', 0, 15, 0, NULL, NULL), (1059, 'DailyScoreType43', 'ci_1059', 0, 15, 0, NULL, NULL), (1060, 'DailyScoreType44', 'ci_1060', 0, 15, 0, NULL, NULL), (1061, 'DailyScoreType45', 'ci_1061', 0, 15, 0, NULL, NULL), (1062, 'DailyScoreType46', 'ci_1062', 0, 15, 0, NULL, NULL), (1063, 'DailyScoreType47', 'ci_1063', 0, 15, 0, NULL, NULL), (1064, 'DailyScoreType48', 'ci_1064', 0, 15, 0, NULL, NULL), (1065, 'DailyScoreType49', 'ci_1065', 0, 15, 0, NULL, NULL), (1066, 'DailyScoreType50', 'ci_1066', 0, 15, 0, NULL, NULL), (1067, 'DailyScoreType51', 'ci_1067', 0, 15, 0, NULL, NULL), (1068, 'DailyScoreType52', 'ci_1068', 0, 15, 0, NULL, NULL), (1069, 'DailyScoreType53', 'ci_1069', 0, 15, 0, NULL, NULL), (1070, 'DailyScoreType54', 'ci_1070', 0, 15, 0, NULL, NULL), (1071, 'DailyScoreType55', 'ci_1071', 0, 15, 0, NULL, NULL), (1072, 'DailyScoreType56', 'ci_1072', 0, 15, 0, NULL, NULL), (1073, 'DailyScoreType57', 'ci_1073', 0, 15, 0, NULL, NULL), (1074, 'DailyScoreType58', 'ci_1074', 0, 15, 0, NULL, NULL), (1075, 'DailyScoreType59', 'ci_1075', 0, 15, 0, NULL, NULL), (1076, 'DailyLevelDoneType1', 'ci_1076', 0, 15, 0, NULL, NULL), (1077, 'DailyLevelDoneType2', 'ci_1077', 0, 15, 0, NULL, NULL), (1078, 'DailyLevelDoneType3', 'ci_1078', 0, 15, 0, NULL, NULL), (1079, 'DailyLevelDoneType4', 'ci_1079', 0, 15, 0, NULL, NULL), (1080, 'DailyLevelDoneType5', 'ci_1080', 0, 15, 0, NULL, NULL), (1081, 'DailyLevelDoneType6', 'ci_1081', 0, 15, 0, NULL, NULL), (1082, 'DailyLevelDoneType7', 'ci_1082', 0, 15, 0, NULL, NULL), (1083, 'DailyLevelDoneType8', 'ci_1083', 0, 15, 0, NULL, NULL), (1084, 'DailyLevelDoneType9', 'ci_1084', 0, 15, 0, NULL, NULL), (1085, 'DailyLevelDoneType10', 'ci_1085', 0, 15, 0, NULL, NULL), (1086, 'DailyLevelDoneType11', 'ci_1086', 0, 15, 0, NULL, NULL), (1087, 'DailyLevelDoneType12', 'ci_1087', 0, 15, 0, NULL, NULL), (1088, 'DailyLevelDoneType13', 'ci_1088', 0, 15, 0, NULL, NULL), (1089, 'DailyLevelDoneType14', 'ci_1089', 0, 15, 0, NULL, NULL), (1090, 'DailyLevelDoneType15', 'ci_1090', 0, 15, 0, NULL, NULL), (1091, 'DailyLevelDoneType16', 'ci_1091', 0, 15, 0, NULL, NULL), (1092, 'DailyLevelDoneType17', 'ci_1092', 0, 15, 0, NULL, NULL), (1093, 'DailyLevelDoneType18', 'ci_1093', 0, 15, 0, NULL, NULL), (1094, 'DailyLevelDoneType19', 'ci_1094', 0, 15, 0, NULL, NULL), (1095, 'DailyLevelDoneType20', 'ci_1095', 0, 15, 0, NULL, NULL), (1096, 'DailyLevelDoneType21', 'ci_1096', 0, 15, 0, NULL, NULL), (1097, 'DailyLevelDoneType22', 'ci_1097', 0, 15, 0, NULL, NULL), (1098, 'DailyLevelDoneType23', 'ci_1098', 0, 15, 0, NULL, NULL), (1099, 'DailyLevelDoneType24', 'ci_1099', 0, 15, 0, NULL, NULL), (1100, 'DailyLevelDoneType25', 'ci_1100', 0, 15, 0, NULL, NULL), (1101, 'DailyLevelDoneType26', 'ci_1101', 0, 15, 0, NULL, NULL), (1102, 'DailyLevelDoneType27', 'ci_1102', 0, 15, 0, NULL, NULL), (1103, 'DailyLevelDoneType28', 'ci_1103', 0, 15, 0, NULL, NULL), (1104, 'DailyLevelDoneType29', 'ci_1104', 0, 15, 0, NULL, NULL), (1105, 'DailyLevelDoneType30', 'ci_1105', 0, 15, 0, NULL, NULL), (1106, 'DailyLevelDoneType31', 'ci_1106', 0, 15, 0, NULL, NULL), (1107, 'DailyLevelDoneType32', 'ci_1107', 0, 15, 0, NULL, NULL), (1108, 'DailyLevelDoneType33', 'ci_1108', 0, 15, 0, NULL, NULL), (1109, 'DailyLevelDoneType34', 'ci_1109', 0, 15, 0, NULL, NULL), (1110, 'DailyLevelDoneType35', 'ci_1110', 0, 15, 0, NULL, NULL), (1111, 'DailyLevelDoneType36', 'ci_1111', 0, 15, 0, NULL, NULL), (1112, 'DailyLevelDoneType37', 'ci_1112', 0, 15, 0, NULL, NULL), (1113, 'DailyLevelDoneType38', 'ci_1113', 0, 15, 0, NULL, NULL), (1114, 'DailyLevelDoneType39', 'ci_1114', 0, 15, 0, NULL, NULL), (1115, 'DailyLevelDoneType40', 'ci_1115', 0, 15, 0, NULL, NULL), (1116, 'DailyLevelDoneType41', 'ci_1116', 0, 15, 0, NULL, NULL), (1117, 'DailyLevelDoneType42', 'ci_1117', 0, 15, 0, NULL, NULL), (1118, 'DailyLevelDoneType43', 'ci_1118', 0, 15, 0, NULL, NULL), (1119, 'DailyLevelDoneType44', 'ci_1119', 0, 15, 0, NULL, NULL), (1120, 'DailyLevelDoneType45', 'ci_1120', 0, 15, 0, NULL, NULL), (1121, 'DailyLevelDoneType46', 'ci_1121', 0, 15, 0, NULL, NULL), (1122, 'DailyLevelDoneType47', 'ci_1122', 0, 15, 0, NULL, NULL), (1123, 'DailyLevelDoneType48', 'ci_1123', 0, 15, 0, NULL, NULL), (1124, 'DailyLevelDoneType49', 'ci_1124', 0, 15, 0, NULL, NULL), (1125, 'DailyLevelDoneType50', 'ci_1125', 0, 15, 0, NULL, NULL), (1126, 'DailyLevelDoneType51', 'ci_1126', 0, 15, 0, NULL, NULL), (1127, 'DailyLevelDoneType52', 'ci_1127', 0, 15, 0, NULL, NULL), (1128, 'DailyLevelDoneType53', 'ci_1128', 0, 15, 0, NULL, NULL), (1129, 'DailyLevelDoneType54', 'ci_1129', 0, 15, 0, NULL, NULL), (1130, 'DailyLevelDoneType55', 'ci_1130', 0, 15, 0, NULL, NULL), (1131, 'DailyLevelDoneType56', 'ci_1131', 0, 15, 0, NULL, NULL), (1132, 'DailyLevelDoneType57', 'ci_1132', 0, 15, 0, NULL, NULL), (1133, 'DailyLevelDoneType58', 'ci_1133', 0, 15, 0, NULL, NULL), (1134, 'DailyLevelDoneType59', 'ci_1134', 0, 15, 0, NULL, NULL), (1135, 'rEasy', 'ci_1135', 0, 15, 0, NULL, NULL), (1136, 'rNormal', 'ci_1136', 0, 15, 0, NULL, NULL), (1137, 'rHard', 'ci_1137', 0, 15, 0, NULL, NULL), (1138, 'completed_hard_task_daily_goal', 'ci_1138', 0, 15, 0, NULL, NULL), (1139, 'DailyTask', 'ci_1139', 0, 15, 0, NULL, NULL), (1140, 'time_complete_all_happiness_task', 'ci_1140', 2, 15, 0, NULL, NULL), (1141, 'completed_all_happiness_tasks', 'ci_1141', 0, 15, 0, NULL, NULL), (1142, 'ItemDailyHappinessDone1', 'ci_1142', 0, 16, 0, NULL, NULL), (1143, 'ItemDailyHappinessDone2', 'ci_1143', 0, 16, 0, NULL, NULL), (1144, 'ItemDailyHappinessDone3', 'ci_1144', 0, 16, 0, NULL, NULL), (1145, 'ItemDailyHappinessDone4', 'ci_1145', 0, 16, 0, NULL, NULL), (1146, 'ItemDailyHappinessDone5', 'ci_1146', 0, 16, 0, NULL, NULL), (1147, 'TUTORIAL_DAILY_HAPPINESS', 'ci_1147', 0, 11, 0, NULL, NULL), (1148, 'TOTAL_DAYS_COMPLETE_DAILY_GOAL', 'ci_1148', 0, 13, 0, NULL, NULL), (1149, 'TOTAL_COIN_PANTRY', 'ci_1149', 0, 13, 0, NULL, NULL), (1150, 'total_win_level_happiness', 'ci_1150', 0, 16, 0, NULL, NULL), (1151, 'TIME_ACHIEVEMENT', 'ci_1151', 2, 12, 0, NULL, NULL), (1152, 'RandomBoostType1', 'ci_1152', 0, 15, 0, NULL, NULL), (1153, 'RandomBoostType2', 'ci_1153', 0, 15, 0, NULL, NULL), (1154, 'RandomBoostType3', 'ci_1154', 0, 15, 0, NULL, NULL);
INSERT INTO `config_data_sync_type` VALUES (1155, 'RandomBoostType4', 'ci_1155', 0, 15, 0, NULL, NULL), (1156, 'RandomBoostType5', 'ci_1156', 0, 15, 0, NULL, NULL), (1157, 'RandomBoostType6', 'ci_1157', 0, 15, 0, NULL, NULL), (1158, 'RandomBoostType7', 'ci_1158', 0, 15, 0, NULL, NULL), (1159, 'RandomBoostType8', 'ci_1159', 0, 15, 0, NULL, NULL), (1160, 'RandomBoostType9', 'ci_1160', 0, 15, 0, NULL, NULL), (1161, 'RandomBoostType10', 'ci_1161', 0, 15, 0, NULL, NULL), (1162, 'RandomBoostType11', 'ci_1162', 0, 15, 0, NULL, NULL), (1163, 'RandomBoostType12', 'ci_1163', 0, 15, 0, NULL, NULL), (1164, 'RandomBoostType13', 'ci_1164', 0, 15, 0, NULL, NULL), (1165, 'RandomBoostType14', 'ci_1165', 0, 15, 0, NULL, NULL), (1166, 'RandomBoostType15', 'ci_1166', 0, 15, 0, NULL, NULL), (1167, 'RandomBoostType16', 'ci_1167', 0, 15, 0, NULL, NULL), (1168, 'RandomBoostType17', 'ci_1168', 0, 15, 0, NULL, NULL), (1169, 'RandomBoostType18', 'ci_1169', 0, 15, 0, NULL, NULL), (1170, 'RandomBoostType19', 'ci_1170', 0, 15, 0, NULL, NULL), (1171, 'RandomBoostType20', 'ci_1171', 0, 15, 0, NULL, NULL), (1172, 'RandomBoostType21', 'ci_1172', 0, 15, 0, NULL, NULL), (1173, 'RandomBoostType22', 'ci_1173', 0, 15, 0, NULL, NULL), (1174, 'RandomBoostType23', 'ci_1174', 0, 15, 0, NULL, NULL), (1175, 'RandomBoostType24', 'ci_1175', 0, 15, 0, NULL, NULL), (1176, 'RandomBoostType25', 'ci_1176', 0, 15, 0, NULL, NULL), (1177, 'RandomBoostType26', 'ci_1177', 0, 15, 0, NULL, NULL), (1178, 'RandomBoostType27', 'ci_1178', 0, 15, 0, NULL, NULL), (1179, 'RandomBoostType28', 'ci_1179', 0, 15, 0, NULL, NULL), (1180, 'RandomBoostType29', 'ci_1180', 0, 15, 0, NULL, NULL), (1181, 'RandomBoostType30', 'ci_1181', 0, 15, 0, NULL, NULL), (1182, 'RandomBoostType31', 'ci_1182', 0, 15, 0, NULL, NULL), (1183, 'RandomBoostType32', 'ci_1183', 0, 15, 0, NULL, NULL), (1184, 'RandomBoostType33', 'ci_1184', 0, 15, 0, NULL, NULL), (1185, 'RandomBoostType34', 'ci_1185', 0, 15, 0, NULL, NULL), (1186, 'RandomBoostType35', 'ci_1186', 0, 15, 0, NULL, NULL), (1187, 'RandomBoostType36', 'ci_1187', 0, 15, 0, NULL, NULL), (1188, 'RandomBoostType37', 'ci_1188', 0, 15, 0, NULL, NULL), (1189, 'RandomBoostType38', 'ci_1189', 0, 15, 0, NULL, NULL), (1190, 'RandomBoostType39', 'ci_1190', 0, 15, 0, NULL, NULL), (1191, 'RandomBoostType40', 'ci_1191', 0, 15, 0, NULL, NULL), (1192, 'RandomBoostType41', 'ci_1192', 0, 15, 0, NULL, NULL), (1193, 'RandomBoostType42', 'ci_1193', 0, 15, 0, NULL, NULL), (1194, 'RandomBoostType43', 'ci_1194', 0, 15, 0, NULL, NULL), (1195, 'RandomBoostType44', 'ci_1195', 0, 15, 0, NULL, NULL), (1196, 'RandomBoostType45', 'ci_1196', 0, 15, 0, NULL, NULL), (1197, 'RandomBoostType46', 'ci_1197', 0, 15, 0, NULL, NULL), (1198, 'RandomBoostType47', 'ci_1198', 0, 15, 0, NULL, NULL), (1199, 'RandomBoostType48', 'ci_1199', 0, 15, 0, NULL, NULL), (1200, 'RandomBoostType49', 'ci_1200', 0, 15, 0, NULL, NULL), (1201, 'RandomBoostType50', 'ci_1201', 0, 15, 0, NULL, NULL), (1202, 'RandomBoostType51', 'ci_1202', 0, 15, 0, NULL, NULL), (1203, 'RandomBoostType52', 'ci_1203', 0, 15, 0, NULL, NULL), (1204, 'RandomBoostType53', 'ci_1204', 0, 15, 0, NULL, NULL), (1205, 'RandomBoostType54', 'ci_1205', 0, 15, 0, NULL, NULL), (1206, 'RandomBoostType55', 'ci_1206', 0, 15, 0, NULL, NULL), (1207, 'RandomBoostType56', 'ci_1207', 0, 15, 0, NULL, NULL), (1208, 'RandomBoostType57', 'ci_1208', 0, 15, 0, NULL, NULL), (1209, 'RandomBoostType58', 'ci_1209', 0, 15, 0, NULL, NULL), (1210, 'RandomBoostType59', 'ci_1210', 0, 15, 0, NULL, NULL), (1211, 'RESET_SCORE_ACHIEVEMENTType1', 'ci_1211', 0, 12, 0, NULL, NULL), (1212, 'RESET_SCORE_ACHIEVEMENTType2', 'ci_1212', 0, 12, 0, NULL, NULL), (1213, 'RESET_SCORE_ACHIEVEMENTType3', 'ci_1213', 0, 12, 0, NULL, NULL), (1214, 'RESET_SCORE_ACHIEVEMENTType4', 'ci_1214', 0, 12, 0, NULL, NULL), (1215, 'RESET_SCORE_ACHIEVEMENTType5', 'ci_1215', 0, 12, 0, NULL, NULL), (1216, 'RESET_SCORE_ACHIEVEMENTType6', 'ci_1216', 0, 12, 0, NULL, NULL), (1217, 'RESET_SCORE_ACHIEVEMENTType7', 'ci_1217', 0, 12, 0, NULL, NULL), (1218, 'RESET_SCORE_ACHIEVEMENTType8', 'ci_1218', 0, 12, 0, NULL, NULL), (1219, 'RESET_SCORE_ACHIEVEMENTType9', 'ci_1219', 0, 12, 0, NULL, NULL), (1220, 'RESET_SCORE_ACHIEVEMENTType10', 'ci_1220', 0, 12, 0, NULL, NULL), (1221, 'RESET_SCORE_ACHIEVEMENTType11', 'ci_1221', 0, 12, 0, NULL, NULL), (1222, 'RESET_SCORE_ACHIEVEMENTType12', 'ci_1222', 0, 12, 0, NULL, NULL), (1223, 'RESET_SCORE_ACHIEVEMENTType13', 'ci_1223', 0, 12, 0, NULL, NULL), (1224, 'RESET_SCORE_ACHIEVEMENTType14', 'ci_1224', 0, 12, 0, NULL, NULL), (1225, 'RESET_SCORE_ACHIEVEMENTType15', 'ci_1225', 0, 12, 0, NULL, NULL), (1226, 'RESET_SCORE_ACHIEVEMENTType16', 'ci_1226', 0, 12, 0, NULL, NULL), (1227, 'RESET_SCORE_ACHIEVEMENTType17', 'ci_1227', 0, 12, 0, NULL, NULL), (1228, 'RESET_SCORE_ACHIEVEMENTType18', 'ci_1228', 0, 12, 0, NULL, NULL), (1229, 'RESET_SCORE_ACHIEVEMENTType19', 'ci_1229', 0, 12, 0, NULL, NULL), (1230, 'RESET_SCORE_ACHIEVEMENTType20', 'ci_1230', 0, 12, 0, NULL, NULL), (1231, 'RESET_SCORE_ACHIEVEMENTType21', 'ci_1231', 0, 12, 0, NULL, NULL), (1232, 'RESET_SCORE_ACHIEVEMENTType22', 'ci_1232', 0, 12, 0, NULL, NULL), (1233, 'RESET_SCORE_ACHIEVEMENTType23', 'ci_1233', 0, 12, 0, NULL, NULL), (1234, 'RESET_SCORE_ACHIEVEMENTType24', 'ci_1234', 0, 12, 0, NULL, NULL), (1235, 'RESET_SCORE_ACHIEVEMENTType25', 'ci_1235', 0, 12, 0, NULL, NULL), (1236, 'RESET_SCORE_ACHIEVEMENTType26', 'ci_1236', 0, 12, 0, NULL, NULL), (1237, 'RESET_SCORE_ACHIEVEMENTType27', 'ci_1237', 0, 12, 0, NULL, NULL), (1238, 'RESET_SCORE_ACHIEVEMENTType28', 'ci_1238', 0, 12, 0, NULL, NULL), (1239, 'RESET_SCORE_ACHIEVEMENTType29', 'ci_1239', 0, 12, 0, NULL, NULL), (1240, 'RESET_SCORE_ACHIEVEMENTType30', 'ci_1240', 0, 12, 0, NULL, NULL), (1241, 'RESET_SCORE_ACHIEVEMENTType31', 'ci_1241', 0, 12, 0, NULL, NULL), (1242, 'RESET_SCORE_ACHIEVEMENTType32', 'ci_1242', 0, 12, 0, NULL, NULL), (1243, 'RESET_SCORE_ACHIEVEMENTType33', 'ci_1243', 0, 12, 0, NULL, NULL), (1244, 'RESET_SCORE_ACHIEVEMENTType34', 'ci_1244', 0, 12, 0, NULL, NULL), (1245, 'RESET_SCORE_ACHIEVEMENTType35', 'ci_1245', 0, 12, 0, NULL, NULL), (1246, 'RESET_SCORE_ACHIEVEMENTType36', 'ci_1246', 0, 12, 0, NULL, NULL), (1247, 'RESET_SCORE_ACHIEVEMENTType37', 'ci_1247', 0, 12, 0, NULL, NULL), (1248, 'RESET_SCORE_ACHIEVEMENTType38', 'ci_1248', 0, 12, 0, NULL, NULL), (1249, 'RESET_SCORE_ACHIEVEMENTType39', 'ci_1249', 0, 12, 0, NULL, NULL), (1250, 'RESET_SCORE_ACHIEVEMENTType40', 'ci_1250', 0, 12, 0, NULL, NULL), (1251, 'RESET_SCORE_ACHIEVEMENTType41', 'ci_1251', 0, 12, 0, NULL, NULL), (1252, 'RESET_SCORE_ACHIEVEMENTType42', 'ci_1252', 0, 12, 0, NULL, NULL), (1253, 'RESET_SCORE_ACHIEVEMENTType43', 'ci_1253', 0, 12, 0, NULL, NULL), (1254, 'RESET_SCORE_ACHIEVEMENTType44', 'ci_1254', 0, 12, 0, NULL, NULL), (1255, 'RESET_SCORE_ACHIEVEMENTType45', 'ci_1255', 0, 12, 0, NULL, NULL), (1256, 'RESET_SCORE_ACHIEVEMENTType46', 'ci_1256', 0, 12, 0, NULL, NULL), (1257, 'RESET_SCORE_ACHIEVEMENTType47', 'ci_1257', 0, 12, 0, NULL, NULL), (1258, 'RESET_SCORE_ACHIEVEMENTType48', 'ci_1258', 0, 12, 0, NULL, NULL), (1259, 'RESET_SCORE_ACHIEVEMENTType49', 'ci_1259', 0, 12, 0, NULL, NULL), (1260, 'RESET_SCORE_ACHIEVEMENTType50', 'ci_1260', 0, 12, 0, NULL, NULL), (1261, 'RESET_SCORE_ACHIEVEMENTType51', 'ci_1261', 0, 12, 0, NULL, NULL), (1262, 'RESET_SCORE_ACHIEVEMENTType52', 'ci_1262', 0, 12, 0, NULL, NULL), (1263, 'RESET_SCORE_ACHIEVEMENTType53', 'ci_1263', 0, 12, 0, NULL, NULL), (1264, 'RESET_SCORE_ACHIEVEMENTType54', 'ci_1264', 0, 12, 0, NULL, NULL), (1265, 'RESET_SCORE_ACHIEVEMENTType55', 'ci_1265', 0, 12, 0, NULL, NULL), (1266, 'RESET_SCORE_ACHIEVEMENTType56', 'ci_1266', 0, 12, 0, NULL, NULL), (1267, 'RESET_SCORE_ACHIEVEMENTType57', 'ci_1267', 0, 12, 0, NULL, NULL), (1268, 'RESET_SCORE_ACHIEVEMENTType58', 'ci_1268', 0, 12, 0, NULL, NULL), (1269, 'RESET_SCORE_ACHIEVEMENTType59', 'ci_1269', 0, 12, 0, NULL, NULL), (1270, 'RESET_SCORE_ACHIEVEMENTType60', 'ci_1270', 0, 12, 0, NULL, NULL), (1271, 'RESET_SCORE_ACHIEVEMENTType61', 'ci_1271', 0, 12, 0, NULL, NULL), (1272, 'RESET_SCORE_ACHIEVEMENTType62', 'ci_1272', 0, 12, 0, NULL, NULL), (1273, 'RESET_SCORE_ACHIEVEMENTType63', 'ci_1273', 0, 12, 0, NULL, NULL), (1274, 'RESET_SCORE_ACHIEVEMENTType64', 'ci_1274', 0, 12, 0, NULL, NULL), (1275, 'RESET_SCORE_ACHIEVEMENTType65', 'ci_1275', 0, 12, 0, NULL, NULL), (1276, 'DEDICATION_ACHIEVEMENT', 'ci_1276', 0, 12, 0, NULL, NULL), (1277, 'LevelCupcake', 'ci_1277', 0, 13, 0, NULL, NULL), (1278, 'TIME_OBTAIN_1_STAR', 'ci_1278', 2, 12, 0, NULL, NULL), (1279, 'TutorialLuckyBox', 'ci_1279', 0, 11, 0, NULL, NULL), (1280, 'GO_STREAKING_ACHIEVEMENT', 'ci_1280', 0, 11, 0, NULL, NULL), (1281, 'total_win_level_daily_rewad', 'ci_1281', 0, 13, 0, NULL, NULL), (1282, 'TimePack1', 'ci_1282', 2, 13, 0, NULL, NULL), (1283, 'HasOffer1', 'ci_1283', 2, 13, 0, NULL, NULL), (1284, 'HasOffer', 'ci_1284', 2, 13, 0, NULL, NULL), (1285, 'TimePack', 'ci_1285', 2, 13, 0, NULL, NULL), (1286, 'LastShowOffer', 'ci_1286', 0, 13, 0, NULL, NULL), (1287, 'TIME_INFINITE_HEART', 'ci_1287', 2, 13, 0, NULL, NULL), (1288, 'buyAnyThing', 'ci_1288', 0, 13, 0, NULL, NULL), (1289, 'keyBuyedIAP', 'ci_1289', 0, 13, 0, NULL, NULL), (1290, 'SpinTime', 'ci_1290', 0, 13, 0, NULL, NULL), (1291, 'SpineWhell_Open', 'ci_1291', 0, 13, 0, NULL, NULL), (1292, 'WheelCount', 'ci_1292', 0, 13, 0, NULL, NULL), (1293, 'Money', 'ci_1293', 1, 13, 0, NULL, NULL), (1294, 'timeWatchAdGameWin', 'ci_1294', 2, 13, 0, NULL, 'Test need remove'), (1295, 'keyNumWatchAdGameWin', 'ci_1295', 0, 13, 0, NULL, 'bvbvbcvb'), (1296, 'keyNumLevelShowWatchAds', 'ci_1296', 0, 13, 0, NULL, NULL), (1297, 'TutorialWatchVideo', 'ci_1297', 0, 13, 0, NULL, '5');
COMMIT;

-- ----------------------------
-- Table structure for config_files
-- ----------------------------
DROP TABLE IF EXISTS `config_files`;
CREATE TABLE `config_files`  (
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `curr_md5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_md5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`filename`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of config_files
-- ----------------------------
BEGIN;
INSERT INTO `config_files` VALUES ('config_data_sync_type.json', '[[\"is_merged_cloud_data\", \"ci_0\", 0, 0, 0, null],[\"PlayerCoins\", \"ci_1\", 0, 0, 0, null],[\"PlayerGems1\", \"ci_2\", 0, 0, 0, null],[\"PlayerCard\", \"ci_3\", 0, 0, 0, null],[\"PlayerStar\", \"ci_4\", 0, 0, 0, null],[\"PlayerHeart\", \"ci_5\", 0, 0, 0, null],[\"Levels\", \"ci_6\", 0, 0, 0, null],[\"LevelUnlock\", \"ci_7\", 0, 0, 0, null],[\"numberNotFire\", \"ci_8\", 0, 0, 0, null],[\"numberDoubleCoin\", \"ci_9\", 0, 0, 0, null],[\"numberFastCook\", \"ci_10\", 0, 0, 0, null],[\"BoostTimeCharacter\", \"ci_11\", 0, 0, 0, null],[\"BoostFastFood\", \"ci_12\", 0, 0, 0, null],[\"NumberCupcake\", \"ci_13\", 0, 0, 0, null],[\"DayBuyVip1\", \"ci_14\", 2, 9998, 0, null],[\"DayBuyVip2\", \"ci_15\", 2, 9998, 0, null],[\"com.fme.cookit.vip1new\", \"ci_16\", 0, 9998, 0, null],[\"com.fme.cookit.vip2\", \"ci_17\", 0, 9998, 0, null],[\"is_buy_starter_pack\", \"ci_18\", 0, 13, 0, null],[\"isAlreadyRateGame\", \"ci_19\", 0, 13, 0, null],[\"isReward5GemFB\", \"ci_20\", 0, 13, 0, null],[\"LikeFB\", \"ci_21\", 0, 13, 0, null],[\"Pinterest\", \"ci_22\", 0, 13, 0, null],[\"Pan1\", \"ci_23\", 0, 1, 0, null],[\"Disk1\", \"ci_24\", 0, 1, 0, null],[\"BurgerUp\", \"ci_25\", 0, 1, 0, null],[\"MeatUp\", \"ci_26\", 0, 1, 0, null],[\"BaconUp\", \"ci_27\", 0, 1, 0, null],[\"CokeUp\", \"ci_28\", 0, 1, 0, null],[\"SodaUp\", \"ci_29\", 0, 1, 0, null],[\"CheeseUp\", \"ci_30\", 0, 1, 0, null],[\"LettuceUp\", \"ci_31\", 0, 1, 0, null],[\"TomatoUp\", \"ci_32\", 0, 1, 0, null],[\"CakeShopPanVanillaUp\", \"ci_33\", 0, 2, 0, null],[\"CakeShopDishCakeUp\", \"ci_34\", 0, 2, 0, null],[\"CakeShopDishCanolliUp\", \"ci_35\", 0, 2, 0, null],[\"CakeShopStrawBerryUp\", \"ci_36\", 0, 2, 0, null],[\"CakeShopChocolateFlakeUp\", \"ci_37\", 0, 2, 0, null],[\"CakeShopBlueBurryUp\", \"ci_38\", 0, 2, 0, null],[\"CakeShopPinkUp\", \"ci_39\", 0, 2, 0, null],[\"CakeShopChocolateIcingUp\", \"ci_40\", 0, 2, 0, null],[\"CakeShopWhiteUp\", \"ci_41\", 0, 2, 0, null],[\"CakeShopCreamUp\", \"ci_42\", 0, 2, 0, null],[\"CakeShopCreamMachineUp\", \"ci_43\", 0, 2, 0, null],[\"CakeShopCanolliUp\", \"ci_44\", 0, 2, 0, null],[\"CakeShopVanillaUp\", \"ci_45\", 0, 2, 0, null],[\"RiceUp\", \"ci_46\", 0, 3, 0, null],[\"SeaweedUp\", \"ci_47\", 0, 3, 0, null],[\"AvocadoUp\", \"ci_48\", 0, 3, 0, null],[\"TunaUp\", \"ci_49\", 0, 3, 0, null],[\"SalmonUp\", \"ci_50\", 0, 3, 0, null],[\"WasabiUp\", \"ci_51\", 0, 3, 0, null],[\"OnionUp\", \"ci_52\", 0, 3, 0, null],[\"TeaUp\", \"ci_53\", 0, 3, 0, null],[\"TeaMachineUp\", \"ci_54\", 0, 3, 0, null],[\"PanSushiUp\", \"ci_55\", 0, 6, 0, null],[\"DishSushiUp\", \"ci_56\", 0, 6, 0, null],[\"PanSoupUp\", \"ci_57\", 0, 6, 0, null],[\"SoupUp\", \"ci_58\", 0, 6, 0, null],[\"MexicanBurritoUp\", \"ci_59\", 0, 3, 0, null],[\"MexicanTacoUp\", \"ci_60\", 0, 3, 0, null],[\"MexicanSaladUp\", \"ci_61\", 0, 3, 0, null],[\"MexicanCheeseUp\", \"ci_62\", 0, 3, 0, null],[\"MexicanTomatoUp\", \"ci_63\", 0, 3, 0, null],[\"MexicanMeatTacoUp\", \"ci_64\", 0, 3, 0, null],[\"MexicanMeatBurritoUp\", \"ci_65\", 0, 3, 0, null],[\"MexicanRiceUp\", \"ci_66\", 0, 3, 0, null],[\"MexicanSodaUp\", \"ci_67\", 0, 3, 0, null],[\"MexicanGuacamolUp\", \"ci_68\", 0, 3, 0, null],[\"MexicanSodaMachineUp\", \"ci_69\", 0, 3, 0, null],[\"MexicanGuacamolMachineUp\", \"ci_70\", 0, 3, 0, null],[\"MexicanPanBurrito\", \"ci_71\", 0, 3, 0, null],[\"MexicanPanTaco\", \"ci_72\", 0, 3, 0, null],[\"MexicanDishTaco\", \"ci_73\", 0, 3, 0, null],[\"MexicanDishBurrito\", \"ci_74\", 0, 3, 0, null],[\"DonutPanDonut\", \"ci_75\", 0, 4, 0, null],[\"DonutDishDonut\", \"ci_76\", 0, 4, 0, null],[\"DonutVanillaUp\", \"ci_77\", 0, 4, 0, null],[\"DonutChocolateUp\", \"ci_78\", 0, 4, 0, null],[\"DonutChocolateIcingUp\", \"ci_79\", 0, 4, 0, null],[\"DonutSugarUp\", \"ci_80\", 0, 4, 0, null],[\"DonutJellyUp\", \"ci_81\", 0, 4, 0, null],[\"DonutSwirlUp\", \"ci_82\", 0, 4, 0, null],[\"DonutHoleUp\", \"ci_83\", 0, 4, 0, null],[\"DonutHoleMachineUp\", \"ci_84\", 0, 4, 0, null],[\"DonutCoffeUp\", \"ci_85\", 0, 4, 0, null],[\"DonutCoffeMachineUp\", \"ci_86\", 0, 4, 0, null],[\"DonutPan7\", \"ci_87\", 0, 4, 0, null],[\"DishDonut7\", \"ci_88\", 0, 4, 0, null],[\"SubwayPan\", \"ci_89\", 0, 5, 0, null],[\"SubwayDish\", \"ci_90\", 0, 5, 0, null],[\"Donut7Up\", \"ci_91\", 0, 5, 0, null],[\"Bun7Up\", \"ci_92\", 0, 5, 0, null],[\"Soda7Up\", \"ci_93\", 0, 5, 0, null],[\"MachineSoda7Up\", \"ci_94\", 0, 5, 0, null],[\"Salad7Up\", \"ci_95\", 0, 5, 0, null],[\"Meat7Up\", \"ci_96\", 0, 5, 0, null],[\"Cheese7Up\", \"ci_97\", 0, 5, 0, null],[\"Tomato7Up\", \"ci_98\", 0, 5, 0, null],[\"Soup7Up\", \"ci_99\", 0, 5, 0, null],[\"MachineSoup7Up\", \"ci_100\", 0, 5, 0, null],[\"OvenPizza\", \"ci_101\", 0, 7, 0, null],[\"DishPizza\", \"ci_102\", 0, 7, 0, null],[\"PeppersUp\", \"ci_103\", 0, 7, 0, null],[\"ChickenUp\", \"ci_104\", 0, 7, 0, null],[\"ChickenMachineUp\", \"ci_105\", 0, 7, 0, null],[\"BunPizzaUp\", \"ci_106\", 0, 7, 0, null],[\"PepperoniUp\", \"ci_107\", 0, 7, 0, null],[\"MozarellaUp\", \"ci_108\", 0, 7, 0, null],[\"SauceUp\", \"ci_109\", 0, 7, 0, null],[\"SodaPizzaUp\", \"ci_110\", 0, 7, 0, null],[\"MushroomsUp\", \"ci_111\", 0, 7, 0, null],[\"MSodaPizzaUp\", \"ci_112\", 0, 7, 0, null],[\"FishPan\", \"ci_113\", 0, 8, 0, null],[\"ShrimpPan\", \"ci_114\", 0, 8, 0, null],[\"FishPlate\", \"ci_115\", 0, 8, 0, null],[\"ShrimpPlate\", \"ci_116\", 0, 8, 0, null],[\"FishUp\", \"ci_117\", 0, 8, 0, null],[\"ShrimpUp\", \"ci_118\", 0, 8, 0, null],[\"MazineUp\", \"ci_119\", 0, 8, 0, null],[\"Soda3Up\", \"ci_120\", 0, 8, 0, null],[\"CokeMachineUp\", \"ci_121\", 0, 8, 0, null],[\"SoupMachineUp\", \"ci_122\", 0, 8, 0, null],[\"SaladsUp\", \"ci_123\", 0, 8, 0, null],[\"LemondUp\", \"ci_124\", 0, 8, 0, null],[\"Lettuce2Up\", \"ci_125\", 0, 8, 0, null],[\"SoupUp2\", \"ci_126\", 0, 8, 0, null],[\"IceCreamWaffleUp\", \"ci_127\", 0, 9, 0, null],[\"IceCreamCreamWaffleUp\", \"ci_128\", 0, 9, 0, null],[\"IceCreamCherryUp\", \"ci_129\", 0, 9, 0, null],[\"IceCreamSauceUp\", \"ci_130\", 0, 9, 0, null],[\"IceCreamCookieUp\", \"ci_131\", 0, 9, 0, null],[\"IceCreamCreamCookieUp\", \"ci_132\", 0, 9, 0, null],[\"IceCreamChocolateUp\", \"ci_133\", 0, 9, 0, null],[\"IceCreamSprinkesUp\", \"ci_134\", 0, 9, 0, null],[\"IceCreamBeerUp\", \"ci_135\", 0, 9, 0, null],[\"IceCreamBeerMachineUp\", \"ci_136\", 0, 9, 0, null],[\"IceCreamPanWaffle\", \"ci_137\", 0, 9, 0, null],[\"IceCreamPanCookie\", \"ci_138\", 0, 9, 0, null],[\"IceCreamDishWaffle\", \"ci_139\", 0, 9, 0, null],[\"IceCreamDishCookie\", \"ci_140\", 0, 9, 0, null],[\"DecorateBurgercar1\", \"ci_141\", 0, 1, 0, null],[\"DecorateBurgercar2\", \"ci_142\", 0, 1, 0, null],[\"DecorateBurgercar3\", \"ci_143\", 0, 1, 0, null],[\"DecorateBurgerchar1\", \"ci_144\", 0, 1, 0, null],[\"DecorateBurgerchar2\", \"ci_145\", 0, 1, 0, null],[\"DecorateBurgerchar3\", \"ci_146\", 0, 1, 0, null],[\"DecorateBurgertable1\", \"ci_147\", 0, 1, 0, null],[\"DecorateBurgertable2\", \"ci_148\", 0, 1, 0, null],[\"DecorateBurgertable3\", \"ci_149\", 0, 1, 0, null],[\"DecorateBurgerflower1\", \"ci_150\", 0, 1, 0, null],[\"DecorateBurgerflower2\", \"ci_151\", 0, 1, 0, null],[\"DecorateBurgerflower3\", \"ci_152\", 0, 1, 0, null],[\"DecorateBurgermachine1\", \"ci_153\", 0, 1, 0, null],[\"DecorateBurgermachine2\", \"ci_154\", 0, 1, 0, null],[\"DecorateBurgermachine3\", \"ci_155\", 0, 1, 0, null],[\"DecorateBurgerLevel\", \"ci_156\", 0, 1, 0, null],[\"KEY_CLAIM_BURGER\", \"ci_157\", 0, 1, 0, null],[\"DecorateBurgeUsercar\", \"ci_158\", 0, 1, 0, null],[\"DecorateBurgerUsechar\", \"ci_159\", 0, 1, 0, null],[\"DecorateBurgerUsetable\", \"ci_160\", 0, 1, 0, null],[\"DecorateBurgerUseflower\", \"ci_161\", 0, 1, 0, null],[\"DecorateBurgerUsemachine\", \"ci_162\", 0, 1, 0, null],[\"DecorateCakecrown1\", \"ci_163\", 0, 2, 0, null],[\"DecorateCakecrown2\", \"ci_164\", 0, 2, 0, null],[\"DecorateCakecrown3\", \"ci_165\", 0, 2, 0, null],[\"DecorateCakebag1\", \"ci_166\", 0, 2, 0, null],[\"DecorateCakebag2\", \"ci_167\", 0, 2, 0, null],[\"DecorateCakebag3\", \"ci_168\", 0, 2, 0, null],[\"DecorateCaketable1\", \"ci_169\", 0, 2, 0, null],[\"DecorateCaketable2\", \"ci_170\", 0, 2, 0, null],[\"DecorateCaketable3\", \"ci_171\", 0, 2, 0, null],[\"DecorateCakeflower1\", \"ci_172\", 0, 2, 0, null],[\"DecorateCakeflower2\", \"ci_173\", 0, 2, 0, null],[\"DecorateCakeflower3\", \"ci_174\", 0, 2, 0, null],[\"DecorateCakepicture1\", \"ci_175\", 0, 2, 0, null],[\"DecorateCakepicture2\", \"ci_176\", 0, 2, 0, null],[\"DecorateCakepicture3\", \"ci_177\", 0, 2, 0, null],[\"DecorateCakeLevel\", \"ci_178\", 0, 2, 0, null],[\"KEY_CLAIM_CAKE\", \"ci_179\", 0, 2, 0, null],[\"DecorateCakeUsecrown\", \"ci_180\", 0, 2, 0, null],[\"DecorateCakeUsebag\", \"ci_181\", 0, 2, 0, null],[\"DecorateCakeUsetable\", \"ci_182\", 0, 2, 0, null],[\"DecorateCakeUseflower\", \"ci_183\", 0, 2, 0, null],[\"DecorateCakeUsepicture\", \"ci_184\", 0, 2, 0, null],[\"DecorateMexicananimal1\", \"ci_185\", 0, 3, 0, null],[\"DecorateMexicananimal2\", \"ci_186\", 0, 3, 0, null],[\"DecorateMexicananimal3\", \"ci_187\", 0, 3, 0, null],[\"DecorateMexicanchar1\", \"ci_188\", 0, 3, 0, null],[\"DecorateMexicanchar2\", \"ci_189\", 0, 3, 0, null],[\"DecorateMexicanchar3\", \"ci_190\", 0, 3, 0, null],[\"DecorateMexicantable1\", \"ci_191\", 0, 3, 0, null],[\"DecorateMexicantable2\", \"ci_192\", 0, 3, 0, null],[\"DecorateMexicantable3\", \"ci_193\", 0, 3, 0, null],[\"DecorateMexicantree1\", \"ci_194\", 0, 3, 0, null],[\"DecorateMexicantree2\", \"ci_195\", 0, 3, 0, null],[\"DecorateMexicantree3\", \"ci_196\", 0, 3, 0, null],[\"DecorateMexicanpicture1\", \"ci_197\", 0, 3, 0, null],[\"DecorateMexicanpicture2\", \"ci_198\", 0, 3, 0, null],[\"DecorateMexicanpicture3\", \"ci_199\", 0, 3, 0, null],[\"DecorateMexicanLevel\", \"ci_200\", 0, 3, 0, null],[\"KEY_CLAIM_MEXICAN\", \"ci_201\", 0, 3, 0, null],[\"DecorateMexicanUseanimal\", \"ci_202\", 0, 3, 0, null],[\"DecorateMexicanUsechar\", \"ci_203\", 0, 3, 0, null],[\"DecorateMexicanUsetable\", \"ci_204\", 0, 3, 0, null],[\"DecorateMexicanUsetree\", \"ci_205\", 0, 3, 0, null],[\"DecorateMexicanUsepicture\", \"ci_206\", 0, 3, 0, null],[\"DecorateSushitree1\", \"ci_207\", 0, 6, 0, null],[\"DecorateSushitree2\", \"ci_208\", 0, 6, 0, null],[\"DecorateSushitree3\", \"ci_209\", 0, 6, 0, null],[\"DecorateSushichar1\", \"ci_210\", 0, 6, 0, null],[\"DecorateSushichar2\", \"ci_211\", 0, 6, 0, null],[\"DecorateSushichar3\", \"ci_212\", 0, 6, 0, null],[\"DecorateSushitable1\", \"ci_213\", 0, 6, 0, null],[\"DecorateSushitable2\", \"ci_214\", 0, 6, 0, null],[\"DecorateSushitable3\", \"ci_215\", 0, 6, 0, null],[\"DecorateSushiplant1\", \"ci_216\", 0, 6, 0, null],[\"DecorateSushiplant2\", \"ci_217\", 0, 6, 0, null],[\"DecorateSushiplant3\", \"ci_218\", 0, 6, 0, null],[\"DecorateSushipicture1\", \"ci_219\", 0, 6, 0, null],[\"DecorateSushipicture2\", \"ci_220\", 0, 6, 0, null],[\"DecorateSushipicture3\", \"ci_221\", 0, 6, 0, null],[\"DecorateSushiLevel\", \"ci_222\", 0, 6, 0, null],[\"KEY_CLAIM_SUSHI\", \"ci_223\", 0, 6, 0, null],[\"DecorateSushiUsetree\", \"ci_224\", 0, 6, 0, null],[\"DecorateSushiUsechar\", \"ci_225\", 0, 6, 0, null],[\"DecorateSushiUsetable\", \"ci_226\", 0, 6, 0, null],[\"DecorateSushiUseplant\", \"ci_227\", 0, 6, 0, null],[\"DecorateSushiUsepicture\", \"ci_228\", 0, 6, 0, null],[\"DecorateDonutcandy1\", \"ci_229\", 0, 4, 0, null],[\"DecorateDonutcandy2\", \"ci_230\", 0, 4, 0, null],[\"DecorateDonutcandy3\", \"ci_231\", 0, 4, 0, null],[\"DecorateDonuttable1\", \"ci_232\", 0, 4, 0, null],[\"DecorateDonuttable2\", \"ci_233\", 0, 4, 0, null],[\"DecorateDonuttable3\", \"ci_234\", 0, 4, 0, null],[\"DecorateDonuttree1\", \"ci_235\", 0, 4, 0, null],[\"DecorateDonuttree2\", \"ci_236\", 0, 4, 0, null],[\"DecorateDonuttree3\", \"ci_237\", 0, 4, 0, null],[\"DecorateDonutanimal1\", \"ci_238\", 0, 4, 0, null],[\"DecorateDonutanimal2\", \"ci_239\", 0, 4, 0, null],[\"DecorateDonutanimal3\", \"ci_240\", 0, 4, 0, null],[\"DecorateDonutLevel\", \"ci_241\", 0, 4, 0, null],[\"KEY_CLAIM_DONUT\", \"ci_242\", 0, 4, 0, null],[\"DecorateDonutUsecandy\", \"ci_243\", 0, 4, 0, null],[\"DecorateDonutUsetable\", \"ci_244\", 0, 4, 0, null],[\"DecorateDonutUsetree\", \"ci_245\", 0, 4, 0, null],[\"DecorateDonutUseanimal\", \"ci_246\", 0, 4, 0, null],[\"DecorateSubwaycandy1\", \"ci_247\", 0, 5, 0, null],[\"DecorateSubwaycandy2\", \"ci_248\", 0, 5, 0, null],[\"DecorateSubwaycandy3\", \"ci_249\", 0, 5, 0, null],[\"DecorateSubwaybox1\", \"ci_250\", 0, 5, 0, null],[\"DecorateSubwaybox2\", \"ci_251\", 0, 5, 0, null],[\"DecorateSubwaybox3\", \"ci_252\", 0, 5, 0, null],[\"DecorateSubwaytable1\", \"ci_253\", 0, 5, 0, null],[\"DecorateSubwaytable2\", \"ci_254\", 0, 5, 0, null],[\"DecorateSubwaytable3\", \"ci_255\", 0, 5, 0, null],[\"DecorateSubwaytree1\", \"ci_256\", 0, 5, 0, null],[\"DecorateSubwaytree2\", \"ci_257\", 0, 5, 0, null],[\"DecorateSubwaytree3\", \"ci_258\", 0, 5, 0, null],[\"DecorateSubwaymachine1\", \"ci_259\", 0, 5, 0, null],[\"DecorateSubwaymachine2\", \"ci_260\", 0, 5, 0, null],[\"DecorateSubwaymachine3\", \"ci_261\", 0, 5, 0, null],[\"DecorateSubwayLevel\", \"ci_262\", 0, 5, 0, null],[\"KEY_CLAIM_SUBWAY\", \"ci_263\", 0, 5, 0, null],[\"DecorateSubwayUsecandy\", \"ci_264\", 0, 5, 0, null],[\"DecorateSubwayUsebox\", \"ci_265\", 0, 5, 0, null],[\"DecorateSubwayUsetable\", \"ci_266\", 0, 5, 0, null],[\"DecorateSubwayUsetree\", \"ci_267\", 0, 5, 0, null],[\"DecorateSubwayUsemachine\", \"ci_268\", 0, 5, 0, null],[\"DecoratePizzaleft1\", \"ci_269\", 0, 7, 0, null],[\"DecoratePizzaleft2\", \"ci_270\", 0, 7, 0, null],[\"DecoratePizzaleft3\", \"ci_271\", 0, 7, 0, null],[\"DecoratePizzaright1\", \"ci_272\", 0, 7, 0, null],[\"DecoratePizzaright2\", \"ci_273\", 0, 7, 0, null],[\"DecoratePizzaright3\", \"ci_274\", 0, 7, 0, null],[\"DecoratePizzatable1\", \"ci_275\", 0, 7, 0, null],[\"DecoratePizzatable2\", \"ci_276\", 0, 7, 0, null],[\"DecoratePizzatable3\", \"ci_277\", 0, 7, 0, null],[\"DecoratePizzatree1\", \"ci_278\", 0, 7, 0, null],[\"DecoratePizzatree2\", \"ci_279\", 0, 7, 0, null],[\"DecoratePizzatree3\", \"ci_280\", 0, 7, 0, null],[\"DecoratePizzapicture1\", \"ci_281\", 0, 7, 0, null],[\"DecoratePizzapicture2\", \"ci_282\", 0, 7, 0, null],[\"DecoratePizzapicture3\", \"ci_283\", 0, 7, 0, null],[\"DecoratePizzaLevel\", \"ci_284\", 0, 7, 0, null],[\"KEY_CLAIM_PIZZA\", \"ci_285\", 0, 7, 0, null],[\"DecoratePizzaUseleft\", \"ci_286\", 0, 7, 0, null],[\"DecoratePizzaUseright\", \"ci_287\", 0, 7, 0, null],[\"DecoratePizzaUsetable\", \"ci_288\", 0, 7, 0, null],[\"DecoratePizzaUsetree\", \"ci_289\", 0, 7, 0, null],[\"DecoratePizzaUsepicture\", \"ci_290\", 0, 7, 0, null],[\"DecorateSeafoodbottle1\", \"ci_291\", 0, 8, 0, null],[\"DecorateSeafoodbottle2\", \"ci_292\", 0, 8, 0, null],[\"DecorateSeafoodbottle3\", \"ci_293\", 0, 8, 0, null],[\"DecorateSeafoodchar1\", \"ci_294\", 0, 8, 0, null],[\"DecorateSeafoodchar2\", \"ci_295\", 0, 8, 0, null],[\"DecorateSeafoodchar3\", \"ci_296\", 0, 8, 0, null],[\"DecorateSeafoodtable1\", \"ci_297\", 0, 8, 0, null],[\"DecorateSeafoodtable2\", \"ci_298\", 0, 8, 0, null],[\"DecorateSeafoodtable3\", \"ci_299\", 0, 8, 0, null],[\"DecorateSeafoodtree1\", \"ci_300\", 0, 8, 0, null],[\"DecorateSeafoodtree2\", \"ci_301\", 0, 8, 0, null],[\"DecorateSeafoodtree3\", \"ci_302\", 0, 8, 0, null],[\"DecorateSeafoodpicture1\", \"ci_303\", 0, 8, 0, null],[\"DecorateSeafoodpicture2\", \"ci_304\", 0, 8, 0, null],[\"DecorateSeafoodpicture3\", \"ci_305\", 0, 8, 0, null],[\"DecorateSeafoodLevel\", \"ci_306\", 0, 8, 0, null],[\"KEY_CLAIM_SEAFOOD\", \"ci_307\", 0, 8, 0, null],[\"DecorateSeafoodUsebottle\", \"ci_308\", 0, 8, 0, null],[\"DecorateSeafoodUsechar\", \"ci_309\", 0, 8, 0, null],[\"DecorateSeafoodUsetable\", \"ci_310\", 0, 8, 0, null],[\"DecorateSeafoodUsetree\", \"ci_311\", 0, 8, 0, null],[\"DecorateSeafoodUsepicture\", \"ci_312\", 0, 8, 0, null],[\"DecorateCreamcandy1\", \"ci_313\", 0, 9, 0, null],[\"DecorateCreamcandy2\", \"ci_314\", 0, 9, 0, null],[\"DecorateCreamcandy3\", \"ci_315\", 0, 9, 0, null],[\"DecorateCreambear1\", \"ci_316\", 0, 9, 0, null],[\"DecorateCreambear2\", \"ci_317\", 0, 9, 0, null],[\"DecorateCreambear3\", \"ci_318\", 0, 9, 0, null],[\"DecorateCreamtable1\", \"ci_319\", 0, 9, 0, null],[\"DecorateCreamtable2\", \"ci_320\", 0, 9, 0, null],[\"DecorateCreamtable3\", \"ci_321\", 0, 9, 0, null],[\"DecorateCreamflower1\", \"ci_322\", 0, 9, 0, null],[\"DecorateCreamflower2\", \"ci_323\", 0, 9, 0, null],[\"DecorateCreamflower3\", \"ci_324\", 0, 9, 0, null],[\"DecorateCreampicture1\", \"ci_325\", 0, 9, 0, null],[\"DecorateCreampicture2\", \"ci_326\", 0, 9, 0, null],[\"DecorateCreampicture3\", \"ci_327\", 0, 9, 0, null],[\"DecorateCreamLevel\", \"ci_328\", 0, 9, 0, null],[\"KEY_CLAIM_CREAM\", \"ci_329\", 0, 9, 0, null],[\"DecorateCreamUsecandy\", \"ci_330\", 0, 9, 0, null],[\"DecorateCreamUsebear\", \"ci_331\", 0, 9, 0, null],[\"DecorateCreamUsetable\", \"ci_332\", 0, 9, 0, null],[\"DecorateCreamUseflower\", \"ci_333\", 0, 9, 0, null],[\"DecorateCreamUsepicture\", \"ci_334\", 0, 9, 0, null],[\"NUM_TICKET_ENDLESS\", \"ci_335\", 0, 0, 0, null],[\"KEY_OPEN_ENDLESS\", \"ci_336\", 0, 11, 0, null],[\"OPEN_ENDLESS_BURGER\", \"ci_337\", 0, 11, 0, null],[\"OPEN_ENDLESS_CAKE\", \"ci_338\", 0, 11, 0, null],[\"OPEN_ENDLESS_MEXICAN\", \"ci_339\", 0, 11, 0, null],[\"OPEN_ENDLESS_DONUT\", \"ci_340\", 0, 11, 0, null],[\"OPEN_ENDLESS_SUBWAY\", \"ci_341\", 0, 11, 0, null],[\"OPEN_ENDLESS_SUSHI\", \"ci_342\", 0, 11, 0, null],[\"OPEN_ENDLESS_PIZZA\", \"ci_343\", 0, 11, 0, null],[\"OPEN_ENDLESS_SEAFOOD\", \"ci_344\", 0, 11, 0, null],[\"OPEN_ENDLESS_CREAM\", \"ci_345\", 0, 11, 0, null],[\"BEST_SCORE_BURGER\", \"ci_346\", 0, 11, 0, null],[\"BEST_SCORE_CAKE\", \"ci_347\", 0, 11, 0, null],[\"BEST_SCORE_MEXICAN\", \"ci_348\", 0, 11, 0, null],[\"BEST_SCORE_DONUT\", \"ci_349\", 0, 11, 0, null],[\"BEST_SCORE_SUBWAY\", \"ci_350\", 0, 11, 0, null],[\"BEST_SCORE_SUSHI\", \"ci_351\", 0, 11, 0, null],[\"BEST_SCORE_PIZZA\", \"ci_352\", 0, 11, 0, null],[\"BEST_SCORE_SEAFOOD\", \"ci_353\", 0, 11, 0, null],[\"BEST_SCORE_CREAM\", \"ci_354\", 0, 11, 0, null],[\"COIN_EARN_ENDLESS\", \"ci_355\", 0, 11, 0, null],[\"KEY_LEVEL_ENDLESS\", \"ci_356\", 0, 11, 0, null],[\"KEY_INDEX_RESTAURANT\", \"ci_357\", 0, 11, 0, null],[\"LevelDoneType1\", \"ci_358\", 0, 12, 0, null],[\"LevelDoneType2\", \"ci_359\", 0, 12, 0, null],[\"LevelDoneType3\", \"ci_360\", 0, 12, 0, null],[\"LevelDoneType4\", \"ci_361\", 0, 12, 0, null],[\"LevelDoneType5\", \"ci_362\", 0, 12, 0, null],[\"LevelDoneType6\", \"ci_363\", 0, 12, 0, null],[\"LevelDoneType7\", \"ci_364\", 0, 12, 0, null],[\"LevelDoneType8\", \"ci_365\", 0, 12, 0, null],[\"LevelDoneType9\", \"ci_366\", 0, 12, 0, null],[\"LevelDoneType10\", \"ci_367\", 0, 12, 0, null],[\"LevelDoneType11\", \"ci_368\", 0, 12, 0, null],[\"LevelDoneType12\", \"ci_369\", 0, 12, 0, null],[\"LevelDoneType13\", \"ci_370\", 0, 12, 0, null],[\"LevelDoneType14\", \"ci_371\", 0, 12, 0, null],[\"LevelDoneType15\", \"ci_372\", 0, 12, 0, null],[\"LevelDoneType16\", \"ci_373\", 0, 12, 0, null],[\"LevelDoneType17\", \"ci_374\", 0, 12, 0, null],[\"LevelDoneType18\", \"ci_375\", 0, 12, 0, null],[\"LevelDoneType19\", \"ci_376\", 0, 12, 0, null],[\"LevelDoneType20\", \"ci_377\", 0, 12, 0, null],[\"LevelDoneType21\", \"ci_378\", 0, 12, 0, null],[\"LevelDoneType22\", \"ci_379\", 0, 12, 0, null],[\"LevelDoneType23\", \"ci_380\", 0, 12, 0, null],[\"LevelDoneType24\", \"ci_381\", 0, 12, 0, null],[\"LevelDoneType25\", \"ci_382\", 0, 12, 0, null],[\"LevelDoneType26\", \"ci_383\", 0, 12, 0, null],[\"LevelDoneType27\", \"ci_384\", 0, 12, 0, null],[\"LevelDoneType28\", \"ci_385\", 0, 12, 0, null],[\"LevelDoneType29\", \"ci_386\", 0, 12, 0, null],[\"LevelDoneType30\", \"ci_387\", 0, 12, 0, null],[\"LevelDoneType31\", \"ci_388\", 0, 12, 0, null],[\"LevelDoneType32\", \"ci_389\", 0, 12, 0, null],[\"LevelDoneType33\", \"ci_390\", 0, 12, 0, null],[\"LevelDoneType34\", \"ci_391\", 0, 12, 0, null],[\"LevelDoneType35\", \"ci_392\", 0, 12, 0, null],[\"LevelDoneType36\", \"ci_393\", 0, 12, 0, null],[\"LevelDoneType37\", \"ci_394\", 0, 12, 0, null],[\"LevelDoneType38\", \"ci_395\", 0, 12, 0, null],[\"LevelDoneType39\", \"ci_396\", 0, 12, 0, null],[\"LevelDoneType40\", \"ci_397\", 0, 12, 0, null],[\"LevelDoneType41\", \"ci_398\", 0, 12, 0, null],[\"LevelDoneType42\", \"ci_399\", 0, 12, 0, null],[\"LevelDoneType43\", \"ci_400\", 0, 12, 0, null],[\"LevelDoneType44\", \"ci_401\", 0, 12, 0, null],[\"LevelDoneType45\", \"ci_402\", 0, 12, 0, null],[\"LevelDoneType46\", \"ci_403\", 0, 12, 0, null],[\"LevelDoneType47\", \"ci_404\", 0, 12, 0, null],[\"LevelDoneType48\", \"ci_405\", 0, 12, 0, null],[\"LevelDoneType49\", \"ci_406\", 0, 12, 0, null],[\"LevelDoneType50\", \"ci_407\", 0, 12, 0, null],[\"LevelDoneType51\", \"ci_408\", 0, 12, 0, null],[\"LevelDoneType52\", \"ci_409\", 0, 12, 0, null],[\"LevelDoneType53\", \"ci_410\", 0, 12, 0, null],[\"LevelDoneType54\", \"ci_411\", 0, 12, 0, null],[\"LevelDoneType55\", \"ci_412\", 0, 12, 0, null],[\"LevelDoneType56\", \"ci_413\", 0, 12, 0, null],[\"LevelDoneType57\", \"ci_414\", 0, 12, 0, null],[\"LevelDoneType58\", \"ci_415\", 0, 12, 0, null],[\"LevelDoneType59\", \"ci_416\", 0, 12, 0, null],[\"LevelDoneType60\", \"ci_417\", 0, 12, 0, null],[\"LevelDoneType61\", \"ci_418\", 0, 12, 0, null],[\"LevelDoneType62\", \"ci_419\", 0, 12, 0, null],[\"LevelDoneType63\", \"ci_420\", 0, 12, 0, null],[\"LevelDoneType64\", \"ci_421\", 0, 12, 0, null],[\"LevelDoneType65\", \"ci_422\", 0, 12, 0, null],[\"ScoreType1\", \"ci_423\", 0, 12, 0, null],[\"ScoreType2\", \"ci_424\", 0, 12, 0, null],[\"ScoreType3\", \"ci_425\", 0, 12, 0, null],[\"ScoreType4\", \"ci_426\", 0, 12, 0, null],[\"ScoreType5\", \"ci_427\", 0, 12, 0, null],[\"ScoreType6\", \"ci_428\", 0, 12, 0, null],[\"ScoreType7\", \"ci_429\", 0, 12, 0, null],[\"ScoreType8\", \"ci_430\", 0, 12, 0, null],[\"ScoreType9\", \"ci_431\", 0, 12, 0, null],[\"ScoreType10\", \"ci_432\", 0, 12, 0, null],[\"ScoreType11\", \"ci_433\", 0, 12, 0, null],[\"ScoreType12\", \"ci_434\", 0, 12, 0, null],[\"ScoreType13\", \"ci_435\", 0, 12, 0, null],[\"ScoreType14\", \"ci_436\", 0, 12, 0, null],[\"ScoreType15\", \"ci_437\", 0, 12, 0, null],[\"ScoreType16\", \"ci_438\", 0, 12, 0, null],[\"ScoreType17\", \"ci_439\", 0, 12, 0, null],[\"ScoreType18\", \"ci_440\", 0, 12, 0, null],[\"ScoreType19\", \"ci_441\", 0, 12, 0, null],[\"ScoreType20\", \"ci_442\", 0, 12, 0, null],[\"ScoreType21\", \"ci_443\", 0, 12, 0, null],[\"ScoreType22\", \"ci_444\", 0, 12, 0, null],[\"ScoreType23\", \"ci_445\", 0, 12, 0, null],[\"ScoreType24\", \"ci_446\", 0, 12, 0, null],[\"ScoreType25\", \"ci_447\", 0, 12, 0, null],[\"ScoreType26\", \"ci_448\", 0, 12, 0, null],[\"ScoreType27\", \"ci_449\", 0, 12, 0, null],[\"ScoreType28\", \"ci_450\", 0, 12, 0, null],[\"ScoreType29\", \"ci_451\", 0, 12, 0, null],[\"ScoreType30\", \"ci_452\", 0, 12, 0, null],[\"ScoreType31\", \"ci_453\", 0, 12, 0, null],[\"ScoreType32\", \"ci_454\", 0, 12, 0, null],[\"ScoreType33\", \"ci_455\", 0, 12, 0, null],[\"ScoreType34\", \"ci_456\", 0, 12, 0, null],[\"ScoreType35\", \"ci_457\", 0, 12, 0, null],[\"ScoreType36\", \"ci_458\", 0, 12, 0, null],[\"ScoreType37\", \"ci_459\", 0, 12, 0, null],[\"ScoreType38\", \"ci_460\", 0, 12, 0, null],[\"ScoreType39\", \"ci_461\", 0, 12, 0, null],[\"ScoreType40\", \"ci_462\", 0, 12, 0, null],[\"ScoreType41\", \"ci_463\", 0, 12, 0, null],[\"ScoreType42\", \"ci_464\", 0, 12, 0, null],[\"ScoreType43\", \"ci_465\", 0, 12, 0, null],[\"ScoreType44\", \"ci_466\", 0, 12, 0, null],[\"ScoreType45\", \"ci_467\", 0, 12, 0, null],[\"ScoreType46\", \"ci_468\", 0, 12, 0, null],[\"ScoreType47\", \"ci_469\", 0, 12, 0, null],[\"ScoreType48\", \"ci_470\", 0, 12, 0, null],[\"ScoreType49\", \"ci_471\", 0, 12, 0, null],[\"ScoreType50\", \"ci_472\", 0, 12, 0, null],[\"ScoreType51\", \"ci_473\", 0, 12, 0, null],[\"ScoreType52\", \"ci_474\", 0, 12, 0, null],[\"ScoreType53\", \"ci_475\", 0, 12, 0, null],[\"ScoreType54\", \"ci_476\", 0, 12, 0, null],[\"ScoreType55\", \"ci_477\", 0, 12, 0, null],[\"ScoreType56\", \"ci_478\", 0, 12, 0, null],[\"ScoreType57\", \"ci_479\", 0, 12, 0, null],[\"ScoreType58\", \"ci_480\", 0, 12, 0, null],[\"ScoreType59\", \"ci_481\", 0, 12, 0, null],[\"ScoreType60\", \"ci_482\", 0, 12, 0, null],[\"ScoreType61\", \"ci_483\", 0, 12, 0, null],[\"ScoreType62\", \"ci_484\", 0, 12, 0, null],[\"ScoreType63\", \"ci_485\", 0, 12, 0, null],[\"ScoreType64\", \"ci_486\", 0, 12, 0, null],[\"ScoreType65\", \"ci_487\", 0, 12, 0, null],[\"LevelUp1\", \"ci_488\", 0, 1, 0, null],[\"LevelUp2\", \"ci_489\", 0, 1, 0, null],[\"LevelUp3\", \"ci_490\", 0, 1, 0, null],[\"LevelUp4\", \"ci_491\", 0, 1, 0, null],[\"LevelUp5\", \"ci_492\", 0, 1, 0, null],[\"LevelUp6\", \"ci_493\", 0, 1, 0, null],[\"LevelUp7\", \"ci_494\", 0, 1, 0, null],[\"LevelUp8\", \"ci_495\", 0, 1, 0, null],[\"LevelUp9\", \"ci_496\", 0, 1, 0, null],[\"LevelUp10\", \"ci_497\", 0, 1, 0, null],[\"LevelUp11\", \"ci_498\", 0, 1, 0, null],[\"LevelUp12\", \"ci_499\", 0, 1, 0, null],[\"LevelUp13\", \"ci_500\", 0, 1, 0, null],[\"LevelUp14\", \"ci_501\", 0, 1, 0, null],[\"LevelUp15\", \"ci_502\", 0, 1, 0, null],[\"LevelUp16\", \"ci_503\", 0, 2, 0, null],[\"LevelUp17\", \"ci_504\", 0, 2, 0, null],[\"LevelUp18\", \"ci_505\", 0, 2, 0, null],[\"LevelUp19\", \"ci_506\", 0, 2, 0, null],[\"LevelUp20\", \"ci_507\", 0, 2, 0, null],[\"LevelUp21\", \"ci_508\", 0, 2, 0, null],[\"LevelUp22\", \"ci_509\", 0, 2, 0, null],[\"LevelUp23\", \"ci_510\", 0, 2, 0, null],[\"LevelUp24\", \"ci_511\", 0, 2, 0, null],[\"LevelUp25\", \"ci_512\", 0, 2, 0, null],[\"LevelUp26\", \"ci_513\", 0, 2, 0, null],[\"LevelUp27\", \"ci_514\", 0, 2, 0, null],[\"LevelUp28\", \"ci_515\", 0, 2, 0, null],[\"LevelUp29\", \"ci_516\", 0, 2, 0, null],[\"LevelUp30\", \"ci_517\", 0, 2, 0, null],[\"LevelUp31\", \"ci_518\", 0, 2, 0, null],[\"LevelUp32\", \"ci_519\", 0, 2, 0, null],[\"LevelUp33\", \"ci_520\", 0, 2, 0, null],[\"LevelUp34\", \"ci_521\", 0, 2, 0, null],[\"LevelUp35\", \"ci_522\", 0, 2, 0, null],[\"LevelUp36\", \"ci_523\", 0, 2, 0, null],[\"LevelUp37\", \"ci_524\", 0, 2, 0, null],[\"LevelUp38\", \"ci_525\", 0, 2, 0, null],[\"LevelUp39\", \"ci_526\", 0, 2, 0, null],[\"LevelUp40\", \"ci_527\", 0, 2, 0, null],[\"LevelUp41\", \"ci_528\", 0, 3, 0, null],[\"LevelUp42\", \"ci_529\", 0, 3, 0, null],[\"LevelUp43\", \"ci_530\", 0, 3, 0, null],[\"LevelUp44\", \"ci_531\", 0, 3, 0, null],[\"LevelUp45\", \"ci_532\", 0, 3, 0, null],[\"LevelUp46\", \"ci_533\", 0, 3, 0, null],[\"LevelUp47\", \"ci_534\", 0, 3, 0, null],[\"LevelUp48\", \"ci_535\", 0, 3, 0, null],[\"LevelUp49\", \"ci_536\", 0, 3, 0, null],[\"LevelUp50\", \"ci_537\", 0, 3, 0, null],[\"LevelUp51\", \"ci_538\", 0, 3, 0, null],[\"LevelUp52\", \"ci_539\", 0, 3, 0, null],[\"LevelUp53\", \"ci_540\", 0, 3, 0, null],[\"LevelUp54\", \"ci_541\", 0, 3, 0, null],[\"LevelUp55\", \"ci_542\", 0, 3, 0, null],[\"LevelUp56\", \"ci_543\", 0, 3, 0, null],[\"LevelUp57\", \"ci_544\", 0, 3, 0, null],[\"LevelUp58\", \"ci_545\", 0, 3, 0, null],[\"LevelUp59\", \"ci_546\", 0, 3, 0, null],[\"LevelUp60\", \"ci_547\", 0, 3, 0, null],[\"LevelUp61\", \"ci_548\", 0, 3, 0, null],[\"LevelUp62\", \"ci_549\", 0, 3, 0, null],[\"LevelUp63\", \"ci_550\", 0, 3, 0, null],[\"LevelUp64\", \"ci_551\", 0, 3, 0, null],[\"LevelUp65\", \"ci_552\", 0, 3, 0, null],[\"LevelUp66\", \"ci_553\", 0, 3, 0, null],[\"LevelUp67\", \"ci_554\", 0, 3, 0, null],[\"LevelUp68\", \"ci_555\", 0, 3, 0, null],[\"LevelUp69\", \"ci_556\", 0, 3, 0, null],[\"LevelUp70\", \"ci_557\", 0, 3, 0, null],[\"LevelUp71\", \"ci_558\", 0, 4, 0, null],[\"LevelUp72\", \"ci_559\", 0, 4, 0, null],[\"LevelUp73\", \"ci_560\", 0, 4, 0, null],[\"LevelUp74\", \"ci_561\", 0, 4, 0, null],[\"LevelUp75\", \"ci_562\", 0, 4, 0, null],[\"LevelUp76\", \"ci_563\", 0, 4, 0, null],[\"LevelUp77\", \"ci_564\", 0, 4, 0, null],[\"LevelUp78\", \"ci_565\", 0, 4, 0, null],[\"LevelUp79\", \"ci_566\", 0, 4, 0, null],[\"LevelUp80\", \"ci_567\", 0, 4, 0, null],[\"LevelUp81\", \"ci_568\", 0, 4, 0, null],[\"LevelUp82\", \"ci_569\", 0, 4, 0, null],[\"LevelUp83\", \"ci_570\", 0, 4, 0, null],[\"LevelUp84\", \"ci_571\", 0, 4, 0, null],[\"LevelUp85\", \"ci_572\", 0, 4, 0, null],[\"LevelUp86\", \"ci_573\", 0, 4, 0, null],[\"LevelUp87\", \"ci_574\", 0, 4, 0, null],[\"LevelUp88\", \"ci_575\", 0, 4, 0, null],[\"LevelUp89\", \"ci_576\", 0, 4, 0, null],[\"LevelUp90\", \"ci_577\", 0, 4, 0, null],[\"LevelUp91\", \"ci_578\", 0, 4, 0, null],[\"LevelUp92\", \"ci_579\", 0, 4, 0, null],[\"LevelUp93\", \"ci_580\", 0, 4, 0, null],[\"LevelUp94\", \"ci_581\", 0, 4, 0, null],[\"LevelUp95\", \"ci_582\", 0, 4, 0, null],[\"LevelUp96\", \"ci_583\", 0, 4, 0, null],[\"LevelUp97\", \"ci_584\", 0, 4, 0, null],[\"LevelUp98\", \"ci_585\", 0, 4, 0, null],[\"LevelUp99\", \"ci_586\", 0, 4, 0, null],[\"LevelUp100\", \"ci_587\", 0, 4, 0, null],[\"LevelUp101\", \"ci_588\", 0, 5, 0, null],[\"LevelUp102\", \"ci_589\", 0, 5, 0, null],[\"LevelUp103\", \"ci_590\", 0, 5, 0, null],[\"LevelUp104\", \"ci_591\", 0, 5, 0, null],[\"LevelUp105\", \"ci_592\", 0, 5, 0, null],[\"LevelUp106\", \"ci_593\", 0, 5, 0, null],[\"LevelUp107\", \"ci_594\", 0, 5, 0, null],[\"LevelUp108\", \"ci_595\", 0, 5, 0, null],[\"LevelUp109\", \"ci_596\", 0, 5, 0, null],[\"LevelUp110\", \"ci_597\", 0, 5, 0, null],[\"LevelUp111\", \"ci_598\", 0, 5, 0, null],[\"LevelUp112\", \"ci_599\", 0, 5, 0, null],[\"LevelUp113\", \"ci_600\", 0, 5, 0, null],[\"LevelUp114\", \"ci_601\", 0, 5, 0, null],[\"LevelUp115\", \"ci_602\", 0, 5, 0, null],[\"LevelUp116\", \"ci_603\", 0, 5, 0, null],[\"LevelUp117\", \"ci_604\", 0, 5, 0, null],[\"LevelUp118\", \"ci_605\", 0, 5, 0, null],[\"LevelUp119\", \"ci_606\", 0, 5, 0, null],[\"LevelUp120\", \"ci_607\", 0, 5, 0, null],[\"LevelUp121\", \"ci_608\", 0, 5, 0, null],[\"LevelUp122\", \"ci_609\", 0, 5, 0, null],[\"LevelUp123\", \"ci_610\", 0, 5, 0, null],[\"LevelUp124\", \"ci_611\", 0, 5, 0, null],[\"LevelUp125\", \"ci_612\", 0, 5, 0, null],[\"LevelUp126\", \"ci_613\", 0, 5, 0, null],[\"LevelUp127\", \"ci_614\", 0, 5, 0, null],[\"LevelUp128\", \"ci_615\", 0, 5, 0, null],[\"LevelUp129\", \"ci_616\", 0, 5, 0, null],[\"LevelUp130\", \"ci_617\", 0, 5, 0, null],[\"LevelUp131\", \"ci_618\", 0, 5, 0, null],[\"LevelUp132\", \"ci_619\", 0, 6, 0, null],[\"LevelUp133\", \"ci_620\", 0, 6, 0, null],[\"LevelUp134\", \"ci_621\", 0, 6, 0, null],[\"LevelUp135\", \"ci_622\", 0, 6, 0, null],[\"LevelUp136\", \"ci_623\", 0, 6, 0, null],[\"LevelUp137\", \"ci_624\", 0, 6, 0, null],[\"LevelUp138\", \"ci_625\", 0, 6, 0, null],[\"LevelUp139\", \"ci_626\", 0, 6, 0, null],[\"LevelUp140\", \"ci_627\", 0, 6, 0, null],[\"LevelUp141\", \"ci_628\", 0, 6, 0, null],[\"LevelUp142\", \"ci_629\", 0, 6, 0, null],[\"LevelUp143\", \"ci_630\", 0, 6, 0, null],[\"LevelUp144\", \"ci_631\", 0, 6, 0, null],[\"LevelUp145\", \"ci_632\", 0, 6, 0, null],[\"LevelUp146\", \"ci_633\", 0, 6, 0, null],[\"LevelUp147\", \"ci_634\", 0, 6, 0, null],[\"LevelUp148\", \"ci_635\", 0, 6, 0, null],[\"LevelUp149\", \"ci_636\", 0, 6, 0, null],[\"LevelUp150\", \"ci_637\", 0, 6, 0, null],[\"LevelUp151\", \"ci_638\", 0, 6, 0, null],[\"LevelUp152\", \"ci_639\", 0, 6, 0, null],[\"LevelUp153\", \"ci_640\", 0, 6, 0, null],[\"LevelUp154\", \"ci_641\", 0, 6, 0, null],[\"LevelUp155\", \"ci_642\", 0, 6, 0, null],[\"LevelUp156\", \"ci_643\", 0, 6, 0, null],[\"LevelUp157\", \"ci_644\", 0, 6, 0, null],[\"LevelUp158\", \"ci_645\", 0, 6, 0, null],[\"LevelUp159\", \"ci_646\", 0, 6, 0, null],[\"LevelUp160\", \"ci_647\", 0, 6, 0, null],[\"LevelUp161\", \"ci_648\", 0, 7, 0, null],[\"LevelUp162\", \"ci_649\", 0, 7, 0, null],[\"LevelUp163\", \"ci_650\", 0, 7, 0, null],[\"LevelUp164\", \"ci_651\", 0, 7, 0, null],[\"LevelUp165\", \"ci_652\", 0, 7, 0, null],[\"LevelUp166\", \"ci_653\", 0, 7, 0, null],[\"LevelUp167\", \"ci_654\", 0, 7, 0, null],[\"LevelUp168\", \"ci_655\", 0, 7, 0, null],[\"LevelUp169\", \"ci_656\", 0, 7, 0, null],[\"LevelUp170\", \"ci_657\", 0, 7, 0, null],[\"LevelUp171\", \"ci_658\", 0, 7, 0, null],[\"LevelUp172\", \"ci_659\", 0, 7, 0, null],[\"LevelUp173\", \"ci_660\", 0, 7, 0, null],[\"LevelUp174\", \"ci_661\", 0, 7, 0, null],[\"LevelUp175\", \"ci_662\", 0, 7, 0, null],[\"LevelUp176\", \"ci_663\", 0, 7, 0, null],[\"LevelUp177\", \"ci_664\", 0, 7, 0, null],[\"LevelUp178\", \"ci_665\", 0, 7, 0, null],[\"LevelUp179\", \"ci_666\", 0, 7, 0, null],[\"LevelUp180\", \"ci_667\", 0, 7, 0, null],[\"LevelUp181\", \"ci_668\", 0, 7, 0, null],[\"LevelUp182\", \"ci_669\", 0, 7, 0, null],[\"LevelUp183\", \"ci_670\", 0, 7, 0, null],[\"LevelUp184\", \"ci_671\", 0, 7, 0, null],[\"LevelUp185\", \"ci_672\", 0, 7, 0, null],[\"LevelUp186\", \"ci_673\", 0, 7, 0, null],[\"LevelUp187\", \"ci_674\", 0, 7, 0, null],[\"LevelUp188\", \"ci_675\", 0, 7, 0, null],[\"LevelUp189\", \"ci_676\", 0, 7, 0, null],[\"LevelUp190\", \"ci_677\", 0, 7, 0, null],[\"LevelUp191\", \"ci_678\", 0, 8, 0, null],[\"LevelUp192\", \"ci_679\", 0, 8, 0, null],[\"LevelUp193\", \"ci_680\", 0, 8, 0, null],[\"LevelUp194\", \"ci_681\", 0, 8, 0, null],[\"LevelUp195\", \"ci_682\", 0, 8, 0, null],[\"LevelUp196\", \"ci_683\", 0, 8, 0, null],[\"LevelUp197\", \"ci_684\", 0, 8, 0, null],[\"LevelUp198\", \"ci_685\", 0, 8, 0, null],[\"LevelUp199\", \"ci_686\", 0, 8, 0, null],[\"LevelUp200\", \"ci_687\", 0, 8, 0, null],[\"LevelUp201\", \"ci_688\", 0, 8, 0, null],[\"LevelUp202\", \"ci_689\", 0, 8, 0, null],[\"LevelUp203\", \"ci_690\", 0, 8, 0, null],[\"LevelUp204\", \"ci_691\", 0, 8, 0, null],[\"LevelUp205\", \"ci_692\", 0, 8, 0, null],[\"LevelUp206\", \"ci_693\", 0, 8, 0, null],[\"LevelUp207\", \"ci_694\", 0, 8, 0, null],[\"LevelUp208\", \"ci_695\", 0, 8, 0, null],[\"LevelUp209\", \"ci_696\", 0, 8, 0, null],[\"LevelUp210\", \"ci_697\", 0, 8, 0, null],[\"LevelUp211\", \"ci_698\", 0, 8, 0, null],[\"LevelUp212\", \"ci_699\", 0, 8, 0, null],[\"LevelUp213\", \"ci_700\", 0, 8, 0, null],[\"LevelUp214\", \"ci_701\", 0, 8, 0, null],[\"LevelUp215\", \"ci_702\", 0, 8, 0, null],[\"LevelUp216\", \"ci_703\", 0, 8, 0, null],[\"LevelUp217\", \"ci_704\", 0, 8, 0, null],[\"LevelUp218\", \"ci_705\", 0, 8, 0, null],[\"LevelUp219\", \"ci_706\", 0, 8, 0, null],[\"LevelUp220\", \"ci_707\", 0, 8, 0, null],[\"LevelUp221\", \"ci_708\", 0, 9, 0, null],[\"LevelUp222\", \"ci_709\", 0, 9, 0, null],[\"LevelUp223\", \"ci_710\", 0, 9, 0, null],[\"LevelUp224\", \"ci_711\", 0, 9, 0, null],[\"LevelUp225\", \"ci_712\", 0, 9, 0, null],[\"LevelUp226\", \"ci_713\", 0, 9, 0, null],[\"LevelUp227\", \"ci_714\", 0, 9, 0, null],[\"LevelUp228\", \"ci_715\", 0, 9, 0, null],[\"LevelUp229\", \"ci_716\", 0, 9, 0, null],[\"LevelUp230\", \"ci_717\", 0, 9, 0, null],[\"LevelUp231\", \"ci_718\", 0, 9, 0, null],[\"LevelUp232\", \"ci_719\", 0, 9, 0, null],[\"LevelUp233\", \"ci_720\", 0, 9, 0, null],[\"LevelUp234\", \"ci_721\", 0, 9, 0, null],[\"LevelUp235\", \"ci_722\", 0, 9, 0, null],[\"LevelUp236\", \"ci_723\", 0, 9, 0, null],[\"LevelUp237\", \"ci_724\", 0, 9, 0, null],[\"LevelUp238\", \"ci_725\", 0, 9, 0, null],[\"LevelUp239\", \"ci_726\", 0, 9, 0, null],[\"LevelUp240\", \"ci_727\", 0, 9, 0, null],[\"LevelUp241\", \"ci_728\", 0, 9, 0, null],[\"LevelUp242\", \"ci_729\", 0, 9, 0, null],[\"LevelUp243\", \"ci_730\", 0, 9, 0, null],[\"LevelUp244\", \"ci_731\", 0, 9, 0, null],[\"LevelUp245\", \"ci_732\", 0, 9, 0, null],[\"LevelUp246\", \"ci_733\", 0, 9, 0, null],[\"LevelUp247\", \"ci_734\", 0, 9, 0, null],[\"LevelUp248\", \"ci_735\", 0, 9, 0, null],[\"LevelUp249\", \"ci_736\", 0, 9, 0, null],[\"LevelUp250\", \"ci_737\", 0, 9, 0, null],[\"LevelUp251\", \"ci_738\", 0, 10, 0, null],[\"LevelUp252\", \"ci_739\", 0, 10, 0, null],[\"LevelUp253\", \"ci_740\", 0, 10, 0, null],[\"LevelUp254\", \"ci_741\", 0, 10, 0, null],[\"LevelUp255\", \"ci_742\", 0, 10, 0, null],[\"LevelUp256\", \"ci_743\", 0, 10, 0, null],[\"LevelUp257\", \"ci_744\", 0, 10, 0, null],[\"LevelUp258\", \"ci_745\", 0, 10, 0, null],[\"LevelUp259\", \"ci_746\", 0, 10, 0, null],[\"LevelUp260\", \"ci_747\", 0, 10, 0, null],[\"LevelUp261\", \"ci_748\", 0, 10, 0, null],[\"LevelUp262\", \"ci_749\", 0, 10, 0, null],[\"LevelUp263\", \"ci_750\", 0, 10, 0, null],[\"LevelUp264\", \"ci_751\", 0, 10, 0, null],[\"LevelUp265\", \"ci_752\", 0, 10, 0, null],[\"LevelUp266\", \"ci_753\", 0, 10, 0, null],[\"LevelUp267\", \"ci_754\", 0, 10, 0, null],[\"LevelUp268\", \"ci_755\", 0, 10, 0, null],[\"LevelUp269\", \"ci_756\", 0, 10, 0, null],[\"LevelUp270\", \"ci_757\", 0, 10, 0, null],[\"LevelUp271\", \"ci_758\", 0, 10, 0, null],[\"LevelUp272\", \"ci_759\", 0, 10, 0, null],[\"LevelUp273\", \"ci_760\", 0, 10, 0, null],[\"LevelUp274\", \"ci_761\", 0, 10, 0, null],[\"LevelUp275\", \"ci_762\", 0, 10, 0, null],[\"LevelUp276\", \"ci_763\", 0, 10, 0, null],[\"LevelUp277\", \"ci_764\", 0, 10, 0, null],[\"LevelUp278\", \"ci_765\", 0, 10, 0, null],[\"LevelUp279\", \"ci_766\", 0, 10, 0, null],[\"LevelUp280\", \"ci_767\", 0, 10, 0, null],[\"TutorialDay1\", \"ci_768\", 0, 11, 0, 1],[\"TutorialCombo\", \"ci_769\", 0, 11, 0, 3],[\"TutorialRushHour\", \"ci_770\", 0, 11, 0, 4],[\"TutorialBaconCheese\", \"ci_771\", 0, 11, 0, 5],[\"TutorialUseCake\", \"ci_772\", 0, 11, 0, 8],[\"TutorialTomato\", \"ci_773\", 0, 11, 0, 9],[\"TutorialBoostHappyHour\", \"ci_774\", 0, 11, 0, 10],[\"TutorialBoostGroceries\", \"ci_775\", 0, 11, 0, 15],[\"CakeShopChocolateIcing\", \"ci_776\", 0, 11, 0, 15],[\"TutorialDay1Res4\", \"ci_777\", 0, 11, 0, 131],[\"TutorialDay2Res4\", \"ci_778\", 0, 11, 0, 132],[\"TutorialRes2Day1\", \"ci_779\", 0, 11, 0, 41],[\"TutorialDay1Res3\", \"ci_780\", 0, 11, 0, 71],[\"TutorialSubwayDay1\", \"ci_781\", 0, 11, 0, 101],[\"TutorialPizzaDay1\", \"ci_782\", 0, 11, 0, 161],[\"TutorialSeafoodDay1\", \"ci_783\", 0, 11, 0, 191],[\"CreamDay1\", \"ci_784\", 0, 11, 0, 221],[\"TutorialConnectFB\", \"ci_785\", 0, 11, 0, 11],[\"TutorialLevel13\", \"ci_786\", 0, 11, 0, 14],[\"TutorialLevel8\", \"ci_787\", 0, 11, 0, 8],[\"TutorialSpinWheel\", \"ci_788\", 0, 11, 0, 2],[\"TutorialOpenRestaurant\", \"ci_789\", 0, 11, 0, 0],[\"TutorialEnterStar2\", \"ci_790\", 0, 11, 0, 0],[\"TutorialEnterStar1\", \"ci_791\", 0, 11, 0, 0],[\"TutorialLevel3\", \"ci_792\", 0, 11, 0, 3],[\"TutorialLevel4\", \"ci_793\", 0, 11, 0, 4],[\"TutorialUpgrade\", \"ci_794\", 0, 11, 0, 5],[\"TutorialLevel6\", \"ci_795\", 0, 11, 0, 6],[\"TutorialLevel7\", \"ci_796\", 0, 11, 0, 7],[\"TutorialDecorate\", \"ci_797\", 0, 11, 0, 7],[\"TutorialLevel7Time\", \"ci_798\", 0, 11, 0, 7],[\"TutorialLevel12\", \"ci_799\", 0, 11, 0, 12],[\"TutorialLevel14\", \"ci_800\", 0, 11, 0, 14],[\"TutorialLevel15\", \"ci_801\", 0, 11, 0, 15],[\"TutorialLevel19\", \"ci_802\", 0, 11, 0, 19],[\"TypeCustomer\", \"ci_803\", 2, 13, 0, null],[\"DEFAULT_LANGUAGE\", \"ci_804\", 2, 13, 0, null],[\"TimeLogin\", \"ci_805\", 2, 13, 0, null],[\"TIME_SPIN_WHEEL\", \"ci_806\", 2, 13, 0, null],[\"WheelDate\", \"ci_807\", 2, 13, 0, null],[\"WheelTime\", \"ci_808\", 2, 13, 0, null],[\"PRC_UQID\", \"ci_809\", 2, 13, 0, null],[\"TutorialCustomerAngry\", \"ci_810\", 0, 11, 0, null],[\"TutorialDay2\", \"ci_811\", 0, 11, 0, null],[\"TutorialHeart\", \"ci_812\", 0, 11, 0, null],[\"TutorialGem\", \"ci_813\", 0, 11, 0, null],[\"TutorialCustomerHungry\", \"ci_814\", 0, 11, 0, null],[\"TutorialItemBurn\", \"ci_815\", 0, 11, 0, null],[\"TutorialBin\", \"ci_816\", 0, 11, 0, null],[\"TutorialTimeBar\", \"ci_817\", 0, 11, 0, null],[\"TutorialTimer\", \"ci_818\", 0, 11, 0, null],[\"TIME_QUEST_WEEKEND\", \"ci_819\", 2, 13, 0, null],[\"FIRST_TIME_OPEN_QUEST_WEEKEND\", \"ci_820\", 0, 13, 0, null],[\"TOTAL_WIN_LEVEL_QUEST_WEEKEND\", \"ci_821\", 0, 13, 0, null],[\"TIME_LEFT_NEXT_QUEST_WEEKEND\", \"ci_822\", 2, 13, 0, null],[\"DailyBonus\", \"ci_823\", 0, 13, 0, null],[\"ShowDaily\", \"ci_824\", 0, 13, 0, null],[\"CLAIM_QUEST_WEEKEND_1\", \"ci_825\", 0, 13, 0, null],[\"CLAIM_QUEST_WEEKEND_2\", \"ci_826\", 0, 13, 0, null],[\"OpenSalmon\", \"ci_827\", 0, 6, 0, null],[\"OpenGinger\", \"ci_828\", 0, 6, 0, null],[\"OpenAvocado\", \"ci_829\", 0, 6, 0, null],[\"OpenSeaweed\", \"ci_830\", 0, 6, 0, null],[\"OpenSoup\", \"ci_831\", 0, 6, 0, null],[\"OpenOnion\", \"ci_832\", 0, 6, 0, null],[\"TutorialRiceMexican\", \"ci_833\", 0, 3, 0, null],[\"TutorialTaco\", \"ci_834\", 0, 3, 0, null],[\"TutorialLettuceMexcian\", \"ci_835\", 0, 3, 0, null],[\"TutorialTomatoMexcian\", \"ci_836\", 0, 3, 0, null],[\"TutorialCheeseMexcian\", \"ci_837\", 0, 3, 0, null],[\"TutorialGuacamole\", \"ci_838\", 0, 3, 0, null],[\"TutorialSugar\", \"ci_839\", 0, 4, 0, null],[\"TutorialJelly\", \"ci_840\", 0, 4, 0, null],[\"TutorialSwirl\", \"ci_841\", 0, 4, 0, null],[\"TutorialChocolateDonut\", \"ci_842\", 0, 4, 0, null],[\"TutorialDonutHole\", \"ci_843\", 0, 4, 0, null],[\"TutorialSalmon\", \"ci_844\", 0, 6, 0, null],[\"TutorialAvocado\", \"ci_845\", 0, 6, 0, null],[\"TutorialSeaweed\", \"ci_846\", 0, 6, 0, null],[\"TutorialSoupSushi\", \"ci_847\", 0, 6, 0, null],[\"TutorialOnion\", \"ci_848\", 0, 6, 0, null],[\"TutorialMozarella\", \"ci_849\", 0, 7, 0, null],[\"TutorialPeppers\", \"ci_850\", 0, 7, 0, null],[\"TutorialMushroom\", \"ci_851\", 0, 7, 0, null],[\"TutorialPepperoni\", \"ci_852\", 0, 7, 0, null],[\"TutorialDonut7\", \"ci_853\", 0, 5, 0, null],[\"TutorialCheese7\", \"ci_854\", 0, 5, 0, null],[\"TutorialTomato7\", \"ci_855\", 0, 5, 0, null],[\"TutorialSoup7\", \"ci_856\", 0, 5, 0, null],[\"CakeShopChocolateFlake\", \"ci_857\", 0, 5, 0, null],[\"CakeShopBlueBurry\", \"ci_858\", 0, 2, 0, null],[\"CakeShopPink\", \"ci_859\", 0, 2, 0, null],[\"CakeShopWhite\", \"ci_860\", 0, 2, 0, null],[\"CakeShopStrawberry\", \"ci_861\", 0, 2, 0, null],[\"CreamSauce\", \"ci_862\", 0, 9, 0, null],[\"CreamChocolate\", \"ci_863\", 0, 9, 0, null],[\"CreamCherry\", \"ci_864\", 0, 9, 0, null],[\"CreamSprinkes\", \"ci_865\", 0, 9, 0, null],[\"TutorialShrimp\", \"ci_866\", 0, 8, 0, null],[\"TutorialMazine\", \"ci_867\", 0, 8, 0, null],[\"TutorialLettuce\", \"ci_868\", 0, 8, 0, null],[\"TutorialSoup\", \"ci_869\", 0, 8, 0, null],[\"TutorialSalad\", \"ci_870\", 0, 8, 0, null],[\"TutorialLemon\", \"ci_871\", 0, 8, 0, null],[\"TutorialCustomer\", \"ci_872\", 0, 13, 0, null],[\"day_spine_open\", \"ci_873\", 0, 13, 0, null],[\"com.fme.cookit.vip3new\", \"ci_874\", 0, 9998, 0, null],[\"DayBuyVip3\", \"ci_875\", 2, 9998, 0, null],[\"rewardChangeRestaurant\", \"ci_876\", 0, 13, 0, null],[\"TimeCountCupcake\", \"ci_877\", 2, 13, 0, null],[\"TIME_PANTRY\", \"ci_878\", 2, 13, 0, null],[\"first_time_unlock_pantry\", \"ci_879\", 0, 13, 0, null],[\"TIME_DAILY_HAPPINESS\", \"ci_880\", 2, 13, 0, null],[\"time_daily_reward_iap\", \"ci_881\", 2, 13, 0, null],[\"TIME_DAILY_REWARD_IAP_BOX\", \"ci_882\", 2, 13, 0, null],[\"TIME_ROTATIONAL_SALE_IAP\", \"ci_883\", 2, 13, 0, null],[\"ITEM_SALE_BOOST\", \"ci_884\", 2, 13, 0, null],[\"Dem1car1\", \"ci_885\", 2, 1, 0, null],[\"Dem1car2\", \"ci_886\", 2, 1, 0, null],[\"Dem1car3\", \"ci_887\", 2, 1, 0, null],[\"Dem1char1\", \"ci_888\", 2, 1, 0, null],[\"Dem1char2\", \"ci_889\", 2, 1, 0, null],[\"Dem1char3\", \"ci_890\", 2, 1, 0, null],[\"Dem1table1\", \"ci_891\", 2, 1, 0, null],[\"Dem1table2\", \"ci_892\", 2, 1, 0, null],[\"Dem1table3\", \"ci_893\", 2, 1, 0, null],[\"Dem1flower1\", \"ci_894\", 2, 1, 0, null],[\"Dem1flower2\", \"ci_895\", 2, 1, 0, null],[\"Dem1flower3\", \"ci_896\", 2, 1, 0, null],[\"Dem1machine1\", \"ci_897\", 2, 1, 0, null],[\"Dem1machine2\", \"ci_898\", 2, 1, 0, null],[\"Dem1machine3\", \"ci_899\", 2, 1, 0, null],[\"Dem2crown1\", \"ci_900\", 2, 2, 0, null],[\"Dem2crown2\", \"ci_901\", 2, 2, 0, null],[\"Dem2crown3\", \"ci_902\", 2, 2, 0, null],[\"Dem2bag1\", \"ci_903\", 2, 2, 0, null],[\"Dem2bag2\", \"ci_904\", 2, 2, 0, null],[\"Dem2bag3\", \"ci_905\", 2, 2, 0, null],[\"Dem2table1\", \"ci_906\", 2, 2, 0, null],[\"Dem2table2\", \"ci_907\", 2, 2, 0, null],[\"Dem2table3\", \"ci_908\", 2, 2, 0, null],[\"Dem2flower1\", \"ci_909\", 2, 2, 0, null],[\"Dem2flower2\", \"ci_910\", 2, 2, 0, null],[\"Dem2flower3\", \"ci_911\", 2, 2, 0, null],[\"Dem2picture1\", \"ci_912\", 2, 2, 0, null],[\"Dem2picture2\", \"ci_913\", 2, 2, 0, null],[\"Dem2picture3\", \"ci_914\", 2, 2, 0, null],[\"Dem4animal1\", \"ci_915\", 2, 3, 0, null],[\"Dem4animal2\", \"ci_916\", 2, 3, 0, null],[\"Dem4animal3\", \"ci_917\", 2, 3, 0, null],[\"Dem4char1\", \"ci_918\", 2, 3, 0, null],[\"Dem4char2\", \"ci_919\", 2, 3, 0, null],[\"Dem4char3\", \"ci_920\", 2, 3, 0, null],[\"Dem4table1\", \"ci_921\", 2, 3, 0, null],[\"Dem4table2\", \"ci_922\", 2, 3, 0, null],[\"Dem4table3\", \"ci_923\", 2, 3, 0, null],[\"Dem4tree1\", \"ci_924\", 2, 3, 0, null],[\"Dem4tree2\", \"ci_925\", 2, 3, 0, null],[\"Dem4tree3\", \"ci_926\", 2, 3, 0, null],[\"Dem4picture1\", \"ci_927\", 2, 3, 0, null],[\"Dem4picture2\", \"ci_928\", 2, 3, 0, null],[\"Dem4picture3\", \"ci_929\", 2, 3, 0, null],[\"Dem5candy1\", \"ci_930\", 2, 4, 0, null],[\"Dem5candy2\", \"ci_931\", 2, 4, 0, null],[\"Dem5candy3\", \"ci_932\", 2, 4, 0, null],[\"Dem5table1\", \"ci_933\", 2, 4, 0, null],[\"Dem5table2\", \"ci_934\", 2, 4, 0, null],[\"Dem5table3\", \"ci_935\", 2, 4, 0, null],[\"Dem5tree1\", \"ci_936\", 2, 4, 0, null],[\"Dem5tree2\", \"ci_937\", 2, 4, 0, null],[\"Dem5tree3\", \"ci_938\", 2, 4, 0, null],[\"Dem5animal1\", \"ci_939\", 2, 4, 0, null],[\"Dem5animal2\", \"ci_940\", 2, 4, 0, null],[\"Dem5animal3\", \"ci_941\", 2, 4, 0, null],[\"Dem6candy1\", \"ci_942\", 2, 5, 0, null],[\"Dem6candy2\", \"ci_943\", 2, 5, 0, null],[\"Dem6candy3\", \"ci_944\", 2, 5, 0, null],[\"Dem6box1\", \"ci_945\", 2, 5, 0, null],[\"Dem6box2\", \"ci_946\", 2, 5, 0, null],[\"Dem6box3\", \"ci_947\", 2, 5, 0, null],[\"Dem6table1\", \"ci_948\", 2, 5, 0, null],[\"Dem6table2\", \"ci_949\", 2, 5, 0, null],[\"Dem6table3\", \"ci_950\", 2, 5, 0, null],[\"Dem6tree1\", \"ci_951\", 2, 5, 0, null],[\"Dem6tree2\", \"ci_952\", 2, 5, 0, null],[\"Dem6tree3\", \"ci_953\", 2, 5, 0, null],[\"Dem6machine1\", \"ci_954\", 2, 5, 0, null],[\"Dem6machine2\", \"ci_955\", 2, 5, 0, null],[\"Dem6machine3\", \"ci_956\", 2, 5, 0, null],[\"Dem3tree1\", \"ci_957\", 2, 6, 0, null],[\"Dem3tree2\", \"ci_958\", 2, 6, 0, null],[\"Dem3tree3\", \"ci_959\", 2, 6, 0, null],[\"Dem3char1\", \"ci_960\", 2, 6, 0, null],[\"Dem3char2\", \"ci_961\", 2, 6, 0, null],[\"Dem3char3\", \"ci_962\", 2, 6, 0, null],[\"Dem3table1\", \"ci_963\", 2, 6, 0, null],[\"Dem3table2\", \"ci_964\", 2, 6, 0, null],[\"Dem3table3\", \"ci_965\", 2, 6, 0, null],[\"Dem3plant1\", \"ci_966\", 2, 6, 0, null],[\"Dem3plant2\", \"ci_967\", 2, 6, 0, null],[\"Dem3plant3\", \"ci_968\", 2, 6, 0, null],[\"Dem3picture1\", \"ci_969\", 2, 6, 0, null],[\"Dem3picture2\", \"ci_970\", 2, 6, 0, null],[\"Dem3picture3\", \"ci_971\", 2, 6, 0, null],[\"Dem7left1\", \"ci_972\", 2, 7, 0, null],[\"Dem7left2\", \"ci_973\", 2, 7, 0, null],[\"Dem7left3\", \"ci_974\", 2, 7, 0, null],[\"Dem7right1\", \"ci_975\", 2, 7, 0, null],[\"Dem7right2\", \"ci_976\", 2, 7, 0, null],[\"Dem7right3\", \"ci_977\", 2, 7, 0, null],[\"Dem7table1\", \"ci_978\", 2, 7, 0, null],[\"Dem7table2\", \"ci_979\", 2, 7, 0, null],[\"Dem7table3\", \"ci_980\", 2, 7, 0, null],[\"Dem7tree1\", \"ci_981\", 2, 7, 0, null],[\"Dem7tree2\", \"ci_982\", 2, 7, 0, null],[\"Dem7tree3\", \"ci_983\", 2, 7, 0, null],[\"Dem7picture1\", \"ci_984\", 2, 7, 0, null],[\"Dem7picture2\", \"ci_985\", 2, 7, 0, null],[\"Dem7picture3\", \"ci_986\", 2, 7, 0, null],[\"Dem8bottle1\", \"ci_987\", 2, 8, 0, null],[\"Dem8bottle2\", \"ci_988\", 2, 8, 0, null],[\"Dem8bottle3\", \"ci_989\", 2, 8, 0, null],[\"Dem8char1\", \"ci_990\", 2, 8, 0, null],[\"Dem8char2\", \"ci_991\", 2, 8, 0, null],[\"Dem8char3\", \"ci_992\", 2, 8, 0, null],[\"Dem8table1\", \"ci_993\", 2, 8, 0, null],[\"Dem8table2\", \"ci_994\", 2, 8, 0, null],[\"Dem8table3\", \"ci_995\", 2, 8, 0, null],[\"Dem8tree1\", \"ci_996\", 2, 8, 0, null],[\"Dem8tree2\", \"ci_997\", 2, 8, 0, null],[\"Dem8tree3\", \"ci_998\", 2, 8, 0, null],[\"Dem8picture1\", \"ci_999\", 2, 8, 0, null],[\"Dem8picture2\", \"ci_1000\", 2, 8, 0, null],[\"Dem8picture3\", \"ci_1001\", 2, 8, 0, null],[\"Dem9candy1\", \"ci_1002\", 2, 9, 0, null],[\"Dem9candy2\", \"ci_1003\", 2, 9, 0, null],[\"Dem9candy3\", \"ci_1004\", 2, 9, 0, null],[\"Dem9bear1\", \"ci_1005\", 2, 9, 0, null],[\"Dem9bear2\", \"ci_1006\", 2, 9, 0, null],[\"Dem9bear3\", \"ci_1007\", 2, 9, 0, null],[\"Dem9table1\", \"ci_1008\", 2, 9, 0, null],[\"Dem9table2\", \"ci_1009\", 2, 9, 0, null],[\"Dem9table3\", \"ci_1010\", 2, 9, 0, null],[\"Dem9flower1\", \"ci_1011\", 2, 9, 0, null],[\"Dem9flower2\", \"ci_1012\", 2, 9, 0, null],[\"Dem9flower3\", \"ci_1013\", 2, 9, 0, null],[\"Dem9picture1\", \"ci_1014\", 2, 9, 0, null],[\"Dem9picture2\", \"ci_1015\", 2, 9, 0, null],[\"Dem9picture3\", \"ci_1016\", 2, 9, 0, null],[\"DailyScoreType1\", \"ci_1017\", 0, 15, 0, null],[\"DailyScoreType2\", \"ci_1018\", 0, 15, 0, null],[\"DailyScoreType3\", \"ci_1019\", 0, 15, 0, null],[\"DailyScoreType4\", \"ci_1020\", 0, 15, 0, null],[\"DailyScoreType5\", \"ci_1021\", 0, 15, 0, null],[\"DailyScoreType6\", \"ci_1022\", 0, 15, 0, null],[\"DailyScoreType7\", \"ci_1023\", 0, 15, 0, null],[\"DailyScoreType8\", \"ci_1024\", 0, 15, 0, null],[\"DailyScoreType9\", \"ci_1025\", 0, 15, 0, null],[\"DailyScoreType10\", \"ci_1026\", 0, 15, 0, null],[\"DailyScoreType11\", \"ci_1027\", 0, 15, 0, null],[\"DailyScoreType12\", \"ci_1028\", 0, 15, 0, null],[\"DailyScoreType13\", \"ci_1029\", 0, 15, 0, null],[\"DailyScoreType14\", \"ci_1030\", 0, 15, 0, null],[\"DailyScoreType15\", \"ci_1031\", 0, 15, 0, null],[\"DailyScoreType16\", \"ci_1032\", 0, 15, 0, null],[\"DailyScoreType17\", \"ci_1033\", 0, 15, 0, null],[\"DailyScoreType18\", \"ci_1034\", 0, 15, 0, null],[\"DailyScoreType19\", \"ci_1035\", 0, 15, 0, null],[\"DailyScoreType20\", \"ci_1036\", 0, 15, 0, null],[\"DailyScoreType21\", \"ci_1037\", 0, 15, 0, null],[\"DailyScoreType22\", \"ci_1038\", 0, 15, 0, null],[\"DailyScoreType23\", \"ci_1039\", 0, 15, 0, null],[\"DailyScoreType24\", \"ci_1040\", 0, 15, 0, null],[\"DailyScoreType25\", \"ci_1041\", 0, 15, 0, null],[\"DailyScoreType26\", \"ci_1042\", 0, 15, 0, null],[\"DailyScoreType27\", \"ci_1043\", 0, 15, 0, null],[\"DailyScoreType28\", \"ci_1044\", 0, 15, 0, null],[\"DailyScoreType29\", \"ci_1045\", 0, 15, 0, null],[\"DailyScoreType30\", \"ci_1046\", 0, 15, 0, null],[\"DailyScoreType31\", \"ci_1047\", 0, 15, 0, null],[\"DailyScoreType32\", \"ci_1048\", 0, 15, 0, null],[\"DailyScoreType33\", \"ci_1049\", 0, 15, 0, null],[\"DailyScoreType34\", \"ci_1050\", 0, 15, 0, null],[\"DailyScoreType35\", \"ci_1051\", 0, 15, 0, null],[\"DailyScoreType36\", \"ci_1052\", 0, 15, 0, null],[\"DailyScoreType37\", \"ci_1053\", 0, 15, 0, null],[\"DailyScoreType38\", \"ci_1054\", 0, 15, 0, null],[\"DailyScoreType39\", \"ci_1055\", 0, 15, 0, null],[\"DailyScoreType40\", \"ci_1056\", 0, 15, 0, null],[\"DailyScoreType41\", \"ci_1057\", 0, 15, 0, null],[\"DailyScoreType42\", \"ci_1058\", 0, 15, 0, null],[\"DailyScoreType43\", \"ci_1059\", 0, 15, 0, null],[\"DailyScoreType44\", \"ci_1060\", 0, 15, 0, null],[\"DailyScoreType45\", \"ci_1061\", 0, 15, 0, null],[\"DailyScoreType46\", \"ci_1062\", 0, 15, 0, null],[\"DailyScoreType47\", \"ci_1063\", 0, 15, 0, null],[\"DailyScoreType48\", \"ci_1064\", 0, 15, 0, null],[\"DailyScoreType49\", \"ci_1065\", 0, 15, 0, null],[\"DailyScoreType50\", \"ci_1066\", 0, 15, 0, null],[\"DailyScoreType51\", \"ci_1067\", 0, 15, 0, null],[\"DailyScoreType52\", \"ci_1068\", 0, 15, 0, null],[\"DailyScoreType53\", \"ci_1069\", 0, 15, 0, null],[\"DailyScoreType54\", \"ci_1070\", 0, 15, 0, null],[\"DailyScoreType55\", \"ci_1071\", 0, 15, 0, null],[\"DailyScoreType56\", \"ci_1072\", 0, 15, 0, null],[\"DailyScoreType57\", \"ci_1073\", 0, 15, 0, null],[\"DailyScoreType58\", \"ci_1074\", 0, 15, 0, null],[\"DailyScoreType59\", \"ci_1075\", 0, 15, 0, null],[\"DailyLevelDoneType1\", \"ci_1076\", 0, 15, 0, null],[\"DailyLevelDoneType2\", \"ci_1077\", 0, 15, 0, null],[\"DailyLevelDoneType3\", \"ci_1078\", 0, 15, 0, null],[\"DailyLevelDoneType4\", \"ci_1079\", 0, 15, 0, null],[\"DailyLevelDoneType5\", \"ci_1080\", 0, 15, 0, null],[\"DailyLevelDoneType6\", \"ci_1081\", 0, 15, 0, null],[\"DailyLevelDoneType7\", \"ci_1082\", 0, 15, 0, null],[\"DailyLevelDoneType8\", \"ci_1083\", 0, 15, 0, null],[\"DailyLevelDoneType9\", \"ci_1084\", 0, 15, 0, null],[\"DailyLevelDoneType10\", \"ci_1085\", 0, 15, 0, null],[\"DailyLevelDoneType11\", \"ci_1086\", 0, 15, 0, null],[\"DailyLevelDoneType12\", \"ci_1087\", 0, 15, 0, null],[\"DailyLevelDoneType13\", \"ci_1088\", 0, 15, 0, null],[\"DailyLevelDoneType14\", \"ci_1089\", 0, 15, 0, null],[\"DailyLevelDoneType15\", \"ci_1090\", 0, 15, 0, null],[\"DailyLevelDoneType16\", \"ci_1091\", 0, 15, 0, null],[\"DailyLevelDoneType17\", \"ci_1092\", 0, 15, 0, null],[\"DailyLevelDoneType18\", \"ci_1093\", 0, 15, 0, null],[\"DailyLevelDoneType19\", \"ci_1094\", 0, 15, 0, null],[\"DailyLevelDoneType20\", \"ci_1095\", 0, 15, 0, null],[\"DailyLevelDoneType21\", \"ci_1096\", 0, 15, 0, null],[\"DailyLevelDoneType22\", \"ci_1097\", 0, 15, 0, null],[\"DailyLevelDoneType23\", \"ci_1098\", 0, 15, 0, null],[\"DailyLevelDoneType24\", \"ci_1099\", 0, 15, 0, null],[\"DailyLevelDoneType25\", \"ci_1100\", 0, 15, 0, null],[\"DailyLevelDoneType26\", \"ci_1101\", 0, 15, 0, null],[\"DailyLevelDoneType27\", \"ci_1102\", 0, 15, 0, null],[\"DailyLevelDoneType28\", \"ci_1103\", 0, 15, 0, null],[\"DailyLevelDoneType29\", \"ci_1104\", 0, 15, 0, null],[\"DailyLevelDoneType30\", \"ci_1105\", 0, 15, 0, null],[\"DailyLevelDoneType31\", \"ci_1106\", 0, 15, 0, null],[\"DailyLevelDoneType32\", \"ci_1107\", 0, 15, 0, null],[\"DailyLevelDoneType33\", \"ci_1108\", 0, 15, 0, null],[\"DailyLevelDoneType34\", \"ci_1109\", 0, 15, 0, null],[\"DailyLevelDoneType35\", \"ci_1110\", 0, 15, 0, null],[\"DailyLevelDoneType36\", \"ci_1111\", 0, 15, 0, null],[\"DailyLevelDoneType37\", \"ci_1112\", 0, 15, 0, null],[\"DailyLevelDoneType38\", \"ci_1113\", 0, 15, 0, null],[\"DailyLevelDoneType39\", \"ci_1114\", 0, 15, 0, null],[\"DailyLevelDoneType40\", \"ci_1115\", 0, 15, 0, null],[\"DailyLevelDoneType41\", \"ci_1116\", 0, 15, 0, null],[\"DailyLevelDoneType42\", \"ci_1117\", 0, 15, 0, null],[\"DailyLevelDoneType43\", \"ci_1118\", 0, 15, 0, null],[\"DailyLevelDoneType44\", \"ci_1119\", 0, 15, 0, null],[\"DailyLevelDoneType45\", \"ci_1120\", 0, 15, 0, null],[\"DailyLevelDoneType46\", \"ci_1121\", 0, 15, 0, null],[\"DailyLevelDoneType47\", \"ci_1122\", 0, 15, 0, null],[\"DailyLevelDoneType48\", \"ci_1123\", 0, 15, 0, null],[\"DailyLevelDoneType49\", \"ci_1124\", 0, 15, 0, null],[\"DailyLevelDoneType50\", \"ci_1125\", 0, 15, 0, null],[\"DailyLevelDoneType51\", \"ci_1126\", 0, 15, 0, null],[\"DailyLevelDoneType52\", \"ci_1127\", 0, 15, 0, null],[\"DailyLevelDoneType53\", \"ci_1128\", 0, 15, 0, null],[\"DailyLevelDoneType54\", \"ci_1129\", 0, 15, 0, null],[\"DailyLevelDoneType55\", \"ci_1130\", 0, 15, 0, null],[\"DailyLevelDoneType56\", \"ci_1131\", 0, 15, 0, null],[\"DailyLevelDoneType57\", \"ci_1132\", 0, 15, 0, null],[\"DailyLevelDoneType58\", \"ci_1133\", 0, 15, 0, null],[\"DailyLevelDoneType59\", \"ci_1134\", 0, 15, 0, null],[\"rEasy\", \"ci_1135\", 0, 15, 0, null],[\"rNormal\", \"ci_1136\", 0, 15, 0, null],[\"rHard\", \"ci_1137\", 0, 15, 0, null],[\"completed_hard_task_daily_goal\", \"ci_1138\", 0, 15, 0, null],[\"DailyTask\", \"ci_1139\", 0, 15, 0, null],[\"time_complete_all_happiness_task\", \"ci_1140\", 2, 15, 0, null],[\"completed_all_happiness_tasks\", \"ci_1141\", 0, 15, 0, null],[\"ItemDailyHappinessDone1\", \"ci_1142\", 0, 16, 0, null],[\"ItemDailyHappinessDone2\", \"ci_1143\", 0, 16, 0, null],[\"ItemDailyHappinessDone3\", \"ci_1144\", 0, 16, 0, null],[\"ItemDailyHappinessDone4\", \"ci_1145\", 0, 16, 0, null],[\"ItemDailyHappinessDone5\", \"ci_1146\", 0, 16, 0, null],[\"TUTORIAL_DAILY_HAPPINESS\", \"ci_1147\", 0, 11, 0, null],[\"TOTAL_DAYS_COMPLETE_DAILY_GOAL\", \"ci_1148\", 0, 13, 0, null],[\"TOTAL_COIN_PANTRY\", \"ci_1149\", 0, 13, 0, null],[\"total_win_level_happiness\", \"ci_1150\", 0, 16, 0, null],[\"TIME_ACHIEVEMENT\", \"ci_1151\", 2, 12, 0, null],[\"RandomBoostType1\", \"ci_1152\", 0, 15, 0, null],[\"RandomBoostType2\", \"ci_1153\", 0, 15, 0, null],[\"RandomBoostType3\", \"ci_1154\", 0, 15, 0, null],[\"RandomBoostType4\", \"ci_1155\", 0, 15, 0, null],[\"RandomBoostType5\", \"ci_1156\", 0, 15, 0, null],[\"RandomBoostType6\", \"ci_1157\", 0, 15, 0, null],[\"RandomBoostType7\", \"ci_1158\", 0, 15, 0, null],[\"RandomBoostType8\", \"ci_1159\", 0, 15, 0, null],[\"RandomBoostType9\", \"ci_1160\", 0, 15, 0, null],[\"RandomBoostType10\", \"ci_1161\", 0, 15, 0, null],[\"RandomBoostType11\", \"ci_1162\", 0, 15, 0, null],[\"RandomBoostType12\", \"ci_1163\", 0, 15, 0, null],[\"RandomBoostType13\", \"ci_1164\", 0, 15, 0, null],[\"RandomBoostType14\", \"ci_1165\", 0, 15, 0, null],[\"RandomBoostType15\", \"ci_1166\", 0, 15, 0, null],[\"RandomBoostType16\", \"ci_1167\", 0, 15, 0, null],[\"RandomBoostType17\", \"ci_1168\", 0, 15, 0, null],[\"RandomBoostType18\", \"ci_1169\", 0, 15, 0, null],[\"RandomBoostType19\", \"ci_1170\", 0, 15, 0, null],[\"RandomBoostType20\", \"ci_1171\", 0, 15, 0, null],[\"RandomBoostType21\", \"ci_1172\", 0, 15, 0, null],[\"RandomBoostType22\", \"ci_1173\", 0, 15, 0, null],[\"RandomBoostType23\", \"ci_1174\", 0, 15, 0, null],[\"RandomBoostType24\", \"ci_1175\", 0, 15, 0, null],[\"RandomBoostType25\", \"ci_1176\", 0, 15, 0, null],[\"RandomBoostType26\", \"ci_1177\", 0, 15, 0, null],[\"RandomBoostType27\", \"ci_1178\", 0, 15, 0, null],[\"RandomBoostType28\", \"ci_1179\", 0, 15, 0, null],[\"RandomBoostType29\", \"ci_1180\", 0, 15, 0, null],[\"RandomBoostType30\", \"ci_1181\", 0, 15, 0, null],[\"RandomBoostType31\", \"ci_1182\", 0, 15, 0, null],[\"RandomBoostType32\", \"ci_1183\", 0, 15, 0, null],[\"RandomBoostType33\", \"ci_1184\", 0, 15, 0, null],[\"RandomBoostType34\", \"ci_1185\", 0, 15, 0, null],[\"RandomBoostType35\", \"ci_1186\", 0, 15, 0, null],[\"RandomBoostType36\", \"ci_1187\", 0, 15, 0, null],[\"RandomBoostType37\", \"ci_1188\", 0, 15, 0, null],[\"RandomBoostType38\", \"ci_1189\", 0, 15, 0, null],[\"RandomBoostType39\", \"ci_1190\", 0, 15, 0, null],[\"RandomBoostType40\", \"ci_1191\", 0, 15, 0, null],[\"RandomBoostType41\", \"ci_1192\", 0, 15, 0, null],[\"RandomBoostType42\", \"ci_1193\", 0, 15, 0, null],[\"RandomBoostType43\", \"ci_1194\", 0, 15, 0, null],[\"RandomBoostType44\", \"ci_1195\", 0, 15, 0, null],[\"RandomBoostType45\", \"ci_1196\", 0, 15, 0, null],[\"RandomBoostType46\", \"ci_1197\", 0, 15, 0, null],[\"RandomBoostType47\", \"ci_1198\", 0, 15, 0, null],[\"RandomBoostType48\", \"ci_1199\", 0, 15, 0, null],[\"RandomBoostType49\", \"ci_1200\", 0, 15, 0, null],[\"RandomBoostType50\", \"ci_1201\", 0, 15, 0, null],[\"RandomBoostType51\", \"ci_1202\", 0, 15, 0, null],[\"RandomBoostType52\", \"ci_1203\", 0, 15, 0, null],[\"RandomBoostType53\", \"ci_1204\", 0, 15, 0, null],[\"RandomBoostType54\", \"ci_1205\", 0, 15, 0, null],[\"RandomBoostType55\", \"ci_1206\", 0, 15, 0, null],[\"RandomBoostType56\", \"ci_1207\", 0, 15, 0, null],[\"RandomBoostType57\", \"ci_1208\", 0, 15, 0, null],[\"RandomBoostType58\", \"ci_1209\", 0, 15, 0, null],[\"RandomBoostType59\", \"ci_1210\", 0, 15, 0, null],[\"RESET_SCORE_ACHIEVEMENTType1\", \"ci_1211\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType2\", \"ci_1212\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType3\", \"ci_1213\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType4\", \"ci_1214\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType5\", \"ci_1215\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType6\", \"ci_1216\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType7\", \"ci_1217\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType8\", \"ci_1218\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType9\", \"ci_1219\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType10\", \"ci_1220\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType11\", \"ci_1221\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType12\", \"ci_1222\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType13\", \"ci_1223\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType14\", \"ci_1224\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType15\", \"ci_1225\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType16\", \"ci_1226\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType17\", \"ci_1227\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType18\", \"ci_1228\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType19\", \"ci_1229\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType20\", \"ci_1230\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType21\", \"ci_1231\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType22\", \"ci_1232\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType23\", \"ci_1233\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType24\", \"ci_1234\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType25\", \"ci_1235\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType26\", \"ci_1236\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType27\", \"ci_1237\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType28\", \"ci_1238\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType29\", \"ci_1239\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType30\", \"ci_1240\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType31\", \"ci_1241\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType32\", \"ci_1242\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType33\", \"ci_1243\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType34\", \"ci_1244\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType35\", \"ci_1245\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType36\", \"ci_1246\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType37\", \"ci_1247\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType38\", \"ci_1248\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType39\", \"ci_1249\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType40\", \"ci_1250\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType41\", \"ci_1251\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType42\", \"ci_1252\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType43\", \"ci_1253\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType44\", \"ci_1254\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType45\", \"ci_1255\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType46\", \"ci_1256\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType47\", \"ci_1257\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType48\", \"ci_1258\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType49\", \"ci_1259\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType50\", \"ci_1260\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType51\", \"ci_1261\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType52\", \"ci_1262\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType53\", \"ci_1263\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType54\", \"ci_1264\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType55\", \"ci_1265\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType56\", \"ci_1266\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType57\", \"ci_1267\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType58\", \"ci_1268\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType59\", \"ci_1269\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType60\", \"ci_1270\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType61\", \"ci_1271\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType62\", \"ci_1272\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType63\", \"ci_1273\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType64\", \"ci_1274\", 0, 12, 0, null],[\"RESET_SCORE_ACHIEVEMENTType65\", \"ci_1275\", 0, 12, 0, null],[\"DEDICATION_ACHIEVEMENT\", \"ci_1276\", 0, 12, 0, null],[\"LevelCupcake\", \"ci_1277\", 0, 13, 0, null],[\"TIME_OBTAIN_1_STAR\", \"ci_1278\", 2, 12, 0, null],[\"TutorialLuckyBox\", \"ci_1279\", 0, 11, 0, null],[\"GO_STREAKING_ACHIEVEMENT\", \"ci_1280\", 0, 11, 0, null],[\"total_win_level_daily_rewad\", \"ci_1281\", 0, 13, 0, null],[\"TimePack1\", \"ci_1282\", 2, 13, 0, null],[\"HasOffer1\", \"ci_1283\", 2, 13, 0, null],[\"HasOffer\", \"ci_1284\", 2, 13, 0, null],[\"TimePack\", \"ci_1285\", 2, 13, 0, null],[\"LastShowOffer\", \"ci_1286\", 0, 13, 0, null],[\"TIME_INFINITE_HEART\", \"ci_1287\", 2, 13, 0, null],[\"buyAnyThing\", \"ci_1288\", 0, 13, 0, null],[\"keyBuyedIAP\", \"ci_1289\", 0, 13, 0, null],[\"SpinTime\", \"ci_1290\", 0, 13, 0, null],[\"SpineWhell_Open\", \"ci_1291\", 0, 13, 0, null],[\"WheelCount\", \"ci_1292\", 0, 13, 0, null],[\"Money\", \"ci_1293\", 1, 13, 0, null],[\"timeWatchAdGameWin\", \"ci_1294\", 2, 13, 0, null],[\"keyNumWatchAdGameWin\", \"ci_1295\", 0, 13, 0, null],[\"keyNumLevelShowWatchAds\", \"ci_1296\", 0, 13, 0, null],[\"TutorialWatchVideo\", \"ci_1297\", 0, 13, 0, null]]', '415d7eb2ced6cd8acb434fe72858272b', 'd22323f7e2f656b81ac1984bc2fa0825', NULL), ('config_md5.json', '{\"config_data_sync_type\":\"d22323f7e2f656b81ac1984bc2fa0825\"}', 'aa4f0024c79c0c466efa8f7c568999eb', 'ba1e39c547e7b0d3740679ca8e413bb3', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_gem_change_type
-- ----------------------------
DROP TABLE IF EXISTS `config_gem_change_type`;
CREATE TABLE `config_gem_change_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of config_gem_change_type
-- ----------------------------
BEGIN;
INSERT INTO `config_gem_change_type` VALUES (0, 'UNKNOW', 'UNKNOW'), (1, 'COMPLETE_LEVEL', 'LUCKY_BOX_REWARD'), (2, 'TUTORIAL_LEVEL_13', 'RATE_REWARD'), (3, 'DAILY_HAPPINESS', 'DAILY_HAPPINESS_REWARD'), (4, 'ACHIEVEMENT', 'ACHIEVEMENT_REWARD'), (5, 'DAILY_GOAL', 'DAILY_GOAL_REWARD'), (6, 'SPINWHEEL_REWARD', 'SPINWHEEL_REWARD'), (7, 'SPINWHEEL_FEE', 'BUY_SPIN_AGAIN'), (8, 'MEMBERSHIP_TRIAL', 'TRIAL_MEMBERSHIP'), (9, 'MEMBERSHIP_REWARD', 'MEMBERSHIP_REWARD'), (10, 'STARTER_PACK', 'STARTER_PACK_REWARD'), (11, 'IAP', 'BUY_WHISKS_PACKS'), (12, 'BUNDLES', 'BUY_BUNDLE_PACKS'), (13, 'GAMEPLAY', 'DECORATE_USING_REWARD'), (14, 'DECORATE_REWARD', 'DECORATE_BUYING_REWARD'), (15, 'DECORATE_FEE', 'BUY_DECORATE'), (16, 'DAILY_FREE_GIFT', 'DAILY_FREE_GIFT'), (17, 'BOOST_SHOP', 'BUY_BOOST'), (18, 'FREE_BOOST_SHOP', 'SOCIAL_NETWORK_REWARD'), (19, 'TIME_QUEST', 'TIME_QUEST_REWARD'), (20, 'UPGRADE_LOLLIPOP', 'UPGRADE_LOLLIPOP_TRUCK'), (21, 'UPGRADE', 'UPGRADE'), (22, 'NMT', 'BUY_NMT'), (23, 'NMC', 'BUY_NMC'), (24, 'NSC', 'BUY_NSC'), (25, 'PROMOTE_CODE', 'ADD_PROMOTE_CODE'), (26, 'HEART', 'BUY_HEART'), (27, 'ENDLESS_LEVEL_REWARD', 'ENDLESS_LEVEL_REWARD'), (28, 'SYNC_DATA_SET', 'SYNC_DATA_SET'), (29, 'EMAIL_GIFT_REWARD', 'EMAIL_GIFT_REWARD'), (30, 'EMAIL_FORCE_SET', 'EMAIL_FORCE_SET'), (31, 'DECORATE_TIME_FEE', 'BUY_TIME_DECORATE'), (32, 'SUBSCRIPTION', 'BUY_SUBSCRIPTION_PACKS'), (33, 'BUY_TICKET', 'BUY_TICKET');
COMMIT;

-- ----------------------------
-- Table structure for config_user_move
-- ----------------------------
DROP TABLE IF EXISTS `config_user_move`;
CREATE TABLE `config_user_move`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `after_hour` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of config_user_move
-- ----------------------------
BEGIN;
INSERT INTO `config_user_move` VALUES (1, 'recently', '7day', 168), (2, '7day', '30day', 720), (3, '30day', '90day', 2160);
COMMIT;

-- ----------------------------
-- Table structure for debug_log
-- ----------------------------
DROP TABLE IF EXISTS `debug_log`;
CREATE TABLE `debug_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for email_support_thread
-- ----------------------------
DROP TABLE IF EXISTS `email_support_thread`;
CREATE TABLE `email_support_thread`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(255) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  `notes` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for email_support_thread_reply
-- ----------------------------
DROP TABLE IF EXISTS `email_support_thread_reply`;
CREATE TABLE `email_support_thread_reply`  (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NULL DEFAULT NULL,
  `user_id_send` int(255) NULL DEFAULT NULL,
  `user_id_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_send` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for email_user
-- ----------------------------
DROP TABLE IF EXISTS `email_user`;
CREATE TABLE `email_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_send` datetime(0) NULL DEFAULT NULL,
  `sent_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gift` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT 'Thời gian hết hạn của email',
  `email_type` int(255) NOT NULL DEFAULT 0 COMMENT '0 : normal - delete when read, 1: gift : delete after claim; 2: importain : delete after expire ; 3: force set data',
  `is_read` int(255) NULL DEFAULT 0 COMMENT 'is user readed email',
  `is_deleted` int(255) NULL DEFAULT 0 COMMENT 'is_deleted email, user will not show it',
  `is_claimed` int(255) NULL DEFAULT 0,
  `is_auto_delete` int(255) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for event_config
-- ----------------------------
DROP TABLE IF EXISTS `event_config`;
CREATE TABLE `event_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_from` datetime(0) NULL DEFAULT NULL,
  `show_to` datetime(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `play_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `play_data` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 : combo, 1 : coin, 2 :level ',
  `auto_recreate_after` int(255) NULL DEFAULT NULL COMMENT '0 : not auto recreate, > 0 : hours from end_time will recreate this event',
  `id_recreated` int(255) NULL DEFAULT NULL COMMENT 'id event recreated',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for log_user_cate_force_change_20190510
-- ----------------------------
DROP TABLE IF EXISTS `log_user_cate_force_change_20190510`;
CREATE TABLE `log_user_cate_force_change_20190510`  (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `time_change` datetime(0) NULL DEFAULT NULL,
  `old_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for user_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_30day`;
CREATE TABLE `user_30day`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nếu đăng nhập bằng tài khoản được đăng ký bởi user thì mới có giá trị, còn nếu đăng nhập bằng device_id hoặc là các tài khoản openid như facebook, gmail thì không',
  `login_type` int(255) NOT NULL DEFAULT 0 COMMENT '0 : device_id , 1 :facebook , 2 : google',
  `last_device_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Last device id logined / sync data',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  `time_created` datetime(0) NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `other_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các thông tin cơ bản khác của user, nếu sau này thực hiện đăng nhập hoặc là cho user điền thêm form thì lưu lại vào đây',
  `old_user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_7day`;
CREATE TABLE `user_7day`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nếu đăng nhập bằng tài khoản được đăng ký bởi user thì mới có giá trị, còn nếu đăng nhập bằng device_id hoặc là các tài khoản openid như facebook, gmail thì không',
  `login_type` int(255) NOT NULL DEFAULT 0 COMMENT '0 : device_id , 1 :facebook , 2 : google',
  `last_device_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Last device id logined / sync data',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  `time_created` datetime(0) NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `other_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các thông tin cơ bản khác của user, nếu sau này thực hiện đăng nhập hoặc là cho user điền thêm form thì lưu lại vào đây',
  `old_user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_90day`;
CREATE TABLE `user_90day`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nếu đăng nhập bằng tài khoản được đăng ký bởi user thì mới có giá trị, còn nếu đăng nhập bằng device_id hoặc là các tài khoản openid như facebook, gmail thì không',
  `login_type` int(255) NOT NULL DEFAULT 0 COMMENT '0 : device_id , 1 :facebook , 2 : google',
  `last_device_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Last device id logined / sync data',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  `time_created` datetime(0) NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `other_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các thông tin cơ bản khác của user, nếu sau này thực hiện đăng nhập hoặc là cho user điền thêm form thì lưu lại vào đây',
  `old_user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_0_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_0_30day`;
CREATE TABLE `user_data_0_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_0_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_0_7day`;
CREATE TABLE `user_data_0_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_0_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_0_90day`;
CREATE TABLE `user_data_0_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_0_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_0_recently`;
CREATE TABLE `user_data_0_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_10_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_10_30day`;
CREATE TABLE `user_data_10_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_10_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_10_7day`;
CREATE TABLE `user_data_10_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_10_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_10_90day`;
CREATE TABLE `user_data_10_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_10_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_10_recently`;
CREATE TABLE `user_data_10_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_11_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_11_30day`;
CREATE TABLE `user_data_11_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_11_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_11_7day`;
CREATE TABLE `user_data_11_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_11_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_11_90day`;
CREATE TABLE `user_data_11_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_11_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_11_recently`;
CREATE TABLE `user_data_11_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_12_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_12_30day`;
CREATE TABLE `user_data_12_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_12_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_12_7day`;
CREATE TABLE `user_data_12_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_12_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_12_90day`;
CREATE TABLE `user_data_12_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_12_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_12_recently`;
CREATE TABLE `user_data_12_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_13_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_13_30day`;
CREATE TABLE `user_data_13_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_13_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_13_7day`;
CREATE TABLE `user_data_13_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_13_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_13_90day`;
CREATE TABLE `user_data_13_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_13_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_13_recently`;
CREATE TABLE `user_data_13_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_14_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_14_30day`;
CREATE TABLE `user_data_14_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_14_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_14_7day`;
CREATE TABLE `user_data_14_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_14_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_14_90day`;
CREATE TABLE `user_data_14_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_14_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_14_recently`;
CREATE TABLE `user_data_14_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_15_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_15_30day`;
CREATE TABLE `user_data_15_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_15_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_15_7day`;
CREATE TABLE `user_data_15_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_15_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_15_90day`;
CREATE TABLE `user_data_15_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_15_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_15_recently`;
CREATE TABLE `user_data_15_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_16_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_16_30day`;
CREATE TABLE `user_data_16_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_16_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_16_7day`;
CREATE TABLE `user_data_16_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_16_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_16_90day`;
CREATE TABLE `user_data_16_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_16_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_16_recently`;
CREATE TABLE `user_data_16_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_1_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_1_30day`;
CREATE TABLE `user_data_1_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_1_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_1_7day`;
CREATE TABLE `user_data_1_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_1_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_1_90day`;
CREATE TABLE `user_data_1_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_1_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_1_recently`;
CREATE TABLE `user_data_1_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_2_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_2_30day`;
CREATE TABLE `user_data_2_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_2_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_2_7day`;
CREATE TABLE `user_data_2_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_2_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_2_90day`;
CREATE TABLE `user_data_2_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_2_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_2_recently`;
CREATE TABLE `user_data_2_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_3_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_3_30day`;
CREATE TABLE `user_data_3_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_3_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_3_7day`;
CREATE TABLE `user_data_3_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_3_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_3_90day`;
CREATE TABLE `user_data_3_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_3_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_3_recently`;
CREATE TABLE `user_data_3_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_4_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_4_30day`;
CREATE TABLE `user_data_4_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_4_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_4_7day`;
CREATE TABLE `user_data_4_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_4_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_4_90day`;
CREATE TABLE `user_data_4_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_4_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_4_recently`;
CREATE TABLE `user_data_4_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_5_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_5_30day`;
CREATE TABLE `user_data_5_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_5_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_5_7day`;
CREATE TABLE `user_data_5_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_5_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_5_90day`;
CREATE TABLE `user_data_5_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_5_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_5_recently`;
CREATE TABLE `user_data_5_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_6_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_6_30day`;
CREATE TABLE `user_data_6_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_6_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_6_7day`;
CREATE TABLE `user_data_6_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_6_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_6_90day`;
CREATE TABLE `user_data_6_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_6_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_6_recently`;
CREATE TABLE `user_data_6_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_7_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_7_30day`;
CREATE TABLE `user_data_7_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_7_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_7_7day`;
CREATE TABLE `user_data_7_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_7_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_7_90day`;
CREATE TABLE `user_data_7_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_7_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_7_recently`;
CREATE TABLE `user_data_7_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_8_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_8_30day`;
CREATE TABLE `user_data_8_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_8_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_8_7day`;
CREATE TABLE `user_data_8_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_8_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_8_90day`;
CREATE TABLE `user_data_8_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_8_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_8_recently`;
CREATE TABLE `user_data_8_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9998_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9998_30day`;
CREATE TABLE `user_data_9998_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9998_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9998_7day`;
CREATE TABLE `user_data_9998_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9998_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9998_90day`;
CREATE TABLE `user_data_9998_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9998_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9998_recently`;
CREATE TABLE `user_data_9998_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9999_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9999_30day`;
CREATE TABLE `user_data_9999_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9999_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9999_7day`;
CREATE TABLE `user_data_9999_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9999_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9999_90day`;
CREATE TABLE `user_data_9999_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9999_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9999_recently`;
CREATE TABLE `user_data_9999_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9_30day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9_30day`;
CREATE TABLE `user_data_9_30day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9_7day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9_7day`;
CREATE TABLE `user_data_9_7day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9_90day
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9_90day`;
CREATE TABLE `user_data_9_90day`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_data_9_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_data_9_recently`;
CREATE TABLE `user_data_9_recently`  (
  `user_id` int(11) NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_log_gem
-- ----------------------------
DROP TABLE IF EXISTS `user_log_gem`;
CREATE TABLE `user_log_gem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time_log` datetime(0) NULL DEFAULT NULL,
  `month_log` int(255) NULL DEFAULT NULL COMMENT 'Log month, set to filter',
  `change_type` int(255) NULL DEFAULT NULL,
  `change_value` int(255) NULL DEFAULT NULL,
  `value_after` int(255) NULL DEFAULT NULL,
  `level` int(255) NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `local_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_partions
-- ----------------------------
DROP TABLE IF EXISTS `user_partions`;
CREATE TABLE `user_partions`  (
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_type` int(255) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `user_date` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`username`, `login_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Table structure for user_recently
-- ----------------------------
DROP TABLE IF EXISTS `user_recently`;
CREATE TABLE `user_recently`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Nếu đăng nhập bằng tài khoản được đăng ký bởi user thì mới có giá trị, còn nếu đăng nhập bằng device_id hoặc là các tài khoản openid như facebook, gmail thì không',
  `login_type` int(255) NOT NULL DEFAULT 0 COMMENT '0 : device_id , 1 :facebook , 2 : google',
  `last_device_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Last device id logined / sync data',
  `last_time_sync` datetime(0) NULL DEFAULT NULL,
  `time_created` datetime(0) NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `other_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Các thông tin cơ bản khác của user, nếu sau này thực hiện đăng nhập hoặc là cho user điền thêm form thì lưu lại vào đây',
  `old_user_id` int(11) NULL DEFAULT NULL COMMENT 'user_id khi login bằng device, login lại bằng facebook sẽ cần lưu lại id để xóa dữ liệu cũ.',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`username`, `login_type`) USING BTREE,
  INDEX `last_device_id`(`last_device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ----------------------------
-- Procedure structure for admin_config_data_sync_category_get_all
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_config_data_sync_category_get_all`;
delimiter ;;
CREATE PROCEDURE `admin_config_data_sync_category_get_all`()
BEGIN
  #Routine body goes here...
	select * from config_data_sync_category;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_config_data_sync_category_save
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_config_data_sync_category_save`;
delimiter ;;
CREATE PROCEDURE `admin_config_data_sync_category_save`(in V_IN_ADMIN int,
in V_IN_ID int,
in V_IN_NAME varchar(1000),
in V_IN_DESCRIPTION varchar(1000))
BEGIN
  #Routine body goes here...
	insert into config_data_sync_category(id,name,description)
	values(V_IN_ID,V_IN_NAME,V_IN_DESCRIPTION)
	on duplicate key update 
	name = V_IN_NAME,
	description = V_IN_DESCRIPTION;
	commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_config_data_sync_type_change_code
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_config_data_sync_type_change_code`;
delimiter ;;
CREATE PROCEDURE `admin_config_data_sync_type_change_code`(in V_IN_OLD_CODE varchar(100),
in V_IN_OLD_CATEGORY int,
in V_IN_NEW_CODE varchar(100),
in V_IN_NEW_CATEGORY int)
LB_CHANGE:BEGIN
  #Big question : Khi mình đổi trên server, mà client chưa đổi config, thì khi client đẩy dữ liệu lên vẫn là category cũ và key cũ, khi ấy xử lý ntn, và xử lý không?
	# Khi số lượng user còn nhỏ, thì có thể còn cho thay đổi category và key, nhưng khi user đã lớn ( khoảng 500K bản ghi user) thì việc thay đổi code và category sẽ mất rất nhiều thời gian và tạo gánh nặng cho hệ thống.
	# Khi bản thân 1 user và dưới client cũng không quan tâm đến categroy của 1 key, cũng như code của 1 key, mà chỉ cần đọc và lấy được dữ liệu đúng theo config từ file config.
	

if( V_IN_OLD_CODE <> V_IN_NEW_CODE and  V_IN_OLD_CATEGORY = V_IN_NEW_CATEGORY) then 
		LEAVE LB_CHANGE;
 end if;# if not have any change, return


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_config_data_sync_type_get_all
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_config_data_sync_type_get_all`;
delimiter ;;
CREATE PROCEDURE `admin_config_data_sync_type_get_all`()
BEGIN
  #Routine body goes here...
	select * from config_data_sync_type;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_config_data_sync_type_save
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_config_data_sync_type_save`;
delimiter ;;
CREATE PROCEDURE `admin_config_data_sync_type_save`(in V_IN_ADMIN int,
in V_IN_ID int,
in V_IN_KEY varchar(100),
in V_IN_CODE varchar(100),
in V_IN_CATE_TYPE int,
in V_IN_VALUE_TYPE int,
in V_IN_IS_NOT_SYNC int,
in V_IN_LEVEL int,
in V_IN_DESCRIPTION varchar(1000))
LB_SAVE:BEGIN
  #Routine body goes here...
	
	DECLARE x_old_code varchar(100);
	DECLARE x_old_cate int;
	
	DECLARE x_max_id int;
	
	if(V_IN_ID is not null and V_IN_ID <> -1) then

				select `code`, cate_type into x_old_code, x_old_cate from config_data_sync_type where id = V_IN_ID limit 0,1;
	
				insert into config_data_sync_type(id,`code`,`key`,cate_type,value_type,is_not_sync,level,description)
				values(V_IN_ID,V_IN_CODE,V_IN_KEY, V_IN_CATE_TYPE,V_IN_VALUE_TYPE,V_IN_IS_NOT_SYNC,V_IN_LEVEL, V_IN_DESCRIPTION  )
				on duplicate key update 
				`code` = V_IN_CODE,
				`key` = V_IN_KEY,
				`cate_type` = V_IN_CATE_TYPE,
				`value_type` = V_IN_VALUE_TYPE,
				`is_not_sync` = V_IN_IS_NOT_SYNC,
				`level` = V_IN_LEVEL,
				description = V_IN_DESCRIPTION;
				commit;

				if(x_old_code is not null) then
							call admin_config_data_sync_type_change_code(
							x_old_code, x_old_cate,
							V_IN_CODE, V_IN_CATE_TYPE
							);
				end if;
				commit;
				
				LEAVE LB_SAVE;
	end if;
	
	
	select max(id) into x_max_id from config_data_sync_type;
	set V_IN_ID:= ifnull(x_max_id,0) +1;
	set V_IN_CODE:= concat("ci_",V_IN_ID);
	
	insert into config_data_sync_type(id,`code`,`key`,cate_type,value_type,is_not_sync,level,description)
				values(V_IN_ID,V_IN_CODE,V_IN_KEY, V_IN_CATE_TYPE,V_IN_VALUE_TYPE,V_IN_IS_NOT_SYNC,V_IN_DESCRIPTION, V_IN_DESCRIPTION  )
				on duplicate key update 
				`code` = V_IN_CODE,
				`key` = V_IN_KEY,
				`cate_type` = V_IN_CATE_TYPE,
				`value_type` = V_IN_VALUE_TYPE,
				`is_not_sync` = V_IN_IS_NOT_SYNC,
				description = V_IN_DESCRIPTION;
				commit;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_config_files_update_category_type
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_config_files_update_category_type`;
delimiter ;;
CREATE PROCEDURE `admin_config_files_update_category_type`()
BEGIN
	#Routine body goes here...

update config_files 
set content = (select concat('[',GROUP_CONCAT(JSON_ARRAY(`key`,`code`,value_type,cate_type,is_not_sync,`level` )),']') from config_data_sync_type)
where filename = 'config_data_sync_type.json';

update config_files set 
last_md5 = if(curr_md5<>md5(content),last_md5,curr_md5),
curr_md5 = md5(content)
where filename = 'config_data_sync_type.json';

commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_create_user
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_create_user`;
delimiter ;;
CREATE PROCEDURE `admin_create_user`(in V_IN_USER_ADMIN int, in V_IN_USERNAME varchar(100), in V_IN_PASSWORD varchar(100), in V_IN_ROLES varchar(100))
BEGIN
  #Routine body goes here...

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_delete_user
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_delete_user`;
delimiter ;;
CREATE PROCEDURE `admin_delete_user`(in V_IN_ADMIN_ID int,
in V_IN_USER_ID int)
BEGIN
delete from user_recently where id =V_IN_USER_ID limit 1;
call admin_user_data_delete_all_info(V_IN_USER_ID);

select 0 status, "OK" msg, '{}' data;	
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_email_list_get
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_email_list_get`;
delimiter ;;
CREATE PROCEDURE `admin_email_list_get`(in V_IN_ADMIN_ID int,
in V_IN_USER_ID int,
in V_IN_PAGE int)
BEGIN
  #Routine body goes here...
	
	DECLARE x_offset int;
	set x_offset:= V_IN_PAGE* 20;
	
	select a.id, utils_format_datetime(a.time_send) time_send ,
	title,content,email_type,gift,is_deleted,is_read,is_claimed,expire_time,sent_by
	from email_user a
	where user_id = V_IN_USER_ID
order by a.id desc
	limit x_offset,20;
	
	commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_log
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_log`;
delimiter ;;
CREATE PROCEDURE `admin_log`(in V_IN_USER_ID int,
in V_IN_FUNC_LOG varchar(100),
in V_IN_DATA_LOG text)
BEGIN
  #Routine body goes here...

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_login`;
delimiter ;;
CREATE PROCEDURE `admin_login`(in V_IN_USERNAME varchar(100), in V_IN_PASSWORD varchar(100), in V_IN_CLIENT_DATA text)
LB_LOGIN:BEGIN
  #Routine body goes here...
	DECLARE x_user_id int;
	select id into x_user_id from admin_user where username = V_IN_USERNAME and `password` = V_IN_PASSWORD limit 0,1;
	if(x_user_id is null) then 
		select 1 status, "Login fail, not found user." msg, '{}' data;

	LEAVE LB_LOGIN;
	end if;
	
	
	select 0 status, "Login success" msg, JSON_OBJECT('id',id,"fullname",fullname,"roles",roles,"address",address,"mobile",mobile) data
	from admin_user
	where id = x_user_id 
	limit 0,1;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_search_user
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_search_user`;
delimiter ;;
CREATE PROCEDURE `admin_search_user`(in V_IN_ADMIN_ID int,
in V_IN_USER_ID int,
in V_IN_FULLNAME varchar(100),
in V_IN_DEVICE_ID varchar(100))
LB_SELECT:BEGIN
  #Routine body goes here...
	
	if(V_IN_USER_ID <> 0 ) then 
			call user_move_to_recently(V_IN_USER_ID);
			select 
				a.id,
				a.fullname,
				a.last_device_id,
				a.login_type,
				a.time_created,
				a.last_time_sync,
				
				JSON_UNQUOTE(JSON_EXTRACT(a.`other_info`, '$.language')) `language`,		
				JSON_UNQUOTE(JSON_EXTRACT(a.`other_info`, '$.device_name')) `device_name`,		
				JSON_UNQUOTE(JSON_EXTRACT(a.`other_info`, '$.os')) `os`,
				JSON_EXTRACT(b.`data`, '$.ci_1') coin,		
				JSON_EXTRACT(b.`data`, '$.ci_2') gem,		
				JSON_EXTRACT(b.`data`, '$.ci_6') level,
				JSON_EXTRACT(b.`data`, '$.ci_4') star,
				JSON_EXTRACT(b.`data`, '$.ci_335') ticket

		from user_recently a join user_data_0_recently b on  a.id = V_IN_USER_ID and  a.id = b.user_id;
			LEAVE LB_SELECT;
	end if;
	
	
		select 
		a.id,
		a.fullname,
		a.last_device_id,
		a.login_type,
		a.time_created,
		a.last_time_sync,
		
				JSON_UNQUOTE(JSON_EXTRACT(a.`other_info`, '$.language')) `language`,		
				JSON_UNQUOTE(JSON_EXTRACT(a.`other_info`, '$.device_name')) `device_name`,		
				JSON_UNQUOTE(JSON_EXTRACT(a.`other_info`, '$.os')) `os`,	

		JSON_EXTRACT(b.`data`, '$.ci_1') coin,		
			JSON_EXTRACT(b.`data`, '$.ci_2') gem,		
		JSON_EXTRACT(b.`data`, '$.ci_6') level ,
		JSON_EXTRACT(b.`data`, '$.ci_4') star,
		JSON_EXTRACT(b.`data`, '$.ci_335') ticket
			
			
		from user_recently a join user_data_0_recently b on  a.id = b.user_id
		where (V_IN_FULLNAME <> '' and a.fullname like concat('%',V_IN_FULLNAME,'%'))
		or (V_IN_FULLNAME = '' and a.last_device_id = V_IN_DEVICE_ID) limit 100;
		
		


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_send_email
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_send_email`;
delimiter ;;
CREATE PROCEDURE `admin_send_email`(in V_IN_ADMIN_ID int,
in V_IN_USER_ID int,
in V_IN_TITLE varchar(1000),
in V_IN_CONTENT varchar(2000),
in V_IN_SEND_BY varchar(100),
in V_IN_GIFT varchar(1000),
in V_IN_EMAIL_TYPE int,
in V_IN_TIME_EXPIRE datetime)
BEGIN
DECLARE x_id_force_set int;

select id into x_id_force_set from email_user
where V_IN_EMAIL_TYPE = 3 and  user_id = V_IN_USER_ID and email_type = 3 limit 0,1;


if(x_id_force_set is not null) then
# Nếu đã tồn tại email type = force set data 3 , delete old value and insert new
delete from email_user where id = x_id_force_set limit 1;
end if;

  #Routine body goes here...
	insert into email_user(user_id,title,content,time_send,sent_by,gift,expire_time,email_type)
	values(V_IN_USER_ID,V_IN_TITLE,V_IN_CONTENT,now(),V_IN_SEND_BY,if(V_IN_EMAIL_TYPE = 1 or V_IN_EMAIL_TYPE = 3 ,V_IN_GIFT,'{}'),V_IN_TIME_EXPIRE,V_IN_EMAIL_TYPE);
	select 0 status,"Send email success" msg,"{}" data;
	commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_user_data_delete_all_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_user_data_delete_all_info`;
delimiter ;;
CREATE PROCEDURE `admin_user_data_delete_all_info`(in V_IN_USER_ID int)
BEGIN
  #Routine body goes here...
DECLARE finished INTEGER DEFAULT 0;
DECLARE x_cate_type int;
DECLARE x_result_category text;
DECLARE x_temp CURSOR FOR 
select DISTINCT id
from config_data_sync_category 
;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN x_temp;
read_loop: LOOP
	FETCH x_temp INTO x_cate_type;

	IF finished = 1 THEN 
		LEAVE read_loop;
	END IF;

call admin_user_data_delete_all_info_by_category(V_IN_USER_ID,x_cate_type);

END LOOP read_loop;
CLOSE x_temp;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_user_data_delete_all_info_by_category
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_user_data_delete_all_info_by_category`;
delimiter ;;
CREATE PROCEDURE `admin_user_data_delete_all_info_by_category`(in V_IN_USER_ID int, in V_IN_CATE int)
BEGIN
  #Routine body goes here...
	
	set @V_IN_USER_ID:= V_IN_USER_ID;
	set @V_IN_CATE := V_IN_CATE;
	

SET @sql_create_table = concat("delete from `user_data_",V_IN_CATE,"_recently` where user_id = ",V_IN_USER_ID," limit 1;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for admin_user_gem_log
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_user_gem_log`;
delimiter ;;
CREATE PROCEDURE `admin_user_gem_log`(in V_IN_ADMIN_ID int,
in V_IN_USER_ID int,
in V_IN_PAGE int)
BEGIN
  #Routine body goes here...
	
	DECLARE x_offset int;
	set x_offset:= V_IN_PAGE* 50;
	
	select a.id, utils_format_datetime(a.time_log) time_log , a.change_type,a.change_value,a.value_after,a.detail detail,a.description description,a.local_time,a.level , b.description change_type_name  from user_log_gem a
	left join config_gem_change_type b on a.change_type = b.id 
	where user_id = V_IN_USER_ID
	order by a.id desc
	limit x_offset,50;
	
	commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for create_table_log_force_change_today
-- ----------------------------
DROP PROCEDURE IF EXISTS `create_table_log_force_change_today`;
delimiter ;;
CREATE PROCEDURE `create_table_log_force_change_today`()
BEGIN
DECLARE x_has_err int;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION set x_has_err = 1;

SET @sql_create_table = concat("CREATE TABLE IF NOT EXISTS `log_user_cate_force_change_",(date(now())+0),"` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `time_change` datetime DEFAULT NULL,
  `old_value` text,
  PRIMARY KEY (`id`,user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
PARTITION BY hash( user_id )
PARTITIONS 10
;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for debug_log_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `debug_log_insert`;
delimiter ;;
CREATE PROCEDURE `debug_log_insert`(in V_IN_DATA_LOG text)
BEGIN
DECLARE x_has_err int;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION set x_has_err = 1;
  #Routine body goes here...
	insert into debug_log(log_data)
	values(V_IN_DATA_LOG);
	commit;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for email_user_check_has_mail
-- ----------------------------
DROP PROCEDURE IF EXISTS `email_user_check_has_mail`;
delimiter ;;
CREATE PROCEDURE `email_user_check_has_mail`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICE_ID varchar(100))
BEGIN
  #Routine body goes here...
	DECLARE x_offset int;
	DECLARE x_data text;
	DECLARE x_count int;
	set x_offset:=0;
	
	select id
	into x_count
	from email_user 
	where user_id = V_IN_USER_ID
	and ( is_deleted is null or is_deleted <> 1)
	and ( is_read is null or is_read <>1)
	limit 0,1;
	
	select  0 status,"OK" msg,JSON_OBJECT("has_email",if(x_count>0,1,0)) data;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for email_user_claim_force_set
-- ----------------------------
DROP PROCEDURE IF EXISTS `email_user_claim_force_set`;
delimiter ;;
CREATE PROCEDURE `email_user_claim_force_set`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICE_ID varchar(100),
in V_IN_EMAIL_ID int)
LB_READ: BEGIN
  #Routine body goes here...
	DECLARE x_email_type int;
	DECLARE x_gift varchar(500);
	
	select email_type, gift
	into x_email_type,x_gift
	from email_user 
	where id = V_IN_EMAIL_ID 
	and user_id = V_IN_USER_ID
	limit 0,1;
	
	if(x_email_type is null or ( x_email_type <> 3)) then 
	# if not found email, as well as email readed
			select 1 status, "Email not have force set data type" msg, JSON_OBJECT("email_type",x_email_type)data;
			LEAVE LB_READ;
	end if;
	
	if(x_gift is null or x_gift = "" or x_gift = '{}') then 
				select 1 status, "Email not have gift" msg, JSON_OBJECT("email_type",x_email_type)data;
				LEAVE LB_READ;
	end if;
	
	# after use delete form
	#update email_user set is_deleted = 1, is_claimed = 1 where id  = V_IN_EMAIL_ID limit 1;
	select 0 status, "OK" msg, JSON_OBJECT( "is_del",0, "is_claimed",1,"gift",x_gift) data;
	
	commit;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for email_user_claim_force_set_success
-- ----------------------------
DROP PROCEDURE IF EXISTS `email_user_claim_force_set_success`;
delimiter ;;
CREATE PROCEDURE `email_user_claim_force_set_success`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICE_ID varchar(100),
in V_IN_EMAIL_ID int)
LB_READ: BEGIN
  #Routine body goes here...
	DECLARE x_email_type int;
	DECLARE x_gift varchar(500);
	
	select email_type, gift
	into x_email_type,x_gift
	from email_user 
	where id = V_IN_EMAIL_ID 
	and user_id = V_IN_USER_ID
	limit 0,1;
	
	# after use delete form
	update email_user set is_deleted = 1, is_claimed = 1 where id  = V_IN_EMAIL_ID limit 1;
	select 0 status, "OK" msg, JSON_OBJECT( "is_del",1, "is_claimed",1,"gift",x_gift) data;
	
	commit;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for email_user_claim_gift
-- ----------------------------
DROP PROCEDURE IF EXISTS `email_user_claim_gift`;
delimiter ;;
CREATE PROCEDURE `email_user_claim_gift`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICE_ID varchar(100),
in V_IN_EMAIL_ID int)
LB_READ: BEGIN
  #Routine body goes here...
	DECLARE x_email_type int;
	DECLARE x_gift varchar(500);
	
	select email_type, gift
	into x_email_type,x_gift
	from email_user 
	where id = V_IN_EMAIL_ID 
	and user_id = V_IN_USER_ID
	limit 0,1;
	
	if(x_email_type is null or (x_email_type <> 1 and x_email_type <> 3)) then 
	# if not found email, as well as email readed
			select 1 status, "Email not have gift" msg, JSON_OBJECT("email_type",x_email_type)data;
			LEAVE LB_READ;
	end if;
	
	if(x_gift is null or x_gift = "" or x_gift = '{}') then 
				select 1 status, "Email not have gift" msg, JSON_OBJECT("email_type",x_email_type)data;
				LEAVE LB_READ;
	end if;
	
	# after use delete form
	update email_user set is_deleted = 1, is_claimed = 1 where id  = V_IN_EMAIL_ID limit 1;
	select 0 status, "OK" msg, JSON_OBJECT( "is_del",1, "is_claimed",1,"gift",x_gift) data;
	
	commit;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for email_user_get
-- ----------------------------
DROP PROCEDURE IF EXISTS `email_user_get`;
delimiter ;;
CREATE PROCEDURE `email_user_get`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICE_ID varchar(100))
BEGIN
  #Routine body goes here...
	DECLARE x_offset int;
	DECLARE x_data text;
	set x_offset:=0;
	
	select concat('[',GROUP_CONCAT(JSON_OBJECT("id",id,
	"title",title,
		"content",content,
	"time_send",utils_format_datetime(time_send),
	"sent_by",sent_by,
	"gift",gift,
	"expire_time",utils_format_datetime(expire_time),
	"email_type",email_type,
	"is_read",is_read,
	"is_claimed",is_claimed
	)),']') 
	into x_data
	from email_user 
	where user_id = V_IN_USER_ID
	and ( is_deleted is null or is_deleted <> 1)
	limit x_offset,20;
	
	select  0 status,"OK" msg,ifnull(x_data,'[]') data;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for email_user_read
-- ----------------------------
DROP PROCEDURE IF EXISTS `email_user_read`;
delimiter ;;
CREATE PROCEDURE `email_user_read`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICE_ID varchar(100),
in V_IN_EMAIL_ID int)
LB_READ: BEGIN
  #Routine body goes here...
	DECLARE x_email_type int;
	
	select email_type into x_email_type
	from email_user 
	where id = V_IN_EMAIL_ID and user_id = V_IN_USER_ID
	limit 0,1;
	
	if(x_email_type is null) then 
	# if not found email, as well as email readed
			select 0 status, "OK" msg, '{"is_del":1}' data;
			LEAVE LB_READ;
	end if;
	
	if(x_email_type = 0) then
	# if email type is Normal emal : -> delete after read
		#	delete from email_user where id = V_IN_EMAIL_ID limit 1;
		update email_user set is_deleted = 1 where id  = V_IN_EMAIL_ID limit 1;
		
			select 0 status, "OK" msg, '{"is_del":1}' data;
	end if;
	
	update email_user set is_read = 1 where id = V_IN_EMAIL_ID limit 1;
	select 0 status, "OK" msg, '{"is_del":0 , "is_read":1 }' data;

	commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for log_force_change
-- ----------------------------
DROP PROCEDURE IF EXISTS `log_force_change`;
delimiter ;;
CREATE PROCEDURE `log_force_change`(in V_IN_USER_ID int, in V_IN_CATE_ID int, in V_IN_OLD_DATA text)
BEGIN
	DECLARE x_has_err int;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION set x_has_err = 1;

	#Tao table neu nhu chua co
	call create_table_log_force_change_today();
	
	#insert table
	set @V_IN_OLD_DATA:= V_IN_OLD_DATA;
	set @sql_update = concat("insert into `log_user_cate_force_change_",(date(now())+0),"`(user_id,cate_id,time_change,old_value)
	values(",V_IN_USER_ID,",",V_IN_CATE_ID, ",now(),?);");
	PREPARE stmt FROM @sql_update;
	EXECUTE stmt using @V_IN_OLD_DATA;
	commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for stress_test_login_by_device
-- ----------------------------
DROP PROCEDURE IF EXISTS `stress_test_login_by_device`;
delimiter ;;
CREATE PROCEDURE `stress_test_login_by_device`()
BEGIN
  #Routine body goes here...
	DECLARE x_index int;
	
	
	set x_index :=0;
	WHILE x_index < 100 DO
			call user_login_by_device_id(concat("test1_",floor(rand()*1000),"_",floor(rand()*1000),"_",x_index), 0, '{}', '{}');
			set x_index:= x_index +1;
	END WHILE;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for system_check_table_exits
-- ----------------------------
DROP PROCEDURE IF EXISTS `system_check_table_exits`;
delimiter ;;
CREATE PROCEDURE `system_check_table_exits`(in V_IN_TABLE_NAME varchar(100)
,out V_OUT_IS_EXITS int)
BEGIN
DECLARE x_table_name varchar(100);

SELECT table_name into x_table_name
FROM information_schema.tables
WHERE table_schema = DATABASE()
    AND table_name = V_IN_TABLE_NAME
LIMIT 1;

set V_OUT_IS_EXITS:= if(x_table_name is null,0,1);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for systsem_auto_move_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `systsem_auto_move_data`;
delimiter ;;
CREATE PROCEDURE `systsem_auto_move_data`()
BEGIN
  #Routine body goes here...

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_check_basic_data_to_show_sync
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_check_basic_data_to_show_sync`;
delimiter ;;
CREATE PROCEDURE `user_check_basic_data_to_show_sync`(in V_IN_USER_ID int,in V_BASIC_DATA text, out is_show_popup_choice int)
BEGIN
  #IMPORTANT : DONT SELECT TO CURSOR IN THIS FUNCTION
DECLARE x_gem, x_coin, x_level int;
DECLARE x_server_gem, x_server_coin, x_server_level int;
DECLARE x_data_cate0 text;

set x_gem:= JSON_UNQUOTE(JSON_EXTRACT(V_BASIC_DATA,'$.pGem'));
set x_coin:= JSON_UNQUOTE(JSON_EXTRACT(V_BASIC_DATA,'$.pCoin'));
set x_level:= JSON_UNQUOTE(JSON_EXTRACT(V_BASIC_DATA,'$.levels'));

select `data` 
into x_data_cate0
from user_data_0_recently
where user_id = V_IN_USER_ID
limit 0,1;


set x_server_gem:= JSON_EXTRACT(x_data_cate0,'$.ci_2');
set x_server_coin:= JSON_EXTRACT(x_data_cate0,'$.ci_1');
set x_server_level:= JSON_EXTRACT(x_data_cate0,'$.ci_6');

set is_show_popup_choice:= if( (x_server_gem is not null and x_gem<> x_server_gem) or (x_server_coin is not null and x_coin<>x_server_coin) or ( x_server_level is not null and x_level<>x_server_level) ,1,0);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_check_basic_data_to_show_sync_device_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_check_basic_data_to_show_sync_device_id`;
delimiter ;;
CREATE PROCEDURE `user_check_basic_data_to_show_sync_device_id`(in V_IN_USER_ID int,in V_BASIC_DATA text, out is_show_popup_choice int)
LB_CHECK:BEGIN
  #Routine body goes here...
DECLARE x_gem, x_coin, x_level int;
DECLARE x_server_gem, x_server_coin, x_server_level int;
DECLARE x_data_cate0 text;

set x_gem:= JSON_UNQUOTE(JSON_EXTRACT(V_BASIC_DATA,'$.pGem'));
set x_coin:= JSON_UNQUOTE(JSON_EXTRACT(V_BASIC_DATA,'$.pCoin'));
set x_level:= JSON_UNQUOTE(JSON_EXTRACT(V_BASIC_DATA,'$.levels'));

select `data` 
into x_data_cate0
from user_data_0_recently
where user_id = V_IN_USER_ID
limit 0,1;

set x_server_gem:= JSON_EXTRACT(x_data_cate0,'$.ci_2');
set x_server_coin:= JSON_EXTRACT(x_data_cate0,'$.ci_1');
set x_server_level:= JSON_EXTRACT(x_data_cate0,'$.ci_6');

set is_show_popup_choice:= if((x_level <> 0 and x_level <> 1) and ( x_gem<> x_server_gem or x_coin<>x_server_coin or x_level<>x_server_level ),1,0);

END
;;
delimiter ;

-- ----------------------------
-- Function structure for user_check_is_merged_client_cloud_sync
-- ----------------------------
DROP FUNCTION IF EXISTS `user_check_is_merged_client_cloud_sync`;
delimiter ;;
CREATE FUNCTION `user_check_is_merged_client_cloud_sync`(V_IN_USER_ID int)
 RETURNS int(11)
BEGIN
  #Routine body goes here...
	DECLARE x_is_merge int;
	SELECT JSON_EXTRACT(`data`, "$.ci_0")
	into x_is_merge
	from user_data_0_recently
	where user_id = V_IN_USER_ID
	limit 0,1;
	
	set x_is_merge:= ifnull(x_is_merge,0);
	
	return if(x_is_merge = 1,0,1);
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_get_all_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_get_all_info`;
delimiter ;;
CREATE PROCEDURE `user_data_get_all_info`(in V_IN_USER_ID int, inout V_INOUT_RESULT text)
BEGIN
  #Routine body goes here...
DECLARE finished INTEGER DEFAULT 0;
DECLARE x_has_err int;

DECLARE x_cate_type int;
DECLARE x_result_category text;
DECLARE x_temp CURSOR FOR 
select DISTINCT id
from config_data_sync_category 
;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION set x_has_err = 1;

set V_INOUT_RESULT:= '{}';
OPEN x_temp;
read_loop: LOOP
	FETCH x_temp INTO x_cate_type;

	IF finished = 1 THEN 
		LEAVE read_loop;
	END IF;
set x_result_category:= null;
call user_data_get_info_by_category(V_IN_USER_ID, x_cate_type, x_result_category);
if(x_result_category is not null) then 

set V_INOUT_RESULT:= utils_func_update_json_data(V_INOUT_RESULT, JSON_OBJECT(
	x_cate_type,
	x_result_category
	),'[]');
end if;

END LOOP read_loop;
CLOSE x_temp;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_get_info_by_category
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_get_info_by_category`;
delimiter ;;
CREATE PROCEDURE `user_data_get_info_by_category`(in V_IN_USER_ID int, in V_IN_CATE int, inout V_IN_OUT_RESULT text)
BEGIN
  #Routine body goes here...
		DECLARE x_has_err int;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION set x_has_err = 1;
	
	set @V_IN_USER_ID:= V_IN_USER_ID;
	set @V_IN_CATE := V_IN_CATE;
	
	set @V_IN_OUT_RESULT = V_IN_OUT_RESULT;

SET @sql_create_table = concat("select `data` into @V_IN_OUT_RESULT from `user_data_",V_IN_CATE,"_recently` where user_id = ",V_IN_USER_ID," limit 0,1;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

set V_IN_OUT_RESULT:= @V_IN_OUT_RESULT;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_init_data_new_user_all_category
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_init_data_new_user_all_category`;
delimiter ;;
CREATE PROCEDURE `user_data_init_data_new_user_all_category`(in V_IN_USER_ID int)
BEGIN

DECLARE finished INTEGER DEFAULT 0;
DECLARE x_cate_type int;
DECLARE x_has_err int;

DECLARE x_temp CURSOR FOR 
select id
from config_data_sync_category 
;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION set x_has_err = 1;

OPEN x_temp;
read_loop: LOOP
	FETCH x_temp INTO x_cate_type;

	IF finished = 1 THEN 
		LEAVE read_loop;
	END IF;

#Will remove when has admin tool to crate new category
#call user_data_table_create_by_cate(x_cate_type);

call user_data_init_data_new_user_to_cate(V_IN_USER_ID,x_cate_type);

END LOOP read_loop;
CLOSE x_temp;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_init_data_new_user_to_cate
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_init_data_new_user_to_cate`;
delimiter ;;
CREATE PROCEDURE `user_data_init_data_new_user_to_cate`(in V_IN_USER_ID int, in IN_DATA_CATE int)
BEGIN
  #Routine body goes here...
SET @sql_create_table = concat("insert IGNORE  into `user_data_",IN_DATA_CATE,"_recently` (user_id,`data`,last_time_sync) values(", V_IN_USER_ID,",'{}',now() )");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_move_from_day_to_day_all_category
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_move_from_day_to_day_all_category`;
delimiter ;;
CREATE PROCEDURE `user_data_move_from_day_to_day_all_category`(in V_IN_USER_ID int
,in V_IN_FROM_DAY int
,in V_IN_TO_DAY int)
BEGIN

DECLARE finished INTEGER DEFAULT 0;
DECLARE x_cate_type int;

DECLARE x_temp CURSOR FOR 
select DISTINCT id
from config_data_sync_category 
;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN x_temp;
read_loop: LOOP
	FETCH x_temp INTO x_cate_type;

	IF finished = 1 THEN 
		LEAVE read_loop;
	END IF;

#Will remove when has admin tool to crate new category
call user_data_move_from_day_to_day_by_category(V_IN_USER_ID,x_cate_type,V_IN_FROM_DAY,V_IN_TO_DAY);

END LOOP read_loop;
CLOSE x_temp;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_move_from_day_to_day_by_category
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_move_from_day_to_day_by_category`;
delimiter ;;
CREATE PROCEDURE `user_data_move_from_day_to_day_by_category`(in V_IN_USER_ID int
, in V_IN_DATA_CATE int
,	in V_IN_FROM_DAY int
, in V_IN_TO_DAY int)
BEGIN

SET @sql_create_table = concat("insert into `user_data_",V_IN_DATA_CATE,"_",if(V_IN_TO_DAY=0,'recently',concat(V_IN_TO_DAY,'day')),"` 
	select * from `user_data_",V_IN_DATA_CATE,"_",if(V_IN_FROM_DAY=0,'recently',concat(V_IN_FROM_DAY,'day')),"`
	where user_id = ",V_IN_USER_ID,"
	limit 0,1;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

SET @sql_create_table = concat("delete from  `user_data_",V_IN_DATA_CATE,"_",if(V_IN_FROM_DAY=0,'recently',concat(V_IN_FROM_DAY,'day')),"` where user_id = ",V_IN_USER_ID," limit 1;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_move_to_recently_all_category
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_move_to_recently_all_category`;
delimiter ;;
CREATE PROCEDURE `user_data_move_to_recently_all_category`(in V_IN_USER_ID int
,in V_IN_USER_TABLE_DAY int)
BEGIN

DECLARE finished INTEGER DEFAULT 0;
DECLARE x_cate_type int;

DECLARE x_temp CURSOR FOR 
select DISTINCT id
from config_data_sync_category 
;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN x_temp;
read_loop: LOOP
	FETCH x_temp INTO x_cate_type;

	IF finished = 1 THEN 
		LEAVE read_loop;
	END IF;

#Will remove when has admin tool to crate new category
call user_data_move_to_recently_by_category(V_IN_USER_ID,x_cate_type,V_IN_USER_TABLE_DAY);

END LOOP read_loop;
CLOSE x_temp;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_move_to_recently_by_category
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_move_to_recently_by_category`;
delimiter ;;
CREATE PROCEDURE `user_data_move_to_recently_by_category`(in V_IN_USER_ID int
, in V_IN_DATA_CATE int
,	in V_IN_TABLE_DAY int)
BEGIN

SET @sql_create_table = concat("insert into user_data_",V_IN_DATA_CATE,"_recently
	select * from `user_data_",V_IN_DATA_CATE,"_",V_IN_TABLE_DAY,"day`
	where user_id = ",V_IN_USER_ID,"
	limit 0,1;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

SET @sql_create_table = concat("delete from  `user_data_",V_IN_DATA_CATE,"_",V_IN_TABLE_DAY,"day` where user_id = ",V_IN_USER_ID," limit 1;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_table_create_all_cate
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_table_create_all_cate`;
delimiter ;;
CREATE PROCEDURE `user_data_table_create_all_cate`()
BEGIN
DECLARE finished INTEGER DEFAULT 0;
DECLARE x_cate_type int;

DECLARE x_temp CURSOR FOR 
select DISTINCT id
from config_data_sync_category  
;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

OPEN x_temp;
read_loop: LOOP
	FETCH x_temp INTO x_cate_type;

	IF finished = 1 THEN 
		LEAVE read_loop;
	END IF;

call user_data_table_create_by_cate(x_cate_type);

END LOOP read_loop;
CLOSE x_temp;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_data_table_create_by_cate
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_data_table_create_by_cate`;
delimiter ;;
CREATE PROCEDURE `user_data_table_create_by_cate`(in IN_DATA_CATE int)
BEGIN
  #Routine body goes here...
 
SET @sql_create_table = concat("CREATE TABLE IF NOT EXISTS  `user_data_",IN_DATA_CATE,"_recently` (
  `user_id` int(11) NOT NULL,
  `data` text COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) InnoDB DEFAULT CHARSET=utf8mb4
PARTITION BY hash( user_id )
PARTITIONS 10
;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

SET @sql_create_table = concat("CREATE TABLE IF NOT EXISTS  `user_data_",IN_DATA_CATE,"_7day` (
  `user_id` int(11) NOT NULL,
  `data` text COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
PARTITION BY hash( user_id )
PARTITIONS 10;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

SET @sql_create_table = concat("CREATE TABLE IF NOT EXISTS  `user_data_",IN_DATA_CATE,"_30day` (
  `user_id` int(11) NOT NULL,
  `data` text COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
PARTITION BY hash( user_id )
PARTITIONS 10;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

SET @sql_create_table = concat("CREATE TABLE IF NOT EXISTS  `user_data_",IN_DATA_CATE,"_90day` (
  `user_id` int(11) NOT NULL,
  `data` text COMMENT 'Các trường thông tin cơ bản của user\r\nđược quy định trong bảng sycn_config với type = 0',
  `last_time_sync` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
PARTITION BY hash( user_id )
PARTITIONS 10;");
PREPARE stmt FROM @sql_create_table;
EXECUTE stmt;

commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_gem_change_log
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_gem_change_log`;
delimiter ;;
CREATE PROCEDURE `user_gem_change_log`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICE_ID varchar(100),

in V_IN_CHANGE_TYPE int,
in V_IN_CHANGE_VALUE int,
in V_IN_VALUE_AFTER int,
in V_IN_LEVEL int,
in V_IN_DESCRIPTION varchar(2000),
in V_IN_DETAIL text,
in V_IN_LOCAL_TIME varchar(50))
BEGIN
  #Routine body goes here... 
	insert into user_log_gem(user_id, time_log, month_log, change_type,change_value,value_after,level,description, detail,local_time) 
	values(V_IN_USER_ID, now(), DATE_FORMAT(now(),'%Y%m'),V_IN_CHANGE_TYPE,V_IN_CHANGE_VALUE,V_IN_VALUE_AFTER,V_IN_LEVEL,V_IN_DESCRIPTION,V_IN_DETAIL, V_IN_LOCAL_TIME );
	
	select 0 status, "OK" msg, "{}" data;
	
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_gem_change_log_list
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_gem_change_log_list`;
delimiter ;;
CREATE PROCEDURE `user_gem_change_log_list`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICE_ID varchar(100),
in V_IN_LIST text)
LB_INSERT_LOG:BEGIN
DECLARE  V_IN_CHANGE_TYPE int;
DECLARE V_IN_CHANGE_VALUE int;
DECLARE V_IN_VALUE_AFTER int;
DECLARE V_IN_LEVEL int;
DECLARE V_IN_DESCRIPTION varchar(2000);
DECLARE V_IN_DETAIL text;
DECLARE V_IN_LOCAL_TIME varchar(50);

DECLARE x_length int;
DECLARE x_index int;

if(JSON_LENGTH(ifnull(V_IN_LIST,'[]')) = 0) then 
	select 2 status, "list size 0" msg, "{}" data;
	LEAVE LB_INSERT_LOG;
end if;

set x_length:= JSON_LENGTH(V_IN_LIST);
set x_index:= 0;
while x_index < x_length do 


set V_IN_CHANGE_TYPE := JSON_EXTRACT(V_IN_LIST, concat('$[',x_index,'].change_type'));
set V_IN_CHANGE_VALUE := JSON_EXTRACT(V_IN_LIST, concat('$[',x_index,'].value'));
set V_IN_VALUE_AFTER := JSON_EXTRACT(V_IN_LIST, concat('$[',x_index,'].value_after'));
set V_IN_LEVEL := JSON_EXTRACT(V_IN_LIST, concat('$[',x_index,'].level'));
set V_IN_DESCRIPTION := JSON_UNQUOTE(JSON_EXTRACT(V_IN_LIST, concat('$[',x_index,'].desc')));
set V_IN_DETAIL := JSON_UNQUOTE(JSON_EXTRACT(V_IN_LIST, concat('$[',x_index,'].detail')));
set V_IN_LOCAL_TIME :=JSON_UNQUOTE(JSON_EXTRACT(V_IN_LIST, concat('$[',x_index,'].local_time')));

insert into user_log_gem(user_id, time_log, month_log, change_type,change_value,value_after,level,description, detail,local_time) 
values(V_IN_USER_ID, now(), DATE_FORMAT(now(),'%Y%m'),V_IN_CHANGE_TYPE,V_IN_CHANGE_VALUE,V_IN_VALUE_AFTER,V_IN_LEVEL,V_IN_DESCRIPTION,V_IN_DETAIL, V_IN_LOCAL_TIME );



set x_index:= x_index +1;
end while;



  #Routine body goes here... 
	
	
	select 0 status, "OK" msg, "{}" data;
	
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_get_user_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_get_user_data`;
delimiter ;;
CREATE PROCEDURE `user_get_user_data`(in V_IN_USER_ID int, in V_IN_CATES varchar(100))
BEGIN
  #Routine body goes here...
	DECLARE x_datas text;
	
	call user_data_get_all_info(V_IN_USER_ID,x_datas);
	
	select 0 status, "OK" msg, JSON_OBJECT("all_data",x_datas) data;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_login_by_cloud_username
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_login_by_cloud_username`;
delimiter ;;
CREATE PROCEDURE `user_login_by_cloud_username`(in V_IN_LOGIN_TYPE int,
in V_IN_USERNAME varchar(100),
in V_IN_FULLNAME varchar(100),
in V_IN_CURRENT_TOKEN varchar(500),
in V_IN_LAST_USER_ID int,
in V_IN_DEVICE_ID varchar(100),
in V_IN_CLIENT_INFO text,
in V_IN_USER_BASIC_INFO text)
LB_LOGIN:BEGIN
  #Routine body goes here...
DECLARE x_current_user_id int;
DECLARE x_user_basic_data text;
DECLARE x_fullname varchar(100);
DECLARE x_other_info text;
DECLARE x_all_data text;
DECLARE x_last_time_sync datetime;

DECLARE x_user_id_by_device_id int; # User by device_id hiện tại
DECLARE x_last_id_is_login_by_device int; # User id by V_IN_LAST_USER_ID với type login = 0

DECLARE x_last_device_id varchar(100);

DECLARE x_check_show_popup int;

DECLARE x_old_user_id int;

call user_partion_get_id(V_IN_USERNAME, V_IN_LOGIN_TYPE, x_old_user_id);

call user_move_to_recently(x_old_user_id);

select id,fullname,other_info,last_time_sync,other_info,last_device_id
				into x_current_user_id ,x_fullname , x_other_info,x_last_time_sync,x_other_info,x_last_device_id
				from user_recently
				where username = V_IN_USERNAME and login_type = V_IN_LOGIN_TYPE 
				limit 0,1;

call user_move_to_recently_by_us_type(V_IN_DEVICE_ID, 0);


select id into x_user_id_by_device_id from user_recently where username = V_IN_DEVICE_ID and login_type = 0 limit 0,1;


if(V_IN_LAST_USER_ID >0) then 
		call user_move_to_recently(V_IN_LAST_USER_ID) ;
		select id into x_last_id_is_login_by_device from user_recently where id = V_IN_LAST_USER_ID and login_type = 0 limit 0,1;
end if;

# Nếu như user id truyền lên khác với user id hiện tại 

if(  			V_IN_LAST_USER_ID is not null  and  V_IN_LAST_USER_ID <> 0 
			and  x_current_user_id is not null  and V_IN_LAST_USER_ID <> x_current_user_id
			and  x_last_id_is_login_by_device is not null and x_last_id_is_login_by_device <> V_IN_LAST_USER_ID
) then 
select 1 status,"LOGIN_CLOUD_FAILURE" msg,
						JSON_OBJECT(
							"user_id",0,
							"reason","Cloud id don't match with user_id ",
							"relogin_cloud_as_new",1
						) data;
			commit;
			LEAVE LB_LOGIN;
end if;

if(x_current_user_id is null) then 
			# Nếu chưa tồn tại user có id như vậy thì thực hiện tạo user mới, trả về cờ để user đẩy hết dữ liệu của user lên.
			
			if(x_user_id_by_device_id is null) then 
			# User này chưa login bằng device id bao giờ : thực hiện insert tạo user mới
						insert into user_recently(username,login_type,last_device_id, last_time_sync, time_created,fullname,other_info)
						values(V_IN_USERNAME, V_IN_LOGIN_TYPE, V_IN_DEVICE_ID, now(),now(),V_IN_FULLNAME, ifnull(V_IN_CLIENT_INFO,'{}'));
						
						set x_current_user_id:= LAST_INSERT_ID();
						set x_fullname:= V_IN_FULLNAME;
						call user_data_init_data_new_user_all_category(x_current_user_id);
						call user_partion_save(V_IN_USERNAME,V_IN_LOGIN_TYPE,x_current_user_id,0);

						select 0 status,"LOGIN_CLOUD_SUCCESS" msg,
									JSON_OBJECT(
										"user_id",x_current_user_id,
										"fullname", x_fullname,
										"need_force_push",1,
										"is_first_login_cloud",1
									) data;
						commit;
						LEAVE LB_LOGIN;
			
			
			else 
			# User đã đăng nhập bằng device_id trước đó : thực hiện merge dữ liệu user hiện tại vào user device_id
					
				if(V_IN_LAST_USER_ID = 0 or  V_IN_LAST_USER_ID = x_user_id_by_device_id) then 
				
									update user_recently 
									set username = V_IN_USERNAME
									, fullname = V_IN_FULLNAME
									, login_type = V_IN_LOGIN_TYPE
									, other_info = utils_func_update_json_data(ifnull(other_info,'{}'), ifnull(V_IN_CLIENT_INFO,'{}'),'[]')

									where id = x_user_id_by_device_id 
									limit 1;
									
									call user_partion_delete(V_IN_DEVICE_ID,0);
									call user_partion_save(V_IN_USERNAME,V_IN_LOGIN_TYPE,x_user_id_by_device_id,0);

									select id,fullname,other_info,last_time_sync,other_info
									into x_current_user_id ,x_fullname , x_other_info,x_last_time_sync,x_other_info
									from user_recently
									where id  = x_user_id_by_device_id
									limit 0,1;
									
									select 0 status,"LOGIN_CLOUD_SUCCESS" msg,
									JSON_OBJECT(
										"user_id",x_current_user_id,
										"fullname", x_fullname,
										"is_first_login_cloud",1
									) data;
								commit;
								LEAVE LB_LOGIN;
								
			else
			# Nếu user truyền lên khác với user_id đang có trên server, ==> Trường hợp này chỉ xảy ra nếu user cheat , hack thay đổi id của user ở dưới local
			
						select 1 status,"LOGIN_CLOUD_FAILURE" msg,
									JSON_OBJECT(
										"user_id",0,
										"reason","Cloud id don't match with user_id ",
										"relogin_cloud_as_new",1
									) data;
						LEAVE LB_LOGIN;
			
			end if;
			
end if;  # end if : x_user_id_by_device_id is null 
LEAVE LB_LOGIN;
end if;  # end if : x_current_user_id is null


# Khi user chưa chọn thì không update last device id, để user sau khi vào lại game thì chọn lại. 
update user_recently 
set
`old_user_id`  = if(old_user_id is null, x_last_id_is_login_by_device,old_user_id)
where id = x_current_user_id limit 1;

commit;



if(V_IN_LAST_USER_ID is null or V_IN_LAST_USER_ID = 0) then 
# Trong trường hợp user id đang lưu dưới client mà = 0, thì tức là user vừa mới gỡ đi cài lại game.
# Trả về cho user toàn bộ thông tin data của user để user set vào client ( pull )
call user_data_get_all_info(x_current_user_id, x_all_data);

select 0 status,"LOGIN_CLOUD_SUCCESS" msg,
						JSON_OBJECT(
							"user_id",x_current_user_id,
							"last_time_sync",utils_format_datetime(x_last_time_sync),
							"need_pull",1,
							"fullname", V_IN_FULLNAME,
							"other_info", ifnull(x_other_info,"{}"),
							"basic_data","{}",
							"all_data",ifnull(x_all_data,'{}')
						) data;
			commit;
			LEAVE LB_LOGIN;
end if;  # V_IN_LAST_USER_ID is null or V_IN_LAST_USER_ID = 0

call user_check_basic_data_to_show_sync(x_current_user_id, V_IN_USER_BASIC_INFO, x_check_show_popup);


if(x_last_device_id <> V_IN_DEVICE_ID or (x_last_id_is_login_by_device  = x_user_id_by_device_id) or x_check_show_popup = 1) then 
			call user_data_get_all_info(x_current_user_id, x_all_data);

			select 0 status,"LOGIN_CLOUD_SUCCESS" msg,
									JSON_OBJECT(
										"user_id",x_current_user_id,
										"show_choice_popup",1,
										"last_time_sync",utils_format_datetime(x_last_time_sync),

										"fullname", V_IN_FULLNAME,
										"other_info", ifnull(x_other_info,"{}"),
										"basic_data","{}",
										"all_data",ifnull(x_all_data,'{}')
									) data;
						commit;
						LEAVE LB_LOGIN;

end if; #x_last_device_id <> V_IN_DEVICE_ID or (x_last_id_is_login_by_device  = x_user_id_by_device_id)


select 0 status
			, "LOGIN_CLOUD_SUCCESS" msg
			, JSON_OBJECT(
						"user_id",x_current_user_id,
						"last_time_sync",utils_format_datetime(x_last_time_sync),
#						"show_choice_popup",0,
						"fullname", x_fullname
#						"info_x", concat("x_user_id_by_device_id ",x_user_id_by_device_id, ' _ x_last_id_is_login_by_device : ',x_last_id_is_login_by_device)
#						"other_info", ifnull(x_other_info,"{}")
#						"basic_data",ifnull(x_user_basic_data,"{}")
				) data;
				
		commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_login_by_device_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_login_by_device_id`;
delimiter ;;
CREATE PROCEDURE `user_login_by_device_id`(in V_IN_DEVICE_ID varchar(100),
in V_IN_LAST_USER_ID int,
in V_IN_CLIENT_INFO text,
in V_IN_USER_BASIC_INFO text)
LB_LOGIN:BEGIN
  #Routine body goes here...
DECLARE x_current_user_id int;
DECLARE x_user_basic_data text;
DECLARE x_fullname varchar(100);
DECLARE x_other_info text;
DECLARE x_all_data text;
DECLARE x_last_time_sync datetime;

DECLARE x_old_user_id int;
DECLARE x_check_show_popup int; # Check xem co show popup chon dong bo hay khong

call user_partion_get_id(V_IN_DEVICE_ID, 0, x_old_user_id);
if(x_old_user_id is not null) then
		call user_move_to_recently(x_old_user_id);
end if; # if x_old_user_id is not null

select id,fullname,other_info,last_time_sync
into x_current_user_id ,x_fullname , x_other_info,x_last_time_sync
from user_recently
where username = V_IN_DEVICE_ID and login_type = 0 
limit 0,1;


if(V_IN_LAST_USER_ID is not null  and  V_IN_LAST_USER_ID <> 0 and  x_current_user_id is not null and V_IN_LAST_USER_ID <> x_current_user_id) then 
#Trong trường hợp đã tồn tại user bởi device_id này, thì check xem last_user_id ở dưới client đang lưu có đúng không, nếu không đúng thì có thể là do user đã tác động lên dữ liệu dưới client, thực hiện tạo device id mới, sau đó đăng nhập lại.
select 1 status,"LOGIN_DEVICE_FAILURE" msg,
						JSON_OBJECT(
							"user_id",0,
							"reason","Device id and user id not match",
							"need_create_new_device",1
						) data;
			commit;
			LEAVE LB_LOGIN;

end if;

if(x_current_user_id is null) then 
			# Nếu chưa tồn tại user có id như vậy thì thực hiện tạo user mới, trả về cờ để user đẩy hết dữ liệu của user lên.
			insert into user_recently(username,login_type,last_device_id, last_time_sync, time_created, other_info)
			values(V_IN_DEVICE_ID, 0, V_IN_DEVICE_ID, now(),now(),V_IN_CLIENT_INFO);
			
			set x_current_user_id:= LAST_INSERT_ID();
			set x_fullname:= concat("Guest", x_current_user_id);

			update user_recently set fullname = x_fullname where id = x_current_user_id limit 1;
			
			call user_partion_save(V_IN_DEVICE_ID,0,x_current_user_id,0);
			
			call user_data_init_data_new_user_all_category(x_current_user_id);
	
			select 0 status,"LOGIN_DEVICE_SUCCESS" msg,
						JSON_OBJECT(
							"user_id",x_current_user_id,
							"fullname", x_fullname,
							"need_force_push",1
						) data;
			commit;
			LEAVE LB_LOGIN;
end if;

update user_recently set other_info = utils_func_update_json_data(ifnull(other_info,'{}'), ifnull(V_IN_CLIENT_INFO,'{}'),'[]') where id = x_current_user_id limit 1;
#Cần update ngay other info;

if(V_IN_LAST_USER_ID is null or V_IN_LAST_USER_ID = 0) then 
# Trong trường hợp user id đang lưu dưới client mà = 0, thì tức là user vừa mới gỡ đi cài lại game.
# Trả về cho user toàn bộ thông tin data của user để user set vào client ( pull )
call user_data_get_all_info(x_current_user_id, x_all_data);

call user_check_basic_data_to_show_sync_device_id(x_current_user_id, V_IN_USER_BASIC_INFO, x_check_show_popup);

select 0 status,"LOGIN_DEVICE_SUCCESS" msg,
						JSON_OBJECT(
							"user_id",x_current_user_id,
							"is_check_client_cloud_sync",user_check_is_merged_client_cloud_sync(x_current_user_id),
							"need_pull",if(x_check_show_popup = 1,0,1),
							"show_choice_popup",if(x_check_show_popup = 1,1,0),
							"fullname", ifnull(x_fullname,concat("Guest", x_current_user_id)),
							"other_info", ifnull(x_other_info,"{}"),
							"basic_data","{}",
							"all_data",ifnull(x_all_data,'{}')
						) data;
			commit;
			LEAVE LB_LOGIN;
end if;

select 0 status
			, "LOGIN_DEVICE_SUCCESS" msg
			, JSON_OBJECT(
						"user_id",x_current_user_id,
#						"need_force_sync",0,
						"sync_last_time",utils_format_datetime(x_last_time_sync),
#						"show_choice_popup",0,
						"is_check_client_cloud_sync",user_check_is_merged_client_cloud_sync(x_current_user_id),
						"fullname", ifnull(x_fullname,concat("Guest", x_current_user_id))
#						"other_info", ifnull(x_other_info,"{}")
#						"basic_data",ifnull(x_user_basic_data,"{}"),
						
				) data;
		commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_move_data_auto_30day_to_90day
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_move_data_auto_30day_to_90day`;
delimiter ;;
CREATE PROCEDURE `user_move_data_auto_30day_to_90day`()
BEGIN
  #Routine body goes here...

DECLARE done INT DEFAULT FALSE;
  DECLARE x_user_id INT;
  DECLARE x_login_type int;
 DECLARE x_username varchar(100);
 
 DECLARE cur1 CURSOR FOR 
	select id,username,login_type  from user_30day
	where date(last_time_sync)+0 < date(now()) - 90 ;
	
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur1;
  read_loop: LOOP
    FETCH cur1 INTO x_user_id,x_username,x_login_type;
    IF done THEN
      LEAVE read_loop;
    END IF;
   
	 #Move basic info
	 insert into user_90day select * from user_30day where id = x_user_id limit 0,1;
	 delete from user_30day where id = x_user_id limit 1;
	 
	 # Move categories data
	 call user_data_move_from_day_to_day_all_category(x_user_id,30,90);
	 
	 	 call user_partion_save(x_username, x_login_type, x_user_id, 90);


END LOOP;
  CLOSE cur1;
	
	commit;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_move_data_auto_7day_to_30day
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_move_data_auto_7day_to_30day`;
delimiter ;;
CREATE PROCEDURE `user_move_data_auto_7day_to_30day`()
BEGIN
	DECLARE done INT DEFAULT FALSE;
  DECLARE x_user_id INT;
 DECLARE x_login_type int;
 DECLARE x_username varchar(100);
 
 DECLARE cur1 CURSOR FOR 
	select id,username,login_type from user_7day
	where date(last_time_sync)+0 < date(now()) - 30 ;
	
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur1;
  read_loop: LOOP
    FETCH cur1 INTO x_user_id,x_username,x_login_type;
    IF done THEN
      LEAVE read_loop;
    END IF;
   
	 #Move basic info
	 insert into user_30day select * from user_7day where id = x_user_id limit 0,1;
	 delete from user_7day where id = x_user_id limit 1;
	 
	 # Move categories data
	 call user_data_move_from_day_to_day_all_category(x_user_id,7,30);
	 call user_partion_save(x_username, x_login_type, x_user_id, 30);

END LOOP;
  CLOSE cur1;
	
	commit;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_move_data_auto_recently_to_7day
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_move_data_auto_recently_to_7day`;
delimiter ;;
CREATE PROCEDURE `user_move_data_auto_recently_to_7day`()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE x_user_id INT;
	 DECLARE x_login_type int;
 DECLARE x_username varchar(100);
 
 DECLARE cur1 CURSOR FOR 
	select id,username,login_type from user_recently
	where date(last_time_sync)+0 < date(now()) - 7 ;
	
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur1;
  read_loop: LOOP
    FETCH cur1 INTO x_user_id,x_username,x_login_type;
    IF done THEN
      LEAVE read_loop;
    END IF;
   
	 #Move basic info
	 insert into user_7day select * from user_recently where id = x_user_id limit 0,1;
	 delete from user_recently where id = x_user_id limit 1;
	 
	 # Move categories data
	 call user_data_move_from_day_to_day_all_category(x_user_id,0,7);
	 call user_partion_save(x_username, x_login_type, x_user_id, 7);

END LOOP;
  CLOSE cur1;
	
	commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_move_to_recently
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_move_to_recently`;
delimiter ;;
CREATE PROCEDURE `user_move_to_recently`(in V_IN_USER_ID int)
LB_MOVE:BEGIN
  #Routine body goes here...
DECLARE x_check_exists int;
DECLARE x_username varchar(100);
DECLARE x_login_type int;

select id,username,login_type into x_check_exists,x_username,x_login_type from user_recently where id = V_IN_USER_ID limit 0,1;
if(x_check_exists is not null) then 
# Da o trong recently, return;
	call user_partion_save(x_username,x_login_type,V_IN_USER_ID, 0);
LEAVE LB_MOVE;
end if;

select id,username,login_type into x_check_exists,x_username,x_login_type from user_7day where id = V_IN_USER_ID limit 0,1;
if(x_check_exists is not null) then 
#User dang o trong table last 7 day, move all data to recently
	call user_move_to_recently_from_7day_info(V_IN_USER_ID);
	call user_data_move_to_recently_all_category(V_IN_USER_ID,7);
	call user_partion_save(x_username,x_login_type,V_IN_USER_ID, 0);
	LEAVE LB_MOVE;
end if;


select id,username,login_type into x_check_exists,x_username,x_login_type from user_30day where id = V_IN_USER_ID limit 0,1;
if(x_check_exists is not null) then 
#User dang o trong table last 7 day, move all data to recently
	call user_move_to_recently_from_30day_info(V_IN_USER_ID);
	call user_data_move_to_recently_all_category(V_IN_USER_ID,30);
	call user_partion_save(x_username,x_login_type,V_IN_USER_ID, 0);
	LEAVE LB_MOVE;
end if;


select id,username,login_type into x_check_exists,x_username,x_login_type from user_90day where id = V_IN_USER_ID limit 0,1;
if(x_check_exists is not null) then 
#User dang o trong table last 7 day, move all data to recently
	call user_move_to_recently_from_90day_info(V_IN_USER_ID);
	call user_data_move_to_recently_all_category(V_IN_USER_ID,90);
	call user_partion_save(x_username,x_login_type,V_IN_USER_ID, 0);
	LEAVE LB_MOVE;
end if;

commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_move_to_recently_by_us_type
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_move_to_recently_by_us_type`;
delimiter ;;
CREATE PROCEDURE `user_move_to_recently_by_us_type`(in V_IN_USERNAME varchar(100), in V_IN_LOGIN_TYPE int)
LB_MOVE:BEGIN
  #Routine body goes here...
DECLARE x_check_exists int;

call user_partion_get_id(V_IN_USERNAME,V_IN_LOGIN_TYPE,x_check_exists );
if(x_check_exists is not null) then
		call user_move_to_recently(x_check_exists);
end if; # if x_check_exists is not null 
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_move_to_recently_from_30day_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_move_to_recently_from_30day_info`;
delimiter ;;
CREATE PROCEDURE `user_move_to_recently_from_30day_info`(in V_IN_USER_ID int)
BEGIN
  #Routine body goes here...
	insert into user_recently
	select * from user_30day
	where id = V_IN_USER_ID
	limit 0,1;
	
	delete from user_30day where id = V_IN_USER_ID limit 1;
	commit;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_move_to_recently_from_7day_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_move_to_recently_from_7day_info`;
delimiter ;;
CREATE PROCEDURE `user_move_to_recently_from_7day_info`(in V_IN_USER_ID int)
BEGIN
  #Routine body goes here...
	insert into user_recently
	select * from user_7day
	where id = V_IN_USER_ID
	limit 0,1;
	
	delete from user_7day where id = V_IN_USER_ID limit 1;
	commit;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_move_to_recently_from_90day_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_move_to_recently_from_90day_info`;
delimiter ;;
CREATE PROCEDURE `user_move_to_recently_from_90day_info`(in V_IN_USER_ID int)
BEGIN
  #Routine body goes here...
	insert into user_recently
	select * from user_90day
	where id = V_IN_USER_ID
	limit 0,1;
	
	delete from user_90day where id = V_IN_USER_ID limit 1;
	commit;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_partion_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_partion_delete`;
delimiter ;;
CREATE PROCEDURE `user_partion_delete`(IN V_IN_USERNAME varchar(100),
IN V_IN_LOGIN_TYPE int)
BEGIN
delete from user_partions where username = V_IN_USERNAME and login_type = V_IN_LOGIN_TYPE limit 1;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_partion_get_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_partion_get_id`;
delimiter ;;
CREATE PROCEDURE `user_partion_get_id`(in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
out V_OUT_USER_ID int)
BEGIN

DECLARE x_user_id int;

select user_id into x_user_id from user_partions where username = V_IN_USERNAME and login_type = V_IN_LOGIN_TYPE limit 0,1;

set V_OUT_USER_ID:= x_user_id;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_partion_save
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_partion_save`;
delimiter ;;
CREATE PROCEDURE `user_partion_save`(IN V_IN_USERNAME varchar(100),
IN V_IN_LOGIN_TYPE int,
in V_IN_USER_ID int,
in V_IN_USER_DATE_TABLE int)
BEGIN
  #Routine body goes here...
	insert into user_partions(username,login_type,user_id,user_date)
	values(V_IN_USERNAME,V_IN_LOGIN_TYPE,V_IN_USER_ID,V_IN_USER_DATE_TABLE)
	on duplicate key update 
	user_id = ifnull(V_IN_USER_ID,values(user_id)),
	user_date = ifnull(V_IN_USER_DATE_TABLE,values(user_date)) ;
commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_sync_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_sync_data`;
delimiter ;;
CREATE PROCEDURE `user_sync_data`(in V_IN_USER_ID int,
in V_IN_USERNAME varchar(100),
in V_IN_LOGIN_TYPE int,
in V_IN_DEVICDE_ID varchar(100),
in V_IN_CLIENT_INFO text,

in V_IN_DATA text,
in V_IN_IS_FORCE_UPDATE int,

in V_IN_SYNC_LAST_TIME varchar(100))
LB_SYNC_DATA:BEGIN
  #Routine body goes here...
DECLARE x_last_device_id varchar(100);
DECLARE x_user_id int;
DECLARE x_username varchar(100);
DECLARE x_login_type int;

DECLARE x_basic_info text;
DECLARE x_last_time_sync datetime;
DECLARE x_all_data text;


DECLARE x_index int;
DECLARE x_list_categories varchar(1000);
DECLARE x_category varchar(100);
DECLARE x_json_cate_data text;
DECLARE x_json_changed text;
DECLARE x_json_deleted text;

DECLARE x_old_user_by_device_id int;


if( V_IN_DATA is null or V_IN_DATA='') then 
select 0 status
						,"OK" msg
						,JSON_OBJECT("last_time_sync",utils_format_datetime(now())
												) data;
LEAVE LB_SYNC_DATA;
end if;

select id, last_device_id, username,login_type,last_time_sync,`old_user_id`
into x_user_id,x_last_device_id, x_username,x_login_type,x_last_time_sync,x_old_user_by_device_id
from user_recently
where id = V_IN_USER_ID
limit 0,1;

if(x_user_id is null) then 
		select 1 status,"USER_NOT_FOUND" msg
					,JSON_OBJECT(
									"need_relogin",1
									) data
		;
		LEAVE LB_SYNC_DATA;
end if;

if(x_username <> V_IN_USERNAME) then 
		select 1 status,"USER_ID and USERNAME not match" msg
					,JSON_OBJECT(
									"need_relogin",1
									) data
		;
		LEAVE LB_SYNC_DATA;
end if;

if( ( V_IN_IS_FORCE_UPDATE is null or V_IN_IS_FORCE_UPDATE <> 1) and x_last_device_id <> V_IN_DEVICDE_ID) then 
# V_IN_IS_FORCE_UPDATE is 2, server will check device id
			call user_data_get_all_info(V_IN_USER_ID, x_all_data);
			select 2 status
						,"You have been login on another device, need choice progress" msg
						,JSON_OBJECT("show_choice_popup",1
												,"basic_info","{}"
												,"last_time_sync",utils_format_datetime(x_last_time_sync)
												,"all_data",x_all_data
												) data;
					LEAVE LB_SYNC_DATA;
end if;


if(x_old_user_by_device_id is not null and x_old_user_by_device_id <> 0) then
			delete from user_recently where id = x_old_user_by_device_id and login_type = 0 limit 1;
			call user_partion_delete(x_old_user_by_device_id,0);
			call admin_user_data_delete_all_info(x_old_user_by_device_id);
			delete from user_log_gem where user_id = x_old_user_by_device_id;
			
			update user_recently set `old_user_id` = null where id = V_IN_USER_ID limit 1;
			
			
end if;

set x_category:=null;
set x_index:=0;

set x_list_categories:= JSON_KEYS( ifnull(V_IN_DATA,'{}'));
while x_index < JSON_LENGTH(x_list_categories) do 
	set x_category:= JSON_EXTRACT(x_list_categories,concat('$[',x_index,']'));
	
	if(x_category is not null) then 
			set x_json_cate_data:= JSON_EXTRACT(V_IN_DATA, concat('$.',x_category));
			if(x_json_cate_data is not null) then
						set x_json_changed:= JSON_EXTRACT(x_json_cate_data, concat('$.','changed'));
						set x_json_deleted:= JSON_EXTRACT(x_json_cate_data, concat('$.','deleted'));
						call user_sync_data_by_category( V_IN_USER_ID,
									JSON_UNQUOTE(x_category) ,
									x_json_changed,
									x_json_deleted,
									V_IN_IS_FORCE_UPDATE
						);
			end if;
		end if;
	set x_index:=x_index +1;
end while;

if(V_IN_IS_FORCE_UPDATE is not null and V_IN_IS_FORCE_UPDATE = 1) then 

			update user_recently set last_time_sync = now()
			, last_device_id = V_IN_DEVICDE_ID 
			, other_info = utils_func_update_json_data(ifnull(other_info,'{}'), ifnull(V_IN_CLIENT_INFO,'{}'),'[]')
			where id = V_IN_USER_ID limit 1;
else
			update user_recently set last_time_sync = now() where id = V_IN_USER_ID limit 1;

end if;


select 0 status
						,"OK" msg
						,JSON_OBJECT("last_time_sync",utils_format_datetime(now())
												) data;

commit;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_sync_data_by_category
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_sync_data_by_category`;
delimiter ;;
CREATE PROCEDURE `user_sync_data_by_category`(in V_IN_USER_ID int,
in V_IN_DATA_CATEGORY_TYPE int,
in V_IN_DATA text,
in V_IN_KEY_DEL text,
in V_IN_IS_FORCE_UPDATE int)
LB_SYNC_DATA:BEGIN
  #Routine body goes here...
DECLARE x_last_device_id varchar(100);
DECLARE x_user_id int;
DECLARE x_username varchar(100);
DECLARE x_login_type int;

DECLARE x_basic_info text;
DECLARE x_last_time_sync datetime;

	DECLARE x_has_err int;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION set x_has_err = 1;

#save data;
if(V_IN_USER_ID = 164) then 
		call debug_log_insert(JSON_OBJECT("V_IN_DATA",V_IN_DATA,"V_IN_IS_FORCE_UPDATE",V_IN_IS_FORCE_UPDATE  ));

end if;

if(V_IN_IS_FORCE_UPDATE is not null and (V_IN_IS_FORCE_UPDATE = 1 or V_IN_IS_FORCE_UPDATE = 2) ) then 
		set @V_IN_OUT_RESULT:= '{}';
		SET @sql_create_table = concat("select `data` into @V_IN_OUT_RESULT from `user_data_",V_IN_DATA_CATEGORY_TYPE,"_recently` where user_id = ",V_IN_USER_ID," limit 0,1;");
		PREPARE stmt FROM @sql_create_table;
		EXECUTE stmt;
		call log_force_change(V_IN_USER_ID,V_IN_DATA_CATEGORY_TYPE, @V_IN_OUT_RESULT);
		commit;
end if;

set @V_IN_DATA := V_IN_DATA;
set @V_IN_KEY_DEL:= V_IN_KEY_DEL;
set @V_IN_IS_FORCE_UPDATE:= V_IN_IS_FORCE_UPDATE;
set @TempData := utils_func_update_json_data('{}', ifnull(V_IN_DATA,'{}'),ifnull(V_IN_KEY_DEL,'{}'));

set @sql_update = concat("insert into user_data_",V_IN_DATA_CATEGORY_TYPE,"_recently(user_id,`data`,last_time_sync)
values(",V_IN_USER_ID,",?,now())
on duplicate key update
		last_time_sync = now(),
		`data` = if(?=1,?,utils_func_update_json_data(ifnull(`data`,'{}'), ifnull(?,'{}'),ifnull(?,'{}')));
	");
PREPARE stmt FROM @sql_update;
EXECUTE stmt using @TempData,@V_IN_IS_FORCE_UPDATE,@TempData,@V_IN_DATA,@V_IN_KEY_DEL;

commit;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for utils_format_datetime
-- ----------------------------
DROP FUNCTION IF EXISTS `utils_format_datetime`;
delimiter ;;
CREATE FUNCTION `utils_format_datetime`(V_IN_DATETIME datetime)
 RETURNS varchar(40) CHARSET utf8
BEGIN
DECLARE x_return varchar(50);
set x_return:= DATE_FORMAT(V_IN_DATETIME,'%Y/%m/%d %H:%i');
return x_return;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for utils_func_update_json_data
-- ----------------------------
DROP FUNCTION IF EXISTS `utils_func_update_json_data`;
delimiter ;;
CREATE FUNCTION `utils_func_update_json_data`(V_IN_JSON_DATA text,  V_IN_JSON_CHANGED text, V_IN_DELETE_KEY text)
 RETURNS text CHARSET utf8mb4
JSON_MERGE:BEGIN
#Routine body goes here...
DECLARE V_OUT_JSON_DATA text;
DECLARE x_json_key_changed text;
DECLARE x_index int;
DECLARE x_val varchar(100);

set V_IN_JSON_CHANGED:= ifnull(V_IN_JSON_CHANGED,'{}');
if(V_IN_JSON_DATA is null) then 
set V_OUT_JSON_DATA:= V_IN_JSON_CHANGED;
return V_OUT_JSON_DATA;
LEAVE JSON_MERGE;
end if;

set V_OUT_JSON_DATA:= V_IN_JSON_DATA;
set x_json_key_changed:= JSON_KEYS(V_IN_JSON_CHANGED);
set x_val:=null;
set x_index:=0;

# merge value changed
while x_index < JSON_LENGTH(x_json_key_changed) do 
	set x_val:= JSON_EXTRACT(x_json_key_changed,concat('$[',x_index,']'));
	if(x_val is not null) then 
			set V_OUT_JSON_DATA:= JSON_SET(V_OUT_JSON_DATA, concat('$.',x_val), JSON_EXTRACT(V_IN_JSON_CHANGED, concat('$.',x_val)));
	end if;
	set x_index:=x_index +1;
end while;

# remove key 
set x_val:=null;
set x_index:=0;

set V_IN_DELETE_KEY:= ifnull(V_IN_DELETE_KEY,'[]');
while x_index < JSON_LENGTH(V_IN_DELETE_KEY) do 
	set x_val:= JSON_EXTRACT(V_IN_DELETE_KEY,concat('$[',x_index,']'));
	if(x_val is not null) then 
			set V_OUT_JSON_DATA:= JSON_REMOVE(V_OUT_JSON_DATA, concat('$.',x_val));
	end if;
	set x_index:=x_index +1;
end while;

return V_OUT_JSON_DATA;

END
;;
delimiter ;

-- ----------------------------
-- Event structure for user_move_data_auto
-- ----------------------------
DROP EVENT IF EXISTS `user_move_data_auto`;
delimiter ;;
CREATE EVENT `user_move_data_auto`
ON SCHEDULE
EVERY '1' DAY STARTS '2019-02-28 08:40:42'
DO BEGIN
		call user_move_data_auto_30day_to_90day();
		call user_move_data_auto_7day_to_30day();
		call user_move_data_auto_recently_to_7day();
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
