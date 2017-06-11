require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count == num_buckets
      resize!
    end
    @store[hashkey(key)] << key
  end

  def include?(key)
    @store[hashkey(key)].include?(key)
  end

  def remove(key)
    @store[hashkey(key)].delete(key)
  end

  def count
    @count = 0
    @store.each { |bucket| @count += bucket.length unless bucket.empty? }
    @count
  end

  private

  def hashkey(key)
    key.hash % num_buckets
  end

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
