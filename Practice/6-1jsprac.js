Function.prototype.myBind = function(context) {
  return () => this.apply(context);
}

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const lamp = new Lamp();

const turnOn = function() {
   console.log("Turning on " + this.name);
};

const myBoundTurnOn = turnOn.myBind(lamp);

myBoundTurnOn();
