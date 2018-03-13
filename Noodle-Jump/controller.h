#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QtGui>
#include <QString>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>


#define monsterCreateHeight 8000
#define floorCreateHeight 1000
#define springCreateheight 2000

class Controller : public QObject
{
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);

    Q_INVOKABLE QString height();
    Q_INVOKABLE double monsterPosition();
    Q_INVOKABLE void monsterPositionChanged();   

    Q_INVOKABLE void floorPositionChanged();
    Q_INVOKABLE int theme();

    Q_INVOKABLE void springPositionChanged();
    Q_INVOKABLE void resetHeight();

signals:

    Q_INVOKABLE void monsterCreate();
    Q_INVOKABLE void floorCreate();
    Q_INVOKABLE void springCreate();


public slots:
    Q_INVOKABLE void heightChanged(double height);
    Q_INVOKABLE void themeChanged(int _theme);

private:
    double m_height;
    double m_monsterPosition;
    double m_floorPosition;
    double m_springPosition;
    int m_theme;
};

#endif // CONTROLLER_H
