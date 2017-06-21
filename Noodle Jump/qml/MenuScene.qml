import VPlay 2.0
import QtQuick 2.0
import "../"
import VPlayPlugins 1.0

Scene {
  id:menuScene

  opacity: 0
  visible: opacity > 0
  enabled: visible

  signal gameStart
  signal gameSettings


  Image {
    anchors.fill: menuScene.gameWindowAnchorItem
    fillMode: Image.Stretch
    source: "../assets/snowbck.png"

    Image {
        id:bckBottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: "../assets/snowbckbottom.png"
    }
  }


  Image {
      id: title
      width: 202
      height:48
      anchors.top: parent.top
      anchors.margins: 20
      anchors.left: parent.left
      anchors.leftMargin: 10
      source: "../assets/doodle-jump.png"
  }

  PhysicsWorld {
      id:gravity
      gravity.y:15
      updatesPerSecondForPhysics: 60
      debugDrawVisible: false
  }


  Noodle {
      id:noodle
      x:30
      y:200
  }

  Floor {
      id:floor
      x:30
      y:400
  }

  Image {
      id: start
      width: 110
      height: 40
      anchors.centerIn: parent
      source: "../assets/play.png"

      MouseArea {
          anchors.fill: parent
          onClicked:
              gameStart()
      }
  }
  Image {
      id: setting
      width: 57
      height: 48
      anchors.top: start.bottom
      anchors.left: start.left
      anchors.leftMargin: 150
      anchors.topMargin: 150
      source: "../assets/options.png"

      MouseArea {
          anchors.fill: parent
          onClicked:
              gameSettings()
      }
  }
}
