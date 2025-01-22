describe BTree do
  let(:b_tree) { BTree.new(3) } # Ordem 3 para a Árvore B

  context '#insert' do
    it 'inserts a value into an empty tree' do
      b_tree.insert(10)
      expect(b_tree.search(10)).not_to be_nil
    end

    it 'inserts values and splits nodes when necessary' do
      b_tree.insert(10)
      b_tree.insert(20)
      b_tree.insert(5)
      b_tree.insert(6)
      b_tree.insert(12)

      expect(b_tree.search(10)).not_to be_nil
      expect(b_tree.search(12)).not_to be_nil
      expect(b_tree.search(6)).not_to be_nil
      expect(b_tree.search(5)).not_to be_nil
      expect(b_tree.search(20)).not_to be_nil
    end
  end

  context '#delete' do
    it 'deletes a value and ensures the tree remains valid' do
      b_tree.insert(10)
      b_tree.insert(20)
      b_tree.insert(5)
      b_tree.delete(10)

      expect(b_tree.search(10)).to be_nil
      expect(b_tree.search(20)).not_to be_nil
    end
  end

  context '#search' do
    it 'finds a value that exists in the tree' do
      b_tree.insert(10)
      expect(b_tree.search(10)).not_to be_nil
    end

    it 'returns nil for a value that does not exist' do
      expect(b_tree.search(15)).to be_nil
    end
  end

  context '#min' do
    it 'returns the minimum value in the tree' do
      b_tree.insert(10)
      b_tree.insert(5)
      b_tree.insert(15)
      expect(b_tree.min).to eq(5)
    end
  end

  context '#max' do
    it 'returns the maximum value in the tree' do
      b_tree.insert(10)
      b_tree.insert(5)
      b_tree.insert(15)
      expect(b_tree.max).to eq(15)
    end
  end
end
