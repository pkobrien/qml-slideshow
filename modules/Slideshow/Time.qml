import QtQuick 2.4

QtObject {
    id: time

    readonly property string text: __clock.now.toLocaleTimeString(locale, format)

    property var format: "h:mm AP"
    property var locale: Qt.locale()
    property int updateInterval: 1000
    property bool updateWhen: false

    property var __clock: Clock {
        interval: time.updateInterval
        running: time.updateWhen
    }
}
