require "byebug"

class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumulator = self.shift if accumulator.nil?
    self.each do |el|
      accumulator = prc.call(accumulator, el)
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
    i += 1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1, 1] if num == 2
  result = factorials_rec(num-1)
  result << result.last * (num-1)
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|h, k| h[k] = []}
    self.each.with_index do |el, i|
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
      (i...self.length).each do |idx|
        result << self[i..idx] if self[i..idx].length > 1 && self[i..idx] == self[i..idx].reverse
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
    prc ||= Proc.new {|a, b| a<=>b}
    return self if self.length < 2

    mid = self.length / 2
    left = self[0...mid]
    right = self[mid..-1]

    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)
    Array.merge(left_sorted, right_sorted, &prc)
  end

  private
  def self.merge(left, right, &prc)
    #debugger
    sorted = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) < 0
        sorted << left.shift
      else
        sorted << right.shift
      end
    end
    sorted + left + right
  end
end
