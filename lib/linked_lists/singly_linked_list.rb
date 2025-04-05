class SinglyLinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def add_first(item)
    @head = @tail = head.nil? ? Node.new(item) : Node.new(item, @tail)
    @size += 1
  end

  def add_last(item)
    new_node = Node.new(item)

    if head.nil?
      @head = @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  def remove(value)
    return if head.nil?

    if head.value == value
      @head = head.next_node
      @tail = head.nil? ? nil : @tail
      @size -= 1
      return
    end

    prev = nil
    current = head
    while current && current.value != value
      prev = current
      current = current.next_node
    end

    return unless current

    prev.next_node = current.next_node
    @tail = prev if current == tail
    @size -= 1
  end

  def find(value)
    current = head
    current = current.next_node until current.nil? || current.value == value
    current unless current.nil?
  end
end
