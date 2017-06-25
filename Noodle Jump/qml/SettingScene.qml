import QtQuick 2.0
import VPlay 2.0

Scene {

    id: settingScene

    opacity: 0
    visible: opacity > 0
    enabled: visible

    Image {
        id: resume
        width: 110
        height: 40
        anchors.centerIn: parent
        source: "../assets/resume.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.theme = 1
                gameWindow.state = "menu"
            }
        }
    }
}
