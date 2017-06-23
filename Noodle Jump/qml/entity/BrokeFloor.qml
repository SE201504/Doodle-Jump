import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id: brokefloor
    entityType: "BrokeFloor"
    width: 42
    height: 12

    property int type

    SpriteSequenceVPlay {
        id: floorSequenceVplay
        defaultSource: "../../assets/brokeFloor.png"
        anchors.fill: parent

        SpriteVPlay {
            name: "1"
            frameCount: 1
            frameWidth: 120
            frameHeight: 32
            frameRate: 0
        }
        SpriteVPlay {
            name: "2"
            frameCount: 1
            frameY: 32
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
            frameY: 80
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
            frameY: 160
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

            if (otherEntityType === "noodle") {
                floorSequenceVplay.jumpTo("2")
                movement.running = true
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
    onYChanged: {
        if (y > parent.height) {
            x = utils.generateRandomValueBetween(20, parent.width - 60)
            y = utils.generateRandomValueBetween(-parent.height, 10)
            floorSequenceVplay.jumpTo("1")
            if (movement.running = true)
                movement.running = false
        }
    }
}
