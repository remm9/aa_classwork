require "byebug"

class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumulator = accumulator || accumulator = self.first
      self.each do |el|
        accumulator += prc.call(el)
      end
      accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).none? {|el| num % el == 0}
end

def primes(num)
  result = []
  i = 1
  while result.length < num
    result << i if is_prime?(i) 
    i+=1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(numbers)
  return [1] if numbers == 0 
  num * factorial(num-1)
  # result = []
  # (numbers..0).each { |n| result << n * factorials_rec(-1) }
  result
end

# def factorial(num)
  # num * factorial(num-1)
# end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|h,k| h[k] = []}
    self.each_with_index do |el, i|
       hash[el] << i if self.count(el) > 1
    end
    hash
  end
  
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    (0...self.length).each do |i|
      (0...self.length).each do |idx|
        result << self[i..idx] if (self[i..idx] == self[i..idx].reverse && self[i..idx].length > 1)
      end
    end
    result
  end

end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self if self.count <= 1
    prc ||= Proc.new {|a, b| a <=> b}

    mid = (self.length/2).floor
    left = merge_sort(self[0...mid])
    right = merge_sort(self[mid..-1])

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)
    
    Array.merge(sorted_left, sorted_right, prc)

  end

  private
  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      # prc.call will return -1, 0, or 1 since we are using <=>
      if prc.call(left[0], right[0]) <= 0
        result << left.shift
      else
        result << right.shift
      end
    end

    result + left + right
  end

end