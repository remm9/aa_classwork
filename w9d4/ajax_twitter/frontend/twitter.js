const FollowToggle = require("./follow_toggle.js")

$( () => {
    // const twit = new FollowToggle();
    $('button.follow-toggle').each(function (i, el) {
        return new FollowToggle(el);
    })
})

// const View = require('./ttt-view');
// const Game = require('../../../ttt_node/solution/game');

// $( () => {
//   const rootEl = $('.ttt');
//   const game = new Game();
//   new View(game, rootEl);
// });