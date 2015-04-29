import QtQuick 2.4
import "." as SS

SS.Box {
    id: banner

    property alias leftText: leftContentText.text
    property alias rightText: rightContentText.text

    property alias line: line

    height: slide.units(textHeight) + slide.units(margin) * 2

    Text {
        id: leftContentText
        anchors.left: content.left
        anchors.verticalCenter: content.verticalCenter
        font.pixelSize: slide.units(textHeight)
    }

    Text {
        id: rightContentText
        anchors.right: content.right
        anchors.verticalCenter: content.verticalCenter
        font.pixelSize: slide.units(textHeight)
    }

    Rectangle {
        id: line
        width: banner.content.width
        height: 0
        color: "Black"
        anchors.horizontalCenter: banner.horizontalCenter
    }
}
