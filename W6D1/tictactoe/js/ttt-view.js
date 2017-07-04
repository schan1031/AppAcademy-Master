class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  }

  bindEvents() {
    let that = this;
    $(".grid").on("click","li",function(event){
      let $square = $(event.currentTarget);
      that.makeMove($square);
    });
  }

  makeMove($square) {
    let pos = $square.data("pos");
    this.game.playMove(pos);
    let mark = this.game.currentPlayer;
    $square.toggleClass("clicked" + mark);
    $square.text(mark);
    if (this.game.board.isOver()){
      $(".clicked" + mark).toggleClass("win");
      $(".grid").off();
      let winner = this.game.board.winner();
      $(".clicked" + winner).toggleClass("loser");
    }
  }

  setupBoard() {
    const $grid = $("<ul class='grid'></ul>");
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++){
        let $li = $("<li>").data("pos",[i,j]);
        $grid.append($li);
      }
    }
    this.$el.append($grid);
  }
}

module.exports = View;
