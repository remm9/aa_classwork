import { siggnup, loggout, siggnin } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

const receiveErrors = (errors) => ({
    type: RECEIVE_ERRORS,
    errors
})


const receiveCurrentUser = (user) => ({

    type: RECEIVE_CURRENT_USER,
    user

});

const logoutCurrentUser = () => ({

    type: LOGOUT_CURRENT_USER

});

export const signup = formUser => dispatch => siggnup(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));


export const login = formUser => dispatch => loggin(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));


export const logout = () => dispatch => loggout()
    .then(() => dispatch(logoutCurrentUser())); 