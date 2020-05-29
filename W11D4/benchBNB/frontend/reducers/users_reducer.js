import { RECEIVE_CURRENT_USER } from '../actions/session_actions';

export default (oldState = {}, action) => {
    // console.log(action)
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState)
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            newState[action.user.id] = action.user;
            return newState;
        default:
            return oldState;
    }
    // switch (action.type) {
    //     case RECEIVE_CURRENT_USER:
    //         return Object.assign({}, state, { [action.user.id]: action.user });
    //     default:
    //         return state;
    // }
}