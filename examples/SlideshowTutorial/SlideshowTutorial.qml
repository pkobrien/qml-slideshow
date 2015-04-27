import QtQuick 2.4
import QtQuick.Window 2.2
import "." as App

Window {
    title: presentation.title

    width: 800
    height: 600

    App.Presentation {
        id: presentation

        anchors.fill: parent
    }
}
