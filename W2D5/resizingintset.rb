class ResizingIntSet
  def initialize(max)
    @store = Array.new(max)  { [] }
    @max = max
  end

  def [](key)
    @store[key]
  end

  def insert(val)
    if val < @max
      self[val] << val
    else
      # diff = val - (@max - 1)
      # @store.concat(Array.new(diff) { [] })
      # self[val] << val
      # @max += diff
      resize

    end
  end

  def remove(val)
    self[val].pop
    nil
  end

  def include?(val)
    !self[val].empty?
  end

  def show
    p @store
  end

  def resize
    @store.concat(Array.new(@max) { [] })
    @max *= 2
  end

end

x = ResizingIntSet.new(5)
x.insert(3)
x.show
x.insert(5)
x.insert(15)
x.show
