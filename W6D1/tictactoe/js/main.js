const View = require('./ttt-view.js'); // require appropriate file
const Game = require('./game.js'); // require appropriate file

$( () => {
  // Your code here
  const game = new Game();
  const $container = $('figure.ttt');
  const $view = new View(game,$container);
  $view.setupBoard();
  $view.bindEvents();
  

});
