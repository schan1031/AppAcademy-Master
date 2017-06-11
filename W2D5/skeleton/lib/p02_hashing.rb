class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.each(&:hash).reduce(:-).hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
    # arr = []
    # tmp = self.chars
    # tmp.each_index do |i|
    #   arr << tmp[i].ord
    # end
    # arr.reduce(:-).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = self.to_a
    output = []
    array.each do |el|
      output << el.first.hash - el.last.hash
    end
    # p output
    output.sort.reduce(:-).hash
  end

end
