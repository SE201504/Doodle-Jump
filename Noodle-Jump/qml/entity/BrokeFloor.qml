import QtQuick 2.0
import VPlay 2.0
import QtMultimedia 5.5

EntityBase {
    id: brokefloor
    entityType: "BrokeFloor"
    width: 42
    height: 12

    property int type

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
            name: "1"
            frameCount: 1
            frameY: 144
            frameWidth: 120
            frameHeight: 32
            frameRate: 0
        }
        SpriteVPlay {
            name: "2"
            frameCount: 1
            frameY: 176
            frameWidth: 120
            frameHeight: 48
            frameRate: 5
            to: {
                3: 2
            }
        }
        SpriteVPlay {
            name: "3"
            frameCount: 1
            frameY: 224
            frameWidth: 120
            frameHeight: 64
            frameRate: 5
            to: {
                4: 2
            }
        }
        SpriteVPlay {
            name: "4"
            frameCount: 1
            frameY: 304
            frameWidth: 120
            frameHeight: 55
            frameRate: 1
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
            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            if (otherEntityType === "noodle" && noodle.linevelocityY > 0) {
                floorSequenceVplay.jumpTo("2")
                movement.running = true
                movement2.running = true
                breaksound.play()
            }
        }
    }
    MovementAnimation {
        id: movement
        target: brokefloor
        property: "y"
        velocity: 100
    }
    MovementAnimation {
        id: movement1
        target: brokefloor
        property: "y"
        velocity: noodle.impulse / 2
        running: noodle.y < 160
    }
    NumberAnimation {
        id: movement2
        target: floorSequenceVplay
        property: "opacity"
        to: 0
        duration: 1000
    }

    onYChanged: {
        if (y > gameScene.height) {
            x = utils.generateRandomValueBetween(20, gameScene.width - 60)
            y = utils.generateRandomValueBetween(-parent.height, 10)
            floorSequenceVplay.jumpTo("1")
            movement.running = false
            brokefloor.opacity = 1
        }
    }
    Audio {
        id: breaksound
        source: "../../assets/sound/floorbreak.mp3"
    }
}
