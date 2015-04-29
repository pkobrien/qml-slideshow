import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

SS.Slide {
    id: slide
    
    fontFamily: "Roboto Condensed"

    header.border.width: 2
    header.line.visible: false

    header.leftText: "header.leftText"
    header.text: "header.text"
    header.rightText: "header.rightText"

    body.border.width: 2
    text: "text (aka slide.text - updates body.text and adds functionality)"

//    body.content.border.width: 2
//    body.text: "body.content"

    footer.border.width: 2
    footer.line.visible: false

    footer.leftText: "footer.leftText"
    footer.text: "footer.text"
    footer.rightText: "footer.rightText"
}
