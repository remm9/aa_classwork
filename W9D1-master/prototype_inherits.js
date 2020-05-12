// Function.prototype.inherits = function(){
//     function Surrogate() {}

//     Surrogate.prototype = MovingObject.prototype;
//     Ship.prototype = new Surrogate();
//     Asteroid.prototype = new Surrogate();
//     Ship.prototype.constructor = Ship;
//     Ship.prototype.constructor = Asteroid;
// }

Function.prototype.inherits = function() {
    Ship.prototype = Object.create(MovingObject.prototype);
    Asteroid.prototype = Object.create(MovingObject.prototype);
}







function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);


//   function Surrogate() { }
//   Surrogate.prototype = Animal.prototype; //merged together
//   Cat.prototype = new Surrogate(); //similar to line 15 but with emppty class
//   Cat.prototype.constructor = Cat; //making sure Cat's constructor is Cat class not Animal


//   // Cat.prototype = Object.create(Animal.prototype)
