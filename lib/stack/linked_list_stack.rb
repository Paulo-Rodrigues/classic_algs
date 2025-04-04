class Node
  attr_reader :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedListStack
  attr_reader :top, :size

  def initialize
    @top = nil
    @size = 0
  end

  def push(item)
    @top = empty? ? Node.new(item) : Node.new(item, @top)
    @size += 1
  end

  def pop
    return nil if empty?

    popped = @top.value
    @top = @top.next_node
    @size -= 1
    popped
  end

  def peek
    return nil if empty?

    top.value
  end

  def empty?
    top.nil?
  end
end
