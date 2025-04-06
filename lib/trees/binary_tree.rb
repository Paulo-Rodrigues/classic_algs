class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    return insert_root(value) if root.nil?

    queue = [root]

    until queue.empty?
      current = queue.shift

      if current.left.nil?
        current.left = TreeNode.new(value)
        break
      end

      if current.right.nil?
        current.right = TreeNode.new(value)
        break
      end

      queue << current.left
      queue << current.right
    end
  end

  def find(value)
    queue = [root]

    until queue.empty?
      current = queue.shift

      return true if current.value == value

      queue << current.left if current.left
      queue << current.right if current.right
    end

    nil
  end

  def in_order(node = root, values = [])
    return values if node.nil?

    in_order(node.left, values)
    values << node.value
    in_order(node.right, values)

    values
  end

  def pre_order(node = root, values = [])
    return values if node.nil?

    values << node.value
    pre_order(node.left, values)
    pre_order(node.right, values)

    values
  end

  def post_order(node = root, values = [])
    return values if node.nil?

    post_order(node.left, values)
    post_order(node.right, values)
    values << node.value

    values
  end

  def height(node = root)
    return -1 if node.nil?

    1 + [height(node.left), height(node.right)].max
  end

  private

  def insert_root(value)
    @root = TreeNode.new(value)
  end
end
