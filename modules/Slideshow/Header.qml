import QtQuick 2.4
import "." as SS

SS.Banner {
    id: header

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    line.height: 3
    line.anchors.bottom: header.bottom
}
