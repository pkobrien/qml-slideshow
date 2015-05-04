import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

App.Deck {

    problemNumber: 999
    title: "Project Euler Problem"

    App.Slide {
        id: slide

        function start() {
            text = "Press [Space] for a random number."
        }

        function stop() {
            text = "All done."
        }

        function update() {
            text = Math.random();
        }

        onEntered: start();

        onExited: stop();

        onTriggered: update();
    }

    App.Slide {  }

    App.Slide {  }
}
