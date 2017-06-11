require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[hashkey(key)].include?(key)
  end

  def set(key, val)
    if @count == num_buckets
      resize!
    end
    if @store[hashkey(key)].include?(key)
      @store[hashkey(key)].update(key, val)
    else
      @store[hashkey(key)].append(key, val)
      @count += 1
    end
  end

  def get(key)
    @store[hashkey(key)].get(key)
  end

  def delete(key)
    @store[hashkey(key)].remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |links|
      links.each do |ele|
        prc.call(ele.key, ele.val)
      end
    end
  end

  # def count
  #   @count = 0
  #   @store.each { |link| @count += 1 unless link.empty? }
  #   @count
  # end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def hashkey(key)
    key.hash % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = []
    # @store.concat(Array.new(num_buckets) { LinkedList.new })
    @store.each do |links|
      links.each do |ele|
        arr << [ele.key, ele.val]
      end
    end
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    arr.each do |kv|
      self.set(kv.first, kv.last)
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
