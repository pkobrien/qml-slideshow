import QtQuick 2.4

QtObject {
    id: countdown

    property int seconds: 0

    readonly property int elapsed: timer.elapsed
    readonly property string elapsedText: timer.elapsedText

    readonly property int remaining: timer.remaining
    readonly property string remainingText: timer.remainingText

    readonly property bool running: timer.running

    readonly property var stop: timer.stop

    function restart() {
        timer.begin = 0;
        timer.restart();
    }

    function start() {
        if (timer.running) {
            return;
        }
        if (timer.begin) {
            timer.begin = Date.now() - timer.elapsed * 1000;
        }
        timer.start();
    }

    property Timer __timer: Timer {
        id: timer

        property double begin
        property double now

        property int elapsed: (now - begin) / 1000
        property string elapsedText: format(elapsed)

        property int remaining: countdown.seconds - elapsed
        property string remainingText: format(remaining)

        function format(num) {
            num = Math.abs(num);
            var minutes = Math.floor(num / 60);
            var seconds = num % 60;

//            minutes = (minutes < 10) ? "0" + minutes : minutes;
            seconds = (seconds < 10) ? "0" + seconds : seconds;

            return minutes + ":" + seconds;
        }

        repeat: true
        triggeredOnStart: true

        onTriggered: {
            if (!begin) {
                begin = Date.now();
            }
            now = Date.now();
        }
    }
}
