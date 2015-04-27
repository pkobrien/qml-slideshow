import QtQuick 2.4

Text {
    id: date

    property var format: Locale.ShortFormat
    property var locale: Qt.locale()
    property int updateInterval: 60000

    text: clock.now.toLocaleDateString(locale, format)

    Clock {
        id: clock
        interval: updateInterval
        running: (date.visible)
    }
}
