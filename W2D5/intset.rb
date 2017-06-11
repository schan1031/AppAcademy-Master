class IntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) { [] }
  end

  def [](key)
    @store[key % @max]
  end

  def insert(val)
    self[val] << val
  end

  def remove(val)
    if self[val].include?(val)
      self[val].delete(val)
    end
  end

  def include?(val)
    self[val].include?(val)
  end

  def show
    p @store
  end
end

# x = IntSet.new(5)
# x.insert(17)
# x.insert(2)
# x.show
