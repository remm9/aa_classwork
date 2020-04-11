require "byebug"

def first_anagrams?(str_1, str_2)
    str_1.chars.all? {|ch| str_2.include?(ch)}
end

def second_anagrams?(str_1, str_2)
    str_1.each_char do |el|
        idx = str_2.split("").find_index(el)
        str_2 = str_2[0...idx] + str_2[idx+1..-1] if !idx.nil?
    end
    str_2.empty?
end

def forth_anagrams?(str_1, str_2)
    ana_hash = Hash.new(0)
    str_1.each_char { |char| ana_hash[char] += 1 }
    str_2.each_char {|char| ana_hash[char] -= 1}
    ana_hash.all? { |k, v| v == 0 }
end

def third_anagrams?(str_1, str_2)
    sorted_1 = str_1.split("").sort
    sorted_2 = str_2.split("").sort
    sorted_1 == sorted_2
end
# 
# p first_anagrams?("gizmo", "sally")
# p first_anagrams?("elvis", "lives")
# 
# p third_anagrams?("gizmo", "sally")    
# p third_anagrams?("elvis", "lives")   

 p second_anagrams?("gizmo", "sally") 
p second_anagrams?("elvis", "lives") 