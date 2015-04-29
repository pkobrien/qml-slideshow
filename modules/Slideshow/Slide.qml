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

    property alias bottomLeft: body.bottomLeft
    property alias bottomRight: body.bottomRight
    property alias topLeft: body.topLeft
    property alias topRight: body.topRight

    property alias date: date
    property alias numbering: slideNumber
    property alias time: time

    property int margin: 2
    property int number: 0
    property var presentation

    property string text
    property alias textColor: body.textColor
    property alias textHeight: body.textHeight
    property string title

    readonly property bool isSlide: true

    visible: (slide === presentation.activeSlide)

    onTextChanged: body.text = text.trim().split("\n").join(" ");

    function moveUserChildrenToBodyRow() {
        // Make a copy first, since we change their parent value.
        var userChildren = [];
        var i = 3;  // Skip existing children: header, body, footer.
        for (i; i < children.length; i++) {
            userChildren.push(children[i]);
        }
        for (i = 0; i < userChildren.length; i++) {
            var child = userChildren[i];
            child.parent = body.row;
        }
    }

    function units(percent) {
        return Math.floor(slide.height * (percent / 100))
    }

    Component.onCompleted: moveUserChildrenToBodyRow();

    SS.Body {
        id: body

        anchors.bottom: (footer.visible) ? footer.top : slide.bottom
        anchors.left: slide.left
        anchors.right: slide.right
        anchors.top: (header.visible) ? header.bottom : slide.top
        margin: slide.margin
        slide: slide
        textHeight: 6
    }

    SS.Header {
        id: header

        margin: slide.margin
        slide: slide
        text: (title) ? title :
              (presentation) ? presentation.title : "Presentation Title"
        textHeight: 4
    }

    SS.Footer {
        id: footer

        leftText: date.text
        text: time.text
        rightText: numbering.text
        margin: slide.margin
        slide: slide
        textHeight: 3
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
