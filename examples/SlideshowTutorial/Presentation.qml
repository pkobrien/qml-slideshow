import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

SS.Presentation {
    title: "QML Slideshow Tutorial"

    App.Slide {
        footer.visible: false;
        header.visible: false;

        gradient: Gradient {
            GradientStop { position: 0.0; color: "White" }
            GradientStop { position: 1.0; color: "Silver" }
        }

        SS.TitleText {
            anchors.centerIn: slide.body
            text: slide.presentation.title
        }
    }

    App.Slide {
        footer.visible: false;
        header.visible: false;

        ConicalGradient {
            anchors.fill: parent
            angle: 120
            horizontalOffset: Math.round(parent.width * -0.3)
            gradient: Gradient {
                GradientStop { position: 0.0; color: "Black" }
                GradientStop { position: 1.0; color: "White" }
            }
        }

        SS.TitleText {
            width: slide.body.width * 0.7
            anchors.right: slide.body.right
            text: slide.presentation.title
            horizontalAlignment: Text.AlignRight
            y: (slide.height / 2 - height)
        }
    }

    App.Slide {
        body.color: "Red"
        body.margin: width / 10

        Rectangle {
            anchors.fill: parent.body
            anchors.margins: parent.body.margin
            color: "Blue"
        }
    }

    App.Slide {
        Column {
            width: parent.body.width
            anchors.centerIn: parent.body
            spacing: parent.margin

            SS.Text {
                text: "This is some text."
            }
            SS.Text {
                width: parent.width
                text: "This is some text that begins with a paragraph full " +
                      "of words, and is followed by some HTML bullets:"
            }
            SS.Text {
                text: "<ul>" +
                      "<li>One</li>" +
                      "<li>Two</li>" +
                      "<li>Three</li>" +
                      "</ul>"
            }
        }
//        ColumnLayout {
//            anchors.centerIn: parent.body
//            implicitHeight: childrenRect.height
//            implicitWidth: childrenRect.width
//            spacing: parent.margin
//            SS.Text {
//                text: "This is some text with bullets:"
//                Layout.fillWidth: true
//            }
////            SS.Text {
////                text: "<ul>" +
////                      "<li>One</li>" +
////                      "<li>Two</li>" +
////                      "<li>Three</li>" +
////                      "</ul>"
////            }
//        }
    }

    App.ColorDeck {  }

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
            color: "Orange"
            radius: deck.pixelSize / 2
            body.color: "Black"
            body.radius: deck.pixelSize
            Rectangle {
                width: Math.round(Math.min(parent.width, parent.height) * 0.6)
                height: width
                radius: width / 2
                color: "Orange"
                anchors.centerIn: parent.body
            }
            SS.Text {
                anchors.centerIn: slide.body
                font.pixelSize: deck.pixelSize / 2
                text: slide.color
            }
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

    App.Slide {
        body.visible: false

        header.text: "Easy Header & Footer Customization"
        header.gradient: Gradient {
            GradientStop { position: 0.0; color: "Black" }
            GradientStop { position: 1.0; color: "Blue" }
        }
        header.color: "Black" // Default is transparent which hides gradient.
        header.headerText.font.bold: true
        header.headerText.color: "White"
        header.height: Math.round(height * 0.18)
        header.line.visible: false
        header.margin: margin * 3

        footer.color: "Yellow"
        footer.line.width: width
        footer.dateText.visible: true
        footer.dateText.format: Locale.LongFormat
        footer.timeText.format: Locale.LongFormat
        footer.timeText.updateInterval: 60
        footer.timeText.font.bold: true
        footer.slideNumber.format: "Slide %1 of %2"
    }

    Repeater {
        id: repeater

        model: 10

        App.Slide {
            SS.TitleText {
                anchors.centerIn: slide.body
                text: "Repeater Delegate " + (index + 1) +
                      " of " + repeater.model
            }
        }
    }
}
