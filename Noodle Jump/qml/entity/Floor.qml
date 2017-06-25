import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id:floor
    entityType: "Floor"
    width: 42
    height: 12
    poolingEnabled: true

    property int type

    SpriteSequenceVPlay {
        id:floorSequenceVplay
        defaultSource: "../../assets/snow/snowresource.png"
        anchors.fill: parent
        SpriteVPlay {
            frameCount: 1
            frameWidth: 112
            frameHeight: 32
        }
    }

      BoxCollider {
           id: floorCollider
           anchors.fill: parent
           width: parent.width
           height: 10
           bodyType: Body.Dynamic // only Dynamic bodies can collide with each other
           collisionTestingOnlyMode: true // collisions are detected, but no physics are applied to the colliding bodies
           fixture.onBeginContact:{

             }
         }
      MovementAnimation {
         id: movement
         target: floor
         property: "y"
         velocity:  noodle.impulse/2
         running: noodle.y < 160
       }
      onYChanged: {
          if(y > gameScene.height){
              x = utils.generateRandomValueBetween(20, gameScene.width-60)
              y = 0
          }
      }

}
