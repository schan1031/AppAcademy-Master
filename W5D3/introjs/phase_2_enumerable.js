Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
      callback(this[i]);
    }
};

function plusOne(ele) {
  return ele + 1;
}

// console.log([1,2,3].myEach(plusOne));
// console.log(plusOne(2));

Array.prototype.myMap = function (callback) {
    let output = [];
    this.myEach((element) => output.push(callback(element)) );
    return output;
};

// console.log([1,2,3].myMap(plusOne));
// console.log(plusOne(2));
//
// let output = [];
// const fun = (element) => output.push(plusOne(element));
//
// [1,2,3].myEach(fun);
// console.log(output);

Array.prototype.myReduce = function (callback, initialValue) {
  let arr = this;
  if (!initialValue) {
    arr = arr.slice(1);
    initialValue = this[0];
  }
  let acc = initialValue;

  arr.myEach(element => acc = callback(acc, element));
  return acc;
};

// var flattened = [[0, 1], [2, 3], [4, 5]].myReduce(function(a, b) {
//   return a.concat(b);
// }, []);
//
// console.log(flattened);

// console.log([1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;}, 25 ));
