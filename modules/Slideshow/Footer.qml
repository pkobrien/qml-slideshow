import QtQuick 2.4
import "." as SS

SS.Banner {
    id: footer

    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right

    line.height: 1
    line.anchors.top: footer.top
}
