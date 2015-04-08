import QtQuick 2.4
import QtQuick.Layouts 1.1

Item {
    id: presentation

    width: 800
    height: 600

    property var activeSlide
    property int activeSlideIndex: 0
    property var footer
    property var header
    property int slideCount: 0
    property var slides: []

    property alias slideArea: slideArea

    onFooterChanged: {
        if (footer) {
            footer.parent = presentation;
        }
    }

    onHeaderChanged: {
        if (header) {
            header.parent = presentation;
        }
    }

    function next() {
        activeSlideIndex = Math.min(activeSlideIndex + 1, slides.length - 1);
        activeSlide = slides[activeSlideIndex];
    }

    function previous() {
        activeSlideIndex = Math.max(activeSlideIndex - 1, 0);
        activeSlide = slides[activeSlideIndex];
    }

    Item {
        id: slideArea
        anchors.bottom: (footer && footer.visible) ? footer.top : presentation.bottom
        anchors.left: presentation.left
        anchors.right: presentation.right
        anchors.top: (header && header.visible) ? header.bottom : presentation.top
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
