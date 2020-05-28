import {combineReducers} from 'redux';
import toDosReducer from './todos_reducer';
//this combines all reducers into 1 file.




export default combineReducers({toDos: toDosReducer});

