import QtQuick 2.0
import VPlay 2.0

Scene {

    id: pauseScene
    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal resume

    Image {
        id: pausebackImage
        anchors.fill: pauseScene.gameWindowAnchorItem
        source: "../assets/pausecover.png"
    }

    Image {
        id: end
        width: 110
        height: 40
        scale: 0.8
        x: parent.width / 2 - width / 3
        y: parent.height / 5 * 4
        source: "../assets/resume.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                resume()
            }
        }
    }
}
