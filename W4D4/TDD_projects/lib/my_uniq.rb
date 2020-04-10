class Array

    def my_uniq
        # self.uniq
        count = Hash.new(0)
        self.each do |el|
            count[el] += 1 
        end 
        count.keys
    end 

    def two_sum
        result = []

        (0...self.length).each do |i|
            ((i + 1)...self.length).each do |j|
                result << [i, j] if self[i] + self[j] == 0
            end 
        end 

        result
    end 

end

def my_transpose(arr)
    (0...arr.length).map do |i|
        (0...arr.length).map do |j|
            arr[j][i]
        end
    end
end 

def stock_picker(arr)
    deltas = {}  

    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            #p [i, j]
            deltas[[arr[i], arr[j]]] = arr[j] - arr[i]
        end 
    end 

    deltas.sort_by { |k,v| v }.last.first
end 

def towers_hanoi

end

