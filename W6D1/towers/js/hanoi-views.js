class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  }

  setupTowers() {
    const $grid = $("<ul class='grid'></ul>");
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++){
        let $li = $("<li>").data("pos",[j,i]);
        $grid.append($li);
      }
    }
    this.$el.append($grid);
  }

  render() {
    let towers = this.game.towers;
    
  }

}

module.exports = View;
