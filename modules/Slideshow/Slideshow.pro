TEMPLATE = subdirs

DISTFILES += \
    fonts \
    qmldir \
    Banner.qml \
    Body.qml \
    Box.qml \
    Clock.qml \
    Countdown.qml \
    Date.qml \
    Deck.qml \
    FontLoaders.qml \
    Fonts.qml \
    Footer.qml \
    Header.qml \
    Navigator.qml \
    Slide.qml \
    SlideNumber.qml \
    Time.qml

target.path = $$[QT_INSTALL_QML]/Slideshow

target.files = $$DISTFILES

INSTALLS += target
