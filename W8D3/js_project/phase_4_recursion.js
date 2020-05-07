const range = function(start, end) {

    if (start === end) { return [] };
    let r = range(start, end-1)
    r.push(end-1)
    return r

}

// console.log(range(1, 5))

const sumRec = (array) => {
    if (array.length <= 1) { return array[0]};

    let result = sumRec(array.slice(1, array.length));
    return array[0] += result;
}

// console.log(sumRec([1,2,3,4,5]))


// function range(start, end){

// }

// const range = (start, end) => {

// }

const exponent = (base, exp) => {
    if (exp === 0) { 
        return 1
    } else if (exp === 1) { 
        return base
    }

    if (exp % 2 === 0) { 
        let result = exponent(base, exp/2) ** 2
        return result
    } else if (exp % 2 === 1) {
        let result = base * (exponent(base, (exp-1) / 2 ) ** 2)
        return  result
    }

}

// const exponent = (base, exp) => {
//     if (exp === 0) {
//         return 1
//     } else if (exp === 1) {
//         return base
//     }

//     let result = exponent(base, exp - 1)
//     return base * result

// }

// console.log(exponent(3, 2))
// console.log(exponent(3, 3))

const fibonacci = (n) => {
    let fibs = [1, 1]

    if (n === 1) {
        return [1]
    } else if (n === 2) {
        return fibs
    }

    let result = fibonacci(n-1)
    result.push(result[result.length-1] + result[result.length-2])


    return result
}

// console.log(fibonacci(5))

const deepDup = (array) => {
    if (array.length <= 1) {
        return array 
    }

    let result = []
    array.map((el) => {
        if (el instanceof Array) {
            result.push(deepDup(el))
        } else {
            result.push(el)
        }
    })
    // console.log(result)
    return result

}

console.log(JSON.stringify(deepDup([2, 4, [3, [7, 9, [3]], 3]])))