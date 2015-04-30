import QtQuick 2.4

Item {
    id: presentation

    readonly property var next: internal.next
    readonly property var previous: internal.previous
    readonly property alias slide: internal.slide
    readonly property alias slideCount: internal.slideCount
    property string title: "Presentation Title"

    Item {
        id: internal

        property int index: 0
        property var slide
        property int slideCount: 0
        property var slides: []

        Component.onCompleted: {
            findSlides(presentation);
            slide = slides[index];
        }

        function next() {
            slide.exited();
            index = Math.min(index + 1, slides.length - 1);
            slide = slides[index];
        }

        function previous() {
            slide.exited();
            index = Math.max(index - 1, 0);
            slide = slides[index];
        }

        function findSlides(obj) {
            var child;
            for (var i = 0; i < obj.children.length; i++) {
                child = obj.children[i];
                if (child === internal) {
                    continue;
                }
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
    }

    focus: true

    Keys.onEscapePressed: Qt.quit();
    Keys.onLeftPressed: previous();
    Keys.onRightPressed: next();
}
