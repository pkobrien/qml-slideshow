import QtQuick 2.4

Text {
    id: time

    property var format: "h:mm AP"
    property var locale: Qt.locale()
    property int updateInterval: 60000

    text: clock.now.toLocaleTimeString(locale, format)

    Clock {
        id: clock
        interval: updateInterval
    }
}
