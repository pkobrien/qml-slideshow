import QtQuick 2.4
import Slideshow 1.0 as SS

SS.Slide {
    id: slide

    header.line.width: slide.width
    header.font.family: "Roboto Slab"

    time.format: Locale.LongFormat
    numbering.format: "Slide %1 of %2"

    footer.line.width: slide.width

    footer.leftText: "Thursday, May 14, 2015"

    footer.text: countdown.remainingText

    footer.textColor: (countdown.remaining < 0) ? "Red" : "Black"

    Binding on footer.text {
        when: (countdown.remaining < 0)
        value: countdown.remainingText + " (Overtime)"
    }

    onEntered: body.opacity = 0;

    OpacityAnimator on body.opacity {
        from: 0
        to: 1
        duration: 1000
        running: (slide.active)
    }
}
