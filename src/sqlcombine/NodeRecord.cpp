#include <iostream>
#include <sstream>
#include "NodeRecord.h"
#include "CombineDef.h"
#include <string>

CNodeRecord::CNodeRecord() : m_nTableNode(0)
{
}

CNodeRecord::~CNodeRecord()
{
}

CNodeRecord & CNodeRecord::GetInstance()
{
	static CNodeRecord sObj;
	return sObj;
}

void CNodeRecord::LoadNode()
{
	FILE * pFile;
	errno_t err;
	if ((err = fopen_s(&pFile, "record", "r")) != 0)
		return;

	SqlAllNode szAllNode[DB_MAX_NUM];
	fread(&szAllNode, sizeof(SqlAllNode), DB_MAX_NUM, pFile);
	fclose(pFile);

	for (int i = 0; i < DB_MAX_NUM; i++)
	{
		SqlAllNode sAllNode = szAllNode[i];
		if (strlen(sAllNode.dbName) <= 0)
			break;

		TABLENAME_2_RECORD_NUM mapNode;
		for (int j = 0; j < TABLE_MAX_NUM; j++)
		{
			SqlNode sNode = sAllNode.szSqlNode[j];
			if (strlen(sNode.tbName) <= 0)
				break;

			mapNode.insert(std::make_pair(sNode.tbName, sNode.nSize));
		}
		m_mapAllNode.insert(std::make_pair(sAllNode.dbName, mapNode));
	}
}

void CNodeRecord::WriteNode()
{
	FILE * pFile;
	errno_t err;
	if ((err = fopen_s(&pFile, "record", "wb")) != 0)
	{
		printf("cant open the file");
		return;
	}

	SqlAllNode szAllNode[DB_MAX_NUM];
	int nDbIndex = 0;
	for (auto iter = m_mapAllNode.begin(); iter != m_mapAllNode.end(); iter++)
	{
		SqlAllNode sNode;
		SqlNode szNode[TABLE_MAX_NUM];
		int nTbIndex = 0;
		for (auto it = iter->second.begin(); it != iter->second.end(); it++)
		{
			SqlNode sNode;
			strcpy_s(sNode.tbName, it->first.c_str());
			sNode.nSize = it->second;
			if (nTbIndex >= TABLE_MAX_NUM)
			{
				printf("incomplete node record");
				break;
			}
			szNode[nTbIndex] = sNode;
			nTbIndex++;
		}

		if (nTbIndex > 0)
		{
			SqlAllNode sNode;
			strcpy_s(sNode.dbName, iter->first.c_str());
			memcpy(sNode.szSqlNode, szNode, sizeof(szNode));
			szAllNode[nDbIndex] = sNode;
			nDbIndex++;
		}
	}

	fwrite(&szAllNode, sizeof(SqlAllNode), DB_MAX_NUM, pFile);
	fclose(pFile);
}

void CNodeRecord::AddTableNode(std::string strDbName, std::string strTableName)
{
	if (m_nTableNode == 0)
		return;

	auto iter = m_mapAllNode.find(strDbName);
	if (iter == m_mapAllNode.end())
	{
		TABLENAME_2_RECORD_NUM mapNode;
		mapNode.insert(std::make_pair(strTableName, m_nTableNode));
		m_mapAllNode.insert(std::make_pair(strDbName, mapNode));
	}
	else
	{
		auto& mapNode = iter->second;
		if (mapNode.find(strTableName) != mapNode.end())
			mapNode[strTableName] = m_nTableNode;
		else
			mapNode.insert(std::make_pair(strTableName, m_nTableNode));
	}
}

std::string CNodeRecord::GetTableDumpCommand(int nIndex, Json::Value& jsonRoot, std::string strTableName)
{
	std::stringstream file_path;
	file_path << ".\\temp\\" << jsonRoot["in"][nIndex]["dbname"].asString() << "\\" << strTableName << ".sql";

	std::stringstream dump;
	dump << "mysqldump --max_allowed_packet=4194304 --net_buffer_length=16384"
		<< " -t -h" << jsonRoot["in"][nIndex]["ip"].asString()
		<< " -u" << jsonRoot["in"][nIndex]["user"].asString()
		<< " -p" << jsonRoot["in"][nIndex]["password"].asString()
		<< " " << jsonRoot["in"][nIndex]["dbname"].asString()
		<< this->GetDumpCondition(nIndex, jsonRoot, strTableName)
		<< ">" << file_path.str();

	return dump.str().c_str();
}

bool CNodeRecord::IsNewDb()
{
	return m_mapAllNode.size() == 0 ? true : false;
}

std::string CNodeRecord::GetDumpCondition(int nIndex, Json::Value& jsonRoot, std::string strTableName)
{
	std::stringstream dump;
	bool bDump = false;
	auto iter = m_mapAllNode.find(jsonRoot["in"][nIndex]["dbname"].asString());
	if (iter != m_mapAllNode.end())
	{
		auto it = iter->second.find(strTableName);
		if (it != iter->second.end())
		{
			dump << " " << it->first
				<< " --where=\"id>"
				<< it->second
				<< " and time<="
				<< jsonRoot["out"]["time"]
				<< "\"";

			bDump = true;
		}
	}

	if (!bDump)
	{
		dump << " " << strTableName
			<< " --where=\"time<="
			<< jsonRoot["out"]["time"]
			<< "\"";
	}

	std::cout << dump.str().c_str() << std::endl;
	return dump.str().c_str();
}
