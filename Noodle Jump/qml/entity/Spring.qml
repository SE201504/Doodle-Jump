import QtQuick 2.0
import VPlay 2.0

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
        defaultSource: "../../assets/snow/snowresource.png"
        anchors.fill: parent

        SpriteVPlay {
            name: "spring"
            frameCount: 1
            frameX: 296
            frameY: 185
            frameWidth: 80
            frameHeight: 35
        }
        SpriteVPlay {
            name: "springDown" //fall
            frameCount: 1
            frameX: 375
            frameY: 185
            frameWidth: 70
            frameHeight: 32
        }
    }
    BoxCollider {
        id: springCollider
        width: 20
        x: 10
        y: 25
        height: 7
        bodyType: Body.Dynamic
        collisionTestingOnlyMode: true
        fixture.onBeginContact: {

            var otherEntity = other.getBody().target
            var otherEntityType = otherEntity.entityType

            if (otherEntityType === "noodle" && linearVelocity.y > 0) {
                noodle.linevelocityY = -600
                springSequenceVplay.jumpTo("springDown")
            }
        }
    }
    onYChanged: {
        if (y > gameScene.height) {
            entityDestroyed()
            springSequenceVplay.jumpTo("spring")
        }
    }
    MovementAnimation {
        id: movement
        target: springFloor
        property: "y"
        velocity: noodle.impulse / 2
        running: noodle.y < 160
    }
}
