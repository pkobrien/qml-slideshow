import QtQuick 2.4
import QtQuick.Layouts 1.1
import "." as SS

Rectangle {
    id: header

    height: Math.round(parent.height * 0.1)

    property alias headerText: headerText
    property alias text: headerText.text

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    color: "transparent"
    z: 100

    RowLayout {
        id: headerContent
        anchors.fill: parent
        anchors.margins: Math.round(header.height / 3)

        property int textHeight: header.height - anchors.margins * 2

        Item {
            Layout.fillWidth: true
        }

        Text {
            id: headerText
            font.pixelSize: headerContent.textHeight
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
