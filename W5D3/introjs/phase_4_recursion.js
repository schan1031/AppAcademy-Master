function range(start, end) {
  if (start === end) {
    return [];
  }
  let out = range(start, end - 1);
  out.push(end - 1);
  return out;
}

console.log(range(2,10));

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  let sum = arr[0] + sumRec(arr.slice(1));
  return sum;
}

console.log(sumRec([2,10,1,3,5,-8]));

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }
  let acc = base * exponent(base, exp - 1);
  return acc;
}

console.log(exponent(5,3));

function fibonacci(n) {
  if (n === 2) {
    return [1,1];
  } else if (n === 1) {
    return [1];
  }
  let temp = fibonacci(n - 1);
  let acc = temp;
  acc.push(temp[temp.length - 1] + temp[temp.length - 2]);
  return acc;
}

console.log(fibonacci(8));

function msort(arr) {
  if (arr.length <= 1) {
    return arr;
  }

  let midpoint = arr.length / 2;
  let left = arr.slice(0, midpoint);
  let right = arr.slice(midpoint);
  let out = merge(msort(left), msort(right));

  return out;
}

function merge(left, right) {
  let out = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] <= right[0]) {
      out.push(left.shift(1));
    } else {
      out.push(right.shift(1));
    }
  }
  return out.concat(left).concat(right);
}

console.log(msort([4,3,6,7,8,5,4,34,2,1]));

function subsets(arr) {
  if (arr.length < 1) {
    return [[]];
  }
  let sub = subsets(arr.slice(0,arr.length-1));
  let out = sub.concat(sub.map(function(x) {
    return x.concat(arr[arr.length-1]);
  }));

  return out;
}

console.log(subsets([1,2,3]));
