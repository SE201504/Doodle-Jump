import QtQuick 2.0
import VPlay 2.0

Scene {

    id: gameoverScene
    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal gameStart
    signal gameSettings

    Image {
        id: gamebackImage
        anchors.fill: gameScene.gameWindowAnchorItem
        source: "../assets/snow/snowbck.png"
    }

    Text {
        id: name
        width: parent.width
        height: parent.height / 3
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Game Over")
        font.pointSize: 24
    }

    Image {
        id: end
        width: 110
        height: 40
        anchors.centerIn: parent
        source: "../assets/resume.png"
        MouseArea {
            anchors.fill: parent
            onClicked: gameStart()
        }
    }
    Image {
        id: setting
        width: 57
        height: 48
        anchors.top: end.bottom
        anchors.left: end.left
        anchors.leftMargin: 150
        anchors.topMargin: 150
        source: "../assets/options.png"

        MouseArea {
            anchors.fill: parent
            onClicked: gameSettings()
        }
    }
}
