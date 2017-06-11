require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)

    if @map.include?(key)
      temp = @map[key].remove
      @store.append(temp.key, temp.val)
      @map[key].val
    elsif count < @max
      val = @prc.call(key)
      @store.append(key, val)
      @map[key] = @store.last
      p 'hit'
    else
      # @store.first.prev.next = @store.first.next
      # @store.first.next.prev = @store.first.prev
      eject!
      val = @prc.call(key)
      @store.append(key, val)
      @map[key] = @store.last
    end
    p @store.map { |l| l.key}
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end
