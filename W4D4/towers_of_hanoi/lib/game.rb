class Towers_of_Hanoi 
    attr_reader :arr

    def initialize 
        @arr = Array.new(3) { Array.new {[]} }
        @arr[0] = [3, 2, 1]
    end

    def play 
        puts "Please enter starting and ending stack positions: e.g.'1, 2'"
        input = gets.chomp.split
        positions = input.map(&:to_i)
        start_pos, ending_pos = positions

    end

    def move(start_pos, ending_pos) # representing subarr indices
        raise "Out of bounds" if !ending_pos.between?(0, 2)

        while won?
            moving_piece = arr[start_pos].pop
            arr[ending_pos].unshift(moving_piece)
        end 
    end

    def won?
        return true if arr[2] == arr[2].sort.reverse
        false 
    end
end

g1 = Towers_of_Hanoi.new
p g1.play