import QtQuick 2.0
import VPlay 2.0

Scene {

    id:gameScene

    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal pause
    signal gameover

    Image {
        id: gamebackImage
        source: "../assets/snowbck.png"
    }

    PhysicsWorld {
        id:gravity
        gravity.y:9.81
        updatesPerSecondForPhysics: 60
        debugDrawVisible: true
    }


    Noodle {
        id:noodle
        x:30
        y:200
    }

    Floor {
        id:floor
        x:10
        y:400
    }
}
