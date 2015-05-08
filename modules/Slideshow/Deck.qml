import QtQuick 2.4
import "." as SS

Item {
    id: deck

    property string title: "Deck Title"

    readonly property bool isDeck: true

    readonly property var slide: SS.Navigator.slide // Namespace trick.

    width: (parent) ? parent.width : 800
    height: (parent) ? parent.height : 600

    Component.onCompleted: {
        assignDeckToSlides(deck);
        if (parent === null) {
            width = 800;
            height = 600;
        } else if (parent.isDeck) {
            // Skip nested decks.
            return;
        }
        // Setup navigation using the top-most level deck.
        SS.Navigator.topDeck = deck;
    }

    function assignDeckToSlides(obj) {
        var child;
        for (var i = 0; i < obj.children.length; i++) {
            child = obj.children[i];
            if (child.isDeck) {
                continue;
            } else if (child.isSlide) {
                child.deck = deck;
            } else if (child.children) {
                assignDeckToSlides(child);
            }
        }
    }
}
