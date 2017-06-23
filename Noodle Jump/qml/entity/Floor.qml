import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id:floor
    entityType: "Floor"
    width: 42
    height: 12
    poolingEnabled: true

    SpriteSequenceVPlay {
        id:noodleSprite
        defaultSource: "../../assets/snowresource.png"
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
         velocity:  noodle.impulse
         running: noodle.y < 300 && noodle.impulse > 0
       }
      onYChanged: {
          if(y > parent.height){
              x: utils.generateRandomValueBetween(0, gameScene.width),
              y = 0
          }
      }

}
