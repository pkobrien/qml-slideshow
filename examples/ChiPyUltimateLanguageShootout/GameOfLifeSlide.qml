import QtQuick 2.4
import "." as App

App.Slide {
    id: slide

    title: "Conway's Game Of Life"

    grid.columns: 100
    grid.rows: 50

    footer.leftText: "Generations: " + generations

    property var cells: []
    property int generations: 0
    property var living: []
    property var newBorn: []
    property var newDead: []

    function cellIndex(x, y) {
        return x + y * grid.columns;
    }

    function cycle() {
        if (!living.length) {
            return;
        }
        if (generations > 1 && !newBorn.length && !newDead.length) {
            return;
        }
        generations += 1;
        newBorn = [];
        newDead = [];
        var alive;
        var count;
        var i, j, len;
        var index;
        var nearby;
        var neigh;
        var nextgen = [];
        var recalc = [];
        for (i = 0, len = living.length; i < len; i++) {
            alive = living[i];
            nearby = [alive].concat(cells[alive].neighbors);
            for (j = 0; j < 9; j++) {
                if (recalc.indexOf(nearby[j]) === -1) {
                    recalc.push(nearby[j]);
                }
            }
        }
        for (i = 0, len = recalc.length; i < len; i++) {
            count = 0;
            index = recalc[i];
            neigh = cells[index].neighbors;
            for (j = 0; j < 8; j++) {
                if (living.indexOf(neigh[j]) !== -1) {
                    count++;
                }
            }
            if (count === 3 || (count === 2 && living.indexOf(index) !== -1)) {
                if (nextgen.indexOf(index) === -1) {
                    nextgen.push(index);
                    if (living.indexOf(index) === -1) {
                        newBorn.push(index);
                    }
                }
            }
        }
        for (i = 0, len = living.length; i < len; i++) {
            alive = living[i];
            if (nextgen.indexOf(alive) === -1) {
                newDead.push(alive)
            }
        }
        newBorn.forEach(function(index) { cells[index].born(); });
        newDead.forEach(function(index) { cells[index].died(); });
        living = nextgen;
    }

    function neighbors(index) {
        var x = index % grid.columns;
        var y = Math.floor(index / grid.columns);
        var neigh = [];
        var i, j;
        for (i = -1; i < 2; i++) {
            for (j = -1; j < 2; j++) {
                if (i === 0 && j === 0) {
                    continue;
                }
                neigh.push(cellIndex(toroidX(x + i), toroidY(y + j)));
            }
        }
        return neigh;
    }

    function toroidN(n, constraint) {
        if (n >= 0) {
            if (n < constraint) {
                return n;
            }
            return n - constraint;
        }
        return n + constraint;
    }

    function toroidX(x) {
        return toroidN(x, grid.columns);
    }

    function toroidY(y) {
        return toroidN(y, grid.rows);
    }

    function populate() {
        living = randomPopulation();
        living.forEach(function(index) {
            cells[index].init(); });
    }

    function randomColor() {
        return Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
    }

    function randomInt(min, max) {
      return Math.floor(Math.random() * (max - min)) + min;
    }

    function randomPopulation() {
        var area = grid.columns * grid.rows;
        var count = randomInt(Math.floor(area / 20), Math.floor(area / 6));
        var index;
        var pop = [];
        for (var i = 0; i < count; i++) {
            index = randomInt(0, area - 1);
            if (pop.indexOf(index) === -1) {
                pop.push(index);
            }
        }
        return pop;
    }

    function reset() {
        timer.stop();
        cells.forEach(function(cell) { cell.reset(); });
        generations = 0;
    }

    onEntered: populate();

    onExited: reset();

    onTriggered: timer.running = !timer.running;

    Timer {
        id: timer
        interval: 10
        repeat: true
        running: false
        onTriggered: cycle()
    }

    Repeater {

        model: grid.columns * grid.rows

        onItemAdded: cells.push(item);

        Rectangle {
            width: grid.width / grid.columns
            height: grid.height / grid.rows
            border.color: Qt.lighter(color)
            border.width: 1
            color: "#eeeeee"

            property var neighbors

            function born() {
                // Get the colors of the 3 living neighbors.
                var colors = [];
                for (var i = 0; i < 8; i++) {
                    if (living.indexOf(neighbors[i]) !== -1) {
                        colors.push(cells[neighbors[i]].color);
                    }
                }
                color = Qt.rgba(colors[0].r, colors[1].g, colors[2].b, 1.0);
            }

            function died() {
                color = "White";
            }

            function init() {
                color = randomColor();
            }

            function reset() {
                color = "#eeeeee";
            }
        }
    }

    Component.onCompleted: {
        cells.forEach(function(cell, index) {
            cell.neighbors = slide.neighbors(index); })
    }

    Keys.onDeletePressed: { reset(); populate(); }
}
