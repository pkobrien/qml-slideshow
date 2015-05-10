import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

App.Slide {
    id: slide

    title: "Randomly-Colored Grid"

    grid.columns: 10

    property var items: []

    function randomColor() {
        return Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
    }

    function update() {
        for (var i = 0, len = items.length; i < len; i++) {
            items[i].color = randomColor();
        }
    }

    onEntered: update();
    onTriggered: update();

    Repeater {
        id: repeater

        model: 100

        onItemAdded: items.push(item);

        Rectangle {
            border.width: 1
            width: slide.grid.width / 10
            height: slide.grid.height / 10

            Text {
                anchors.centerIn: parent
                color: Qt.darker(parent.color)
                font.family: slide.fontFamily
                font.pixelSize: slide.units(slide.textHeight)
                text: modelData
            }
        }
    }
}
