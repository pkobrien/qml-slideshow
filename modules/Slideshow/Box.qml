import QtQuick 2.4
import "." as SS

Rectangle {
    id: box

    property alias font: centralText.font
    property alias grid: grid
    property real margin: 0
    property alias text: centralText.text
    property alias textColor: centralText.color
    property real textHeight

    property alias __centralText: centralText
    property alias __column: column
    property alias __content: content
    property var __slide

    Item {
        id: content

        anchors.fill: box
        anchors.margins: __slide.units(box.margin)
    }

    Grid {
        id: grid

        anchors.fill: content
    }

    Column {
        id: column

        width: childrenRect.width
        height: childrenRect.height
        anchors.horizontalCenter: content.horizontalCenter
        anchors.verticalCenter: content.verticalCenter

        Text {
            id: centralText
            font.pixelSize: __slide.units(box.textHeight)
        }
    }
}
