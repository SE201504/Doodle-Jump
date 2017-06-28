import QtQuick 2.0
import VPlay 2.0

Scene {

    id: gameoverScene
    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal gameStart
    signal gameSettings

    property alias gameoverScore: score.text

    Image {
        id: gamebackImage
        anchors.fill: gameoverScene.gameWindowAnchorItem
        source: if (gameWindow.theme === 0) {
                    "../assets/snow/snowbck.png"
                } else if (gameWindow.theme === 1) {
                    "../assets/bunny/hopbck_X.png"
                } else if (gameWindow.theme === 2) {
                    "../assets/ninja/ghostbck_X.png"
                }
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
    Text {
        id: score
        anchors.left: end.left
        anchors.leftMargin:30
        anchors.bottom: end.top
        anchors.topMargin: 60
        text: "0"
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
        id: quit
        width: 110
        height: 40
        scale: 0.8
        x: end.x
        anchors.top: end.bottom
        anchors.topMargin: 30
        source: "../assets/menu.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.state = "menu"
            }
        }
    }
}
