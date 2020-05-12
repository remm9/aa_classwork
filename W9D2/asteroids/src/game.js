const Asteroid = require("./asteroid.js");

// const asteroids = [];

function Game () {
    this.DIM_X = 500;
    this.DIM_Y = 500;
    this.asteroids =[];
    this.addAsteroids();
    // for (let i = 0; i < Game.NUM_ASTEROIDS; i++ ) {
    //     asteroids.push(
    //         Game.addAsteroids(DIM_X, DIM_Y, Game.NUM_ASTEROIDS)
    //         )

    // }
}

Game.NUM_ASTEROIDS = 30;


Game.prototype.addAsteroids = function () {
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
        let positionX = Math.floor(Math.random() * 500 + 1)
        let positionY = Math.floor(Math.random() * 500 + 1)
        this.asteroids.push(new Asteroid([positionX, positionY]))
    }
        // Asteroid.color('gray'),
        // Asteroid.radius(15)

};

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y)
    this.asteroids.forEach(function (asteroid) {
        asteroid.draw(ctx);
    });
};


Game.prototype.moveObjects = function() {
    this.asteroids.forEach(asteroid => {
        asteroid.move();
    });
}

module.exports = Game;