import QtQuick 2.4
import QtQuick.Window 2.2
import "." as App

Window {
    title: topDeck.title

    width: 800
    height: 600

    App.TopDeck {
        id: topDeck

        anchors.fill: parent
    }
}
