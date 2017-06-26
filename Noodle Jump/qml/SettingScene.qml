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
        anchors.bottom: settingScene.bottom
        anchors.bottomMargin: 5
        x: parent.width / 2
        source: "../assets/resume.png"
        scale: 0.7
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.state = "menu"
            }
        }
    }

    Image {
        id: theme0
        width: (gameWindow.width / 10) * 7
        height: (gameWindow.height / 12) * 7
        anchors.topMargin: 1
        anchors.leftMargin: 10
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../assets/snow/snowthem.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.theme = 0
            }
        }
    }

    Image {
        visible: false
        id: theme1
        width: (gameWindow.width / 10) * 7
        height: (gameWindow.height / 12) * 7
        anchors.topMargin: 1
        anchors.leftMargin: 10
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../assets/bunny/bunnythem.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.theme = 1
            }
        }
    }

    Image {
        visible: false
        id: theme2
        width: (gameWindow.width / 10) * 7
        height: (gameWindow.height / 12) * 7
        anchors.topMargin: 1
        anchors.leftMargin: 10
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../assets/ninja/ninjathem.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.theme = 2
            }
        }
    }

    Image {
        visible: false
        id: leftselect
        source: "../assets/leftselect.svg"
        anchors.top: theme0.bottom
        anchors.topMargin: 20
        x: parent.width / 12
        scale: 0.8
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (gameWindow.theme === 2) {
                    gameWindow.theme = 1
                    leftselect.visible = true
                    rightselect.visible = true
                    theme0.visible = false
                    theme1.visible = true
                    theme2.visible = false
                } else if (gameWindow.theme === 1) {
                    gameWindow.theme = 0
                    rightselect.visible = true
                    leftselect.visible = false
                    theme0.visible = true
                    theme1.visible = false
                    theme2.visible = false
                }
            }
        }
    }

    Image {
        id: rightselect
        source: "../assets/rightselect.svg"
        anchors.top: theme0.bottom
        anchors.topMargin: 20
        anchors.left: leftselect.right
        anchors.leftMargin: 10
        scale: 0.8
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (gameWindow.theme === 0) {
                    gameWindow.theme = 1
                    leftselect.visible = true
                    theme0.visible = false
                    theme1.visible = true
                    theme2.visible = false
                } else if (gameWindow.theme === 1) {
                    gameWindow.theme = 2
                    leftselect.visible = true
                    rightselect.visible = false
                    theme0.visible = false
                    theme1.visible = false
                    theme2.visible = true
                }
            }
        }
    }
}
