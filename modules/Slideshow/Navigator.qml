pragma Singleton

import QtQuick 2.4

QtObject {
    id: navigator
    
    property int index: 0
    property var slide
    property int slideCount: 0
    property var slides: []
    property var topDeck
    
    onIndexChanged: {
        if (slide) {
            slide.exited();
        }
        slide = slides[index];
        slide.entered();
    }

    onTopDeckChanged: {
        if (topDeck) {
            findSlides(topDeck);
            slide = slides[index];
            slide.forceActiveFocus();  // Shouldn't be necessary. Qt bug fix.
            slide.entered();
        }
    }
    
    function next() {
        index = Math.min(index + 1, slides.length - 1);
    }
    
    function previous() {
        index = Math.max(index - 1, 0);
    }
    
    function findSlides(obj) {
        var child;
        for (var i = 0; i < obj.children.length; i++) {
            child = obj.children[i];
            if (child.isSlide) {
                slideCount++;
                child.number = slideCount;
                slides.push(child);
            } else if (child.children) {
                findSlides(child);
            }
        }
    }
}
