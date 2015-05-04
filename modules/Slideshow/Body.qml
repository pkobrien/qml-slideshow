import QtQuick 2.4
import "." as SS

SS.Box {
    id: body

    property var bottomLeft
    property var bottomRight
    property var topLeft
    property var topRight

    property alias code: centralCode.text
    property alias codeColor: centralCode.color
    property alias codeFont: centralCode.font
    property real codeHeight

    __centralText.horizontalAlignment: (__centralText.lineCount > 1) ?
                                       Text.AlignLeft : Text.AlignHCenter
    __centralText.width: __content.width
    __centralText.wrapMode: Text.WordWrap

    __slide: parent

    onBottomLeftChanged: {
        internal.anchor(bottomLeft, "bottom", "left");
    }

    onBottomRightChanged: {
        internal.anchor(bottomRight, "bottom", "right");
    }

    onTopLeftChanged: {
        internal.anchor(topLeft, "top", "left");
    }

    onTopRightChanged: {
        internal.anchor(topRight, "top", "right");
    }

    Text {
        id: centralCode

        parent: __column
        font.pixelSize: __slide.units(body.codeHeight)
    }

    QtObject {
        id: internal

        function anchor(obj, location1, location2) {
            if (obj) {
                obj.parent = body.__content;
                obj.anchors[location1] = body.__content[location1];
                obj.anchors[location2] = body.__content[location2];
            }
        }
    }
}
