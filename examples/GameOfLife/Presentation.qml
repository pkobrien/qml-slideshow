import QtQuick 2.4
import QtQuick.Window 2.2
import "." as App

Window {
    title: deck.title

    width: 1200
    height: 800

    visible: true

    App.Deck {
        id: deck
    }
}
