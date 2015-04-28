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
            body.color: modelData
            text: modelData
            textHeight: deck.textHeight
            textColor: Qt.darker(body.color)
        }
    }
}
