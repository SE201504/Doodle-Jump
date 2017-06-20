import QtQuick 2.0
import VPlay 2.0

Scene {

    id:gameScene

    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal pause
    signal gameover
    Text {
        id: name
        text: qsTr("gamescene test")
    }
    Image {
        width: 100
        height: 50
        anchors.top: start.bottom
        anchors.left: start.left
        anchors.topMargin: 30
        source: "../assets/settings.png"

        MouseArea {
            anchors.fill: parent
            onClicked:
                pause()
        }
    }
}
