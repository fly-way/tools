#pragma once

constexpr auto SYSTEM_SUCC					= 0;				// 执行bat成功标志
constexpr auto DB_NAME_MAX_SIZE				= 32;				// 数据库名最大长度
constexpr auto TABLE_NAME_MAX_SIZE			= 32;				// 表名最大长度
constexpr auto TABLE_MAX_NUM				= 48;				// 库表数量
constexpr auto DB_MAX_NUM					= 256;				// 一次最多合并多少个库
constexpr auto GAME_TABLE_MAX_NUM			= 8;				// 游服库表数量

static std::string SZ_ALL_TABLE[TABLE_MAX_NUM] = {
	"log_arena_rank", 
	"log_astrology",
	"log_change_skill",
	"log_consignment_sell",
	"log_deal",
	"log_devildom",
	"log_dupl",
	"log_dupl_end",
	"log_dupl_enter",
	"log_emoney",
	"log_equip_info",
	"log_equip_up_start",
	"log_func_open",
	"log_gold",
	"log_guild_aid_levup",
	"log_guild_aid_wash",
	"log_guild_bless",
	"log_guild_contribute",
	"log_guild_create",
	"log_guild_destroy",
	"log_guild_liveness",
	"log_guild_member_chg",
	"log_guild_skill_levup",
	"log_hongyan_call",
	"log_hongyan_exp",
	"log_hongyan_grow",
	"log_hongyan_jiban",
	"log_hongyan_quality",
	"log_item",
	"log_learn_skill",
	"log_licai_award",
	"log_licai_buy",
	"log_login_out",
	"log_mail",
	"log_online",
	"log_quip_gem",
	"log_rank_info",
	"log_recharge",
	"log_relation",
	"log_spend_emoney_buy",
	"log_submit_zhenbao",
	"log_task",
	"log_up_stren",
	"log_upgrade",
	"log_vip",
	"log_wing_model",
	"log_yc_levup",
	"log_magic_pet",
};

static std::string SZ_GAME_TABLE[GAME_TABLE_MAX_NUM] = {
	"tb_account",
	"tb_player_info",
	"tb_player_chain",
	"tb_player_equips",
	"tb_guild_hell",
	"tb_guild_newwar",
	"tb_activity",
	"tb_exchange_record",
};

struct SqlNode
{
	char tbName[TABLE_NAME_MAX_SIZE];
	long long int nSize;

	SqlNode()
	{
		memset(this, 0, sizeof(*this));
	}
};

struct SqlAllNode
{
	char dbName[DB_NAME_MAX_SIZE];
	SqlNode szSqlNode[TABLE_MAX_NUM];

	SqlAllNode()
	{
		memset(this, 0, sizeof(*this));
	}
};
