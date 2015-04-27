import QtQuick 2.4
import QtQuick.Layouts 1.1
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
            anchors.centerIn: parent.body
            text: parent.presentation.title
        }
    }

    App.Slide {
        Column {
            anchors.centerIn: parent.body
            spacing: parent.margin

            SS.Text {
                text: "This is some text."
            }
            SS.Text {
                text: "This is some text with HTML bullets:"
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

    App.Slide {
        body.color: "Green"
    }

    App.Slide {
        body.color: "Blue"
    }

    Repeater {
        model: 10

        App.Slide {  }
    }
}
