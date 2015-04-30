import QtQuick 2.4
import "." as SS

SS.Box {
    id: banner

    property alias leftText: leftContentText.text
    property alias rightText: rightContentText.text

    property alias line: line

    height: __slide.units(textHeight) + __slide.units(margin) * 2

    Text {
        id: leftContentText
        anchors.left: banner.__content.left
        anchors.verticalCenter: banner.__content.verticalCenter
        font.pixelSize: banner.__slide.units(textHeight)
        font.family: banner.font.family
    }

    Text {
        id: rightContentText
        anchors.right: banner.__content.right
        anchors.verticalCenter: banner.__content.verticalCenter
        font.pixelSize: banner.__slide.units(textHeight)
        font.family: banner.font.family
    }

    Rectangle {
        id: line
        width: banner.__content.width
        height: 0
        color: "Black"
        anchors.horizontalCenter: banner.horizontalCenter
    }
}
