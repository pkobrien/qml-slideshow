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
        activate(index);
    }

    onTopDeckChanged: {
        if (topDeck) {
            findSlides(topDeck);
            slide = undefined;
            activate(0);
        }
    }

    function activate(index) {
        if (slide) {
            slide.ready = false;
            slide.exited();
        }
        slide = slides[index];
        if (slide) {
            slide.entered();
            slide.ready = true;
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
        for (var i = 0, len = obj.children.length; i < len; i++) {
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
