import QtQuick 2.4

QtObject {
    id: date

    readonly property string text: __clock.now.toLocaleDateString(locale, format)

    property var format: Locale.ShortFormat
    property var locale: Qt.locale()
    property int updateInterval: 60000
    property bool updateWhen: false

    property var __clock: Clock {
        interval: date.updateInterval
        running: date.updateWhen
    }
}
