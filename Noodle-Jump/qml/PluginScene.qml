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

    // app content with plugin list
    NavigationStack {
        id: pluginMainItem

        // initial page contains list if plugins and opens pages for each plugin when selected
        ListPage {
            id: page
            title: qsTr("V-Play Plugins")

            model: ListModel {
                ListElement {
                    type: "Advertising"
                    name: "AdMob"
                    detailText: "Ad Monetization and Promotion"
                    image: "../assets/logo-admob.png"
                }
            }

            delegate: PluginListItem {
                visible: name !== "GameCenter" || Theme.isIos

                onSelected: {
                    switch (name) {
                    case "AdMob":
                        page.navigationStack.push(Qt.resolvedUrl(
                                                      "pages/AdMobPage.qml"))
                        break
                    }
                }
            }
        }
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
