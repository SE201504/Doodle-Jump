#include "controller.h"
#include "time.h"

Controller::Controller(QObject *parent) : QObject(parent),m_height(0),m_monsterPosition(0),m_floorPosition(0)
{}

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
    monsterPositionChanged();
    floorPositionChanged();
}


