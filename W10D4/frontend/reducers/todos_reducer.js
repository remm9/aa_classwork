import {ADD_TO_DO, ADD_TO_DOS, CLEAR_TO_DOS} from '../actions/add_to_do'

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  
  switch (action.type) {
    case ADD_TO_DO: {

      const {toDo} = action;

      const newAddToDo = {
          [toDo.id]: {
              id: toDo.id,
              title: toDo.title, 
              body: toDo.body,
              done: false,
          }
      }
      return Object.assign({}, state, newAddToDo);
    }
    
    case ADD_TO_DOS: {
      const newState = {};
            
      const { toDos } = action;

      toDos.forEach(toDo => {
        newState[toDo.id] = toDo;
      });

      return newState;
    }

    default:
      return state;
  }
};

export default todosReducer;