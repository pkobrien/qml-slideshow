import QtQuick 2.4
import QtQuick.Layouts 1.1
import Slideshow 1.0 as SS
import "." as App

SS.Presentation {
    id: presentation

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
            text: presentation.title
        }
    }

//    App.Slide {
////        SS.Text {
////            anchors.centerIn: parent.body
////            text: "This is some text with bullets:"
////        }
////        SS.Text {
////            anchors.centerIn: parent.body
////            text: "<ul>" +
////                  "<li>One</li>" +
////                  "<li>Two</li>" +
////                  "<li>Three</li>" +
////                  "</ul>"
////        }
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
//    }

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
        header.color: "DarkGray"
        header.headerText.font.bold: true
        header.headerText.color: "White"
        header.line.visible: false

        footer.color: "Silver"
        footer.line.width: footer.parent.width
        footer.dateText.visible: true
        footer.dateText.format: Locale.LongFormat
        footer.timeText.format: Locale.LongFormat
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
