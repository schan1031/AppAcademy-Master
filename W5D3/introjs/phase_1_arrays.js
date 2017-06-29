Array.prototype.uniq = function () {
  let output = [];
  for (let i = 0; i < this.length; i++) {
    if (!output.includes(this[i])) {
      output.push(this[i]);
    }
  }
  return output;
};

// console.log([1,2,2,3].uniq());

Array.prototype.twoSum = function () {
  let output = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      if (this[i] + this[j] === 0 && i < j) {
        output.push([i, j]);
      }
    }
  }
  return output;
};

// console.log([1,-1,3,4,-3, 1].twoSum());


Array.prototype.myTranspose = function () {
  let output = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      if (i < j) {
        this[j][i] = [this[i][j], this[i][j] = this[j][i]][0];
      }
    }
  }
  return this;
};

console.log([[1,2,3],[4,5,6],[7,8,9]].myTranspose());
