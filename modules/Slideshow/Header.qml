import QtQuick 2.4
import QtQuick.Layouts 1.1
import "." as SS

Rectangle {
    id: header

    property alias headerText: headerText
    property alias line: line
    property alias text: headerText.text

    property int margin: 0

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    color: "transparent"
    z: 100

    RowLayout {
        id: content

        anchors.centerIn: parent
        anchors.margins: header.margin

        property int textHeight: Math.round(header.height - anchors.margins * 2)

        Item {
            Layout.fillWidth: true
        }

        Text {
            id: headerText
            font.pixelSize: content.textHeight
        }

        Item {
            Layout.fillWidth: true
        }
    }

    Rectangle {
        id: line
        width: content.width
        height: 2
        color: "Black"
        anchors.bottom: header.bottom
        anchors.horizontalCenter: header.horizontalCenter
    }

}
