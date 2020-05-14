

class FollowToggle {
    
    constructor(el) {
        this.$el = $(el)
        this.userId = this.$el.data('user-id')
        this.followState = this.$el.data('initial-follow-state')  
        this.render();
        // this.handleClick(); 
        this.$el.on('click', this.handleClick.bind(this))   
    }

    render() {
        if (this.followState === 'followed'){
            this.$el.html('Unfollow!');
        } else {
            this.$el.html('Follow!');
        }
    }

    handleClick(event) {
        event.preventDefault();



    // if (this.followState === 'followed') {
    //     this.followState = 'unfollowing';
    //     this.render();
    //     APIUtil.unfollowUser(this.userId).then(() => {
    //       followToggle.followState = 'unfollowed';
    //       followToggle.render();
    //     });
    //   } else if (this.followState === 'unfollowed') {
    //     this.followState = 'following';
    //     this.render();
    //     APIUtil.followUser(this.userId).then(() => {
    //       followToggle.followState = 'followed';
    //       followToggle.render();
    //     });
        if (this.followState === 'followed') {
            this.followState = 'unfollowed';

        } else {
            this.followState = 'followed';
        }
        this.render();

        // $.ajax ({
        //     method: "POST",
        //     url: `/users/${this.userId}/follow`,
        //     data: "json",
        //     success: function() {
        //         if (this.followState === 'followed') {
        //             this.followState = 'unfollowed';
                    
        //         } else {
        //             this.followState = 'followed';
        //         }
        //         this.render();
        //     }
        // })
    }
          
}
window.FollowToggle = FollowToggle;
// constructor(game, $el) {
//     this.game = game;
//     this.$el = $el;

//     this.setupBoard();
//     this.bindEvents();
//   }

module.exports = FollowToggle;