import VPlay 2.0
import QtQuick 2.0
import "../qml/entity"


GameWindow {
    id:gameWindow
    licenseKey: "BD82BD4CB8C8B4C2A55B72EAEDB0C0D315C57BB03A164959C3615A34F232729BBA005477A93C978BD2E1AD2453BD384C3EDB0FBF1F81C471D59BE20C5BB425F5A833A7B457937E6E0E13CFBB732488CAA9DD9144FFE42767438C366CA7F558FE3031DC97E56C523E971BB1EA792F8C577DD7B1F8AC5CCAE178DC78512D563BD62456F0329FD84E29643385057594F34742D9FD4F439A224FB77F9C342C0A8350077C1485AC093C978CC96B0F00B3E9E5CC2007A199137AAED434C47C7B83E8BCA9041344194039F34A4A091CBEAF092F49908CA3ACE8009F5DBB048FA92C7BBF983055ED9EBF314E7A065CC5E98C8F1E16B4ED9A1E312F37CB1770F94BF92ECCEA0F5FAF276BDD68741D80F710B585030040FA47CCCB4D6372A8ADA96BB627F3C229443F2D05996FCA9B36A8CD4670720CCFB2B85485F43F50C01EF769FE7AE62127506CEFBAA726B50567F9EB9B7040"

        // ... your remaining code



    screenWidth: 640
    screenHeight: 960
    activeScene: menuScene

    EntityManager {
      id: entityManager
      entityContainer: gameScene
    }

    MenuScene {
      id: menuScene
      onGameStart: {
        gameWindow.state = "game"
      }
      onGameSettings: {
          gameWindow.state = "settings"
      }
    }
    SettingScene {
        id:settingScene
    }
    GameScene {
      id: gameScene
      onPause: {
        gameWindow.state = "pause"
        ga.logEvent("Click", "PauseScene")
      }
    }
    PauseScene {
        id:pauseScene
    }
    GameoverScene {
        id:gameoverScene
    }

    // the menu scene of the game


    //default state is menu
    state: "menu"
    states: [
      State {
        name: "menu"
        PropertyChanges {target: menuScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: menuScene}
      },
        State {
          name: "settings"
          PropertyChanges {target: settingScene; opacity: 1}
          PropertyChanges {target: gameWindow; activeScene: settingScene}
        },
        State {
        name: "game"
        PropertyChanges {target: gameScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: gameScene}
      },
        State {
        name: "pause"
        PropertyChanges {target: pauseScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: pauseScene}
      },
        State {
        name: "gameover"
        PropertyChanges {target: gameoverScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: gameoverScene}
      }
    ]
}
