import QtQuick 2.4
import Slideshow 1.0 as SS
import "." as App

SS.Deck {
    title: "External Nested Slides: ROYGBIV"
    
    Repeater {
        model: ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"]

        App.Slide {
            header.line.width: width
            header.line.height: 6
            header.line.color: Qt.darker(body.color)
            header.margin: margin * 2
            body.color: modelData
            text: modelData
            textHeight: 40
            textColor: Qt.lighter(body.color)
            footer.color: Qt.lighter(body.color)
        }
    }
}
