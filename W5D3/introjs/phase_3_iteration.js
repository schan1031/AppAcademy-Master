Array.prototype.bubbleSort = function () {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let j = 0; j < this.length-1; j++) {
      let i = j + 1;
      if (this[j] > this[i]) {
        this[j] = [this[i], this[i] = this[j]][0];
        sorted = false;
      }
    }
  }
  return this;
};

console.log([3,2,6,1].bubbleSort());

String.prototype.substrings = function () {
  let output = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      output.push(this.slice(i, j + 1));
    }
  }
  return output;
};

String.prototype.substrings2 = function () {
  let output = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length - i; j++) {
      output.push(this.slice(j, j+i+1));
    }
  }
  return output;
};

let str = 'calendar';
console.log(str.substrings2());
