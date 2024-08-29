#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtSerialPort/QSerialPort>
#include "myclass.h"

#include "myqtlib.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QSerialPort *port;
    bool result;
    int x;
    double y = 0.0;
    MyClass obj;

    x = obj.add(2,3);

    MyQtLib lib;

    x = lib.add(6, 3);

    x = lib.multiply(6, 3);

    y = lib.divide(1.5, 2.3);

    QQmlApplicationEngine engine;

    port = new QSerialPort();

    port->setPortName("/dev/ttyUSB0");

    result = port->open(QIODeviceBase::ReadWrite);

    if (result)
    {
        for (int i=0; i < 1000; i++)
        {
            x = port->write("QWERTY");
        }
    }



    const QUrl url(QStringLiteral("qrc:/Test6_7/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
