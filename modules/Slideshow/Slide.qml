import QtQuick 2.4
import "." as SS

Rectangle {
    id: slide

    width: (deck) ? deck.width : 800
    height: (deck) ? deck.height : 600

    SS.FontLoaders {  }  // Temporary bug fix. QML has font loading issues.

    property var deck

    property alias body: body
    property alias footer: footer
    property alias grid: body.grid
    property alias header: header

    property alias bottomLeft: body.bottomLeft
    property alias bottomRight: body.bottomRight
    property alias topLeft: body.topLeft
    property alias topRight: body.topRight

    property string code
    property alias codeColor: body.codeColor
    property string codeFontFamily: "Inconsolata"
    property alias codeHeight: body.codeHeight
    property string fontFamily: "Roboto"
    property int margin: 2  // As percentage of slide height.
    property string text
    property alias textColor: body.textColor
    property alias textHeight: body.textHeight
    property string title

    property alias date: date
    property alias numbering: slideNumber
    property alias time: time

    property int number: 0

    readonly property bool isSlide: true

    signal entered()
    signal exited()
    signal triggered()

    function units(percent) {
        return Math.floor(slide.height * (percent / 100))
    }

    visible: (deck) ? (slide === SS.Navigator.slide) : true

    onCodeChanged: body.code = code;

    onEntered: {
        internal.entered = true;
        internal.simulate = slide.exited;
    }

    onExited: {
        internal.entered = false;
        internal.simulate = slide.entered;
    }

    onTextChanged: body.text = text.trim().split("\r\n").join(" ");

    Component.onCompleted: internal.setup();

    QtObject {
        id: internal

        // Toggle between entered and exited when running slide directly in
        // qmlscene without a deck as the parent (or ancestor).

        property bool entered: false
        property var simulate: slide.entered

        function next() {
            if (deck) {
                SS.Navigator.next();
            } else {
                simulate();
            }
        }

        function previous() {
            if (deck) {
                SS.Navigator.previous();
            } else {
                simulate();
            }
        }

        function trigger() {
            if (!deck && !entered) {
                // When a slide is run in qmlscene outside of a deck
                // the entered() signal is not initially executed. So if the
                // user hits [Space] for triggered() we may need to execute the
                // entered() signal first to duplicate the state the slide will
                // be in when it appears within a deck.
                slide.entered();
            }
            slide.triggered();
        }

        function moveUserDefinedChildrenToBodyGrid() {
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

        function setup() {
            moveUserDefinedChildrenToBodyGrid();
        }
    }

    SS.Body {
        id: body

        anchors.bottom: (footer.visible) ? footer.top : slide.bottom
        anchors.left: slide.left
        anchors.right: slide.right
        anchors.top: (header.visible) ? header.bottom : slide.top
        codeFont.family: slide.codeFontFamily
        codeHeight: 4
        font.family: slide.fontFamily
        margin: slide.margin
        textHeight: 6
    }

    SS.Header {
        id: header

        font.family: slide.fontFamily
        margin: slide.margin
        text: (title) ? title :
              (deck) ? deck.title : "Slide/Deck Title"
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
        __total: (deck) ? SS.Navigator.slideCount : 0
    }

    focus: (visible)

    Keys.onEscapePressed: Qt.quit();
    Keys.onLeftPressed: internal.previous();
    Keys.onRightPressed: internal.next();
    Keys.onSpacePressed: internal.trigger();
}
