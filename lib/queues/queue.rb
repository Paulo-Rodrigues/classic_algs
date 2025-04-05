class EmptyQueue < StandardError
  def initialize(msg = 'Queue is empty')
    super
    @msg = msg
  end
end

class MyQueue
  attr_reader :items

  def initialize
    @items = []
  end

  def enqueue(item)
    items << item
  end

  def dequeue
    raise EmptyQueue if items.empty?

    items.shift
  end

  def peek
    raise EmptyQueue if items.empty?

    items.first
  end

  def empty?
    items.empty?
  end

  def size
    items.size
  end
end
