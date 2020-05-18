// import {htmlGenerator} from "./warmup";
const dogFinder = document.getElementsByClassName('drop-down-dog-list')[0];

export const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogs, htmlElement) {
  // let result = [];
  // debugger
  Object.keys(dogs).forEach(dog => {
    const newLi = document.createElement("li");
    const newA = document.createElement("a");
    newLi.innerHTML = dog;
    newA.href = dogs[dog];
    htmlElement.appendChild(newLi);
    newLi.appendChild(newA);

  })
}

dogLinkCreator(dogs, dogFinder);
// export dogs; 