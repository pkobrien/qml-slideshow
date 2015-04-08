import QtQuick 2.4
import Slideshow 1.0 as SS

SS.Presentation {
    id: presentation

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "White" }
            GradientStop { position: 1.0; color: "Silver" }
        }
    }

    header: SS.Header {
        text: "QML Slideshow Tutorial"
    }

    footer: SS.Footer {
        dateText.visible: false
    }

    SS.Slide {
//        anchors.margins: 0

        Text {
            anchors.fill: parent
            anchors.margins: Math.round(parent.height * .1)
            font.pixelSize: Math.round(parent.height * .1)
            horizontalAlignment: Text.AlignHCenter
            text: "QML Slideshow Tutorial"
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

//        SS.Date { format: Locale.LongFormat }

//        SS.Time { format: Locale.LongFormat }

        onVisibleChanged: {
            presentation.header.visible = !visible;
            presentation.footer.visible = !visible;
        }
    }

    SS.Slide {
        color: "White"
    }

    SS.Slide {
        color: "Red"
    }

    SS.Slide {
        color: "Green"
    }

    SS.Slide {
        color: "Blue"
    }

    Repeater {
        model: 10

        SS.Slide {  }
    }
}
