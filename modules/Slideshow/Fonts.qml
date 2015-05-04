pragma Singleton

import QtQuick 2.4

Item {
    id: fonts

    // This code doesn't work because Qt does not load all the fonts correctly.
    // When Qt gets fixed this code should work and can replace loading all the
    // fonts in each slide, which is what we have to do now, unfortunately.

//    Repeater {
//        model: [
//            "fonts/Roboto/Roboto-Black.ttf",
//            "fonts/Roboto/Roboto-BlackItalic.ttf",
//            "fonts/Roboto/Roboto-Bold.ttf",
//            "fonts/Roboto/Roboto-BoldItalic.ttf",
//            "fonts/Roboto/Roboto-Italic.ttf",
//            "fonts/Roboto/Roboto-Light.ttf",
//            "fonts/Roboto/Roboto-LightItalic.ttf",
//            "fonts/Roboto/Roboto-Medium.ttf",
//            "fonts/Roboto/Roboto-MediumItalic.ttf",
//            "fonts/Roboto/Roboto-Regular.ttf",
//            "fonts/Roboto/Roboto-Thin.ttf",
//            "fonts/Roboto/Roboto-ThinItalic.ttf",
//            "fonts/Roboto_Condensed/RobotoCondensed-Bold.ttf",
//            "fonts/Roboto_Condensed/RobotoCondensed-BoldItalic.ttf",
//            "fonts/Roboto_Condensed/RobotoCondensed-Italic.ttf",
//            "fonts/Roboto_Condensed/RobotoCondensed-Light.ttf",
//            "fonts/Roboto_Condensed/RobotoCondensed-LightItalic.ttf",
//            "fonts/Roboto_Condensed/RobotoCondensed-Regular.ttf",
//            "fonts/Roboto_Slab/RobotoSlab-Bold.ttf",
//            "fonts/Roboto_Slab/RobotoSlab-Light.ttf",
//            "fonts/Roboto_Slab/RobotoSlab-Regular.ttf",
//            "fonts/Roboto_Slab/RobotoSlab-Thin.ttf",
//        ]

//        Item {
//            FontLoader {
//                source: modelData
//            }
//        }
//    }
}
