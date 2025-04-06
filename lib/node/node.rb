class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end
