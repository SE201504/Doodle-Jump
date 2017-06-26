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
        source: if(gameWindow.theme === 0){
                    "../assets/snow/snowbck.png"
                       }else if(gameWindow.theme === 1){
                           "../assets/bunny/hopbck_X.png"
                       }else if(gameWindow.theme === 2){
                           "../assets/ninja/ghostbck_X.png"
                       }
    }

    Image {
        width: 32
        height: 32
        x:10
        y:10
        source: "../assets/ppause.png"

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
        type : 0
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
    Component {
        id:monsterComponent
        Monster {
            id:monster
            x:50
            y:-10
        }
    }
    Component {
        id:floorComponent
        Floor {
            x:50
            y:0
        }
    }
    Connections {
        target: manager
        onMonsterCreate:{
            var newProperty = {
                x:Math.random()*gameScene.width,
                y:manager.monsterPosition()
            }
            entityManager.createEntityFromComponentWithProperties(monsterComponent,
                        newProperty)
        }
        onFloorCreate:{
            var newProperty = {
                x:utils.generateRandomValueBetween(100, gameScene.width - 140),
                y:0,
                type: 1
            }
            entityManager.createEntityFromComponentWithProperties(floorComponent,
                        newProperty)
        }
    }
    Noodle {
        id: noodle
        x: 30
        y: 350
    }

    Keys.forwardTo: noodle.controller
}
