import QtQuick 2.4

QtObject {
    id: slideNumber

    readonly property string text: __text

    readonly property int current: __current
    readonly property int total: __total

    property string format: (total > 0) ? "# %1 / %2" : "# %1"

    property string __text
    property int __current: 0
    property int __total: 0

    onFormatChanged: {
        if (format.indexOf("%2") !== -1) {
            __text = Qt.binding(function()
                                { return format.arg(__current).arg(__total) });
        } else {
            __text = Qt.binding(function() { return format.arg(__current) });
        }
    }
}
