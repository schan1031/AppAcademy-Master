class MaxIntSet
  def initialize(max)
    @store = Array.new(max)  {false}
    @max = max
  end

  def insert(val)
    unless val >= @max
      @store[val] = true
    else
      raise 'Value out of bounds'
    end
  end

  def remove(val)
    unless val >= @max
      @store[val] = false
    else
      raise 'Value out of bounds'
    end
  end

  def include?(val)
    unless val >= @max
      @store[val]
    else
      raise 'Value out of bounds'
    end
  end

  def show
    p @store
  end
end
