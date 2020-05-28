import React from "react";
import ReactDOM from "react-dom";

import Root from './frontend/components/root';
import {addToDo} from './frontend/actions/add_to_do.js'
import {addToDos} from './frontend/actions/add_to_do.js'
import {clearAllToDos} from './frontend/actions/add_to_do.js'
import configStore from './frontend/store/store'
import {ALLToDos, AllToDos} from './frontend/reducers/selectors'



document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  const store = configStore();

  window.ALLToDos = AllToDos;
  window.store = store;
  window.addToDo = addToDo;
  window.addToDos = addToDos;
  window.clearAllToDos = clearAllToDos;
  ReactDOM.render(<Root store={store}/>, root);
});