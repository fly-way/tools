-- ----------------------------
-- Table structure for tb_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account`  (
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号名',
  `account_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '帐号GUID',
  `charguid` bigint(20) NOT NULL DEFAULT 0 COMMENT '当前选中的角色GUID',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `last_logout` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登出时间',
  `last_login` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `create_timestamp` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间戳',
  `last_logoutstamp` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登出时间戳',
  `last_loginstamp` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登录时间戳',
  `valid` int(11) NOT NULL DEFAULT 0 COMMENT '封禁标识(暂未用)',
  `forb_chat_time` int(11) NOT NULL DEFAULT 0 COMMENT '禁言时间点',
  `forb_chat_last` int(11) NOT NULL DEFAULT 0 COMMENT '禁言持续时间(单位s)',
  `forb_acc_time` int(11) NOT NULL DEFAULT 0 COMMENT '账号封禁时间点',
  `forb_acc_last` int(11) NOT NULL DEFAULT 0 COMMENT '账号封禁持续时间(单位s)',
  `last_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上次登录IP地址',
  `last_mac` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上次登录Mac',
  `adult` int(11) NOT NULL DEFAULT 0 COMMENT '防沉迷标识(1-成年人, 0-未成年)',
  `groupid` int(11) NOT NULL DEFAULT 0 COMMENT '区服ID',
  `gm_flag` int(11) NOT NULL DEFAULT 0 COMMENT 'GM帐号标识',
  `forb_type` int(11) NOT NULL DEFAULT 0 COMMENT '禁封类型',
  `lock_reason` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '禁封原因',
  `welfare` int(11) NOT NULL DEFAULT 0 COMMENT '福利账号状态',
  `oper` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '福利账号申请人',
  `oper_time` int(11) NOT NULL DEFAULT 0 COMMENT '福利账号申请时间',
  `appid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appid',
  `channel` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'channel',
  `create_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册时IP地址',
  `create_country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册时国家ID',
  `phone_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '设备品牌与机型',
  `system_info` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统类型与版本号',
  PRIMARY KEY (`charguid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE,
  INDEX `account_id`(`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '玩家账号表' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for tb_player_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_player_info`;
CREATE TABLE `tb_player_info`  (
  `charguid` bigint(20) NOT NULL DEFAULT 0 COMMENT '角色GUID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `prof` int(11) NOT NULL DEFAULT 0 COMMENT '职业',
  `iconid` int(11) NOT NULL DEFAULT 0 COMMENT '头像ID',
  `sex` int(11) NOT NULL DEFAULT 0 COMMENT '性别',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `exp` bigint(20) NOT NULL DEFAULT 0 COMMENT '经验',
  `vip_level` int(11) NOT NULL DEFAULT 0 COMMENT 'vip等级',
  `vip_exp` int(11) NOT NULL DEFAULT 0 COMMENT 'vip经验',
  `power` bigint(20) NOT NULL DEFAULT 0 COMMENT '战斗力',
  `leftpoint` int(11) NOT NULL DEFAULT 0 COMMENT '剩余点数',
  `totalpoint` int(11) NOT NULL DEFAULT 0 COMMENT '总点数',
  `bindgold` bigint(20) NOT NULL DEFAULT 0 COMMENT '绑定金币',
  `unbindgold` bigint(20) NOT NULL DEFAULT 0 COMMENT '非绑定金币',
  `bindmoney` bigint(20) NOT NULL DEFAULT 0 COMMENT '礼金',
  `unbindmoney` bigint(20) NOT NULL DEFAULT 0 COMMENT '元宝',
  `hp` int(11) NOT NULL DEFAULT 0 COMMENT '血量',
  `mp` int(11) NOT NULL DEFAULT 0 COMMENT '魔法',
  `hunli` int(11) NOT NULL DEFAULT 0 COMMENT '魂力',
  `tipo` int(11) NOT NULL DEFAULT 0 COMMENT '体魄',
  `shenfa` int(11) NOT NULL DEFAULT 0 COMMENT '身法',
  `jingshen` int(11) NOT NULL DEFAULT 0 COMMENT '精神',
  `sp` int(11) NOT NULL DEFAULT 100 COMMENT '体力值',
  `max_sp` int(11) NOT NULL DEFAULT 100 COMMENT '最大体力值',
  `sp_recover` int(11) NOT NULL DEFAULT 30 COMMENT '体力恢复',
  `zhenqi` bigint(20) NOT NULL DEFAULT 0 COMMENT '真气',
  `func_flags` bigint(20) NOT NULL DEFAULT 0 COMMENT '功能开启标志',
  `soul` int(11) NOT NULL DEFAULT 0 COMMENT '魂值',
  `pk_mode` int(11) NOT NULL DEFAULT 0 COMMENT 'pk模式',
  `pk_status` int(11) NOT NULL DEFAULT 0 COMMENT 'pk状态',
  `pk_flags` int(11) NOT NULL DEFAULT 0 COMMENT 'pk标识',
  `pk_evil` int(11) NOT NULL DEFAULT 0 COMMENT 'pk值',
  `redname_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '红名时间',
  `grayname_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '灰名时间',
  `pk_count` int(11) NOT NULL DEFAULT 0 COMMENT '善恶值',
  `yao_hun` int(11) NOT NULL DEFAULT 0 COMMENT '妖魂',
  `arms` int(11) NOT NULL DEFAULT 0 COMMENT '当前武器',
  `dress` int(11) NOT NULL DEFAULT 0 COMMENT '当前衣服',
  `online_time` int(11) NOT NULL DEFAULT 0 COMMENT '在线时间',
  `head` int(11) NOT NULL DEFAULT 0 COMMENT '当前时装头盔',
  `suit` int(11) NOT NULL DEFAULT 0 COMMENT '当前时装套装',
  `weapon` int(11) NOT NULL DEFAULT 0 COMMENT '当前时装武器',
  `drop_val` int(11) NOT NULL DEFAULT 0 COMMENT '掉落值',
  `drop_lv` int(11) NOT NULL DEFAULT 0 COMMENT '掉落等级',
  `killtask_count` int(11) NOT NULL DEFAULT 0 COMMENT '击杀数',
  `onlinetime_day` int(11) NOT NULL DEFAULT 0 COMMENT '在线天数',
  `honor` int(11) NOT NULL DEFAULT 0 COMMENT '荣誉值',
  `hearthstone_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '回城时间',
  `lingzhi` int(11) NOT NULL DEFAULT 0 COMMENT '灵值',
  `jingjie_exp` int(11) NOT NULL DEFAULT 0 COMMENT '境界经验',
  `vplan` int(11) NOT NULL DEFAULT 0 COMMENT 'Vplan',
  `blesstime` bigint(20) NOT NULL DEFAULT 0 COMMENT '膜拜时间',
  `equipval` int(11) NOT NULL DEFAULT 0 COMMENT '装备值',
  `wuhunid` int(11) NOT NULL DEFAULT 0 COMMENT '当前武魂id',
  `shenbingid` int(11) NOT NULL DEFAULT 0 COMMENT '当前神兵id',
  `extremityval` bigint(20) NOT NULL DEFAULT 0 COMMENT '极限桃战积分',
  `wingid` int(11) NOT NULL DEFAULT 0 COMMENT '当前翅膀ID',
  `blesstime2` bigint(20) NOT NULL DEFAULT 0 COMMENT '膜拜时间2',
  `blesstime3` bigint(20) NOT NULL DEFAULT 0 COMMENT '膜拜时间3',
  `suitflag` int(11) NOT NULL DEFAULT 0 COMMENT '套装标识',
  `crossscore` int(11) NOT NULL DEFAULT 0 COMMENT '跨服积分',
  `crossexploit` int(11) NOT NULL DEFAULT 0 COMMENT '跨服功勋',
  `crossseasonid` int(11) NOT NULL DEFAULT 0 COMMENT '赛季ID',
  `pvplevel` int(11) NOT NULL DEFAULT 0 COMMENT '段位',
  `sheild` bigint(20) NOT NULL DEFAULT 0 COMMENT '护盾',
  `glorylevel` int(11) NOT NULL DEFAULT 0 COMMENT '荣誉等级',
  `gloryexp` int(11) NOT NULL DEFAULT 0 COMMENT '荣誉经验',
  `CuMoJiFen` int(11) NOT NULL DEFAULT 0 COMMENT '除魔积分',
  `exts` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'exts',
  `account_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '帐号GUID',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建角色时间',
  `last_logout` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登出时间',
  `last_login` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `create_timestamp` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建角色时间戳',
  `last_logoutstamp` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登出时间戳',
  `last_loginstamp` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上次登录时间戳',
  `last_mac` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上次登录Mac',
  `last_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上次登录IP地址',
  `forb_type` int(11) NOT NULL DEFAULT 0 COMMENT '禁封类型',
  `lock_reason` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '禁封原因',
  `forb_chat_time` int(11) NOT NULL DEFAULT 0 COMMENT '禁言时间点',
  `forb_chat_last` int(11) NOT NULL DEFAULT 0 COMMENT '禁言持续时间(单位s)',
  `forb_acc_time` int(11) NOT NULL DEFAULT 0 COMMENT '账号封禁时间点',
  `forb_acc_last` int(11) NOT NULL DEFAULT 0 COMMENT '账号封禁持续时间(单位s)',
  `human_flag` bigint(20) NOT NULL DEFAULT 0 COMMENT '角色标志位',
  `slayerQuestNum` int(11) NOT NULL DEFAULT 0 COMMENT '当天除魔任务接取数量',
  `magickey` int(11) NOT NULL DEFAULT 0 COMMENT '法宝是否第一次合成',
  `datangcnt` int(11) NOT NULL DEFAULT 0 COMMENT '大唐奇遇次数',
  `luck_point` int(11) NOT NULL DEFAULT 0 COMMENT '抽奖积分',
  `txvipflag` int(11) NOT NULL DEFAULT 0,
  `txbvipflag` int(11) NOT NULL DEFAULT 0,
  `changeproftag` int(11) NOT NULL DEFAULT 0 COMMENT '是否转职',
  `talent_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋点数',
  PRIMARY KEY (`charguid`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `account_id`(`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '玩家信息表' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for tb_player_chain
-- ----------------------------
DROP TABLE IF EXISTS `tb_player_chain`;
CREATE TABLE `tb_player_chain`  (
  `charguid` bigint(20) NOT NULL COMMENT '玩家id',
  `systemstatus` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统状态',
  `runesinfo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '符文信息',
  `spritslotid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '神魄信息',
  `mantrainfo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法咒信息',
  `soulslotid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '器灵信息',
  `extractinfo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '抽奖信息',
  PRIMARY KEY (`charguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '羁绊系统表' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for tb_player_equips
-- ----------------------------
DROP TABLE IF EXISTS `tb_player_equips`;
CREATE TABLE `tb_player_equips`  (
  `charguid` bigint(20) NOT NULL DEFAULT 0 COMMENT '角色GUID',
  `item_id` bigint(20) NOT NULL COMMENT '物品GUID',
  `item_tid` int(11) NOT NULL DEFAULT 0 COMMENT '物品配表ID',
  `slot_id` int(11) NOT NULL DEFAULT 0 COMMENT '位置',
  `stack_num` int(11) NOT NULL DEFAULT 0 COMMENT '叠放数量',
  `flags` bigint(20) NOT NULL DEFAULT 0 COMMENT '标识',
  `bag` int(11) NOT NULL DEFAULT 0 COMMENT '背包',
  `strenid` int(11) NOT NULL DEFAULT 0 COMMENT '强化等级',
  `strenval` int(11) NOT NULL DEFAULT 0 COMMENT '强化值',
  `proval` int(11) NOT NULL DEFAULT 0 COMMENT '升品值',
  `extralv` int(11) NOT NULL DEFAULT 0 COMMENT '追加等级',
  `superholenum` int(11) NOT NULL DEFAULT 0 COMMENT '附加属性数',
  `super1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加属性1',
  `super2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加属性2',
  `super3` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加属性3',
  `super4` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加属性4',
  `super5` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加属性5',
  `time_stamp` bigint(20) NOT NULL DEFAULT 0,
  `super6` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加属性6',
  `super7` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附加属性7',
  `newsuper` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '新卓越属性',
  `newgroup` int(11) NOT NULL DEFAULT 0 COMMENT '新套装ID',
  `newgroupbind` int(11) NOT NULL DEFAULT 0 COMMENT '新套装材料绑定状态',
  `wash` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '洗练属性',
  `NewGroupLevel` int(11) NOT NULL DEFAULT 0 COMMENT '新套装等级',
  `jinglian` int(11) NOT NULL DEFAULT 0 COMMENT '装备精炼状态',
  `godlevel` int(11) NOT NULL DEFAULT -1 COMMENT '神化等级',
  `blesslevel` int(11) NOT NULL DEFAULT -1 COMMENT '神化神佑',
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `charguid`(`charguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '玩家装备表' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for tb_guild_hell
-- ----------------------------
DROP TABLE IF EXISTS `tb_guild_hell`;
CREATE TABLE `tb_guild_hell`  (
  `charguid` bigint(20) NOT NULL COMMENT '角色GUID',
  `gid` bigint(20) NOT NULL DEFAULT 0 COMMENT '帮派GUID',
  `lasttime` bigint(20) NOT NULL DEFAULT 0 COMMENT '上次挑战时间',
  `hellinfo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '挑战信息',
  PRIMARY KEY (`charguid`) USING BTREE,
  INDEX `gid`(`gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮派地宫表' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for tb_guild_newwar
-- ----------------------------
DROP TABLE IF EXISTS `tb_guild_newwar`;
CREATE TABLE `tb_guild_newwar`  (
  `gid` bigint(20) NOT NULL COMMENT '帮派Id',
  `power` bigint(20) NOT NULL DEFAULT 0 COMMENT '战斗力',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `rank` int(11) NOT NULL DEFAULT 0 COMMENT '排名',
  `start_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间戳',
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参加本次帮派战的帮派列表' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for tb_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity`;
CREATE TABLE `tb_activity`  (
  `charguid` bigint(20) NOT NULL COMMENT '角色GUID',
  `activity` int(11) NOT NULL DEFAULT 0 COMMENT '活动配表ID',
  `join_count` int(11) NOT NULL DEFAULT 0 COMMENT '参加活动次数',
  `last_join` bigint(20) NOT NULL DEFAULT 0 COMMENT '上次进入时间点',
  `flags` int(11) NOT NULL DEFAULT 0 COMMENT '活动标识',
  `param` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '活动参数',
  `online_time` bigint(20) NOT NULL DEFAULT 0 COMMENT '玩家在活动时长',
  PRIMARY KEY (`charguid`, `activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表,记录玩家参与活动信息' ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for tb_exchange_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_exchange_record`;
CREATE TABLE `tb_exchange_record`  (
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '充值订单ID',
  `uid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账号ID',
  `role_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '角色GUID',
  `money` int(11) NOT NULL DEFAULT 0 COMMENT '钱',
  `coins` int(11) NOT NULL DEFAULT 0 COMMENT '元宝',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '时间',
  `recharge` int(11) NOT NULL DEFAULT 1 COMMENT '是否兑换',
  `platform` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '平台',
  `goodsId` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `couponId` int(11) NOT NULL DEFAULT 0 COMMENT '折扣物品',
  `param` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '额外参数',
  `cporderid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'CP订单号',
  `currency` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币种',
  `activityExtra` int(11) NOT NULL DEFAULT 0 COMMENT '活动额外获得',
  `payCode` int(11) NOT NULL DEFAULT 0 COMMENT '0:官方充值;1:第三方充值;2:活动订单',
  `payType` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付类型：google、appstore、platform',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `guid_idx`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充值记录表' ROW_FORMAT = Compact;
