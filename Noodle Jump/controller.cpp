#include "controller.h"
#include "time.h"
#include <ostream>

Controller::Controller(QObject *parent) : QObject(parent),m_height(0),m_monsterPosition(0),m_floorPosition(0)
  ,m_springPosition(0),m_springCreatePositionX(0),m_springCreatePositionY(0)
{
    QFile file("./qml/myconfig.json");
    file.open(QIODevice::ReadOnly);
    QByteArray json = file.readAll();

    QJsonParseError json_error;
    QJsonDocument parse_doucment = QJsonDocument::fromJson(json, &json_error);
    if(json_error.error == QJsonParseError::NoError) {
        if(parse_doucment.isObject())  {
            QJsonObject obj = parse_doucment.object();
            if(obj.contains("theme"))  {
                QJsonValue name_value = obj.take("theme");

                m_theme = name_value.toInt();

            }
        }
    }
    file.close();
}

double Controller::monsterPosition(){
    return m_monsterPosition;
}
void Controller::monsterPositionChanged(){
    if(m_monsterPosition > monsterCreateHeight){
        m_monsterPosition = -10;
        emit monsterCreate();
    }
}

void Controller::floorPositionChanged(){
    if(m_floorPosition > floorCreateHeight){
        m_floorPosition = 0;
        emit floorCreate();
    }
}

void Controller::heightChanged(double height){
    m_height += height;
    m_monsterPosition += height;
    m_floorPosition += height;
    m_springPosition += height;
    monsterPositionChanged();
    floorPositionChanged();
    springPositionChanged();
}
int Controller::theme(){
    return m_theme;
}

void Controller::themeChanged(int _theme){


    QJsonObject themeObject;
    themeObject.insert("theme",_theme);

        QJsonDocument jsonDoc(themeObject);
        QByteArray ba = jsonDoc.toJson();
        QFile file("./qml/myconfig.json");
        if(!file.open(QIODevice::WriteOnly))
        {
            qDebug() << "write json file failed";
        }
        file.write(ba);
        file.close();
}
void Controller::springPositionChanged(){
    if(m_springPosition > springCreateheight){
        m_springPosition = 0;
        emit springCreate();
    }
}
double Controller::springPositionX(){
    return m_springCreatePositionX;
    m_springCreatePositionX = 0;
}
double Controller::springPositionY(){
    return m_springCreatePositionY;
    m_springCreatePositionY = 0;
}

void Controller::springChanged(double x,double y){
    m_springCreatePositionX = x;
    m_springCreatePositionY = y;
}

