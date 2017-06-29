import VPlay 2.0
import QtQuick 2.0
import "../qml/entity"
//import VPlayPlugins 1.0

Scene {
    id: menuScene

    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal gameStart
    signal gameSettings

    Image {
        id: menuImage
        anchors.fill: menuScene.gameWindowAnchorItem
        fillMode: Image.Stretch
        source: if (gameWindow.theme === 0) {
                    "../assets/snow/snowbck.png"
                } else if (gameWindow.theme === 1) {
                    "../assets/bunny/hopbck_X.png"
                } else if (gameWindow.theme === 2) {
                    "../assets/ninja/ghostbck_X.png"
                }

        Image {
            id: bckBottom
            height: 30
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            source: if (gameWindow.theme === 0) {
                        "../assets/snow/bottom.png"
                    } else if (gameWindow.theme === 1) {
                        "../assets/bunny/bottom.png"
                    } else if (gameWindow.theme === 2) {
                        "../assets/ninja/bottom.png"
                    }
        }
    }

    Image {
        id: title
        width: 202
        height: 48
        anchors.top: parent.top
        anchors.margins: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        source: "../assets/doodle-jump.png"
    }

    PhysicsWorld {
        id: gravity
        gravity.y: 15
        updatesPerSecondForPhysics: 60
        debugDrawVisible: false
    }

    ParticleVPlay {
        id: fireParticle
        fileName: "../qml/particle/snowPractice.json"
        autoStart: true
    }

    Noodle {
        id: noodle
        x: 30
        y: 200
    }

    Floor {
        id: floor
        x: 30
        y: 400
    }

    Image {
        id: start
        width: 110
        height: 40
        anchors.centerIn: parent
        source: "../assets/play.png"

        MouseArea {
            anchors.fill: parent
            onClicked: gameStart()
        }
    }
    Image {
        id: setting
        width: 57
        height: 48
        anchors.top: start.bottom
        anchors.left: start.left
        anchors.leftMargin: 150
        anchors.topMargin: 150
        source: "../assets/options.png"

        MouseArea {
            anchors.fill: parent
            onClicked: gameSettings()
        }
    }

    onBackButtonPressed: {
        Qt.quit()
    }
}
