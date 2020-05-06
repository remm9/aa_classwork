Array.prototype.uniq = function() {

    let arr = [];

    for(let i = 0; i < this.length; i++) {
        if (!arr.includes(this[i])) {
            arr.push(this[i])
        }

    }
    return arr
} 

//console.log([1, 2, 2, 3, 3, 3].uniq());

Array.prototype.twoSum = function() {
    let arr = [];
    for(let i = 0; i < this.length - 1; i++) {
        for(let j = i+1 ; j < this.length; j++){
            if(this[i] + this[j] === 0 ){
                arr.push([i,j])
            }
        }
    }
    return arr
}

// console.log(JSON.stringify([2,-2,3,-3, 1, 5, 7, -7].twoSum())) 

Array.prototype.transpose = function(){
    let arr = Array.from({length: this[0].length}, () => { return Array.from({length: this.length})});
    // let arr = new Array(this.length).fill(new Array(this.length))
    // let arr = [];

    for(let i = 0; i < this.length; i++){
        // let subArr = [];
        // debugger;
        for(let j = 0; j < this.length; j++){
            arr[i][j] = this[j][i]
        }
        // arr.push(subArr)
    };
    return arr;
};

// console.log([[1,2,3],
            // [4,5,6],
            // [7,8,9]].transpose())          


