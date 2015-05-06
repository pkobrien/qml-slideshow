import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

App.Slide {
    id: slide

    body.color: "Transparent"

    footer.visible: false
    header.visible: false

    function start() {
        cone.increment = -cone.increment;
        cone.angle = 90;
        spin.interval = 100;
        waitForIt.start();
    }

    function stop() {
        waitForIt.stop();
        goForIt.stop();
        spin.stop();
    }

    onEntered: start();

    onTriggered: {
        stop();
        start();
    }

    onExited: stop();

    property Text fancyText: Text {
        parent: slide.body
        width: slide.width * 0.7
        y: (slide.height / 2 - height)
        anchors.right: parent.right
        anchors.margins: slide.units(slide.margin * 2)
        font.family: slide.fontFamily
        font.pixelSize: slide.units(14)
        horizontalAlignment: Text.AlignRight
        style: Text.Sunken
        styleColor: "White"
        text: (slide.deck) ? slide.deck.title : "Slide Deck Title"
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
    }

    property ConicalGradient cone: ConicalGradient {
        property int increment: -1
        parent: slide.body
        anchors.fill: parent
        angle: 90
        horizontalOffset: Math.floor(slide.width * -0.3)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "Black" }
            GradientStop { position: 1.0; color: "White" }
        }
        z: -1
    }

    Timer {
        id: spin
        interval: 100
        repeat: true
        onTriggered: cone.angle += cone.increment;
    }

    Timer {
        id: goForIt
        interval: 500
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            if (spin.running) {
                cone.horizontalOffset += cone.increment;
                spin.interval = Math.max(spin.interval - 1, 10);
            } else {
                spin.start();
            }
        }
    }

    Timer {
        id: waitForIt
        interval: 5000
        repeat: false
        onTriggered: goForIt.start();
    }
}
