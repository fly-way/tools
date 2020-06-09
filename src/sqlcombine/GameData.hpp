
// 游服库数据也要导出到经分库表
// efun:tb_account, tb_player_info, tb_player_chain, tb_player_equips, tb_guild_hell, tb_guild_newwar, tb_activity, tb_exchange_record, tb_setting，一共9个；表中的字段均需要全部导出，麻烦看看

#ifndef	_GAME_DATA_HPP_
#define _GAME_DATA_HPP_

namespace GameData
{
	enum COMBINE_CODE
	{
		COMBINE_SUCC,
		COMBINE_CONFIG_ERR,
		COMBINE_DATABASE_CREATE_ERR,
		COMBINE_DUMP_ERR,
		COMBINE_TEMP_FILE_ERR,
	};

	int DoCombine(Json::Value& jsonRoot, std::ofstream& outstream)
	{
		// Check config
		{
			// 游服库配置不存在时，表示不合并游服库
			if (!jsonRoot["game_in"].isArray())
				return COMBINE_SUCC;

			for (unsigned int i = 0; i < jsonRoot["game_in"].size(); ++i)
			{
				if (!(jsonRoot["game_in"][i].isObject()
					&& jsonRoot["game_in"][i]["ip"].isString()
					&& jsonRoot["game_in"][i]["user"].isString()
					&& jsonRoot["game_in"][i]["password"].isString()
					&& jsonRoot["game_in"][i]["dbname"].isString()
					))
					return COMBINE_CONFIG_ERR;
			}
		}

		// DataBase create
		{
			std::stringstream db_info;
			db_info << "mysql -h" << jsonRoot["out"]["ip"].asString()
				<< " -u" << jsonRoot["out"]["user"].asString()
				<< " -p" << jsonRoot["out"]["password"].asString();
			std::string strDbName = jsonRoot["out"]["dbname"].asString();
			std::stringstream struct_cre;
			struct_cre << db_info.str() << " -D " << strDbName << " < " << "./gd.sql";

			if (system(struct_cre.str().c_str()) != SYSTEM_SUCC)
				return COMBINE_DATABASE_CREATE_ERR;
		}

		std::ifstream instream;
		std::string str;
		std::stringstream file_path;
		file_path << ".\\temp\\game_temp.sql";

		for (unsigned int i = 0; i < jsonRoot["game_in"].size(); ++i)
		{
			for (unsigned int j = 0; j < GAME_TABLE_MAX_NUM; ++j)
			{
				std::stringstream dump;
				dump << "mysqldump --max_allowed_packet=4194304 --net_buffer_length=16384"
					<< " -t -h" << jsonRoot["game_in"][i]["ip"].asString()
					<< " -u" << jsonRoot["game_in"][i]["user"].asString()
					<< " -p" << jsonRoot["game_in"][i]["password"].asString()
					<< " " << jsonRoot["game_in"][i]["dbname"].asString()
					<< " " << SZ_GAME_TABLE[j]
					<< ">" << file_path.str();

				if (system(dump.str().c_str()) != SYSTEM_SUCC)
					return COMBINE_DUMP_ERR;

				instream.open(file_path.str().c_str());
				if (!instream)
					return COMBINE_TEMP_FILE_ERR;

				while (getline(instream, str))
				{
					if (str.find("/*") == std::string::npos
						&& str.find("--") == std::string::npos
						)
						outstream << str << std::endl;
				}
				instream.close();
			}
		}

		return COMBINE_SUCC;
	}
}
	 



#endif // !defined(_GAME_DATA_HPP_)
