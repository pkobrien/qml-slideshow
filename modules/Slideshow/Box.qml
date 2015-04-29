import QtQuick 2.4
import "." as SS

Rectangle {
    id: box

    property alias content: content
    property alias font: centralText.font
    property real margin: 0
    property alias row: row
    property var slide
    property alias text: centralText.text
    property alias textColor: centralText.color
    property real textHeight

    property alias __centralText: centralText

    Text {
        id: centralText
        anchors.horizontalCenter: content.horizontalCenter
        anchors.verticalCenter: content.verticalCenter
        font.pixelSize: slide.units(box.textHeight)
    }

    Rectangle {
        id: content

        anchors.fill: box
        anchors.margins: slide.units(box.margin)
        color: "Transparent"
    }

    Row {
        id: row

        anchors.fill: box
        anchors.margins: slide.units(box.margin)
    }
}
