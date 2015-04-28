import QtQuick 2.4
import "." as SS

SS.Box {
    id: body

    contentText.horizontalAlignment: Text.AlignHCenter
    contentText.width: content.width
    contentText.wrapMode: Text.WordWrap
    
//    onLeftChanged: {
//        if (left) {
//            left.parent = box;
//            left.anchors.left = content.left;
//        }
//    }

}
