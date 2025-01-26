describe MyArray do
  let(:my_array) { MyArray.new }

  context 'initialization' do
    it 'starts empty' do
      expect(my_array.size).to eq(0)
    end

    it 'has a default capacity (if applicable)' do
      expect(my_array.capacity).to eq(10)
    end
  end

  context 'adding elements' do
    it 'adds elements using push' do
      my_array.push(1)
      my_array.push(2)
      expect(my_array.size).to eq(2)
      expect(my_array.get(0)).to eq(1)
      expect(my_array.get(1)).to eq(2)
    end

    it 'inserts elements em posições específicas' do
      my_array.push(1)
      my_array.push(3)
      my_array.insert(1, 2) # Inserir '2' na posição 1
      expect(my_array.get(1)).to eq(2)
      expect(my_array.size).to eq(3)
    end

    it 'expande corretamente quando ultrapassa a capacidade' do
      20.times { |i| my_array.push(i) }
      expect(my_array.size).to eq(20)
      20.times { |i| expect(my_array.get(i)).to eq(i) }
    end
  end

  context 'removing elements' do
    before do
      my_array.push(1)
      my_array.push(2)
      my_array.push(3)
    end

    it 'remove the last element (pop)' do
      removed = my_array.pop
      expect(removed).to eq(3)
      expect(my_array.size).to eq(2)
    end

    it 'remove an element by index' do
      removed = my_array.remove_at(1)
      expect(removed).to eq(2)
      expect(my_array.size).to eq(2)
      expect(my_array.get(1)).to eq(3)
    end

    it 'returns nil if remove_at is out of bounds' do
      removed = my_array.remove_at(10) # Índice inexistente
      expect(removed).to be_nil
    end
  end

  context 'accessing elements' do
    before do
      my_array.push(10)
      my_array.push(20)
      my_array.push(30)
    end

    it 'gets elements by index' do
      expect(my_array.get(0)).to eq(10)
      expect(my_array.get(1)).to eq(20)
      expect(my_array.get(2)).to eq(30)
    end

    it 'sets elements by index' do
      my_array.set(1, 99)
      expect(my_array.get(1)).to eq(99)
    end

    it 'returns nil for out-of-bounds access' do
      expect(my_array.get(99)).to be_nil
    end
  end

  context 'search operations' do
    before do
      my_array.push('A')
      my_array.push('B')
      my_array.push('C')
      my_array.push('B')
    end

    it 'finds the index of a given element' do
      expect(my_array.find_index('B')).to eq(1)
    end

    it 'returns nil if the element is not found' do
      expect(my_array.find_index('Z')).to be_nil
    end

    it 'finds all occurrences of an element' do
      expect(my_array.find_all('B')).to eq([1, 3])
    end
  end

  context 'utility methods' do
    it 'checks if it is empty' do
      expect(my_array.empty?).to be true
      my_array.push(1)
      expect(my_array.empty?).to be false
    end

    it 'converts to a standard Ruby array' do
      my_array.push(1)
      my_array.push(2)
      my_array.push(3)
      expect(my_array.to_array).to eq([1, 2, 3])
    end
  end

  context 'edge cases' do
    it 'raises error when setting at invalid index' do
      expect { my_array.set(-1, 99) }.to raise_error(IndexError)
    end

    it 'handles removing from an empty array (pop)' do
      expect(my_array.pop).to be_nil
      expect(my_array.size).to eq(0)
    end

    it 'handles nil elements' do
      my_array.push(nil)
      expect(my_array.get(0)).to be_nil
      expect(my_array.size).to eq(1)
    end
  end
end
