import QtQuick 2.0
import VPlay 2.0
import "../qml/entity"

Scene {

    id:gameScene

    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal pause
    signal gameover

    Image {
        id: gamebackImage
        anchors.fill: gameScene.gameWindowAnchorItem
        source: "../assets/snowbck.png"
    }

    PhysicsWorld {
        id:gravity
        gravity.y:9.81
        updatesPerSecondForPhysics: 60
    }


    Noodle {
        id:noodle
        x:30
        y:200
    }

    Floor {
        id:floor
        x:10
        y:400
    }
    Repeater {
      model: 10
      Floor {
        x: utils.generateRandomValueBetween(0, gameScene.width) // random value
        y: gameScene.height / 10 * index // distribute the platforms across the screen
      }
    }
    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered:
            if(noodle.y < 100) {
                var newEntityProperties = {
                    x: utils.generateRandomValueBetween(0, gameScene.width),
                    y: noodle.y + utils.generateRandomValueBetween(0, 80)
                }
                entityManager.createEntityFromComponentWithProperties(
                            floor,
                            newEntityProperties)
            }
    }

    Keys.forwardTo: noodle.controller



}
