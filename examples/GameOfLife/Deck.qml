import QtQuick 2.4
import Slideshow 1.0 as SS
import "." as App

SS.Deck {
    title: "Conway's Game of Life"

    App.GameOfLifeSlide {
        black: true
//        grid.columns: 50
//        grid.rows: 30
//        interval: 100
    }
}
