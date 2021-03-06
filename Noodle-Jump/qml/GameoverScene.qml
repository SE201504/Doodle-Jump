import QtQuick 2.0
import VPlay 2.0

Scene {

    id: gameoverScene
    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal gameStart
    signal gameSettings

    property alias gameoverScore: score.text

    Image {
        id: gamebackImage
        anchors.fill: gameoverScene.gameWindowAnchorItem
        source: if (gameWindow.theme === 0) {
                    "../assets/snow/snowbck.png"
                } else if (gameWindow.theme === 1) {
                    "../assets/bunny/hopbck_X.png"
                } else if (gameWindow.theme === 2) {
                    "../assets/ninja/ghostbck_X.png"
                }
    }

    Image {
        id: overImage
        width: 200
        height: 60
        anchors.top: gameoverScene.gameWindowAnchorItem.top
        anchors.topMargin: 30
        anchors.left: gameoverScene.gameWindowAnchorItem.left
        anchors.leftMargin: 30
        source: "../assets/race-over.png"
    }
    Text {
        id: socretext
        anchors.right: score.left
        anchors.leftMargin: 30
        anchors.bottom: end.top
        anchors.topMargin: 200
        text: "Scores:"
        font.pixelSize: 15
    }

    Text {
        id: score
        anchors.left: end.left
        anchors.leftMargin: 60
        anchors.bottom: end.top
        anchors.topMargin: 200
        text: "0"
    }

    Image {
        id: end
        width: 110
        height: 40
        anchors.centerIn: gameoverScene.gameWindowAnchorItem
        source: "../assets/playagain.png"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gameScene.score = 0
                manager.resetHeight()
                gameStart()
            }
        }
    }

    Image {
        id: achievement
        width: 110
        height: 40
        scale: 0.8
        x: quit.x
        anchors.top: quit.bottom
        anchors.topMargin: 30
        source: "../assets/achievement.png"
        MouseArea {
            anchors.fill: achievement
            onClicked: {
                gameWindow.userScore.reportScore(manager.height())
                gameWindow.state = "achievement"
                frogNetworkView.visible = true
                gameoverScene.opacity = 0
            }
        }
    }
}
