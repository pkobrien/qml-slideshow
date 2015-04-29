import QtQuick 2.4
import "." as App

App.Slide {
    id: slide

    header.visible: false;
    body.color: "Transparent"
    footer.visible: false;
    
    text: slide.presentation.title
    textHeight: 10
    
    gradient: Gradient {
        GradientStop { position: 0.0; color: "White" }
        GradientStop { position: 1.0; color: "Silver" }
    }
}
