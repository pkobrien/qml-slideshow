import QtQuick 2.4

Item {
    id: presentation

    property var activeSlide
    property int activeSlideIndex: 0
    property int slideCount: 0
    property var slides: []
    property string title: "Presentation Title"

    function next() {
        activeSlideIndex = Math.min(activeSlideIndex + 1, slides.length - 1);
        activeSlide = slides[activeSlideIndex];
    }

    function previous() {
        activeSlideIndex = Math.max(activeSlideIndex - 1, 0);
        activeSlide = slides[activeSlideIndex];
    }

    Component.onCompleted: {
        var child;
        for (var i = 0; i < children.length; i++) {
            child = children[i];
            if (child.isSlide) {
                slideCount++;
                child.number = slideCount;
                child.presentation = presentation;
                slides.push(child);
            }
        }
        activeSlideIndex = 0;
        activeSlide = slides[activeSlideIndex];
    }

    focus: true

    Keys.onEscapePressed: Qt.quit();
    Keys.onLeftPressed: previous();
    Keys.onRightPressed: next();
}
