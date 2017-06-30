class Clock {
  constructor() {
    const date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    setInterval(this._tick.bind(this), 100);
  }

  printTime() {
    console.log(`Current time is: ${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    this.seconds++;
    if (this.seconds === 60) {
      this.seconds = 0;
      this.minutes++;
    } else if (this.minutes === 60) {
      this.minutes = 0;
      this.hours++;
    }
      this.printTime();
  }
}

const clock = new Clock ();
// clock.printTime();
// clock._tick();
