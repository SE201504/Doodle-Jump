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

    Image {
        id: gamebackImage
        anchors.fill: gameScene.gameWindowAnchorItem
        source: "../assets/snow/snowbck.png"
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
    }
    Repeater {
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

    Noodle {
        id: noodle
        x: 30
        y: 350
    }

    Connections {
        target: noodle
        onDie: {
            sceneState = "gameover"
            noodle.y = 350
            noodle.x = 30

            floor.x = 10
            floor.y = 400
        }
    }

    Keys.forwardTo: noodle.controller
}
