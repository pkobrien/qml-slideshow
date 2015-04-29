import QtQuick 2.4
import "." as SS

Rectangle {
    id: box

    property alias content: content
    property alias font: centralText.font
    property alias grid: grid
    property real margin: 0
    property alias text: centralText.text
    property alias textColor: centralText.color
    property real textHeight

    property alias __centralText: centralText
    property var __slide

    Text {
        id: centralText
        anchors.horizontalCenter: content.horizontalCenter
        anchors.verticalCenter: content.verticalCenter
        font.pixelSize: __slide.units(box.textHeight)
    }

    Rectangle {
        id: content

        anchors.fill: box
        anchors.margins: __slide.units(box.margin)
        color: "Transparent"
    }

    Grid {
        id: grid

        anchors.fill: box
        anchors.margins: __slide.units(box.margin)
    }
}
