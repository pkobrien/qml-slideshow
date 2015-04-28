import QtQuick 2.4
import "." as SS

SS.Box {
    id: header

    property alias leftText: leftContentText.text
    property alias rightText: rightContentText.text

    property alias line: line

    height: textHeight + margin * 2

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    Text {
        id: leftContentText
        anchors.left: content.left
        anchors.verticalCenter: content.verticalCenter
        font.pixelSize: textHeight
    }

    Text {
        id: rightContentText
        anchors.right: content.right
        anchors.verticalCenter: content.verticalCenter
        font.pixelSize: textHeight
    }

    Rectangle {
        id: line
        width: header.content.width
        height: 3
        color: "Black"
        anchors.bottom: header.bottom
        anchors.horizontalCenter: header.horizontalCenter
    }
}
