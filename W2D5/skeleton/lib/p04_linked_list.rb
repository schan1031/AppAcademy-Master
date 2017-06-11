class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
    return self
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    cur_link = @head
    until cur_link.key == key
      cur_link = cur_link.next
      return nil if cur_link == @tail
    end
    cur_link.val
  end

  def include?(key)
    cur_link = @head
    until cur_link.key == key
      cur_link = cur_link.next
      return false if cur_link == @tail
    end
    true
  end

  def append(key, val)
    l = Link.new(key, val)
    l.prev = @tail.prev
    @tail.prev.next = l
    l.next = @tail
    @tail.prev = l
  end

  def update(key, val)
    cur_link = @head
    until cur_link.key == key
      cur_link = cur_link.next
      return nil if cur_link == @tail
    end
    cur_link.val = val
  end

  def remove(key)
    cur_link = @head.next
    until cur_link.key == key
      cur_link = cur_link.next
      return nil if cur_link == @tail
    end
    cur_link.remove
  end

  def each(&prc)
    cur_link = @head.next
    until cur_link == @tail
      prc.call(cur_link)
      cur_link = cur_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
