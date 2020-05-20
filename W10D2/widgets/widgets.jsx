import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './frontend/clock'
import Tabs from './frontend/tabs'
import Root from './frontend/root';

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root")
    // const Hello = <h1>Hello from React.</h1>;
    ReactDOM.render(<Root />, root);
    console.log(root)

})

