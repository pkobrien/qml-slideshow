import QtQuick 2.4

Rectangle {
    id: slide

    property bool isSlide: true
    property int number: 0
    property var presentation

    anchors.fill: presentation.slideArea
//    anchors.margins: Math.round(presentation.height * 0.025)
    color: "Transparent"
    visible: (presentation && slide === presentation.activeSlide)
}
