// class Towers {
//   run() {
//     // until game is over
//     // get move from player
//     // update towers
//   }
// }
const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.stacks = [[3, 2, 1],[],[]];
  }

  run (gameCompletionCallback) {
    this.promptMove((startTowerIdx, endTowerIdx) => {
      if (!this.move(startTowerIdx, endTowerIdx)) {
        console.log("Invalid move!");
      }
    });

    if (!this.gameOver()) {
          // Continue to play!
          this.run(gameCompletionCallback);
        } else {
          this.print();
          console.log("You win!");
          gameCompletionCallback();
        }
  }

  gameOver () {
    if (this.stacks[1].length === 3 || this.stacks[2].length === 3) {
      return true;
    }
    return false;
  }

  promptMove (callback) {
    if (!this.gameOver()) {
      reader.question('Enter from tower', function (ans){
        const start = parseInt(ans);
        reader.question('Enter to tower', function (ans2){
          const end = parseInt(ans2);
          callback(start, end);
        });
      });
    }
  }

  ValidMove (start, end){
    // console.log(this.stacks[end]);
    if (this.stacks[end].length === 0) {
      // console.log(true);
      return true;
    } else if(this.stacks[start][this.stacks[start].length - 1 ] > (this.stacks[end][this.stacks[end].length - 1])){
      return true;
    }
    return false;
  }


  move (start, end) {
    if(this.ValidMove(start, end)){
      this.stacks[end].push(this.stacks[start].pop());
    } else {
      this.promptMove();
    }
  }
}


let game = new Game;
game.run();
reader.close();
// game.move(0, 1);
