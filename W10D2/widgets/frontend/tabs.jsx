import React from "react";

class Tabs extends React.Component {
    constructor (props) {
        super(props)
        this.state = {
            index: 0,
        } 
        this.changeIndex = this.changeIndex.bind(this);
    }

    changeIndex (e) {

    }


    render () {
        // let keys = []
        const title = this.props.tabsArray.map(el => {
            return (
                <h1>
                    {Object.keys(el)}
                    <article>
                        {Object.values(el)}
                    </article>
                </h1>
            )
            // const content = Object.values(el)
        }); 
        
        return (
            <ul onClick={this.changeIndex}>
                {title}
            </ul>
        );
    }
}

export default Tabs;