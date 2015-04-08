TEMPLATE = subdirs

DISTFILES += \
    fonts \
    qmldir \
    Clock.qml \
    Date.qml \
    Footer.qml \
    Header.qml \
    Presentation.qml \
    Slide.qml \
    SlideNumber.qml \
    Time.qml

target.path = $$[QT_INSTALL_QML]/Slideshow

target.files = $$DISTFILES

INSTALLS += target
