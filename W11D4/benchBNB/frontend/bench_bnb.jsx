import React from "react";
import ReactDOM from "react-dom";
// import { siggnup, loggin, loggout } from './util/session_api_util';
import Root from './components/root';
import configureStore from './store/store'

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const store = configureStore();
    //testing
    // window.siggnup = siggnup;
    // window.loggin = loggin;
    // window.loggout = loggout;
    // window.getState = store.getState;
    // window.dispatch = store.dispatch;
    //testing
    // ReactDOM.render(<h1>Hello benchbnb</h1>, root);
    ReactDOM.render(<Root store={store} />, root);
});
