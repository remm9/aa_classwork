import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER} from '../actions/session_actions';


export default (state = {}, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_ERRORS:
            return Object.assign({}, { errors: action.errors }); // MAYBE THIS INSTEAD [action.user.id]: action.user 
        case RECEIVE_CURRENT_USER:
            return { errors: null };
        default:
            return state;
    }
}