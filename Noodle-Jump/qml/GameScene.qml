import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.5
import "../qml/entity"

Scene {

    id: gameScene
    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal pause
    signal gameover

    property alias score: score.text

    Image {
        id: gamebackImage
        anchors.fill: gameScene.gameWindowAnchorItem
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

    Text {
        id: score
        text: "0"
        anchors.left: gameScene.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    Image {
        width: 16
        height: 16
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 5
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 5
        source: "../assets/pause_button.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                pause()
            }
        }
    }

    PhysicsWorld {
        id: gravity
        gravity.y: 9.81
        updatesPerSecondForPhysics: 60
    }
    Accelerometer {
        id: accelerometer
        active: true
    }

    Floor {
        id: floor
        x: 10
        y: 400
        type: 0
    }

    Repeater {
        id: f_repeater
        model: 15
        Floor {

            x: utils.generateRandomValueBetween(
                   20, parent.width - 60) // random value
            y: gameScene.height / 15 * index // distribute the platforms across the screen
        }
    }

    Repeater {
        model: 5
        BrokeFloor {

            x: utils.generateRandomValueBetween(
                   20, parent.width - 50) // random value
            y: gameScene.height / 5 * index // distribute the platforms across the screen
        }
    }

    Connections {
        target: noodle
        onDie: {
            sceneState = "plugin"
        }
    }

    Connections {
        target: pluginScene
        onEndPlugin: {
            sceneState = "gameover"
            pluginScene.opacity = 0
            noodle.y = 350
            noodle.x = 30

            floor.x = 10
            floor.y = 400
        }
    }

    Component {
        id: monsterComponent
        Monster {
            id: monster
            x: 50
            y: -10
        }
    }
    Component {
        id: floorComponent
        Floor {
            x: 50
            y: 0
        }
    }
    Component {
        id: springComponent
        Spring {
        }
    }
    Connections {
        target: manager
        onMonsterCreate: {
            var newProperty = {
                x: Math.random() * gameScene.width,
                y: manager.monsterPosition()
            }
            entityManager.createEntityFromComponentWithProperties(
                        monsterComponent, newProperty)
        }
        onFloorCreate: {
            var newProperty = {
                x: utils.generateRandomValueBetween(100, gameScene.width - 140),
                y: 0,
                type: utils.generateRandomValueBetween(0, 4) > 2 ? 1 : 2
            }
            entityManager.createEntityFromComponentWithProperties(
                        floorComponent, newProperty)
        }
        onSpringCreate: {
            var newProperty = {
                x//                x: utils.generateRandomValueBetween(100, gameScene.width - 140),
                //                y: -20
                : f_repeater.itemAt(14).x + 5,
                y: f_repeater.itemAt(14).y - 5
            }
            entityManager.createEntityFromComponentWithProperties(
                        springComponent, newProperty)
        }
    }
    Noodle {
        id: noodle
        x: 30
        y: 350
    }
    onBackButtonPressed: {
        pause()
    }

    Keys.forwardTo: noodle.controller
}
