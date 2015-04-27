import QtQuick 2.4

Text {
    id: text

    property var slide

    font.pixelSize: Math.round(slide.height * .04)
    wrapMode: Text.WordWrap

    function findAncestorSlide(obj) {
        while (obj.parent) {
            obj = obj.parent;
            if (obj.isSlide) {
                return obj;
            }
        }
    }

    Component.onCompleted: {
        text.slide = findAncestorSlide(text);
    }
}
