import QtQuick 2.4
import "." as SS

Rectangle {
    id: box

    property alias centralText: centralText
    property alias content: content
    property alias font: centralText.font
    property alias row: row
    property alias text: centralText.text
    property alias textColor: centralText.color
    property alias textHeight: centralText.font.pixelSize

    property int margin: 0

    Text {
        id: centralText
        anchors.horizontalCenter: content.horizontalCenter
        anchors.verticalCenter: content.verticalCenter
    }

    Rectangle {
        id: content

        anchors.fill: box
        anchors.margins: box.margin
        color: "Transparent"
    }

    Row {
        id: row

        anchors.fill: box
        anchors.margins: box.margin
    }
}
