import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id:noodle
    entityType: "noodle"
    width: 40
    height: 32

    property alias controller: controller
    property int impulse: y - noodleCollider.linearVelocity.y
    property alias body: noodleCollider.body

    Image {
        id: noodleImage
        source: "../../assets/noodlesnow.png"
        anchors.fill: parent
    }


    BoxCollider {
      id: noodleCollider
      width: 20
      x:10
      y:25
      height: 7
      bodyType: Body.Dynamic
      fixture.onContactChanged: {

          var otherEntity = other.getBody().target
          var otherEntityType = otherEntity.entityType
          var otherEntityId = otherEntity.entityId
          if(otherEntityType === "Floor" && linearVelocity.y > 0) {
              linearVelocity.y = -300
          }
      }
      linearVelocity.x: controller.xAxis * 200
    }

    TwoAxisController {
        id:controller
    }

    onYChanged: {
        if(y < 150) {
            y = 150
        }
        if(noodleCollider.linearVelocity < 0){
            noodleCollider.bodyType = Body.Static
        } else{
            noodleCollider.bodyType = Body.Dynamic
        }
    }
    onXChanged: {
        if(x < 0)
        {
            x = 640
        }
        if(x > 640)
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
