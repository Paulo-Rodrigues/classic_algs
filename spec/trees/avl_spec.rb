describe AVLTree do
  let(:avl_tree) { AVLTree.new }

  context '#insert' do
    it 'inserts a value into an empty tree' do
      avl_tree.insert(10)
      expect(avl_tree.in_order_traversal).to eq([10])
    end

    it 'inserts values and balances the tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.in_order_traversal).to eq([5, 10, 15])
    end

    it 'rebalance tree when it becomes unbalanced after insertion' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      avl_tree.insert(2) # This should trigger a rebalance
      expect(avl_tree.in_order_traversal).to eq([2, 5, 10, 15])
    end
  end

  context '#delete' do
    it 'deletes a leaf node and rebalances the tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.delete(5)
      expect(avl_tree.in_order_traversal).to eq([10])
    end

    it 'deletes a node with one child and rebalances' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      avl_tree.delete(5)
      expect(avl_tree.in_order_traversal).to eq([10, 15])
    end

    it 'deletes a node with two children and rebalances' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      avl_tree.delete(10)
      expect(avl_tree.in_order_traversal).to eq([5, 15])
    end
  end

  context '#find' do
    it 'finds a value in the tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.find(10)).to eq(10)
      expect(avl_tree.find(5)).to eq(5)
      expect(avl_tree.find(15)).to eq(15)
    end

    it 'returns nil if the value is not found' do
      expect(avl_tree.find(100)).to be_nil
    end
  end

  context '#min' do
    it 'returns the minimum value in the tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.min).to eq(5)
    end

    it 'returns nil if the tree is empty' do
      expect(avl_tree.min).to be_nil
    end
  end

  context '#max' do
    it 'returns the maximum value in the tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.max).to eq(15)
    end

    it 'returns nil if the tree is empty' do
      expect(avl_tree.max).to be_nil
    end
  end

  context '#contains?' do
    it 'returns true if the value is present' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.contains?(10)).to be true
      expect(avl_tree.contains?(5)).to be true
      expect(avl_tree.contains?(15)).to be true
    end

    it 'returns false if the value is not present' do
      expect(avl_tree.contains?(100)).to be false
    end
  end

  context '#in_order_traversal' do
    it 'returns the values in ascending order' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.in_order_traversal).to eq([5, 10, 15])
    end
  end

  context '#pre_order_traversal' do
    it 'returns the values in pre-order' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.pre_order_traversal).to eq([10, 5, 15])
    end
  end

  context '#post_order_traversal' do
    it 'returns the values in post-order' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.post_order_traversal).to eq([5, 15, 10])
    end
  end

  context '#height' do
    it 'returns the height of the tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.height).to eq(2)
    end

    it 'returns 0 for an empty tree' do
      expect(avl_tree.height).to eq(0)
    end
  end

  context '#balance_factor' do
    it 'calculates the balance factor of a node' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      node = avl_tree.find(10)
      expect(avl_tree.balance_factor(node)).to eq(0)
    end
  end

  context '#rebalance' do
    it 'rebalance the tree after an unbalanced insertion' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      avl_tree.insert(2) # Trigger a rebalance
      expect(avl_tree.in_order_traversal).to eq([2, 5, 10, 15])
    end
  end

  context '#is_balanced?' do
    it 'returns true for a balanced tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.is_balanced?).to be true
    end

    it 'returns false for an unbalanced tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(3) # Unbalanced tree
      expect(avl_tree.is_balanced?).to be false
    end
  end

  context '#clear' do
    it 'removes all elements from the tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.clear
      expect(avl_tree.in_order_traversal).to eq([])
    end
  end

  context '#size' do
    it 'returns the number of nodes in the tree' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.size).to eq(3)
    end
  end

  context '#successor' do
    it 'returns the in-order successor of a node' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.successor(10)).to eq(15)
    end

    it 'returns nil if the node has no successor' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      expect(avl_tree.successor(15)).to be_nil
    end
  end

  context '#predecessor' do
    it 'returns the in-order predecessor of a node' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      avl_tree.insert(15)
      expect(avl_tree.predecessor(10)).to eq(5)
    end

    it 'returns nil if the node has no predecessor' do
      avl_tree.insert(10)
      avl_tree.insert(5)
      expect(avl_tree.predecessor(5)).to be_nil
    end
  end
end
