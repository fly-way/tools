/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.6.238
 Source Server Type    : MySQL
 Source Server Version : 50642
 Source Host           : 192.168.6.238:3306
 Source Schema         : jf

 Target Server Type    : MySQL
 Target Server Version : 50642
 File Encoding         : 65001

 Date: 25/03/2019 18:37:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for log_arena_rank
-- ----------------------------
DROP TABLE IF EXISTS `log_arena_rank`;
CREATE TABLE `log_arena_rank`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `rank` int(11) NOT NULL DEFAULT 0 COMMENT '当前排名',
  `last_rank` int(11) NOT NULL DEFAULT 0 COMMENT '上一次排名',
  `times` int(11) NOT NULL DEFAULT 0 COMMENT '今日挑战次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '竞技场排名变化' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_astrology
-- ----------------------------
DROP TABLE IF EXISTS `log_astrology`;
CREATE TABLE `log_astrology`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `astrology_id` int(11) NOT NULL DEFAULT 0 COMMENT '星座ID',
  `node_id` int(11) NOT NULL DEFAULT 0 COMMENT '星位ID',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '星位当前等级',
  `result` int(11) NOT NULL DEFAULT 0 COMMENT '0：成功 非0：失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '占星' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_change_skill
-- ----------------------------
DROP TABLE IF EXISTS `log_change_skill`;
CREATE TABLE `log_change_skill`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `oldskill` bigint(20) NOT NULL DEFAULT 0 COMMENT '升级前技能id',
  `newskill` bigint(20) NOT NULL DEFAULT 0 COMMENT '升级后技能id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '技能升级' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_consignment_sell
-- ----------------------------
DROP TABLE IF EXISTS `log_consignment_sell`;
CREATE TABLE `log_consignment_sell`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `balance` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家剩余绑元数量',
  `itemid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `amount` int(11) NOT NULL DEFAULT 0 COMMENT '物品数量',
  `money` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品总价格',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `map` bigint(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统回收寄售物品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_deal
-- ----------------------------
DROP TABLE IF EXISTS `log_deal`;
CREATE TABLE `log_deal`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `buy_map` bigint(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  `buy_level` int(11) NOT NULL DEFAULT 0 COMMENT '玩家等级',
  `buy_cp` int(11) NOT NULL DEFAULT 0 COMMENT '金币数量',
  `buy_goods` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物品组字符串，格式(单个物品)： \"id:%d,goodid:%d,goodtype:1,num:%d\" （多个物品情况下字符串连接）',
  `sell_id` bigint(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  `sell_roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '在售玩家ID',
  `sell_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '在售玩家账号',
  `sell_map` bigint(11) NOT NULL DEFAULT 0 COMMENT '在售玩家所在地图ID',
  `sell_level` int(11) NOT NULL DEFAULT 0 COMMENT '在售玩家等级',
  `sell_cp` int(11) NOT NULL DEFAULT 0 COMMENT '在售金币',
  `sell_goods` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物品组字符串，格式(单个物品)： \"id:%d,goodid:%d,goodtype:1,num:%d\" （多个物品情况下字符串连接）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_devildom
-- ----------------------------
DROP TABLE IF EXISTS `log_devildom`;
CREATE TABLE `log_devildom`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `devildom_id` int(11) NOT NULL DEFAULT 0 COMMENT '异界ID',
  `map` bigint(11) NOT NULL DEFAULT 0 COMMENT '玩家所在地图ID',
  `val` int(11) NOT NULL DEFAULT 0 COMMENT '剩余体力',
  `times` int(11) NOT NULL DEFAULT 0 COMMENT '剩余次数',
  `is_quick` int(11) NOT NULL DEFAULT 0 COMMENT '是否为扫荡 0：非扫荡 1：扫荡',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '远征异界' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_dupl
-- ----------------------------
DROP TABLE IF EXISTS `log_dupl`;
CREATE TABLE `log_dupl`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '玩家所在队伍ID',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '副本类型 1：单人 2：组队',
  `result` int(11) NOT NULL DEFAULT 0 COMMENT ' 副本结果 1：成功 2：失败',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '玩家等级',
  `map` bigint(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  `dlevel` int(11) NOT NULL DEFAULT 0 COMMENT '副本等级（DungeonsConfig.lua 配置 key%100）',
  `dscore` int(11) NOT NULL DEFAULT 0 COMMENT '副本结算时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '获得物品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_dupl_end
-- ----------------------------
DROP TABLE IF EXISTS `log_dupl_end`;
CREATE TABLE `log_dupl_end`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `result` int(11) NOT NULL DEFAULT 0 COMMENT '副本结果 0：成功 1：时间到失败 2：主动离开',
  `map` bigint(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '离开副本' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_dupl_enter
-- ----------------------------
DROP TABLE IF EXISTS `log_dupl_enter`;
CREATE TABLE `log_dupl_enter`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '今日进入改副本次数',
  `map` bigint(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进入副本' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_emoney
-- ----------------------------
DROP TABLE IF EXISTS `log_emoney`;
CREATE TABLE `log_emoney`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `amount` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `balance` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家剩余元宝数量',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `reason` int(11) NOT NULL DEFAULT 0 COMMENT '途径, 数量>0:gain_type, 数量<0:consume_type',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0：非绑定 1：绑定',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '元宝变化' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_equip_info
-- ----------------------------
DROP TABLE IF EXISTS `log_equip_info`;
CREATE TABLE `log_equip_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `quality` int(11) NOT NULL DEFAULT 0 COMMENT '品质',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套装信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_equip_up_start
-- ----------------------------
DROP TABLE IF EXISTS `log_equip_up_start`;
CREATE TABLE `log_equip_up_start`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `pos` int(11) NOT NULL DEFAULT 0 COMMENT '装备位置',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '升星前等级',
  `new_level` int(11) NOT NULL DEFAULT 0 COMMENT '升星后等级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '装备升星' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_func_open
-- ----------------------------
DROP TABLE IF EXISTS `log_func_open`;
CREATE TABLE `log_func_open`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '（5：坐骑 233：战翼 21：魂兵 161：魂器 122：圣盾 145：战弩 36：宝甲   其他功能type可以查阅配置文件：FuncOpenConfig.lua）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能开启' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_gold
-- ----------------------------
DROP TABLE IF EXISTS `log_gold`;
CREATE TABLE `log_gold`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '数量（>0:获得 <0:花费）',
  `reason` int(11) NOT NULL DEFAULT 0 COMMENT '途径 gain_type',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '非绑定金币数量变化' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_aid_levup
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_aid_levup`;
CREATE TABLE `log_guild_aid_levup`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `lv` int(11) NOT NULL DEFAULT 0 COMMENT '等级（升级后）',
  `atk` int(11) NOT NULL DEFAULT 0 COMMENT '攻击加成',
  `def` int(11) NOT NULL DEFAULT 0 COMMENT '防御加成',
  `hp` int(11) NOT NULL DEFAULT 0 COMMENT '生命加成',
  `subdef` int(11) NOT NULL DEFAULT 0 COMMENT '破防加成',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会加持升级' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_aid_wash
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_aid_wash`;
CREATE TABLE `log_guild_aid_wash`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `atk` int(11) NOT NULL DEFAULT 0 COMMENT '攻击加成',
  `def` int(11) NOT NULL DEFAULT 0 COMMENT '防御加成',
  `hp` int(11) NOT NULL DEFAULT 0 COMMENT '生命加成',
  `subdef` int(11) NOT NULL DEFAULT 0 COMMENT '破防加成',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会加持洗练' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_bless
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_bless`;
CREATE TABLE `log_guild_bless`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `cost_type` int(11) NOT NULL DEFAULT 0 COMMENT '货币类型 10：金币 12：钻 13：绑钻',
  `cost_count` int(11) NOT NULL DEFAULT 0 COMMENT '花费数量',
  `bg` int(11) NOT NULL DEFAULT 0 COMMENT '增加的帮贡',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会祈福' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_contribute
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_contribute`;
CREATE TABLE `log_guild_contribute`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `item_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '物品ID',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  `cont` int(11) NOT NULL DEFAULT 0 COMMENT '增加的贡献度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会捐献' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_create
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_create`;
CREATE TABLE `log_guild_create`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `guild_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公会名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '创建公会' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_destroy
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_destroy`;
CREATE TABLE `log_guild_destroy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `guild_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公会名称',
  `member_count` int(11) NOT NULL DEFAULT 0 COMMENT '公会成员数量',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'GM：1 非GM：2',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '解散公会' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_liveness
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_liveness`;
CREATE TABLE `log_guild_liveness`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '活跃度增加值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会活跃' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_member_chg
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_member_chg`;
CREATE TABLE `log_guild_member_chg`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `guild_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公会名称',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '1：Add -1:del',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会成语变动' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_guild_skill_levup
-- ----------------------------
DROP TABLE IF EXISTS `log_guild_skill_levup`;
CREATE TABLE `log_guild_skill_levup`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `guild_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '公会ID',
  `groupid` int(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  `lv` int(11) NOT NULL DEFAULT 0 COMMENT '技能等级（升级后）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会技能升级' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_hongyan_call
-- ----------------------------
DROP TABLE IF EXISTS `log_hongyan_call`;
CREATE TABLE `log_hongyan_call`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `hongyan_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '魔神ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '魔神召唤' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_hongyan_exp
-- ----------------------------
DROP TABLE IF EXISTS `log_hongyan_exp`;
CREATE TABLE `log_hongyan_exp`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `hongyan_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '魔神ID',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '提升后等级',
  `exp` int(11) NOT NULL DEFAULT 0 COMMENT '提升后经验',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '魔神升级' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_hongyan_grow
-- ----------------------------
DROP TABLE IF EXISTS `log_hongyan_grow`;
CREATE TABLE `log_hongyan_grow`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `hongyan_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '魔神ID',
  `grow` int(11) NOT NULL DEFAULT 0 COMMENT '激活进度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '魔神激活' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_hongyan_jiban
-- ----------------------------
DROP TABLE IF EXISTS `log_hongyan_jiban`;
CREATE TABLE `log_hongyan_jiban`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '羁绊类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '魔神羁绊' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_hongyan_quality
-- ----------------------------
DROP TABLE IF EXISTS `log_hongyan_quality`;
CREATE TABLE `log_hongyan_quality`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `hongyan_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '魔神ID',
  `quality` int(11) NOT NULL DEFAULT 0 COMMENT '提升后品质',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '魔神晋升' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_item
-- ----------------------------
DROP TABLE IF EXISTS `log_item`;
CREATE TABLE `log_item`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `item_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '物品ID',
  `item_num` int(11) NOT NULL DEFAULT 0 COMMENT '物品数量',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `remain` int(11) NOT NULL DEFAULT 0 COMMENT '该类型物品玩家目前持有数量',
  `reason` int(11) NOT NULL DEFAULT 0 COMMENT '途径, 数量>0:gain_type, 数量<0:consume_type',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0：非绑定 1：绑定',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '获得物品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_learn_skill
-- ----------------------------
DROP TABLE IF EXISTS `log_learn_skill`;
CREATE TABLE `log_learn_skill`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `skill_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '技能ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学习技能' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_licai_award
-- ----------------------------
DROP TABLE IF EXISTS `log_licai_award`;
CREATE TABLE `log_licai_award`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `licai_id` int(11) NOT NULL DEFAULT 0 COMMENT '理财类型id',
  `rid` int(11) NOT NULL DEFAULT 0 COMMENT '理财奖励类型id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '理财奖励领取' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_licai_buy
-- ----------------------------
DROP TABLE IF EXISTS `log_licai_buy`;
CREATE TABLE `log_licai_buy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `licai_id` int(11) NOT NULL DEFAULT 0 COMMENT '理财类型id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '理财投资' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_login_out
-- ----------------------------
DROP TABLE IF EXISTS `log_login_out`;
CREATE TABLE `log_login_out`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户端IP地址',
  `map` bigint(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0：登出 1：登陆',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '玩家登陆登出' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_mail
-- ----------------------------
DROP TABLE IF EXISTS `log_mail`;
CREATE TABLE `log_mail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `mailid` bigint(20) NOT NULL DEFAULT 0 COMMENT '邮件id',
  `refflag` int(11) NOT NULL DEFAULT 0 COMMENT '0：单发 1：广播 2：群发',
  `sendtime` int(11) NOT NULL DEFAULT 0 COMMENT '发送时间',
  `vaildtime` int(11) NOT NULL DEFAULT 0 COMMENT '有效时间',
  `mailcfgid` int(11) NOT NULL DEFAULT 0 COMMENT '配置ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_online
-- ----------------------------
DROP TABLE IF EXISTS `log_online`;
CREATE TABLE `log_online`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `usercount` int(11) NOT NULL DEFAULT 0 COMMENT '在线玩家数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '玩家在线数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_quip_gem
-- ----------------------------
DROP TABLE IF EXISTS `log_quip_gem`;
CREATE TABLE `log_quip_gem`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `gem_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '宝石ID',
  `pos` int(11) NOT NULL DEFAULT 0 COMMENT '位置',
  `ret` int(11) NOT NULL DEFAULT 0 COMMENT '0：成功 非0：失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '装备宝石镶嵌' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_rank_info
-- ----------------------------
DROP TABLE IF EXISTS `log_rank_info`;
CREATE TABLE `log_rank_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `type` bigint(11) NOT NULL DEFAULT 0 COMMENT '排行版类型',
  `rank` bigint(11) NOT NULL DEFAULT 0 COMMENT '名次',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleid`(`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '排行版信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_recharge
-- ----------------------------
DROP TABLE IF EXISTS `log_recharge`;
CREATE TABLE `log_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `money` int(11) NOT NULL DEFAULT 0 COMMENT '充值金额',
  `balance` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家剩余元宝数量',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '充值类型 1：购买钻石 2：购买月卡 3：VIP续费',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '玩家等级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充值记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_relation
-- ----------------------------
DROP TABLE IF EXISTS `log_relation`;
CREATE TABLE `log_relation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作者ID',
  `rid` bigint(20) NOT NULL DEFAULT 0 COMMENT '目标者ID',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '关系类型（1：好友 2：仇人 3：黑名单 4：最近联系人 5：婚姻 6：师徒）',
  `operation` int(11) NOT NULL DEFAULT 0 COMMENT '操作方式（0：删除 1：添加）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社交' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_spend_emoney_buy
-- ----------------------------
DROP TABLE IF EXISTS `log_spend_emoney_buy`;
CREATE TABLE `log_spend_emoney_buy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `balance` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家剩余元宝数量',
  `item_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '物品ID',
  `item_num` int(11) NOT NULL DEFAULT 0 COMMENT '物品数量',
  `money` int(11) NOT NULL DEFAULT 0 COMMENT '商品总价格',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `remain` int(11) NOT NULL DEFAULT 0 COMMENT '该类型物品玩家目前持有数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '花费元宝购买物品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_submit_zhenbao
-- ----------------------------
DROP TABLE IF EXISTS `log_submit_zhenbao`;
CREATE TABLE `log_submit_zhenbao`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `zhenbao_id` int(11) NOT NULL DEFAULT 0 COMMENT '秘宝类型',
  `item_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '物品ID',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上交珍宝' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_task
-- ----------------------------
DROP TABLE IF EXISTS `log_task`;
CREATE TABLE `log_task`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `taskid` bigint(20) NOT NULL DEFAULT 0 COMMENT '任务ID',
  `map` bigint(11) NOT NULL DEFAULT 0 COMMENT '地图ID',
  `result` int(11) NOT NULL DEFAULT 0 COMMENT '0：完成 1：放弃 2：接取',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_up_stren
-- ----------------------------
DROP TABLE IF EXISTS `log_up_stren`;
CREATE TABLE `log_up_stren`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `pos` int(11) NOT NULL DEFAULT 0 COMMENT '装备位置',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '强化前等级',
  `new_level` int(11) NOT NULL DEFAULT 0 COMMENT '强化后等级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '装备强化' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `log_upgrade`;
CREATE TABLE `log_upgrade`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '玩家等级',
  `map` bigint(11) NOT NULL DEFAULT 0 COMMENT '玩家所在地图ID',
  `power` bigint(20) NOT NULL DEFAULT 0 COMMENT '战斗力',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '战斗力提升' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_vip
-- ----------------------------
DROP TABLE IF EXISTS `log_vip`;
CREATE TABLE `log_vip`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `viptype` int(11) NOT NULL DEFAULT 0 COMMENT 'VIP类型 1：钻石 2：王者 3：至尊',
  `buytime` int(11) NOT NULL DEFAULT 0 COMMENT ' 购买时间（天）',
  `viplevel` int(11) NOT NULL DEFAULT 0 COMMENT '玩家VIP等级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '获得物品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_wing_model
-- ----------------------------
DROP TABLE IF EXISTS `log_wing_model`;
CREATE TABLE `log_wing_model`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `skin_level` int(11) NOT NULL DEFAULT 0 COMMENT '皮肤等级（不同皮肤用等级区分）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '战翼皮肤激活' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_yc_levup
-- ----------------------------
DROP TABLE IF EXISTS `log_yc_levup`;
CREATE TABLE `log_yc_levup`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `system_id` int(11) NOT NULL DEFAULT 0 COMMENT '系统ID（战弩：145 宝甲：36 坐骑：5 神兵：21 红颜：120 魂器：161 翅膀：233 阵法：188 披风：122 魔神：120）',
  `level_before` int(11) NOT NULL DEFAULT 0 COMMENT '旧阶',
  `level_after` int(11) NOT NULL DEFAULT 0 COMMENT '新阶',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '养成系统升阶' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_magic_pet
-- ----------------------------
DROP TABLE IF EXISTS `log_magic_pet`;
CREATE TABLE `log_magic_pet`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '游戏ID',
  `sid` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务器组ID',
  `time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `roleid` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家ID',
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '玩家角色名',
  `pet_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '魔宠ID',
  `exp` int(11) NOT NULL DEFAULT 0 COMMENT '魔宠总经验',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '魔宠等级',
  `start` int(11) NOT NULL DEFAULT 0 COMMENT '魔宠星级',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '操作类型 0：召唤 1：升级 2：升星',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_roleid`(`user`, `roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '战翼皮肤激活' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
