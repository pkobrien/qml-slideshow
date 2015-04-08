import QtQuick 2.4

Timer {
    id: clock
    
    property date now: new Date()
    
    interval: 100
    repeat: true
    running: true
    onTriggered: now = new Date();
}
