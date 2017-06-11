# Finish StackQueue Functionality
# Each hash pushed in contains current max/min and value
# Last element pushed through will be hash containing final min/max

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(val)
    @store << val
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(val)
    @store.push(val)
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(val)
    prev = @stack1.peek
    if prev.nil?
      h = {:value => val, :c_max => val, :c_min => val}
    else
      val > prev[:c_max] ? newmax = val : newmax = prev[:c_max]
      val < prev[:c_min] ? newmin = val : newmin = prev[:c_min]
      h = { value: val, c_max: newmax, c_min: newmin }
    end
    @stack1.push(h)
  end

  def dequeue
    @stack2.push(@stack1.pop)
  end

end
