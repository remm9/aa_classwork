def first_anagrams?(str_1, str_2)
    ana_arr = []
    (0...str_1.length).each do |i|
        (i...str_1.length).each do |j|
            ana_arr << str_1[i..j]
        end
    end
    ana_arr
end

def second_anagrams?(str_1, str_2)
  ana_hash = Hash.new(0)

  str_1.each_char do |char|
    ana_hash[char] += 1
  end

  str_2.each_char do |char|
    ana_hash[char] -= 1
  end
  ana_hash.all? { |k, v| v == 0 }
end


p first_anagrams?("gizmo", "sally")    
p first_anagrams?("elvis", "lives")   

# p second_anagrams?("elvis", "lives") 
# p second_anagrams?("elvis", "lives") 