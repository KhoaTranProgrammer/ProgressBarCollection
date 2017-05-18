#include "GeneralInfo.h"

GeneralInfo::GeneralInfo()
{
    this->Total = 0;
    this->Usage = 0;
}

double GeneralInfo::getTotal()
{
    return this->Total;
}

void GeneralInfo::setTotal(double total)
{
    this->Total = total;
}

double GeneralInfo::getUsage()
{
    return this->Usage;
}

void GeneralInfo::setUsage(double usage)
{
    this->Usage = usage;
}
