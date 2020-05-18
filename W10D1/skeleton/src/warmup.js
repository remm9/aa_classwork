
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if (htmlElement.children) {
        Array.from(htmlElement.children).forEach((child) => htmlElement.removeChild(child));
    }
    const newP = document.createElement("p");
    newP.innerHTML = string;
    htmlElement.appendChild(newP);
};

htmlGenerator('New Party Time.', partyHeader);
