import QtQuick 2.4
import Slideshow 1.0 as SS

SS.Slide {
    id: slide

    header.line.width: slide.width

    date.format: Locale.LongFormat
    time.format: Locale.LongFormat
    numbering.format: "Slide %1 of %2"

    footer.line.width: slide.width

    footer.leftText: "Project Euler"
    footer.text: "Problem #" + deck.problemNumber
}
