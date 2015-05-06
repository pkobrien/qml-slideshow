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
    property alias __code: centralCode.text
    property alias __codeColor: centralCode.color
    property alias __codeFont: centralCode.font
    property alias __codeFrame: centralCodeFrame
    property real __codeHeight
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

        anchors.horizontalCenter: content.horizontalCenter
        anchors.verticalCenter: content.verticalCenter
        spacing: __slide.units(box.margin)

        Text {
            id: centralText

            font.pixelSize: __slide.units(box.textHeight)
            visible: (text)
        }

        Rectangle {
            id: centralCodeFrame

            width: centralCode.width + __slide.units(box.margin) * 2
            height: centralCode.height + __slide.units(box.margin) * 2
            anchors.horizontalCenter: column.horizontalCenter
            border.width: 1
            radius: __slide.units(box.margin) / 2
            visible: (centralCode.text)

            gradient: Gradient {
                GradientStop { position: 0.0; color: "White" }
                GradientStop { position: 1.0; color: "Silver" }
            }

            Item {
                anchors.fill: centralCodeFrame
                anchors.margins: __slide.units(box.margin)

                Text {
                    id: centralCode

                    font.pixelSize: __slide.units(box.__codeHeight)
                    visible: (text)
                }
            }
        }
    }
}
