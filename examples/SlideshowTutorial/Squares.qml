import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

App.Slide {
    id: slide
    text: slide.numbering.total + " Slides"

    bottomLeft: RowLayout {
        width: slide.content.width / 2
        Rectangle {
            implicitWidth: slide.content.width / 6
            implicitHeight: implicitWidth
            color: "Orange"
        }
        Item {
            Layout.fillWidth: true
        }
        Rectangle {
            implicitWidth: slide.content.width / 10
            implicitHeight: implicitWidth
            color: "Indigo"
        }
    }

    bottomRight: Rectangle {
        width: slide.content.width / 8
        height: width
        color: "Green"
    }

    Rectangle {
        width: slide.content.width / 4
        height: width
        color: "Red"
    }
    Rectangle {
        width: slide.content.width / 8
        height: width
        color: "Blue"
    }
}
