import React from 'react';

class Clock extends React.Component {

    constructor() {
        super();
        this.state = {
            myTime: new Date()
        };
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({myTime: new Date()}); 
    }

    componentDidMount() {
        this.interval = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.interval);
    }


    render() {
        return (
            <>
            
            <h1 class="h1">Clock</h1>
            <div class="clock">
                    <div class="time">Time: <span>{this.state.myTime.toLocaleTimeString()}</span></div>
                <div class="date">Date: <span>{this.state.myTime.toDateString()}</span></div>
            </div>

            </>
        );
    }
};

export default Clock;
