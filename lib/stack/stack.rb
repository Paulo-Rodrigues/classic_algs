class EmptyStack < StandardError
  def initialize(msg = 'Stack is empty')
    super
    @msg = msg
  end
end

class Stack
  attr_reader :items

  def initialize
    @items = []
  end

  def push(item)
    items << item
  end

  def pop
    raise EmptyStack if items.empty?

    items.pop
  end

  def peek
    raise EmptyStack if items.empty?

    items.last
  end

  def empty?
    items.empty?
  end

  def size
    items.size
  end
end
