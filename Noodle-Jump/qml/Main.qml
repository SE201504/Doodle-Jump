import VPlay 2.0
import QtQuick 2.0
import "../qml/entity"

GameWindow {
    id: gameWindow
    property alias sceneState: gameWindow.state
    property int theme: manager.theme()


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
        id: settingScene
    }
    GameScene {
        id: gameScene
        onPause: {
            gameWindow.state = "pause"
        }
    }
    PauseScene {
        id: pauseScene
        onResume: {
            gameWindow.state = "game"
        }
    }
    GameoverScene {
        id: gameoverScene
        onGameStart: {
            gameWindow.state = "game"
        }
        onGameSettings: {
            gameWindow.state = "settings"
        }
    }

    PluginScene {
        id: pluginScene
    }

    // the menu scene of the game

    //default state is menu
    state: "menu"
    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: menuScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: menuScene
            }
        },
        State {
            name: "settings"
            PropertyChanges {
                target: settingScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: settingScene
            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: gameScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: gameScene
            }
        },
        State {
            name: "pause"
            PropertyChanges {
                target: pauseScene
                opacity: 1
            }
            PropertyChanges {
                target: pauseScene
                pauseScore:manager.height()
            }
            PropertyChanges {
                target: gameWindow
                activeScene: pauseScene
            }
        },
        State {
            name: "gameover"
            PropertyChanges {
                target: gameoverScene
                opacity: 1
            }
            PropertyChanges {
                target: gameoverScene
                gameoverScore:manager.height()
            }
            PropertyChanges {
                target: gameWindow
                activeScene: gameoverScene
            }
        },
        State {
            name: "plugin"
            PropertyChanges {
                target: pluginScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: pluginScene
            }
        }
    ]
}
