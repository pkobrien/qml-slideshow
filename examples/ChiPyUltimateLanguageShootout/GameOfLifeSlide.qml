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

    function colorize(cells, indices, func) {
        if (indices) {
            indices.forEach(function(index) {
                cells[index].color = func.call(null, index); });
        } else {
            cells.forEach(function(cell) { cell.color = func.call(); });
        }
    }

    function colorNewborn(index) {
        var neigh = neighbors(index);
        var colors = [];
        for (var i = 0; i < 8; i++) {
            if (living.indexOf(neigh[i]) !== -1) {
                colors.push(neigh[i]);
            }
        }
        return Qt.rgba(cells[colors[0]].color.r,
                       cells[colors[1]].color.g,
                       cells[colors[2]].color.b, 1.0);
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
            nearby = [alive].concat(neighbors(alive));
            for (j = 0; j < 9; j++) {
                if (recalc.indexOf(nearby[j]) === -1) {
                    recalc.push(nearby[j]);
                }
            }
        }
        for (i = 0, len = recalc.length; i < len; i++) {
            count = 0;
            index = recalc[i];
            neigh = neighbors(index);
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
        colorize(cells, newBorn, colorNewborn);
        colorize(cells, newDead, function() { return "White"; });
        living = nextgen;
    }

    function neighbors(index) {
        var x = index % grid.columns;
        var y = Math.floor(index / grid.columns);
        var neigh = [];
        neigh.push(cellIndex(x, (y + 1) % grid.rows));
        neigh.push(cellIndex((x + 1) % grid.columns, (y + 1) % grid.rows));
        neigh.push(cellIndex((x + 1) % grid.columns, y));
        neigh.push(cellIndex((x + 1) % grid.columns, (y - 1) % grid.rows));
        neigh.push(cellIndex(x, (y - 1) % grid.rows));
        neigh.push(cellIndex((x - 1) % grid.columns, (y - 1) % grid.rows));
        neigh.push(cellIndex((x - 1) % grid.columns, y));
        neigh.push(cellIndex((x - 1) % grid.columns, (y + 1) % grid.rows));
        return neigh;
    }

    function populate() {
        living = randomPopulation();
        colorize(cells, living, randomColor);
    }

    function randomColor() {
        return Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
    }

    function randomInt(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function randomPopulation() {
        var area = grid.columns * grid.rows;
        var count = randomInt(Math.floor(area / 20), Math.floor(area / 4));
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
        colorize(cells, null, function() { return "#eeeeee"; });
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
        id: repeater

        model: grid.columns * grid.rows

        onItemAdded: cells.push(item);

        Rectangle {
            width: grid.width / grid.columns
            height: grid.height / grid.rows
            border.color: Qt.lighter(color)
            border.width: 1
            color: "#eeeeee"
        }
    }
}
