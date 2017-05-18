#ifndef WINDOWSINFO_H
#define WINDOWSINFO_H

#include "SysInfo.h"
#include "Windows.h"
#include <QDebug>

class WindowsInfo : public SysInfo
{
private:
    FILETIME idleTime;
    FILETIME kernelTime;
    FILETIME userTime;

    FILETIME last_idleTime;
    FILETIME last_kernelTime;
    FILETIME last_userTime;

public:
    WindowsInfo();

    void update() override;

    qulonglong convertFileTime(const FILETIME& filetime) const;
};

#endif // WINDOWSINFO_H
