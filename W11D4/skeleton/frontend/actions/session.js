import { postUser, postSession, deleteSession } from '../utils/session'

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGGOUT_CURRENT_USER = "LOGGOUT_CURRENT_USER";

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user,
});

const loggoutCurrentUser = user => ({
    type: LOGGOUT_CURRENT_USER,
});

export const createNewUser = formUser => dispatch => postUser(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const login = formUser => dispatch => postSession(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));
    
export const logout = () => dispatch => deleteSession()    
    .then(() => dispatch(loggoutCurrentUser()));