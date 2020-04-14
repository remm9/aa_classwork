class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    result = 0

    self.each_with_index do |el, i|
      result += el.ord.hash * i.hash
    end
    result
  end
end

class String
  def hash
    result = 0
    self.split("").each_with_index do |el, i|
      result += el.ord.hash * i.hash
      # new_el.to_i
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.keys.each {|k| result += k.hash}
    result
  end
end
