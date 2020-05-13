console.log("Webpack is working!")

const View = require("./ttt-view.js");
const Game = require("./game.js");


// const View = // require appropriate file
// const Game = // require appropriate file

  $(() => {
      const figure = $(".ttt")
      const game = new Game();
      new View(game, figure);
  });

// window.MovingObject = MovingObject;
// window.Asteroid = Asteroid;
// window.Game = Game;
