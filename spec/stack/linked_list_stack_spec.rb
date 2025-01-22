describe LinkedListStack do
  let(:stack) { Stack.new }

  context '#is_empty?' do
    it 'returns true for an empty stack' do
      expect(stack.is_empty?).to be true
    end

    it 'returns false for a non-empty stack' do
      stack.push(1)
      expect(stack.is_empty?).to be false
    end
  end

  context '#push' do
    it 'adds elements to the stack' do
      stack.push(1)
      expect(stack.size).to eq(1)
      stack.push(2)
      expect(stack.size).to eq(2)
    end
  end

  context '#pop' do
    it 'removes and returns the top element' do
      stack.push(1)
      stack.push(2)
      expect(stack.pop).to eq(2)
      expect(stack.size).to eq(1)
    end

    it 'returns nil if the stack is empty' do
      expect(stack.pop).to be_nil
    end
  end

  context '#peek' do
    it 'returns the top element without removing it' do
      stack.push(1)
      stack.push(2)
      expect(stack.peek).to eq(2)
      expect(stack.size).to eq(2)
    end

    it 'returns nil if the stack is empty' do
      expect(stack.peek).to be_nil
    end
  end

  context '#size' do
    it 'returns 0 for an empty stack' do
      expect(stack.size).to eq(0)
    end

    it 'returns the correct size after pushing elements' do
      stack.push(1)
      stack.push(2)
      expect(stack.size).to eq(2)
    end

    it 'updates the size correctly after popping elements' do
      stack.push(1)
      stack.push(2)
      stack.pop
      expect(stack.size).to eq(1)
    end
  end
end
