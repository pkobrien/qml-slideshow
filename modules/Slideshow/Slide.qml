import QtQuick 2.4
import "." as SS

Rectangle {
    id: slide

    width: 800
    height: 600

    property alias body: body
    property alias footer: footer
    property alias header: header

    property int margin: Math.round(slide.height * 0.02)

    property bool isSlide: true
    property int number: 0
    property var presentation

    anchors.fill: presentation

    visible: (slide === presentation.activeSlide)

    SS.Header {
        id: header

        height: Math.round(slide.height * 0.09)
        margin: slide.margin
        text: (presentation) ? presentation.title : "Presentation Title"
    }

    SS.Body {
        id: body

        anchors.bottom: (footer.visible) ? footer.top : slide.bottom
        anchors.left: slide.left
        anchors.right: slide.right
        anchors.top: (header.visible) ? header.bottom : slide.top
        margin: slide.margin
    }

    SS.Footer {
        id: footer

        height: Math.round(slide.height * 0.07)
        margin: slide.margin
    }
}
