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
        y:350
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


//    Component {
//        id:component
//        Floor {
//            id:floors
//        }
//    }

//    Connections {
//        target: floors
//        onCreatFloor:{
//                var newEntityProperties = {
//                    x: utils.generateRandomValueBetween(0, gameScene.width),
//                    y: utils.generateRandomValueBetween(-10, -20)
//                }
//                entityManager.createEntityFromComponentWithProperties(component,newEntityProperties)
//            console.log("created")

//        }
//    }

    Keys.forwardTo: noodle.controller

}
