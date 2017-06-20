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
    source: "../assets/background0.jpg"
  }

  Image {
      id: start
      width: 100
      height: 50
      anchors.centerIn: parent
      source: "../assets/start.jpg"

      MouseArea {
          anchors.fill: parent
          onClicked:
              gameStart()
      }
  }
  Image {
      id: setting
      width: 100
      height: 50
      anchors.top: start.bottom
      anchors.left: start.left
      anchors.topMargin: 30
      source: "../assets/settings.png"

      MouseArea {
          anchors.fill: parent
          onClicked:
              gameSettings()
      }
  }

}
