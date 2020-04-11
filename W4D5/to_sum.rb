require "byebug"

def bad_two_sum?(arr, target_sum)   #O(n^2)
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

def okay_two_sum?(arr, target_sum) #O(nlog(n))
    sorted = arr.sort
    sorted.any? { |el| bsearch(sorted, target - el) }
end

def bsearch(arr, target)
    mid = arr.length/2
    #debugger
    return nil if arr.length < 2 && mid != target
    return mid if arr[mid] == target 
    if arr[mid] > target
        bsearch(arr[0...mid], target)
    else
        rest = bsearch(arr[mid..-1], target)
        mid + rest if !rest.nil?
    end
end

def two_sum?(arr, target_sum)
    result = []
    hash = {}
    arr.each_with_index do |el, i|
        j = arr.index(target_sum-el)
        result << [i , j] if hash[target_sum-el]
        # return true if hash[target_sum-el]
        hash[el] = [el, i]
    end
    false
    result 
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
