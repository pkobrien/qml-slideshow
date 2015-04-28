import QtQuick 2.4
import "." as SS

Rectangle {
    id: box

    property alias content: content
    property alias contentText: centerContentText
    property alias font: centerContentText.font
    property alias row: row
    property alias text: centerContentText.text
    property alias textColor: centerContentText.color
    property alias textHeight: centerContentText.font.pixelSize

    property int margin: 0

    Rectangle {
        id: content

        anchors.fill: box
        anchors.margins: box.margin
        color: "Transparent"
    }

    Text {
        id: centerContentText
        anchors.horizontalCenter: content.horizontalCenter
        anchors.verticalCenter: content.verticalCenter
    }

    Row {
        id: row

        anchors.fill: box
        anchors.margins: box.margin
    }
}
