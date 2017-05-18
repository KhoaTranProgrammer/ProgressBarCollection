#include "SysInfoQML.h"

#ifdef Q_OS_WIN
    #include "WindowsInfo.h"
#elif defined(Q_OS_ANDROID)
    #include "AndroidInfo.h"
#endif


SysInfoQML::SysInfoQML(QObject *parent) : QObject(parent)
{
#ifdef Q_OS_WIN
    this->m_sysInfo = new WindowsInfo();
#elif defined(Q_OS_ANDROID)
    this->m_sysInfo = new AndroidInfo();
#endif

}

double SysInfoQML::cpuTotal() const
{
    return this->m_sysInfo->m_cpuInfo.getTotal();
}

double SysInfoQML::cpuUsage() const
{
    return this->m_sysInfo->m_cpuInfo.getUsage();
}

double SysInfoQML::memTotal() const
{
    return this->m_sysInfo->m_memInfo.getTotal();
}

double SysInfoQML::memUsage() const
{
    return this->m_sysInfo->m_memInfo.getUsage();
}

void SysInfoQML::update()
{
    this->m_sysInfo->update();
}
