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
        anchors.bottom: settingScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 15
        x: parent.width / 2
        source: "../assets/resume.png"
        scale: 0.7
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (theme0.visible) {
                    gameWindow.theme = 0
                } else if (theme1.visible) {
                    gameWindow.theme = 1
                } else
                    gameWindow.theme = 2

                manager.themeChanged(gameWindow.theme)
                gameWindow.state = "menu"
            }
        }
    }

    Image {
        id: theme0
        visible: if (gameWindow.theme === 0) {
                     true
                 } else {
                     false
                 }
        width: settingScene.gameWindowAnchorItem.width
        height: (settingScene.gameWindowAnchorItem.height / 6) * 5
        anchors.left: settingScene.gameWindowAnchorItem.left
        anchors.top: settingScene.gameWindowAnchorItem.top
        source: "../assets/snow/snowthem.png"
    }

    Image {
        visible: if (gameWindow.theme === 1) {
                     true
                 } else {
                     false
                 }

        id: theme1
        width: settingScene.gameWindowAnchorItem.width
        height: (settingScene.gameWindowAnchorItem.height / 6) * 5
        anchors.left: settingScene.gameWindowAnchorItem.left
        anchors.top: settingScene.gameWindowAnchorItem.top
        source: "../assets/bunny/bunnythem.png"
    }

    Image {
        visible: if (gameWindow.theme === 2) {
                     true
                 } else {
                     false
                 }
        id: theme2
        width: settingScene.gameWindowAnchorItem.width
        height: (settingScene.gameWindowAnchorItem.height / 6) * 5
        anchors.left: settingScene.gameWindowAnchorItem.left
        anchors.top: settingScene.gameWindowAnchorItem.top
        source: "../assets/ninja/ninjathem.png"
    }

    Image {
        id: leftselect
        visible: if (gameWindow.theme === 0) {
                     false
                 } else {
                     true
                 }
        source: "../assets/arrow.png"
        rotation: -90
        anchors.bottom: settingScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 30
        x: parent.width / 12
        scale: 0.8
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (gameWindow.theme === 2) {
                    gameWindow.theme = 1
                    theme0.visible = false
                    theme1.visible = true
                    theme2.visible = false
                } else if (gameWindow.theme === 1) {
                    gameWindow.theme = 0
                    theme0.visible = true
                    theme1.visible = false
                    theme2.visible = false
                }
            }
        }
    }

    Image {
        id: rightselect
        visible: if (gameWindow.theme === 2) {
                     false
                 } else {
                     true
                 }

        source: "../assets/arrow.png"
        rotation: 90
        anchors.bottom: settingScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 20
        anchors.left: leftselect.right
        anchors.leftMargin: 30
        scale: 0.8
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (gameWindow.theme === 0) {
                    gameWindow.theme = 1
                    theme0.visible = false
                    theme1.visible = true
                    theme2.visible = false
                } else if (gameWindow.theme === 1) {
                    gameWindow.theme = 2
                    theme0.visible = false
                    theme1.visible = false
                    theme2.visible = true
                }
            }
        }
    }
}
