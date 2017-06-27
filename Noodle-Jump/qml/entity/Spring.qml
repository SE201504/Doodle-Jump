import QtQuick 2.0
import VPlay 2.0
import QtMultimedia 5.5

EntityBase {
    id: springFloor
    visible: true
    entityType: "Spring"
    width: 20
    height: 12
    poolingEnabled: true

    SpriteSequenceVPlay {
        id: springSequenceVplay
        visible: true
        defaultSource: if (gameWindow.theme === 0) {
                           "../../assets/snow/snowresource.png"
                       } else if (gameWindow.theme === 1) {
                           "../../assets/bunny/gametilesbunny_X.png"
                       } else if (gameWindow.theme === 2) {
                           "../../assets/ninja/game-tiles-ninja_X.png"
                       }
        anchors.fill: parent

        SpriteVPlay {
            name: "spring"
            frameCount: 1
            frameX: 296
            frameY: 185
            frameWidth: 80
            frameHeight: 35
            frameRate: 5
            //            to: {
            //                springDown: 0
            //                spring: 1
            //            }
        }
        SpriteVPlay {
            name: "springDown" //fall
            frameCount: 1
            frameX: 375
            frameY: 185
            frameWidth: 70
            frameHeight: 32
            frameRate: 5
        }
    }

    BoxCollider {
        id: springCollider
        width: 20
        height: 20
        bodyType: Body.Dynamic
        collisionTestingOnlyMode: true
        fixture.onBeginContact: {

            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            if (otherEntityType === "noodle" && linearVelocity.y > 0) {
                noodle.linevelocityY = -600
                springSequenceVplay.jumpTo("springDown")
                stimer.running = true
                ntssound.play()
            }
        }
    }
    onYChanged: {
        if (y > gameScene.height) {
            entityDestroyed()
        }
    }
    MovementAnimation {
        id: movement
        target: springFloor
        property: "y"
        velocity: noodle.impulse / 2
        running: noodle.y < 160
    }

    Audio {
        id: ntssound
        source: "../../assets/sound/trampoline.mp3"
    }

    Timer {
        id: stimer
        interval: 350
        running: false
        repeat: false
        onTriggered: {
            springSequenceVplay.jumpTo("spring")
        }
    }
}
