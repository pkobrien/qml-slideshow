import QtQuick 2.4
import "." as SS

Rectangle {
    id: slide

    width: (presentation) ? presentation.width : 800
    height: (presentation) ? presentation.height : 600

    property alias body: body
    property alias content: body.content
    property alias footer: footer
    property alias header: header

    property alias date: date
    property alias numbering: slideNumber
    property alias time: time

    property int margin: Math.floor(slide.height * 0.02)
    property int number: 0
    property var presentation

    property string text

    readonly property bool isSlide: true

    visible: (slide === presentation.activeSlide)

    onTextChanged: body.text = text.trim().split("\n").join(" ");

    SS.Header {
        id: header

        margin: slide.margin
        text: (presentation) ? presentation.title : "Presentation Title"
        textHeight: Math.floor(slide.height * 0.04)
    }

    SS.Body {
        id: body

        anchors.bottom: (footer.visible) ? footer.top : slide.bottom
        anchors.left: slide.left
        anchors.right: slide.right
        anchors.top: (header.visible) ? header.bottom : slide.top
        margin: slide.margin
        textHeight: Math.floor(slide.height * 0.06)
    }

    SS.Footer {
        id: footer

        leftText: date.text
        text: time.text
        rightText: numbering.text
        margin: slide.margin
        textHeight: Math.floor(slide.height * 0.03)
    }

    SS.Date {
        id: date
        updateWhen: (slide.visible)
    }

    SS.Time {
        id: time
        updateWhen: (slide.visible)
    }

    SS.SlideNumber {
        id: slideNumber
        __current: slide.number
        __total: (presentation) ? presentation.slideCount : 0
    }
}
