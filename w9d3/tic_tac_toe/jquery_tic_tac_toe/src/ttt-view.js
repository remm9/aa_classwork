class View {
  constructor(game, $el) {
    this.game = game
    this.$el = $el

    this.setupBoard();
}

  bindEvents() {
    // $($newLi).on("click" , event => {

    // })
  }

  // $('#complete-all').on('click', event => {
//     // TODO: change styling by changing the class
//     $("ul li").removeClass("incomplete").addClass("complete");
// });

  makeMove($square) {}

  setupBoard() {

    const $ul = $("<ul>");
    this.$el.append($ul)
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        const $newLi = $("<li>");
        $ul.append($newLi);
      }
    }
    
    
  };
};

    // console.log(this.$el)
    // let $li = $("<li>")
    // $ul.append($li)

  // $ul.append('pls work');
    // console.log($el)
    


module.exports = View;
