import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: floor
    entityType: "Floor"
    width: 42
    height: 12
    poolingEnabled: true

    property int type: 0
    property int time: 1

    SpriteSequenceVPlay {
        id: floorSequenceVplay
        defaultSource: if (gameWindow.theme === 0) {
                           "../../assets/snow/snowresource.png"
                       } else if (gameWindow.theme === 1) {
                           "../../assets/bunny/gametilesbunny_X.png"
                       } else if (gameWindow.theme === 2) {
                           "../../assets/ninja/game-tiles-ninja_X.png"
                       }
        anchors.fill: parent
        SpriteVPlay {
            frameCount: 1
            frameWidth: 116
            frameHeight: 32
            frameY: type === 0 ? 0 : 110
        }
    }

    BoxCollider {
        id: floorCollider
        anchors.fill: parent
        width: parent.width
        height: 10
        bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
        collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
        fixture.onBeginContact: {

        }
    }
    MovementAnimation {
        id: movement
        target: floor
        property: 'y'
        velocity: noodle.impulse / 2
        running: noodle.y < 160
    }

    MovementAnimation {
        id: movement1
        target: floor
        property: 'x'
        velocity: 50
        running: type === 0 ? false : true
    }

    onYChanged: {
        if (y > gameScene.height) {
            if(type !== 0){
                floor.entityDestroyed()
            } else {
            type = 0
            x = utils.generateRandomValueBetween(20, gameScene.width - 60)
            y = 0
            }
        }
    }

    onXChanged: {

        if (x < floorSequenceVplay.width
                || gameScene.width - floorSequenceVplay) {
            if (time) {
                movement1.velocity = -movement1.velocity
                timer.restart()
                time--
            }
        }
    }

    Timer {
        id: timer
        interval: 2000
        running: true
        repeat: true
        onTriggered: movement1.velocity = -movement1.velocity
    }
}
