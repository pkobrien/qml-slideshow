import QtQuick 2.4
import Slideshow 1.0 as SS

SS.Slide {
    id: slide

    header.line.width: slide.width

    time.format: Locale.LongFormat
    numbering.format: "Slide %1 of %2"

    footer.line.width: slide.width

    footer.leftText: "Thursday, May 14, 2015"
    footer.text: slide.time.text
}
