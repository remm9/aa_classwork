export const ADD_TO_DO = "ADD_TO_DO";
export const ADD_TO_DOS = "ADD_TO_DOS";

export const CLEAR_TO_DOS = "CLEAR_TO_DOS"

export const addToDo = (toDoObj) => {
  return {
    type: ADD_TO_DO,
    toDo: toDoObj, //action
  };
};

export const addToDos = (toDosArr) => {
  return {
    type: ADD_TO_DOS,
    toDos: toDosArr
  }
};

export const clearAllToDos = () => {
  return {
    type: CLEAR_TO_DOS,
  };
};

//to get any of these to reducer, we call store.dispatch()

// export default AddToDo;
