import QtQuick 2.4
import QtQuick.Layouts 1.1
import "." as SS

Rectangle {
    id: footer

    height: Math.round(parent.height * 0.08)

    property alias dateText: dateText
    property alias slideNumber: slideNumber
    property alias timeText: timeText

    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    color: "transparent"
    z: 100

    RowLayout {
        id: footerContent
        anchors.fill: parent
        anchors.margins: Math.round(footer.height / 3)

        property int textHeight: footer.height - anchors.margins * 2

        SS.Date {
            id: dateText
            font.pixelSize: footerContent.textHeight
        }

        Item {
            visible: dateText.visible
            Layout.fillWidth: true
        }

        SS.Time {
            id: timeText
            font.pixelSize: footerContent.textHeight
        }

        Item {
            Layout.fillWidth: true
        }

        SS.SlideNumber {
            id: slideNumber
            current: footer.parent.activeSlide.number
            total: footer.parent.slideCount
            font.pixelSize: footerContent.textHeight
        }
    }
}
