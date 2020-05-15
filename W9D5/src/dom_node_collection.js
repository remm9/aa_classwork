class DOMNodeCollection {
  constructor(nodes) {
    this.nodes = nodes; 
    
  }

  html(str){
    if (!str) {
      return this.nodes[0].innerHTML;
    }

    for (let i=0; i<this.nodes.length; i++){
      this.nodes[i].innerHTML = str; 
    }
  }

  empty(){
    this.html('');
  }

  append(children){
    if (typeof children === "string") {
      this.nodes.forEach((child) => {
        child.innerHTML += children;
      });

    } else if (children instanceof DOMNodeCollection) {
      this.nodes.forEach((child) => {
        this.nodes.forEach((childNode) => {
          child.appendChild(childNode.cloneNode(true));
        });
      });
    }
  }

  attr(k, v) {
    debugger
    if (typeof v === 'string') {
      this.nodes.forEach(node => {
        node.setAttribute(k, v);
      });
    } else {
      return this.nodes[0].getAttribute(k);
    }
  }

  addClass(string) {
    this.nodes.forEach(node => {
      node.classList.add(string);
    })
  }

  removeClass(string) {
    // debugger
    this.nodes.forEach(node => {
      node.classList.remove(string);
    })
  }

}

module.exports = DOMNodeCollection; 

