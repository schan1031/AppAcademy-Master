const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, callback) {

  if (numsLeft > 0) {
    reader.question("Enter a number: ", function (num){
      const num1 = parseInt(num);

      sum += num1;
      numsLeft--;
      console.log(sum);
      addNumbers(sum, numsLeft, callback);
    });
  } else {
    callback(sum);
    reader.close();
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
