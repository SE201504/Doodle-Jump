import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id:noodle
    entityType: "noodle"
    width: 40
    height: 32

    signal arrive

    property alias controller: controller
    property int impulse: y - noodleCollider.linearVelocity.y
    property int linearVelocity: noodleCollider.linearVelocity.y

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
        noodleCollider.linearVelocity.y = -300
      }
      linearVelocity.x: controller.xAxis * 200
    }
    TwoAxisController {
        id:controller
    }

    onYChanged: {
        if(y < 150) {
            arrive()
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
            x = parent.width
        }
        if(x > parent.width)
        {
            x = 0
        }

    }
}
