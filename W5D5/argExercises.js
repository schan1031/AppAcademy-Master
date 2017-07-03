function sum(...args) {
  let acc = 0;
  for (let i = 0; i < args.length; i++) {
    acc += args[i];
  }
  return acc;
}

Function.prototype.myBind = function(context) {
  let bindTimeargs = Array.from(arguments);
  bindTimeargs = bindTimeargs.slice(1);
  let that = this;
  return function () {
    let callTimeArgs = Array.from(arguments);
    let args = bindTimeargs.concat(callTimeArgs);
    that.apply(context, args);
  };
};

Function.prototype.myBind2 = function(context, ...args1) {
  let bindTimeargs = args1;
  return (...args2) => {
    let args = bindTimeargs.concat(args2);
    this.apply(context, args);
  };
};


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast)("meow", "a tree");

function curriedSum(numArgs) {
  let numbers = [];
  let sumnum = 0;
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      for (let i = 0; i < numbers.length; i++) {
        sumnum += numbers[i];
        // console.log(sumnum);
      }
      return sumnum;
    } else {
      return _curriedSum;
    }
  };
}

// const testsum = curriedSum(4);
// console.log(testsum(5)(30)(20)(1));

function sum2(arr) {
  let acc = 0;
  for (let i = 0; i < arr.length; i++) {
    acc += arr[i];
  }
  return acc;
}

Function.prototype.curry = function (numArgs) {
  let args = [];
  let that = this;
  return function _test() {
    let arg = Array.from(arguments);
    args = args.concat.apply(this, arg);
    if (args.length === numArgs) {
      return that(args);
    } else {
      return _test;
    }
  };
};

Function.prototype.curry2 = function (numArgs) {
  let args = [];
  let that = this;
  return function _test(arg) {
    args.push(arg);
    // console.log(args);
    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _test;
    }
  };
};

const test = sum.curry2(3);
console.log(test(1)(2)(2));
