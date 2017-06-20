import VPlay 2.0
import QtQuick 2.0


GameWindow {
    id:gameWindow

    screenWidth: 640
    screenHeight: 960

    activeScene: gameScene

    EntityManager {
      id: entityManager
      entityContainer: gameScene
    }


    MenuScene {
      id: menuScene
      onGameStart: {
        gameWindow.state = "game"
        ga.logEvent("Click", "GameScene")
      }
      onGameSettings: {
          gameWindow.state = "settings"
          ga.logEvent("Click", "GameSettings")
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
