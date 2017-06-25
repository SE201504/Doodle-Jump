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
        anchors.bottomMargin: 15
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
        id: theme1
        width: parent.width / 4
        height: parent.height / 2
        anchors.centerIn: parent
        source: "../assets/bunny/bunnythem.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.theme = 1
            }
        }
    }

    Image {
        id: theme0
        width: parent.width / 4
        height: parent.height / 2
        anchors.right: theme1.left
        anchors.top: theme1.top
        anchors.rightMargin: 20
        //        anchors.horizontalCenter: parent
        source: "../assets/snow/snowthem.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.theme = 0
            }
        }
    }
    Image {
        id: theme2
        width: parent.width / 4
        height: parent.height / 2
        anchors.left: theme1.right
        anchors.leftMargin: 20
        anchors.top: theme1.top
        source: "../assets/ninja/ninjathem.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameWindow.theme = 2
            }
        }
    }

    //    Image {
    //        id: select
    //        source: "file"
    //    }
}
