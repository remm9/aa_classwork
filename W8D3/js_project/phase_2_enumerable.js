
Array.prototype.myEach = function (callback) {
    if (!callback) {
        callback = function (num) {
            return num * 1
        }
    }

    for(let i = 0; i < this.length; i++) {
        callback(this[i])
    }
}

// function timesTwo(num) {
//     return num * 2
// }

// console.log([3,6,9,12].myEach()) //[2,4,6,8]



Array.prototype.myMap = function(callback) {
    // if (!callback){
    //     callback = function (num){
    //         return num * 1
    //     }
    // }
    
    let arr = []
    // debugger
    // console.log(this.myEach)
    //arr.push(this.myEach(callback))
    this.myEach((el) => { 
        arr.push(callback(el))
    })
    //[0,1,2,3,4,5]
    // 0 1 2 3 4 5 
    return arr
}


function timesTwo (num){
    return num * 3
}

// console.log([1,2,3,4].myMap(timesTwo)) //[2,4,6,8]

Array.prototype.myReduce = function (callback, acc) {

    let returnedValue
    let arr
    if (acc) {
        returnedValue = acc
        arr = this
    } else {
        returnedValue = this[0]
        arr = this.slice(1, this.length)
    }
    
    arr.myEach((el) => {
        returnedValue = callback(el, returnedValue)
    })
    // } else {
    //     // debugger
    //     returnedValue = this[0]
    //     this.slice(1, this.length).myEach((el) => {
    //         returnedValue = callback(el, returnedValue)
    //     })
    // }
    return returnedValue
};

function sumOfNum (num1, num2){
    return num1 + num2
}
// console.log([1,2,3,4].myReduce(sumOfNum))


