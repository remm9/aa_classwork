let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  // let arr = new Array(8)
  // for(let i=0; i < 8; i++) {
  //   arr[i] = new Array(8)
  // }
  let array = Array.from( {length: 8}, () => { return Array.from({length: 8})});

  array[3][3] = new Piece("white");
  array[4][4] = new Piece("white");
  array[3][4] = new Piece("black");
  array[4][3] = new Piece("black");
  // return arr
  return array;
  // let arr = Array.from({ length: this[0].length }, () => { return Array.from({ length: this.length }) });
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  // debugger;
  if (pos[0] < 0 || pos[1] < 0 )  {
    return false; 
  } else if (pos[0] > 7 || pos[1] > 7) {
    return false;
  } else {
    return true;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  // debugger;
  // let startingPos = [[3, 3], [4, 4], [4, 3], [3, 4]];
  if ( !this.isValidPos(pos) ) { 
    throw new Error("Not valid pos!");
  }
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let myPiece = this.grid[pos[0]][pos[1]];
  if (myPiece) {
    return myPiece.color === color;
  } else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
if (this.grid[pos[0]][pos[1]]) {
  return true;
} else {
  return false;
}
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  if (!piecesToFlip) {
    piecesToFlip = [];
  }
  const newPos = [pos[0]+dir[0], pos[1]+dir[1]]
  if (!this.isValidPos(newPos)) {
    return []
  } else if (!this.isOccupied(newPos)) {
    return []
  } else if (this.isMine(newPos, color)) {
    return piecesToFlip
  } 

  piecesToFlip.push(newPos);
  return this._positionsToFlip(newPos, color, dir, piecesToFlip);


  // let positionsArr = [];
  // let possibleMovesFromStart= [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], [0, -1], [1, -1]]

  // if (!this.isValidPos(pos)) {
  //   return positionsArr
  // } 
  
  // // possibleMovesFromStart.for((move) => 
  // for (let i = 0; i < possibleMovesFromStart.length; i++) {
  //   debugger;
    
  //   let posibleMove = [pos[0] + possibleMovesFromStart[i][0], pos[1] + possibleMovesFromStart[i][1]];
  //   if (!this.isOccupied(posibleMove)) {
  //     return []
  //   } else if (!this.isMine(posibleMove, color)) {
  //     return []
  //   } else if (!this.isValidPos(dir)) {
  //     return []
  //   } else if (!piecesToFlip.includes(possibleMove)) {
  //     positionsArr.push(posibleMove)
  //     this._positionsToFlip(posibleMove, color, dir, piecesToFlip)
  //   }
  //   return positionsArr
  // }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false
  } 

  for ( let i = 0; i < Board.DIRS.length; i++) {
    let dir = Board.DIRS[i];
    let flips = this._positionsToFlip(pos, color, dir);
    if (flips.length) {
      return true
    }
  }
  return false
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error("Invalid Move")
  }

  this.grid[pos[0]][pos[1]] = new Piece(color);

  let flippable = []; 
  for (let i = 0; i < Board.DIRS.length; i++) { 
    let dir = Board.DIRS[i]
    flippable = flippable.concat(this._positionsToFlip(pos, color, dir))
  }
  for (let i = 0; i < flippable.length; i++) {
    this.getPiece(flippable[i]).flip();
  }
  
  // this.grid[pos[0]][pos[1]].color = color;
  // // this.grid[pos[0]][pos[1]] = new Piece(color);
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {

  let validMoves = [];
  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      debugger;
      let avalPos = [i, j];
      if (this.validMove(avalPos, color)) {
        validMoves.push(avalPos);
      }
    }
  }
  return validMoves;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length) {
    return true;
  } else {
    return false;
  }
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (!this.hasMove("white") && (!this.hasMove("black"))) {
    return true
  } else {
    return false
  }

};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  console.log(this.grid)
};



module.exports = Board;
