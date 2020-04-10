# require "byebug"

def my_min(arr)  # O(n^2)
  smallest = arr.first
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
        if arr[j] < smallest
          smallest = arr[j]
        else
          smallest
        end
    end
  end
  smallest    
end



def my_min(arr) # O(n)
    smalest = arr[0]
    arr.each do |ele|
        smalest = ele if ele < smalest
    end
    smalest
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# list = [5, 3, -7]
# 


# 
# def largest_contiguous_subsum(arr) #O(n^3)
#   result = []
#   (0...arr.length).each do |i|
    # (i...arr.length).each do |j|
    #   result << arr[i..j].reduce(:+) #O(n)
    # end
#   end
#   result.max
# end
# 
def largest_contiguous_subsum(arr)
    
    largest_sum = arr.first
    current_sum = arr.first
    largest_el = arr.first
    # debugger
    (1...arr.length).each do |i|
        current_sum += arr[i]
        current_sum = 0 if current_sum < 0
        largest_el = arr[i] if arr[i] > largest_el
        if current_sum > largest_sum
            largest_sum = current_sum
        else
            largest_sum 
        end
    end
    return largest_el if arr.all? {|el| el < 0}
    largest_sum
end

# list = [5, 3, -7]
# list = [-5, -1, -3]
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list)
