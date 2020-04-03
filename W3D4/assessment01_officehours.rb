require 'byebug'

class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**


  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift
    # if accumulator.nil? 
    #   accumulator = self.shift
    # end 
    self.each do |ele| 
      accumulator = prc.call( accumulator, ele)
    end 
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.


def is_prime?(num)
  return false if num < 2 
  return true if num == 2 
  (2...num).each do |factor| 
    return false if num % factor == 0 
  end 
  true 
end

def primes(num)
  prime_arr = []
  prime_num = 2 
  while prime_arr.length < num 
    prime_arr << prime_num if is_prime?(prime_num)
    prime_num += 1 
  end 
  prime_arr
end



# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

# fact(1) = [1]
# fact(2) = [1, 1]
# fact(3) = [0!, 1!, 2!] = [1, 1, 2] 
# fact(4) = [0!, 1!, 2!, 3!] = [1, 1, 2, 6] 
# 6 = (n-1) *last_fact
# fact(6) = [1, 1, 2, 6, 24, 120]
# return array 

def factorials_rec(num)
  return [1] if num == 1
  return [1, 1] if num == 2  
  prev = factorials_rec(num - 1)
  prev << (prev.last * (num - 1))
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|h,k| h[k] = [] }
    self.each_with_index { |ele, idx| hash[ele] << idx }
    hash.select do |ele,arr| 
      arr.length > 1
    end 
  end 
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1. # "a"

  def symmetric_substrings
    strs = []
    # debugger
    (0...self.length).each do |start_idx| 
      (start_idx + 1 ...self.length).each do |end_idx| 
        str = self[start_idx..end_idx]
        strs << str if str == str.reverse
      end 
    end 
    strs
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc) # block 
    prc ||= Proc.new{|a,b| a<=>b}
    return self if self.length < 2 
    mid = self.length / 2 
    left = self[0...mid]
    right = self[mid..-1]

    left_sorted = left.merge_sort(&prc) # blockify the proc 
    right_sorted = right.merge_sort(&prc)
    # prc is a proc 
    Array.merge(left_sorted, right_sorted, &prc) # blockify the proc
  end

  private
    def self.merge(left, right, &prc) #expects a block 
      # debugger
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
end
 
