describe BinarySearchTree do
  let(:bst) { BinarySearchTree.new }

  context '#insert' do
    it 'inserts a value into an empty tree' do
      bst.insert(10)
      expect(bst.in_order_traversal).to eq([10])
    end

    it 'inserts values in the correct position' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.in_order_traversal).to eq([5, 10, 15])
    end
  end

  context '#delete' do
    it 'deletes a leaf node' do
      bst.insert(10)
      bst.delete(10)
      expect(bst.in_order_traversal).to eq([])
    end

    it 'deletes a node with one child' do
      bst.insert(10)
      bst.insert(5)
      bst.delete(10)
      expect(bst.in_order_traversal).to eq([5])
    end

    it 'deletes a node with two children' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      bst.delete(10)
      expect(bst.in_order_traversal).to eq([5, 15])
    end
  end

  context '#find' do
    it 'finds a value in the tree' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.find(10)).to eq(10)
      expect(bst.find(5)).to eq(5)
      expect(bst.find(15)).to eq(15)
    end

    it 'returns nil if the value is not found' do
      expect(bst.find(100)).to be_nil
    end
  end

  context '#min' do
    it 'returns the minimum value in the tree' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.min).to eq(5)
    end

    it 'returns nil if the tree is empty' do
      expect(bst.min).to be_nil
    end
  end

  context '#max' do
    it 'returns the maximum value in the tree' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.max).to eq(15)
    end

    it 'returns nil if the tree is empty' do
      expect(bst.max).to be_nil
    end
  end

  context '#contains?' do
    it 'returns true if the value is present' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.contains?(10)).to be true
      expect(bst.contains?(5)).to be true
      expect(bst.contains?(15)).to be true
    end

    it 'returns false if the value is not present' do
      expect(bst.contains?(100)).to be false
    end
  end

  context '#in_order_traversal' do
    it 'returns the values in ascending order' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.in_order_traversal).to eq([5, 10, 15])
    end
  end

  context '#pre_order_traversal' do
    it 'returns the values in pre-order' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.pre_order_traversal).to eq([10, 5, 15])
    end
  end

  context '#post_order_traversal' do
    it 'returns the values in post-order' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.post_order_traversal).to eq([5, 15, 10])
    end
  end

  context '#height' do
    it 'returns the height of the tree' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.height).to eq(2)
    end

    it 'returns 0 for an empty tree' do
      expect(bst.height).to eq(0)
    end
  end

  context '#is_balanced?' do
    it 'returns true for a balanced tree' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.is_balanced?).to be true
    end

    it 'returns false for an unbalanced tree' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(3)
      expect(bst.is_balanced?).to be false
    end
  end

  context '#level_order_traversal' do
    it 'returns the values level by level' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.level_order_traversal).to eq([10, 5, 15])
    end
  end

  context '#clear' do
    it 'removes all elements from the tree' do
      bst.insert(10)
      bst.insert(5)
      bst.clear
      expect(bst.in_order_traversal).to eq([])
    end
  end

  context '#size' do
    it 'returns the number of nodes in the tree' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.size).to eq(3)
    end
  end

  context '#successor' do
    it 'returns the in-order successor of a node' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.successor(10)).to eq(15)
    end

    it 'returns nil if the node has no successor' do
      bst.insert(10)
      bst.insert(5)
      expect(bst.successor(15)).to be_nil
    end
  end

  context '#predecessor' do
    it 'returns the in-order predecessor of a node' do
      bst.insert(10)
      bst.insert(5)
      bst.insert(15)
      expect(bst.predecessor(10)).to eq(5)
    end

    it 'returns nil if the node has no predecessor' do
      bst.insert(10)
      bst.insert(5)
      expect(bst.predecessor(5)).to be_nil
    end
  end
end
