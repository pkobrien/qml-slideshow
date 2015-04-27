import QtQuick 2.4
import QtQuick.Layouts 1.1
import "." as SS

Rectangle {
    id: footer

    property alias dateText: dateText
    property alias line: line
    property alias slideNumber: slideNumber
    property alias timeText: timeText

    property int margin: 0

    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    color: "transparent"
    z: 100

    RowLayout {
        id: content

        anchors.fill: parent
        anchors.margins: footer.margin

        property int textHeight: Math.round(footer.height - anchors.margins * 2)

        SS.Date {
            id: dateText
            font.pixelSize: content.textHeight
        }

        Item {
            visible: dateText.visible
            Layout.fillWidth: true
        }

        SS.Time {
            id: timeText
            font.pixelSize: content.textHeight
        }

        Item {
            Layout.fillWidth: true
        }

        SS.SlideNumber {
            id: slideNumber
            current: footer.parent.presentation.activeSlide.number
            total: footer.parent.presentation.slideCount
            font.pixelSize: content.textHeight
        }
    }

    Rectangle {
        id: line
        width: content.width
        height: 1
        color: "Black"
        anchors.top: footer.top
        anchors.horizontalCenter: footer.horizontalCenter
    }
}
