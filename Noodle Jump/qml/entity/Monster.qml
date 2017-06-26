import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id:monster
    entityType: "monster"
    poolingEnabled: true
    width: 60
    height:36

    property int type

    SpriteSequenceVPlay {
        id:floorSequenceVplay
        defaultSource: if(gameWindow.theme === 0){
                           "../../assets/snow/snowresource.png"
                              }else if(gameWindow.theme === 1){
                                  "../../assets/bunny/gametilesbunny_X.png"
                              }else if(gameWindow.theme === 2){
                                  "../../assets/ninja/game-tiles-ninja_X.png"
                              }
        anchors.fill: parent
        SpriteVPlay {
            name: "1"
            frameCount: 4
            frameY:0
            frameX:296
            frameWidth: 162
            frameHeight: 94
            frameRate: 20
        }
    }

      BoxCollider {
           id: monsterCollider
           anchors.fill: parent
           width: parent.width
           height: 10
           bodyType: Body.Dynamic
           collisionTestingOnlyMode: true
           fixture.onBeginContact:{
               var otherEntity = other.getBody().target
               var otherEntityType = otherEntity.entityType

               if (otherEntityType === "noodle") {
                   noodle.y = 1000
               }
             }
         }

      MovementAnimation {
         id: movement
         target: monster
         property: "y"
         velocity:  noodle.impulse/2
         running: noodle.y < 160
       }
      onYChanged: {
          if(y > gameScene.height){
              x = utils.generateRandomValueBetween(20, gameScene.width-60)
              y = utils.generateRandomValueBetween(-1000, -3000)
          }
      }

}
