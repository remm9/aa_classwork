const Util = {
    
    inherits(childClass, parentClass) {
        function Surogate() {};
        Surogate.prototype = parentClass.prototype;
        childClass.prototype = new Surogate;
        childClass.prototype.constructor = childClass;
    }, 
    randomVec(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },
    scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    }
    
};

// Util.prototype.randomVec = function(length) {
//     const deg = 2 * Math.PI * Math.random();
//     return Util.scale([Math.sin(deg), Math.cos(deg)], length);
// }
// // Scale the length of a vector by the given amount.
// Util.prototype.scale = function(vec, m) {
//     return [vec[0] * m, vec[1] * m];
// }

module.exports = Util;