const bubleSort = (array) => {
    let sorted = false 

    while(!sorted) {
        sorted = true
        for(let i = 0; i < array.length - 2; i++) {
            if (array[i] > array[i + 1]) {
                [array[i], array[i + 1]] = [array[i + 1], array[i]]
                sorted = false
            }
        }
    }
    return array
}

// console.log(bubleSort([2,8,3,9,4,12]))

const subStrings = (string) => {
    let newArray = []
    // debugger
    for(let i=0; i<string.length ; i++){
        for(let j= i+1; j<=string.length; j++){
            newArray.push(string.slice(i, j))
        }
    }
    return newArray
}
//cat [c, ca, cat, at, t]

// console.log(subStrings("cat"))