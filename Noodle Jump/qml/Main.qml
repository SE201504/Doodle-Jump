import VPlay 2.0
import QtQuick 2.0
import "../qml/entity"

GameWindow {
    id: gameWindow
    licenseKey: "0A0ED0DD98A5CCC11D5F239BA62072EBFA21F43D304A4B1EAD7247E5BD2A4645CC91E9360487731E3D55997849241AA73F74D6D5F6099F0E35AD9CEE43451FF2284711A25A51F16FE1FCEB28BDEDF33496E6B85CF1A63DAD51721264236CCFF8ADD9E21CE50A1D083AA265C10F7CFE9F7251F09F1D60C69ED62DEF8D1177B0660C9A271F6D2895CAF62C43A61F40DBC678C5E70179EA6BEE135222720FA523FB6621B1BC8F6D7880495F527AC3C377BC8A69E7E74BD5D746A0BFF918EE5CEA760D0D88384F83C46993E5E2EDC3FC7FDC26EFDDECC94509F282F29B145A1328005648145DFDF8EAFA9E690E993A15C09C9F95B7B71B18902A865D153154742DAB09F7CC54B2CC04069CFEB61438670D045B82F95E237204C6AB3BFFEEDC1B10C0"

    property alias sceneState: gameWindow.state
    property int theme: 1

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
                target: gameWindow
                activeScene: gameoverScene
            }
        }
    ]
}
