#pragma once

#include <map>
#include "libjson\json.h"


class CNodeRecord
{
protected:
	CNodeRecord();
	~CNodeRecord();

public:
	static CNodeRecord& GetInstance();

public:
	void LoadNode();					// ��ȡ�����ƽڵ��¼
	void WriteNode();					// д�����ƽڵ��¼

public:
	void AddTableNode(std::string strDbName, std::string strTableName);
	std::string GetTableDumpCommand(int nIndex, Json::Value& jsonRoot, std::string strTableName);
	bool IsNewDb();

	void SetTableNode(long long int nNode)	{ m_nTableNode = nNode; }
	long long int GetTableNode()	{ return m_nTableNode; }

private:
	std::string GetDumpCondition(int nIndex, Json::Value& jsonRoot, std::string strTableName);

private:
	typedef std::map<std::string, long long int>	TABLENAME_2_RECORD_NUM;
	typedef std::map<std::string, TABLENAME_2_RECORD_NUM>	MAP_ALL_NODE;

	long long int			m_nTableNode;
	MAP_ALL_NODE	m_mapAllNode;		// �������ݿ��dump�ڵ�
};

#define gNodeRecordMgr		(CNodeRecord::GetInstance())
