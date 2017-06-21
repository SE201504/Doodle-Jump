import QtQuick 2.0
import VPlay 2.0

EntityBase {
    id:noodle
    entityType: "noodle"
    width: 40
    height: 32

    Image {
        id: noodleImage
        source: "../assets/noodlesnow.png"
        anchors.fill: parent
    }


    BoxCollider {
      id: noodleCollider
      width: 40
      height: 32
      bodyType: Body.Dynamic
      fixture.onContactChanged: {
        noodleCollider.linearVelocity.y = -300
      }
    }


}
