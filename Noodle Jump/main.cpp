#include <QApplication>
#include <VPApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "controller.h"


int main(int argc, char *argv[])
{

  QApplication app(argc, argv);

  VPApplication vplay;
  QQmlApplicationEngine engine;
  engine.rootContext()->setContextProperty("manager", new Controller);
  vplay.initialize(&engine);
  vplay.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
  engine.load(QUrl(vplay.mainQmlFileName()));

  return app.exec();
}
