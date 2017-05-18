#include "WindowsInfo.h"
#include <windows.h>

WindowsInfo::WindowsInfo()
{
    //get memory total
    MEMORYSTATUSEX memoryStatus;
    memoryStatus.dwLength = sizeof(MEMORYSTATUSEX);
    GlobalMemoryStatusEx(&memoryStatus);
    this->m_memInfo.setTotal(memoryStatus.ullTotalPhys / 1024 / 1024);

    //get the last systemtime
    GetSystemTimes(&this->last_idleTime, &this->last_kernelTime, &this->last_userTime);
}

void WindowsInfo::update()
{
    //update memory
    MEMORYSTATUSEX memoryStatus;
    memoryStatus.dwLength = sizeof(MEMORYSTATUSEX);
    GlobalMemoryStatusEx(&memoryStatus);
    this->m_memInfo.setUsage((memoryStatus.ullTotalPhys - memoryStatus.ullAvailPhys) / 1024 / 1024);

    //update cpu
    GetSystemTimes( &this->idleTime, &this->kernelTime, &this->userTime);
    qulonglong usr, ker, idl, sys;
    usr = convertFileTime(userTime)   - convertFileTime(last_userTime);
    ker = convertFileTime(kernelTime) - convertFileTime(last_kernelTime);
    idl = convertFileTime(idleTime)   - convertFileTime(last_idleTime);
    sys = ker + usr;
    this->m_cpuInfo.setUsage((sys - idl) * 100 / sys);
    last_userTime = userTime;
    last_kernelTime = kernelTime;
    last_idleTime = idleTime;
}

qulonglong WindowsInfo::convertFileTime(const FILETIME& filetime) const
{
    ULARGE_INTEGER largeInteger;
    largeInteger.LowPart = filetime.dwLowDateTime;
    largeInteger.HighPart = filetime.dwHighDateTime;
    return largeInteger.QuadPart;
}
