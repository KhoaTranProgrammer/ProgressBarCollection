#ifndef ANDROIDINFO_H
#define ANDROIDINFO_H

#include "SysInfo.h"
#include <QDebug>

class AndroidInfo : public SysInfo
{
private:
    qulonglong totalUser = 0;
    qulonglong totalUserNice = 0;
    qulonglong totalSystem = 0;
    qulonglong totalIdle = 0;

    qulonglong last_totalUser = 0;
    qulonglong last_totalUserNice = 0;
    qulonglong last_totalSystem = 0;
    qulonglong last_totalIdle = 0;
public:
    AndroidInfo();

    void update() override;
};

#endif // ANDROIDINFO_H
