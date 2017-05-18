#ifndef GENERALINFO_H
#define GENERALINFO_H


class GeneralInfo
{
private:
    double Total;
    double Usage;

public:
    GeneralInfo();

    //For Total
    double getTotal();
    void setTotal(double total);

    //For Usage
    double getUsage();
    void setUsage(double usage);
};

#endif // GENERALINFO_H
