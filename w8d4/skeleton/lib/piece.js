/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
    this.color = color;
    // let darkPiece.color = new Piece("black");
    // let lightPiece.color = new Piece("white");
}


/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
    if (this.color === "black") {
        return "white";
    } else {
        return "black";
    }

};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    if (this.color === "black") {
        this.color = "white";
    } else {
        this.color = "black";
    }
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
    if (this.color === "white") {
        return "W";
    } else {
        return "B";
    }

};

module.exports = Piece;
