import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

SS.Deck {
    title: "QML Slideshow Tutorial"

//    App.Slide { }

    App.DevelopmentSlide {  }

    App.BasicTitleSlide {  }

    App.FancyTitleSlide {  }

    SS.Slide {
        text: "This is the simplest type of slide you can create."
    }

    SS.Slide {
        code: '
import Slideshow 1.0 as SS

    SS.Slide {
        text: "This is the simplest type of slide you can create."
    }
'
    }

    SS.Slide {
        text: "
Other than assigning a string value to a text property (that you see here),
the header, footer, font, margins, etc. are all default values.
"
    }

    SS.Slide {
        title: "Simple Slide, Lots Of Text"
        text: "
This is also a simple slide, only it has lots of text. Even though it has a
lot of text, the text will wrap at word boundaries so it all fits inside
the body of the slide, up to a point...
"
    }

    App.Slide {
        title: "Special Text Features"
        text: "
It will even do text.trim().split(\"\\r\\n\").join(\" \") for you.
And set the horizontal alignment when the line count is greater than one,
switching from centered to left aligned.
"
    }

    SS.Slide {
        title: "Custom Base Slide"
        text: "
Did you notice anything different on that last slide? Or the next one?"
    }

    App.Slide {
        title: "Customizing Slide Defaults"
        text: "
The difference was in the use of a custom base slide with a modified footer."
    }

    App.Slide {
        title: "Customizing Slide Defaults"
        text: "Slide.qml"
        code: '
import QtQuick 2.4
import Slideshow 1.0 as SS

SS.Slide {
    id: slide

    date.format: Locale.LongFormat
    time.format: Locale.LongFormat
    numbering.format: "Slide %1 of %2"

    footer.color: "LightSteelBlue"
    footer.line.width: slide.width
}
'
    }

    App.Slide {
        fontFamily: "Roboto Condensed"
        title: "Customizing Slide Defaults"
        text: "This slide also changes the font family to Roboto Condensed."
    }

    App.Slide {
        code: '
    App.Slide {
        fontFamily: "Roboto Condensed"
        title: "Customizing Slide Defaults"
        text: "This slide also changes the font family..."
    }
'
    }

    App.HBFDiagramSlide {  }

    App.HBFTextDiagramSlide {  }

    App.Slide {
        title: "Children Are Magically Added To A Grid"
        Text {
            font.family: slide.fontFamily
            font.pixelSize: slide.units(slide.textHeight)
            text: "QtQuick Text component with minimal modification."
        }
    }

    App.RandomlyColoredGridSlide {  }

    App.SquaresSlide {  }

    App.ColorDeck {  }

    App.Slide {
        body.margin: margin * 5
        body.text: "
Qualities of a good system:

    * Simplicity
    * Flexibility
    * Power
".trim()
    }

    App.Slide {
        body.margin: margin * 5
        body.text: "
Are asterisks as good as bullets?

    * Yes
    * No
    * Sometimes
".trim()
    }

    App.Slide {
        body.margin: margin * 5
        body.text: ("
Are bullets worth fighting for? Do they really make things better? Really? " +
"How hard would you fight for them? I'm only asking because I need a lot of " +
"words to test this particular slide.

    * Valiantly
    * Cowardly
    * Depends
").trim()
    }

    App.Slide {
        header.color: footer.color
        header.line.width: width

        body.color: "Red"
        body.margin: 20

        grid.columns: 1
        grid.rows: 1

        text: "Blue on Red"

        Rectangle {
            border.width: 3
            width: slide.grid.width
            height: slide.grid.height
            color: "Blue"
            radius: height / 2
        }
    }

    App.Slide {
        body.visible: false

        header.font.family: "Roboto Slab"
        header.text: "Easy Header & Footer Customization"
        header.gradient: Gradient {
            GradientStop { position: 0.0; color: "Black" }
            GradientStop { position: 1.0; color: "Blue" }
        }
        header.font.bold: true
        header.textColor: "White"
        header.textHeight: 7
        header.line.visible: false
        header.margin: margin * 2

        footer.color: "Yellow"
        footer.font.family: "Roboto Condensed"
        footer.line.width: width
        footer.font.bold: true
        footer.leftText: "What time is it?"
    }


    /*

//    App.Slide {
//        Column {
//            width: parent.body.width
//            anchors.centerIn: parent.body
//            spacing: parent.margin

//            SS.Text {
//                text: "This is some text."
//            }
//            SS.Text {
//                width: parent.width
//                text: "This is some text that begins with a paragraph full " +
//                      "of words, and is followed by some HTML bullets:"
//            }
//            SS.Text {
//                text: "<ul>" +
//                      "<li>One</li>" +
//                      "<li>Two</li>" +
//                      "<li>Three</li>" +
//                      "</ul>"
//            }
//        }
////        ColumnLayout {
////            anchors.centerIn: parent.body
////            implicitHeight: childrenRect.height
////            implicitWidth: childrenRect.width
////            spacing: parent.margin
////            SS.Text {
////                text: "This is some text with bullets:"
////                Layout.fillWidth: true
////            }
//////            SS.Text {
//////                text: "<ul>" +
//////                      "<li>One</li>" +
//////                      "<li>Two</li>" +
//////                      "<li>Three</li>" +
//////                      "</ul>"
//////            }
////        }
//    }

    Item {
        id: deck
        property string header: "Inline Nested Slides: ROYGBIV"
        property int pixelSize: Math.round(parent.height * 0.25)

        App.Slide {
            header.text: deck.header
            body.color: "Red"
            SS.Text {
                anchors.centerIn: slide.body
                font.pixelSize: deck.pixelSize
                text: "Red Again"
            }
        }

        App.Slide {
            header.text: deck.header
            header.color: "Transparent"
            footer.color: "Transparent"
            header.line.visible: false
            footer.line.visible: false
            footer.leftText: ""
            footer.text: numbering.text
            numbering.format: "Slide %1 is " + color + ", also known as Orange"
            footer.rightText: ""
            color: "Orange"
            radius: deck.pixelSize / 2
            body.color: "Black"
            body.radius: deck.pixelSize
//            Rectangle {
//                width: Math.round(Math.min(parent.width, parent.height) * 0.6)
//                height: width
//                radius: width / 2
//                color: "Orange"
//                anchors.centerIn: parent.body
//            }
//            SS.Text {
//                anchors.centerIn: slide.body
//                font.pixelSize: deck.pixelSize / 2
//                text: slide.color
//            }
        }

        Item {
            id: deck2

            App.Slide {
                header.text: deck.header
                body.color: "Yellow"
                SS.Text {
                    anchors.bottom: slide.body.bottom
                    anchors.right: slide.body.right
                    color: "Red"
                    font.pixelSize: Math.round(parent.height * 0.05)
                    text: "%1 (%2, %3)".arg(slide.body.color).arg(
                              slide.body.width).arg(slide.body.height)
                }
            }

            App.Slide {
                header.text: deck.header
                body.color: "Green"
            }

            App.Slide {
                header.text: deck.header
                body.color: "Blue"
            }
        }

        App.Slide {
            header.text: deck.header
            body.color: "Indigo"
        }

        Item {
            id: deck3

            App.Slide {
                header.text: deck.header
                body.color: "Violet"
            }
        }
    }

// */

}
