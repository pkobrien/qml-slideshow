import QtQuick 2.4
import QtQuick.Window 2.2
import Slideshow 1.0 as SS
import "." as App

SS.Deck {
    title: "ChiPy Ultimate Language Shootout"

    App.Slide {
        text: "
Pick any programming language. Present and introduce the language
at the May 14th ChiPy meeting. Do at least 1 comparison to Python.
"
    }

    App.Slide {
        text: "
Talks should be approximately 5 minutes.
"
    }

    App.Slide {
        text: "
Audience members will vote on their favorite presentation
and the winner takes home $100s in cash.
"
    }

    App.Slide {
        text: "QML vs. Python"
    }

    App.Slide {
        text: "QML vs. Python"
        textHeight: 9
    }

    App.Slide {
        text: "QML vs. Python"
        textHeight: 15
    }

    App.Slide {
        title: "Your Presenter"
        text: "Patrick Keith O'Brien"
    }

    App.Slide {
        title: "Your Presenter"
        text: "Pythonista since 1999"
    }

    App.Slide {
        title: "Your Presenter"
        text: "Worked with wxPython, PyGTK, PyQt"
    }

    App.Slide {
        title: "Your Presenter Boasted"
        text: '
"If you think Python is Pythonic, wait until you see QML
from the point of view of an experienced Python developer."
'
    }

    App.Slide {
        title: "What does it mean to be Pythonic?"
        codeHeight: 3
        code: "
>>> import this
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
"
    }

    App.Slide {
        title: "QML vs. Python"
        text: '
Working with QML gives me the same good *feelings* as when I work with Python.
'
    }

    App.Slide {
        title: "What is QML?"
        text: "
QML is the Qt Meta Language or Qt Modeling Language.
http://en.wikipedia.org/wiki/QML
"
    }

    App.Slide {
        title: "QML vs. Python"
        text: "
Python:

* procedural, functional, object-oriented

* general purpose (not UI-centric)

* easy to write, read, refactor

* one and only one obvious way
"
    }

    App.Slide {
        title: "QML vs. Python"
        text: "
QML:

* declarative, hierarchical, object-based

* UI-centric (plus DSMF)

* easy to write, read, refactor

* no obvious way, many wrong ways
"
    }

    App.Slide {
        title: "Sample QML Code"
        code: '
import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    width: 640
    height: 480
    title: "Simple Demo"
}
'
        Window {
            id: window1
            width: 640
            height: 480
            title: "Simple Demo"
            visible: false
        }
        onExited: window1.visible = false;
        onTriggered: window1.visible = true;
    }

    App.Slide {
        title: "Sample QML Code"
        code: '
import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    width: 640
    height: 480
    title: "Simple Demo: " + width + " by " + height
}
'
        Window {
            id: window2
            width: 640
            height: 480
            title: "Simple Demo: " + width + " by " + height
            visible: false
        }
        onExited: window2.visible = false;
        onTriggered: window2.visible = true;
    }

    App.Slide {
        title: "Sample QML Code"
        code: '
import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    width: 640
    height: 480

    Text {
        anchors.centerIn: parent
        color: "Blue"
        font.bold: true
        font.pixelSize: parent.height / 4
        text: parent.width + " by " + parent.height
    }
}
'
        Window {
            id: window3
            width: 640
            height: 480
            visible: false
            Text {
                anchors.centerIn: parent
                color: "Blue"
                font.bold: true
                font.pixelSize: parent.height / 4
                text: parent.width + " by " + parent.height
            }
        }
        onExited: window3.visible = false;
        onTriggered: window3.visible = true;
    }

    App.Slide {
        title: "QML Features"
        text: "
* Bindings

* Signals and Slots

* Scripting (but it's Javascript)

* Declarative State Machine Framework

* Unit Testing Framework
"
    }

    App.Slide {
        title: 'Returning to "The Zen of Python"'
        codeHeight: 3
        code: "
>>> import this
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
"
    }

    App.Slide {
        title: "QML vs. Python"
        text: "QML can be as Pythonic as Python"
    }

    App.Slide {
        title: "Does that mean QML loses?"
        text: "Although it is hard to find examples of this..."
    }

    App.Slide {
        title: "QML and Python go great together"
        text: 'Perhaps one day there will be "The Zen of QML"'
    }
}
