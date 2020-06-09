#include <stdio.h>
#include <windows.h>
#include <tlhelp32.h>
#include <string>
#include <tchar.h>
#include <Psapi.h>
#pragma comment (lib,"Psapi.lib")


static const unsigned int TASK_SIZE = 8;
static const std::string szTask[TASK_SIZE] = { "datasrv.exe", "worldsrv.exe", "scenesrv.exe", "loginsrv.exe", "connsrv.exe", "logsrv.exe", "connexsrv.exe", "crosssrv.exe" };

BOOL DosPathToNtPath(LPTSTR pszDosPath, LPTSTR pszNtPath)
{
	TCHAR		szDriveStr[500];
	TCHAR		szDrive[3];
	TCHAR		szDevName[100];
	INT			cchDevName;
	INT			i;

	//检查参数
	if (!pszDosPath || !pszNtPath)
		return FALSE;

	//获取本地磁盘字符串
	if (GetLogicalDriveStrings(sizeof(szDriveStr), szDriveStr))
	{
		for (i = 0; szDriveStr[i]; i += 4)
		{
			if (!lstrcmpi(&(szDriveStr[i]), _T("A:\\")) || !lstrcmpi(&(szDriveStr[i]), _T("B:\\")))
				continue;

			szDrive[0] = szDriveStr[i];
			szDrive[1] = szDriveStr[i + 1];
			szDrive[2] = '\0';
			if (!QueryDosDevice(szDrive, szDevName, 100))//查询 Dos 设备名
				return FALSE;

			cchDevName = lstrlen(szDevName);
			if (_tcsnicmp(pszDosPath, szDevName, cchDevName) == 0)//命中
			{
				lstrcpy(pszNtPath, szDrive);//复制驱动器
				lstrcat(pszNtPath, pszDosPath + cchDevName);//复制路径

				return TRUE;
			}
		}
	}

	lstrcpy(pszNtPath, pszDosPath);

	return FALSE;
}

//获取进程完整路径
BOOL GetProcessFullPath(DWORD dwPID, TCHAR pszFullPath[MAX_PATH])
{
	TCHAR        szImagePath[MAX_PATH];
	HANDLE        hProcess;
	if (!pszFullPath)
		return FALSE;

	pszFullPath[0] = '\0';
	hProcess = OpenProcess(PROCESS_QUERY_INFORMATION, 0, dwPID);
	if (!hProcess)
		return FALSE;

	if (!GetProcessImageFileName(hProcess, szImagePath, MAX_PATH))
	{
		CloseHandle(hProcess);
		return FALSE;
	}

	if (!DosPathToNtPath(szImagePath, pszFullPath))
	{
		CloseHandle(hProcess);
		return FALSE;
	}

	CloseHandle(hProcess);
	return TRUE;
}

void KillTheSamePathTask(DWORD th32ProcessID, const char* szExeFile)
{
	if (th32ProcessID == 0)
		return;

	for (unsigned int i = 0; i < TASK_SIZE; ++i)
	{
		if (strcmp(szTask[i].c_str(), szExeFile) == 0)
		{
			std::string str = "taskkill /f -pid ";
			str += std::to_string(th32ProcessID);
			system(str.c_str());
		}
	}
}

int main(int argc, char* argv[])
{
	HANDLE hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
	if (INVALID_HANDLE_VALUE == hSnapshot)
	{
		return NULL;
	}
	PROCESSENTRY32 pe = { 0 };
	pe.dwSize = sizeof(PROCESSENTRY32);

	char* file = 0;
	_get_pgmptr(&file);

	char path[MAX_PATH];
	strncpy_s(path, file, strlen(file) - 12);	// 去除 KillTask.exe

	printf(path);
	printf("\n");

	BOOL fOk;
	char t[MAX_PATH];
	for (fOk = Process32First(hSnapshot, &pe); fOk; fOk = Process32Next(hSnapshot, &pe))
	{
		TCHAR szProcessName[MAX_PATH] = { 0 };
		GetProcessFullPath(pe.th32ProcessID, szProcessName);
		

		if (strlen(szProcessName) != 0)
		{
			strncpy_s(t, szProcessName, strlen(path));
			if (strcmp(t, path) == 0)
				KillTheSamePathTask(pe.th32ProcessID, pe.szExeFile);
			// _tprintf(_T("%d,%s \r\n"), pe.th32ProcessID, szProcessName);
		}
	
	}
	return 0;
}
