import QtQuick 2.4
import Slideshow 1.0 as SS

SS.Slide {
    id: slide

    date.format: Locale.LongFormat
    time.format: Locale.LongFormat
    numbering.format: "Slide %1 of %2"

    footer.color: "LightSteelBlue"
    footer.line.width: slide.width

    footer.leftText: body.__centralText.width
}
