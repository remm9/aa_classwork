/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nUtil.inherits(Asteroid, MovingObject)\n\n\nfunction Asteroid (pos) {\n    this.pos = pos;\n    this.vel = Util.randomVec(10);\n    this.radius = 10; \n    this.color = 'grey';\n    this.ctx = ctx;\n}\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n\n// const asteroids = [];\n\nfunction Game () {\n    this.DIM_X = 500;\n    this.DIM_Y = 500;\n    this.asteroids =[];\n    this.addAsteroids();\n    // for (let i = 0; i < Game.NUM_ASTEROIDS; i++ ) {\n    //     asteroids.push(\n    //         Game.addAsteroids(DIM_X, DIM_Y, Game.NUM_ASTEROIDS)\n    //         )\n\n    // }\n}\n\nGame.NUM_ASTEROIDS = 30;\n\n\nGame.prototype.addAsteroids = function () {\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n        let positionX = Math.floor(Math.random() * 500 + 1)\n        let positionY = Math.floor(Math.random() * 500 + 1)\n        this.asteroids.push(new Asteroid([positionX, positionY]))\n    }\n        // Asteroid.color('gray'),\n        // Asteroid.radius(15)\n\n};\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y)\n    this.asteroids.forEach(function (asteroid) {\n        asteroid.draw(ctx);\n    });\n};\n\n\nGame.prototype.moveObjects = function() {\n    this.asteroids.forEach(asteroid => {\n        asteroid.move();\n    });\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log(\"Webpack is working!\")\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\n\ndocument.addEventListener('DOMContentLoaded', function() {\n    const canvas = document.getElementById('game-canvas');\n    const ctx = canvas.getContext('2d');\n    window.ctx = ctx\n})\n//require files here\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject (object) {\n    this.pos = object['pos'];\n    this.vel = object['vel'];\n    this.radius = object['radius'];\n    this.color = object['color'];\n    this.ctx = object['ctx'];\n} \n\nMovingObject.prototype.draw = function() {\n // arc(x, y, radius, startAngle, endAngle, anticlockwise)\n\n    // this.ctx.arc(this.pos[0], this.pos[1], 5, 0, 2 * Math.PI);\n\n    this.ctx.fillStyle = this.color;\n    this.ctx.beginPath(); \n    this.ctx.arc(this.pos[0],this.pos[1], 15, 0, 2*Math.PI);\n    this.ctx.strokeStyle = 'black';\n    this.ctx.lineWidth = 3;\n    // // this.ctx.moveTo(200, 20);\n    this.ctx.stroke(); \n    this.ctx.closePath();  \n    this.ctx.fill()  \n    \n};\n\nMovingObject.prototype.move = function() {\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n};\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    \n    inherits(childClass, parentClass) {\n        function Surogate() {};\n        Surogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surogate;\n        childClass.prototype.constructor = childClass;\n    }, \n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n    \n};\n\n// Util.prototype.randomVec = function(length) {\n//     const deg = 2 * Math.PI * Math.random();\n//     return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n// }\n// // Scale the length of a vector by the given amount.\n// Util.prototype.scale = function(vec, m) {\n//     return [vec[0] * m, vec[1] * m];\n// }\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });