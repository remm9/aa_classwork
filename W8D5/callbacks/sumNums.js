const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        debugger
        reader.question("Please enter a number?", function (answer) {
            console.log(`${answer}!`);
        
                sum += parseInt(answer);
                numsLeft -= 1;
                console.log(sum);
                
                return addNumbers(sum, numsLeft, completionCallback);
            
        });
    } else {
        reader.close();
        return completionCallback(sum);
    }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

