import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from './Board.jsx'


class Game extends React.Component{

    constructor(props){
        super(props)
        this.state={
            //new minesweeper board
            board: new Minesweeper.Board(5, 10),

        }
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(){

    }

    render() {
        return (
            // class name in </> tag
            <Board
                board = {this.state.board}
                updateGame = {this.state.updateGame}
            />
            // <div>hello</div>
            //      <ClassName
            //          prop1 = {interpilated value} 
            //          prop2 = "other referenced value"
            //      />
        )
    }
}

export default Game;