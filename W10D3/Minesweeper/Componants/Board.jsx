import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Tile from "./Tile.jsx"



//what functionality does explicitly calling this a class give us?
//could you "extend" with the function keyword?
class Board extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            grid: Minesweeper.Board.grid,
        }  
    }
    
    render() {
        const currentBoard = this.props.board.grid;
        return (
            <>
                <ul className="grid">
                    { currentBoard.map((row, index) => {
                        //What should we be doing with our indicies??
                        return row.map((tile, index2) => {
                            // console.log(tile)
 
                            return(
                                < Tile key={index + index2} 
                                    tile={tile} 
                                    updateGame={this.props.updateGame}
                                />
                            )
                            })
                        }) 
                    }  
                </ul>
            </>
        )
    }

}

export default Board;