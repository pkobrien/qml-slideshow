import QtQuick 2.4

Text {
    id: text

    property var slide

    font.pixelSize: Math.round(slide.height * .04)
    wrapMode: Text.WordWrap

    Component.onCompleted: {
        while (true) {
            if (parent["isSlide"]) {
                slide = parent;
                break;
            } else {
                parent = parent.parent;
            }
        }
    }
}
