import QtQuick 2.4
import "." as SS

Rectangle {
    id: slide

    width: (presentation) ? presentation.width : 800
    height: (presentation) ? presentation.height : 600

    property alias body: body
    property alias content: body.content
    property alias footer: footer
    property alias grid: body.grid
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

    property string fontFamily: "Roboto"
    property string text
    property alias textColor: body.textColor
    property alias textHeight: body.textHeight
    property string title

    readonly property bool isSlide: true

    visible: (presentation) ? (slide === presentation.activeSlide) : true

    onTextChanged: body.text = text.trim().split("\n").join(" ");

    function __moveUserDefinedChildrenToBodyGrid() {
        // Copy children to a new list, since we change their parent value.
        var child, i;
        var userChildren = [];
        for (i = 0; i < children.length; i++) {
            child = children[i];
            switch (child) {
                // Skip existing children: header, body, footer.
                case header: case body: case footer:
                    continue;
            }
            userChildren.push(children[i]);
        }
        for (i = 0; i < userChildren.length; i++) {
            child = userChildren[i];
            child.parent = body.grid;
        }
    }

    function units(percent) {
        return Math.floor(slide.height * (percent / 100))
    }

    Component.onCompleted: __moveUserDefinedChildrenToBodyGrid();

    SS.Body {
        id: body

        anchors.bottom: (footer.visible) ? footer.top : slide.bottom
        anchors.left: slide.left
        anchors.right: slide.right
        anchors.top: (header.visible) ? header.bottom : slide.top
        font.family: slide.fontFamily
        margin: slide.margin
        textHeight: 6
    }

    SS.Header {
        id: header

        font.family: slide.fontFamily
        margin: slide.margin
        text: (title) ? title :
              (presentation) ? presentation.title : "Slide/Presentation Title"
        textHeight: 4
    }

    SS.Footer {
        id: footer

        font.family: slide.fontFamily
        leftText: date.text
        text: time.text
        rightText: numbering.text
        margin: slide.margin
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
