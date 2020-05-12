const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
Util.inherits(Asteroid, MovingObject)


function Asteroid (pos) {
    this.pos = pos;
    this.vel = Util.randomVec(10);
    this.radius = 10; 
    this.color = 'grey';
    this.ctx = ctx;
}

module.exports = Asteroid;