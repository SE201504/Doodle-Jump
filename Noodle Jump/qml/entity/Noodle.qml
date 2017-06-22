import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id:noodle
    entityType: "noodle"
    width: 40
    height: 32

    property alias controller: controller
    property int impulse: y - noodleCollider.linearVelocity.y

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

}
