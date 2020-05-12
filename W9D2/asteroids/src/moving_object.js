function MovingObject (object) {
    this.pos = object['pos'];
    this.vel = object['vel'];
    this.radius = object['radius'];
    this.color = object['color'];
    this.ctx = object['ctx'];
} 

MovingObject.prototype.draw = function() {
 // arc(x, y, radius, startAngle, endAngle, anticlockwise)

    // this.ctx.arc(this.pos[0], this.pos[1], 5, 0, 2 * Math.PI);

    this.ctx.fillStyle = this.color;
    this.ctx.beginPath(); 
    this.ctx.arc(this.pos[0],this.pos[1], 15, 0, 2*Math.PI);
    this.ctx.strokeStyle = 'black';
    this.ctx.lineWidth = 3;
    // // this.ctx.moveTo(200, 20);
    this.ctx.stroke(); 
    this.ctx.closePath();  
    this.ctx.fill()  
    
};

MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
};

module.exports = MovingObject;