// const Warmup = require ('./warmup.js'); 

import { htmlGenerator } from "./warmup";
const clockElement = document.getElementById('clock');

class Clock {
    constructor() {
        // debugger
        console.log(this)
        const myTime = new Date();
        this.hours = myTime.getHours();
        this.minutes = myTime.getMinutes();
        this.seconds = myTime.getSeconds();
        
        htmlGenerator(this.printTime(), clockElement);
        setInterval(this._tick.bind(this), 1000);
    }

    
    printTime() {

        if (this.hours < 10 && this.minutes < 10 && this.seconds < 10) {
            return `0${this.hours}:0${this.minutes}:0${this.seconds}`
        } else if (this.minutes < 10 && this.seconds < 10) {
            return `${this.hours}:0${this.minutes}:0${this.seconds}`
        } else if (this.seconds < 10) {
            return `${this.hours}:${this.minutes}:0${this.seconds}`
        } else {
            return `${this.hours}:${this.minutes}:${this.seconds}`
        }
        // Format the time in HH:MM:SS
        // Use console.log to print it.
    }
    _tick() {

        if (this.seconds < 59) {
            this.seconds += 1;
        } else {
            //   this.minutes += 1;
            this.seconds = 0;

            if (this.minutes < 59) {
                this.minutes += 1;
            } else {
                // this.hours += 1;
                this.minutes = 0;

                if (this.hours < 23) {
                    this.hours += 1;
                } else {
                    this.hours = 0;
                }
            }
        }

        htmlGenerator(this.printTime(), clockElement);
    }
}
export default Clock;

const t = new Clock();
// console.log(t)
