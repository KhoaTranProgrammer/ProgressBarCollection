#ifndef SYSINFO_H
#define SYSINFO_H

#include "MemInfo.h"
#include "CpuInfo.h"

class SysInfo
{
public:
    CpuInfo m_cpuInfo;
    MemInfo m_memInfo;

public:
    SysInfo();

    virtual void update() = 0;
};

#endif // SYSINFO_H
