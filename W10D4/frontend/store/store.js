import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

function configStore() {
  return createStore(rootReducer);

}

// when invoking createStore we need to pass at least one argument, 
// which will be our rootReducer and createStore will invoke that argument
// actions represent what kind of changes we want to make
// need a type, and another key-value pair of the change

export default configStore;