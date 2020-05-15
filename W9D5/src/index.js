const DOMNodeCollection = require("./dom_node_collection");

function $l(arg){
  let elements; 
  if (typeof arg === 'string'){
    elements = document.querySelectorAll(arg);
    let arrayElements = Array.from(elements);
    return new DOMNodeCollection(arrayElements); 
  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  }

}

window.$l = $l;