#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "SysInfoQML.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;

    qmlRegisterType<SysInfoQML>("SysInfoQML", 1, 0, "SysInfoQML");
    view.setSource(QUrl("qrc:/main.qml"));
    view.setMinimumSize(QSize(800, 480));
    view.show();

    return app.exec();
}
