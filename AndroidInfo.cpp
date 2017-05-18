#include "AndroidInfo.h"

#include <sys/types.h>
#include <sys/sysinfo.h>
#include <QFile>
#include <stdio.h>
#include <QString>

AndroidInfo::AndroidInfo()
{
    //get memory total
    QFile file("/proc/meminfo");
    file.open(QIODevice::ReadOnly);
    QString line = file.readLine();
    file.close();
    QStringList data = line.split(" ", QString::SkipEmptyParts);
    QString totalMemory = data.at(1);
    this->m_memInfo.setTotal(totalMemory.toLong() / 1024);

    //get cpu first time running
    QFile file2("/proc/stat");
    file2.open(QIODevice::ReadOnly);
    QByteArray line2 = file2.readLine();
    file2.close();
    sscanf(line2.data(), "cpu %llu %llu %llu %llu", &last_totalUser, &last_totalUserNice, &last_totalSystem, &last_totalIdle);
}

void AndroidInfo::update()
{
    //get memory used
    QFile file("/proc/meminfo");
    file.open(QIODevice::ReadOnly);

    qulonglong totalMemoryUsed;
    //MemTotal
    QString line = file.readLine();
    QStringList data = line.split(" ", QString::SkipEmptyParts);
    QString totalMemory = data.at(1);
    totalMemoryUsed = totalMemory.toLongLong();
    //MemFree
    line = file.readLine();
    data = line.split(" ", QString::SkipEmptyParts);
    totalMemoryUsed -= ((QString)(data.at(1))).toLong();
    //Buffers
    line = file.readLine();
    data = line.split(" ", QString::SkipEmptyParts);
    totalMemoryUsed -= ((QString)(data.at(1))).toLong();
    //Cached
    line = file.readLine();
    data = line.split(" ", QString::SkipEmptyParts);
    totalMemoryUsed -= ((QString)(data.at(1))).toLong();
    file.close();

    this->m_memInfo.setUsage(totalMemoryUsed / 1024);

    //update cpu
    QFile file2("/proc/stat");
    file2.open(QIODevice::ReadOnly);
    QByteArray line2 = file2.readLine();
    file2.close();
    sscanf(line2.data(), "cpu %llu %llu %llu %llu", &totalUser, &totalUserNice, &totalSystem, &totalIdle);

    double overall = totalUser - last_totalUser;
    overall += totalUserNice - last_totalUserNice;
    overall += totalSystem - last_totalSystem;

    double total = overall + totalIdle - last_totalIdle;
    this->m_cpuInfo.setUsage((overall / total) * 100.0);

    last_totalUser = totalUser;
    last_totalUserNice = totalUserNice;
    last_totalSystem = totalSystem;
    last_totalIdle = totalIdle;
}
