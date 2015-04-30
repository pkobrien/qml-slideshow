import QtQuick 2.4

Item {
    id: presentation

    readonly property alias slide: presentation.activeSlide // Evil! :-)

    property var activeSlide
    property int activeSlideIndex: 0
    property int slideCount: 0
    property var slides: []
    property string title: "Presentation Title"

    function findSlides(obj) {
        var child;
        for (var i = 0; i < obj.children.length; i++) {
            child = obj.children[i];
            if (child.isSlide) {
                slideCount++;
                child.number = slideCount;
                child.presentation = presentation;
                slides.push(child);
            } else if (child.children) {
                findSlides(child);
            }
        }
    }

    function next() {
        activeSlide.exited();
        activeSlideIndex = Math.min(activeSlideIndex + 1, slides.length - 1);
        activeSlide = slides[activeSlideIndex];
    }

    function previous() {
        activeSlide.exited();
        activeSlideIndex = Math.max(activeSlideIndex - 1, 0);
        activeSlide = slides[activeSlideIndex];
    }

    Component.onCompleted: {
        findSlides(presentation);
        activeSlideIndex = 0;
        activeSlide = slides[activeSlideIndex];
    }

    FontLoader { source: "fonts/Roboto/Roboto-Black.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-BlackItalic.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-Bold.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-BoldItalic.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-Italic.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-Light.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-LightItalic.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-Medium.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-MediumItalic.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-Regular.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-Thin.ttf" }
    FontLoader { source: "fonts/Roboto/Roboto-ThinItalic.ttf" }

    FontLoader { source: "fonts/Roboto_Condensed/RobotoCondensed-Bold.ttf" }
    FontLoader { source: "fonts/Roboto_Condensed/RobotoCondensed-BoldItalic.ttf" }
    FontLoader { source: "fonts/Roboto_Condensed/RobotoCondensed-Italic.ttf" }
    FontLoader { source: "fonts/Roboto_Condensed/RobotoCondensed-Light.ttf" }
    FontLoader { source: "fonts/Roboto_Condensed/RobotoCondensed-LightItalic.ttf" }
    FontLoader { source: "fonts/Roboto_Condensed/RobotoCondensed-Regular.ttf" }

    FontLoader { source: "fonts/Roboto_Slab/RobotoSlab-Bold.ttf" }
    FontLoader { source: "fonts/Roboto_Slab/RobotoSlab-Light.ttf" }
    FontLoader { source: "fonts/Roboto_Slab/RobotoSlab-Regular.ttf" }
    FontLoader { source: "fonts/Roboto_Slab/RobotoSlab-Thin.ttf" }

    focus: true

    Keys.onEscapePressed: Qt.quit();
    Keys.onLeftPressed: previous();
    Keys.onRightPressed: next();
}
