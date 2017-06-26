#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QtGui>


#define monsterCreateHeight 5000
#define floorCreateHeight 1000

class Controller : public QObject
{
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);

    Q_INVOKABLE double monsterPosition();
    Q_INVOKABLE void monsterPositionChanged();

    Q_INVOKABLE void floorPositionChanged();

signals:

    Q_INVOKABLE void monsterCreate();
    Q_INVOKABLE void floorCreate();


public slots:
    Q_INVOKABLE void heightChanged(double height);
private:
    double m_height;
    double m_monsterPosition;
    double m_floorPosition;
};

#endif // CONTROLLER_H
