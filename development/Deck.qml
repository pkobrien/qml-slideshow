import QtQuick 2.4
import Slideshow 1.0 as SS
import "." as App

SS.Deck {
    title: "Under Development"

    App.DevelopmentSlide {  }

    App.Slide {
        text: "Hello, World"
    }

    App.Slide {
        text: "
Hello, World.

What's new with you?
"
    }

    App.Slide {
        text: "
Hello, World.

What's new with you?

Not much, how about you?
"
    }

    App.Slide {
        text: "
Hello, World.

What's new with you?

Not much, how about you?

Just another day in paradise.
"
    }

    App.Slide {
        code: "Hello, World"
    }

    App.Slide {
        code: "
Hello, World.

What's new with you?
"
    }

    App.Slide {
        code: "
Hello, World.

What's new with you?

Not much, how about you?
"
    }

    App.Slide {
        code: "
Hello, World.

What's new with you?

Not much, how about you?

Just another day in paradise.
"
    }

    App.UnderscoreSlide {  }
}
