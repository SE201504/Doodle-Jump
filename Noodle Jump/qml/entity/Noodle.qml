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
        source: "../../assets/snow/noodlesnow.png"
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
          if (otherEntityType === "BrokeFloor" && linearVelocity.y > 0) {
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
        }
        if(noodleCollider.linearVelocity.y < -100){
            noodleImage.source = "../../assets/snow/noodlesnow_sit.png"
        }else {
            noodleImage.source = "../../assets/snow/noodlesnow.png"
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
            noodleImage.mirror = true
        } else {
            noodleImage.mirror = false
        }
    }
}
