describe CircularLinkedList do
  let(:list) { CircularLinkedList.new }

  context '#is_empty?' do
    it 'returns true for an empty list' do
      expect(list.is_empty?).to be true
    end

    it 'returns false for a non-empty list' do
      list.add(1)
      expect(list.is_empty?).to be false
    end
  end

  context '#add' do
    it 'adds elements to the list' do
      list.add(1)
      expect(list.size).to eq(1)
      list.add(2)
      expect(list.size).to eq(2)
    end

    it 'maintains circular behavior' do
      list.add(1)
      list.add(2)
      expect(list.to_array).to eq([1, 2])
      # Verifica se o último nó aponta para o primeiro
      expect(list.head.next_node.next_node).to eq(list.head)
    end
  end

  context '#remove' do
    it 'removes a specific element' do
      list.add(1)
      list.add(2)
      list.remove(1)
      expect(list.to_array).to eq([2])
    end

    it 'removes the only element in the list' do
      list.add(1)
      list.remove(1)
      expect(list.is_empty?).to be true
    end

    it 'does nothing if the element is not found' do
      list.add(1)
      list.add(2)
      list.remove(3)
      expect(list.to_array).to eq([1, 2])
    end
  end

  context '#find' do
    it 'returns the node containing the value if found' do
      list.add(1)
      list.add(2)
      expect(list.find(2).value).to eq(2)
    end

    it 'returns nil if the value is not found' do
      list.add(1)
      list.add(2)
      expect(list.find(3)).to be_nil
    end
  end

  context '#size' do
    it 'returns 0 for an empty list' do
      expect(list.size).to eq(0)
    end

    it 'returns the correct size after adding elements' do
      list.add(1)
      list.add(2)
      expect(list.size).to eq(2)
    end
  end

  context '#to_array' do
    it 'returns an array representation of the list' do
      list.add(1)
      list.add(2)
      expect(list.to_array).to eq([1, 2])
    end

    it 'returns an empty array for an empty list' do
      expect(list.to_array).to eq([])
    end
  end
end
