import QtQuick 2.4

Text {
    id: text

    property var slide

    font.pixelSize: Math.round(slide.height * .04)
    wrapMode: Text.WordWrap

    Component.onCompleted: {
        var ancestor = text.parent;
        while (true) {
            if (ancestor["isSlide"]) {
                text.slide = ancestor;
                break;
            } else {
                ancestor = ancestor.parent;
            }
        }
    }
}
