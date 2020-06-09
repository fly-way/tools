#include <iostream>
#include <string>
#include <fstream>
#include <stdio.h>
#include <ctime>
#include "libjson\json.h"

#include "CombineDef.h"
#include "NodeRecord.h"
#include "GameData.hpp"


bool BatChing(const char* str, bool bPause = false)
{
	if (system(str) != SYSTEM_SUCC)
	{
		std::cout << "batch err:" << str << std::endl;
		if (bPause)
			system("pause");
		return false;
	}
	return true;
}

bool LoadConfig(Json::Value& jsonRoot)
{
	std::ifstream in("config.json");
	if (!in.is_open())
		std::cout << "Error:config.json opening file" << std::endl;

	Json::Reader jsonReader;
	if (!jsonReader.parse(in, jsonRoot))
		return false;

	if (!(jsonRoot["in"].isArray()
		&& jsonRoot["out"].isObject()
		&& jsonRoot["out"]["ip"].isString()
		&& jsonRoot["out"]["user"].isString()
		&& jsonRoot["out"]["password"].isString()
		&& jsonRoot["out"]["dbname"].isString()
		&& jsonRoot["out"]["time"].isInt()
		))
		return false;

	for (unsigned int i = 0; i < jsonRoot["in"].size(); ++i)
	{
		if (!(jsonRoot["in"][i].isObject()
			&& jsonRoot["in"][i]["ip"].isString()
			&& jsonRoot["in"][i]["user"].isString()
			&& jsonRoot["in"][i]["password"].isString()
			&& jsonRoot["in"][i]["dbname"].isString()
			))
		return false;
	}

	return true;
}

bool DataBaseCreate(Json::Value& jsonRoot)
{
	std::stringstream db_info;
	db_info << "mysql -h" << jsonRoot["out"]["ip"].asString()
		<< " -u" << jsonRoot["out"]["user"].asString()
		<< " -p" << jsonRoot["out"]["password"].asString();

	std::string strDbName = jsonRoot["out"]["dbname"].asString();

	std::cout << "begin create database, please waitting ..." << std::endl;
	std::stringstream db_cre;
	db_cre << db_info.str() << " -e " << "\"CREATE DATABASE IF NOT EXISTS " << strDbName << " DEFAULT CHARSET utf8\"";
	if (!BatChing(db_cre.str().c_str()))
		return false;

	std::cout << "begin database struct init, please waitting ..." << std::endl;
	std::stringstream struct_cre;
	struct_cre << db_info.str() << " -D " << strDbName << " < " << "./jf.sql";
	if (!BatChing(struct_cre.str().c_str()))
		return false;

	return true;
}

bool DataInit(Json::Value& jsonRoot, std::string strFile)
{
	std::stringstream db_info;
	db_info << "mysql -h" << jsonRoot["out"]["ip"].asString()
		<< " -u" << jsonRoot["out"]["user"].asString()
		<< " -p" << jsonRoot["out"]["password"].asString();

	std::string strDbName = jsonRoot["out"]["dbname"].asString();

	std::cout << "begin data init, please waitting ..." << std::endl;
	std::stringstream data_cre;
	data_cre << db_info.str() << " --max_allowed_packet=4194304 --net_buffer_length=16384 -D " << strDbName << " < " << strFile;
	return BatChing(data_cre.str().c_str());
}

void RecordRePlace(std::string& str, std::string::size_type& pos, std::string::size_type& posx)
{
	pos = str.find("(", posx);
	if (pos != std::string::npos)
	{
		posx = str.find(",", pos);
		if (posx != std::string::npos)
		{
			gNodeRecordMgr.SetTableNode(_atoi64(str.substr(pos + 1, posx - pos - 1).c_str()));
			str.replace(pos, posx - pos, "(0");
			RecordRePlace(str, pos, posx);
		}
	}
}

int main()
{
	clock_t startTime, endTime;
	startTime = clock();
	std::cout << "----------------------------combine begin!----------------------------" << std::endl;
	Json::Value jsonRoot;
	if (!LoadConfig(jsonRoot))
	{
		std::cout << "config err!" << std::endl;
		system("pause");
		return 0;
	}

	gNodeRecordMgr.LoadNode();
	std::ifstream instream;
	std::ofstream outstream;
	std::string str;
	std::string::size_type pos = 0;
	std::string::size_type posx = 0;

	if (gNodeRecordMgr.IsNewDb() && (!DataBaseCreate(jsonRoot)))
	{
		system("pause");
		return 0;
	}

	if (!BatChing("if not exist \".\\temp\" md \".\\temp\"", true))
	{
		system("pause");
		return 0;
	}

	std::string out_file = ".\\temp\\all.sql";
	outstream.open(out_file);
	outstream << "set names utf8;" << std::endl;

	int nCode = GameData::DoCombine(jsonRoot, outstream);
	if (nCode != 0)
	{
		std::cout << "gamedata combine fail, code:" << nCode << std::endl;
		system("pause");
		return 0;
	}

	for (unsigned int i=0; i < jsonRoot["in"].size(); ++i)
	{
		std::string strDbName = jsonRoot["in"][i]["dbname"].asString();
		for (int j = 0; j < TABLE_MAX_NUM; j++)
		{
			std::string strTableName = SZ_ALL_TABLE[j];
			std::stringstream file_path;
			file_path << ".\\temp\\" << strDbName << "\\" << strTableName << ".sql";

			std::stringstream strBat;
			strBat << "if not exist \".\\temp\\" << strDbName << "\" md \".\\temp\\" << strDbName << "\"";
			if (!BatChing(strBat.str().c_str(), true))
			{
				system("pause");
				return 0;
			}

			std::string strDump = gNodeRecordMgr.GetTableDumpCommand(i, jsonRoot, strTableName);
			if (!BatChing(strDump.c_str(), true))
			{
				system("pause");
				return 0;
			}

			instream.open(file_path.str().c_str());
			if (!instream)
				std::cout << "file not found:" << file_path.str().c_str() << std::endl;

			gNodeRecordMgr.SetTableNode(0);
			while (getline(instream, str))
			{
				pos = 0;
				posx = 0;
				RecordRePlace(str, pos, posx);

				if (str.find("/*") == std::string::npos 
					&& str.find("--") == std::string::npos
					)
					outstream << str << std::endl;
			}
			gNodeRecordMgr.AddTableNode(strDbName, strTableName);
			instream.close();
		}
		std::cout << "success:ip[" << jsonRoot["in"][i]["ip"].asString() << "] dbname[" << strDbName << "]" << std::endl;
	}

	outstream.close();
	if (!DataInit(jsonRoot, out_file))
	{
		system("pause");
		return 0;
	}

	gNodeRecordMgr.WriteNode();
	std::cout << "----------------------------combine success!----------------------------" << std::endl;
	endTime = clock();
	std::cout << "The run time is:" << (double)(endTime - startTime) / CLOCKS_PER_SEC << "s" << std::endl;
	system("pause");
	return 0;
}
