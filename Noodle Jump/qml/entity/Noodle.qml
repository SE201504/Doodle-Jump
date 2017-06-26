import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id:noodle
    entityType: "noodle"
    width: 40
    height: 32

    signal die

    property alias controller: controller
    property alias linevelocityY: noodleCollider.linearVelocity.y
    property int impulse: y - noodleCollider.linearVelocity.y

    Image {
        id: noodleImage
        source:
            if(gameWindow.theme === 0){
                    "../../assets/snow/noodlesnow.png"
                       }else if(gameWindow.theme === 1){
                           "../../assets/bunny/bunnyleft_X.png"
                       }else if(gameWindow.theme === 2){
                           "../../assets/ninja/ninja-left_X.png"
                       }
        anchors.fill: parent
    }


    BoxCollider {
      id: noodleCollider
      width: 20
      x:10
      y:25
      height: 7
      bodyType: Body.Dynamic
      fixture.onBeginContact: {

          var otherEntity = other.getBody().target
          var otherEntityType = otherEntity.entityType

          if (otherEntityType === "Floor" && linearVelocity.y > 0) {
              linearVelocity.y = -250
          }

      }
          linearVelocity.x : system.desktopPlatform ?
                                  controller.xAxis * 200 :  //  for desktop
                                  (accelerometer.reading !== null ? -accelerometer.reading.x * 100 : 0)   // for mobile
    }

    TwoAxisController {
        id:controller
    }

    onYChanged: {
        if(y < 150) {
            y = 150
            manager.heightChanged(10)
        }
        if(noodleCollider.linearVelocity.y < -100){
            if(gameWindow.theme === 0){
                    noodleImage.source =  "../../assets/snow/noodlesnow_sit.png"
                       }else if(gameWindow.theme === 1){
                           noodleImage.source = "../../assets/bunny/bunnyleftodskok_X.png"
                       }else if(gameWindow.theme === 2){
                           noodleImage.source = "../../assets/ninja/ninja-left-odskok_X.png"
                       }

        }else if(gameWindow.theme === 0){
            noodleImage.source =  "../../assets/snow/noodlesnow.png"
               }else if(gameWindow.theme === 1){
                   noodleImage.source = "../../assets/bunny/bunnyleft_X.png"
               }else if(gameWindow.theme === 2){
                   noodleImage.source = "../../assets/ninja/ninja-left_X.png"
               }

        if(y > gameScene.height)
            die()
    }
    onXChanged: {
        if(x < 0)
        {
            x = gameScene.width
        }
        if(x > gameScene.width)
        {
            x = 0
        }

        if(controller.xAxis < 0) {
            noodleImage.mirror = false
        } else {
            noodleImage.mirror = true
        }
    }

}
