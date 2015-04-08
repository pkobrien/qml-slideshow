import QtQuick 2.4

Text {
    id: slideNumber

    property string format: (total > 0) ? "# %1 / %2" : "# %1"
    property int current: 0
    property int total: 0

    text: format.arg(current)

    onFormatChanged: {
        if (format.indexOf("%2") !== -1) {
            text = Qt.binding(function() { return format.arg(current).arg(total) });
        }
    }
}
