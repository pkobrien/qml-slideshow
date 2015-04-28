import QtQuick 2.4
import "." as SS

SS.Box {
    id: footer

    property alias leftText: leftContentText.text
    property alias rightText: rightContentText.text

    property alias line: line

    height: textHeight + margin * 2

    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right

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
        width: footer.content.width
        height: 1
        color: "Black"
        anchors.top: footer.top
        anchors.horizontalCenter: footer.horizontalCenter
    }
}
