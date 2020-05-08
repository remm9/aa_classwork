class Clock {
    constructor(hours, minutes, seconds) {
      const time = new Date();
      this.hours = time.getHours();
      this.minutes = time.getMinutes();
      this.seconds = time.getSeconds();
    //   this.hours = 0
    //   this.minutes = 5
    //   this.seconds = 55
    //   this.printTime();

      const timerId = setInterval(this._tick.bind(this), 1000);
      
      // 1. Create a Date object.
      // 2. Store the hours, minutes, and seconds.
      // 3. Call printTime.
      // 4. Schedule the tick at 1 second intervals.
    }
    
    printTime() {
        
        if (this.hours < 10 && this.minutes < 10 && this.seconds < 10) {
            console.log(`0${this.hours}:0${this.minutes}:0${this.seconds}`)
        } else if (this.minutes < 10 && this.seconds < 10) {
            console.log(`${this.hours}:0${this.minutes}:0${this.seconds}`)
        } else if (this.seconds < 10) {
            console.log(`${this.hours}:${this.minutes}:0${this.seconds}`)
        } else {
            console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
        }
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    //   debugger
    //   if (this.seconds < 59) {
    //       this.seconds += 1;
    //     //   this.seconds = 0
    // } else if (this.minutes < 59) {
    //       this.minutes += 1
    //       this.seconds = 0
    // } else if (this.hours < 23) {
    //       this.hours += 1
    //       this.minutes = 0
    //       this.seconds = 0
    // } else {
    //     this.hours = 0
    // }

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

      this.printTime();
  }
}

const clock = new Clock();