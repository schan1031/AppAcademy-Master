class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    return false if @store[num]
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    return nil unless include?(num)
    @store[num] = false
    num
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length - 1)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
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

  private

  def [](key)
    @store[key % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(val)
    if val < num_buckets
      if self[val].empty?
        self[val] << val
      end
    else
      resize!
      insert(val)
    end
  end

  def remove(val)
    self[val].pop unless self[val].empty?
  end

  def include?(val)
    !self[val].empty?
  end

  def count
    @count = 0
    @store.each { |bucket| @count+=1 unless bucket.empty? }
    @count
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!

    @store.concat(Array.new(num_buckets) { [] })
  end
end
