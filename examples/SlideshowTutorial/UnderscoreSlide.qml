import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App
import "underscore.js" as Underscore

App.Slide {
    id: slide

    property var _: Underscore._

    text: "Underscore version: " + _.VERSION
}
