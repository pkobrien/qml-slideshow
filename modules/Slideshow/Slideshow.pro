TEMPLATE = subdirs

DISTFILES += \
    fonts \
    qmldir \
    Body.qml \
    Clock.qml \
    Date.qml \
    Footer.qml \
    Header.qml \
    Presentation.qml \
    Slide.qml \
    SlideNumber.qml \
    Text.qml \
    Time.qml \
    TitleText.qml

target.path = $$[QT_INSTALL_QML]/Slideshow

target.files = $$DISTFILES

INSTALLS += target
