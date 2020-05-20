import React from "react";
import * as Minesweeper from "../minesweeper.js";

class Tile extends React.Component{

    constructor(props) {
        super(props)
    }

    // handleClick(e) {
    //     const flagged = e.altKey ? true : false;
    //     this.props.updateGame(this.props.tile, flagged);
    // }

    render() {
        const tile = this.props.tile;
        let status;
        
        if (tile.explored) {
            //backend method numberOfBombs()
            status = tile.adjacentBombCount();
            if (tile.bombed) {
                status = `\u2623`;
            }
        }else if (tile.flagged) {
            //what if we want to unflag
            status = tile.toggleFlag();

            if(status){ status =`\u26F3`}
           
        } 

        return (
            <li>{status}</li>
        )
    }
}

export default Tile;