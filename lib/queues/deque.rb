class Deque
  attr_reader :items

  def initialize
    @items = []
  end

  def add_front(item)
    items.unshift(item)
  end

  def add_rear(item)
    items << item
  end

  def remove_front
    items.shift
  end

  def remove_rear
    items.pop
  end

  def peek_front
    items.first
  end

  def peek_rear
    items.last
  end

  def clear
    items.clear
  end

  def to_array
    items
  end

  def empty?
    items.empty?
  end

  def size
    items.size
  end
end
