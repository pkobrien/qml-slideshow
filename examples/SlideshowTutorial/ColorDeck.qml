import QtQuick 2.4
import Slideshow 1.0 as SS
import "." as App

Item {
    id: deck
    property string header: "External Nested Slides: ROYGBIV"
    property int textHeight: Math.floor(parent.height * 0.2)
    
    Repeater {
        model: ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"]

        App.Slide {
            header.text: deck.header
            header.line.width: width
            header.line.height: 6
            header.line.color: Qt.lighter(body.color)
            header.margin: margin * 2
            body.color: modelData
            text: modelData
            textHeight: deck.textHeight
            textColor: Qt.darker(body.color)
            footer.color: Qt.lighter(body.color)
        }
    }
}
