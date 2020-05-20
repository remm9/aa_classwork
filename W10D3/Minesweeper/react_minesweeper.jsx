import React from 'react';
import ReactDOM from 'react-dom';
import Game from './Componants/Game'


document.addEventListener("DOMContentLoaded", () => {
    // const Hello = <h1>Hello from React.</h1>;
    const root = document.getElementById("root");
    ReactDOM.render(<Game/>, root);
    // console.log(root);

})
