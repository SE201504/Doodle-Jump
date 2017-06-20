import QtQuick 2.0
import VPlay 2.0

Scene {

    id:settingScene

    opacity: 0
    visible: opacity > 0
    enabled: visible

    Text {
        id: name
        text: qsTr("setting  test")
    }
}
