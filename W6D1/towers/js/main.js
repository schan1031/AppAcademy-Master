let HanoiGame = require('./game.js');
let HanoiView = require('./hanoi-views.js');

$( () => {
  const $rootEl = $('figure.towers');
  const game = new HanoiGame();
  const $view = new HanoiView(game, $rootEl);
  $view.setupTowers();

});

console.log('test');
