import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

App.Deck {
    problemNumber: 1
    title: "Multiples of 3 and 5"

    function solve(max) {
        var result = 0;
        for (var i=1; i < max; i++) {
            result += (i % 3 === 0 || i % 5 === 0) ? i : 0;
        }
        return result;
    }

    App.Slide {
        text: "
If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23."
    }

    App.Slide {
        text: "Find the sum of all the multiples of 3 or 5 below 1000."
    }

    App.Slide {
        onEntered: text = "Press [Space] for the solution.";
        onTriggered: text = solve(1000);
    }

    App.Slide {
        text: "This is how I solved it:"
        code: "
    function solve(max) {
        var result = 0;
        for (var i=1; i < max; i++) {
            result += (i % 3 === 0 || i % 5 === 0) ? i : 0;
        }
        return result;
    }
"
    }
}
