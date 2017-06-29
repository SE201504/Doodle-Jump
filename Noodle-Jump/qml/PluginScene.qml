import QtQuick 2.0
import VPlay 2.0
import VPlayPlugins 1.0
import VPlayApps 1.0
// used for plugin example pages and app navigation
import "helper"
import "pages"

Scene {
    id: pluginScene

    opacity: 0
    visible: opacity > 0
    enabled: visible

    signal endPlugin

    AdMobPage {

    }

    onVisibleChanged: {
        if (pluginScene.opacity === 1) {
            ptimer.running = true
        }
    }

    Timer {
        id: ptimer
        interval: 2000
        //        running: true
        repeat: false
        onTriggered: {
            endPlugin()
            console.log("end plugin")
        }
    }
}
