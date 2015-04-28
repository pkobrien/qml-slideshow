import QtQuick 2.4
import Slideshow 1.0 as SS

SS.Slide {
    id: slide

    date.format: Locale.LongFormat
    time.format: Locale.LongFormat
    numbering.format: "Slide %1 of %2"

    footer.line.width: slide.width

//    footer.leftText: date.text

//    footer.text: time.text

//    footer.rightText: numbering.text

//    body.anchors.bottomMargin: 0
//    body.anchors.topMargin: 0

//    header.line.color: "Gray"
//    header.line.width: body.width

}
