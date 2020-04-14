class MaxIntSet 
  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > max || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
      #p @store
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true ? true : false
  end

  private

  def is_valid?(num)
    
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    self[num] << num && @count += 1 if !self.include?(num)
    resize! if count > num_buckets
  end

  def remove(num)
    @count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  # def count
  #   @store.count {|sub| !sub.empty?}
  # end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = self.store
    self.store = Array.new(num_buckets * 2) {Array.new}
    @count = 0

    # old_store.each do |sub|
    #   sub.each do |el|
    #     self.insert(el)
    #   end
    # end

    old_store.flatten.each {|el| self.insert(el)}
    
  end
end
