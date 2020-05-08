function bubbleSort(array) {
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for (let i = 0; i < array.length-1; i++) {
            if (array[i] > array[i+1]) {
                [array[i], array[i + 1]] = [array[i+1], array[i]];
                sorted = false;
            }
        }
    }
    return array;
}

console.log(bubbleSort([1, 6, 17, 24, 1, 3, 7]))


function absurdBubbleSort(arr, sortCompletionCallback) {

}