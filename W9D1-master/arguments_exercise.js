function Sum(){
    let sum = 0;  
    
    for(let i = 0; i < arguments.length; i ++){
        sum += arguments[i];
    }

    return sum;
}

function Sum2(...nums){
    let sum = 0;

    for(let i = 0; i < nums.length; i ++){
        sum += nums[i];
    }
    return sum;
}

Function.prototype.myBind = function(ctx) {
    const that = this;
    const args = Array.from(arguments);
    console.log(args);
    // debugger
    return function(){ 
        // debugger
        const innerArgs = Array.from(arguments)
        // debugger
        return that.apply(ctx, args.slice(1).concat(innerArgs));
    }
}

// Function.prototype.myBind = function (context, ...bindArgs) {
//     const that = this;
//     return function (...callArgs) {
//         return that.apply(context, bindArgs.concat(callArgs));
//     };
// };



class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
        // debugger
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }
  
  const markov = new Cat("Markov");
  const pavlov = new Dog("Pavlov");

//   console.log(markov.says.myBind(pavlov, "meow", "Kush")());
// console.log(markov.says.myBind(pavlov, "meow")("Markov"));

Function.prototype.curry = function(numArgs){
    let arr = [];
    const that = this;

    return function _curry(arg){
        debugger
        arr.push(arg);
        if(arr.length !== numArgs){
            return _curry;
        } 
        return that(...arr);
    }
}


function curriedSum(numArgs){
    let arr = []

    return function _curriedSum(arg){
        arr.push(arg);
        if(numArgs === arr.length){
            console.log(arr.reduce((acc, el) => {return acc + el}));
        }
        return _curriedSum;
    }
}



function sumThree(num1){
    return function(num2){
        return function(num3){
            return num1 + num2 + num3;
        }
    }
}
// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

// let f1 = sumThree.curry(1); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6);

// console.log(f1);

function otherSumThree(a, b, c){
    return a + b + c
}

console.log(otherSumThree.curry(4)(4)(20)(6));