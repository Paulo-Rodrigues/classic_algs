describe Deque do
  let(:deque) { Deque.new }

  context '#is_empty?' do
    it 'returns true for an empty deque' do
      expect(deque.is_empty?).to be true
    end

    it 'returns false for a non-empty deque' do
      deque.add_front(1)
      expect(deque.is_empty?).to be false
    end
  end

  context '#add_front' do
    it 'adds elements to the front of the deque' do
      deque.add_front(1)
      deque.add_front(2)
      expect(deque.to_array).to eq([2, 1])
    end
  end

  context '#add_rear' do
    it 'adds elements to the rear of the deque' do
      deque.add_rear(1)
      deque.add_rear(2)
      expect(deque.to_array).to eq([1, 2])
    end
  end

  context '#remove_front' do
    it 'removes and returns the front element' do
      deque.add_front(1)
      deque.add_front(2)
      expect(deque.remove_front).to eq(2)
      expect(deque.to_array).to eq([1])
    end

    it 'returns nil if the deque is empty' do
      expect(deque.remove_front).to be_nil
    end
  end

  context '#remove_rear' do
    it 'removes and returns the rear element' do
      deque.add_rear(1)
      deque.add_rear(2)
      expect(deque.remove_rear).to eq(2)
      expect(deque.to_array).to eq([1])
    end

    it 'returns nil if the deque is empty' do
      expect(deque.remove_rear).to be_nil
    end
  end

  context '#peek_front' do
    it 'returns the front element without removing it' do
      deque.add_front(1)
      deque.add_front(2)
      expect(deque.peek_front).to eq(2)
      expect(deque.to_array).to eq([2, 1])
    end

    it 'returns nil if the deque is empty' do
      expect(deque.peek_front).to be_nil
    end
  end

  context '#peek_rear' do
    it 'returns the rear element without removing it' do
      deque.add_rear(1)
      deque.add_rear(2)
      expect(deque.peek_rear).to eq(2)
      expect(deque.to_array).to eq([1, 2])
    end

    it 'returns nil if the deque is empty' do
      expect(deque.peek_rear).to be_nil
    end
  end

  context '#size' do
    it 'returns 0 for an empty deque' do
      expect(deque.size).to eq(0)
    end

    it 'returns the correct size after adding elements' do
      deque.add_front(1)
      deque.add_rear(2)
      expect(deque.size).to eq(2)
    end

    it 'updates the size correctly after removing elements' do
      deque.add_front(1)
      deque.add_rear(2)
      deque.remove_front
      expect(deque.size).to eq(1)
    end
  end

  context '#clear' do
    it 'removes all elements from the deque' do
      deque.add_front(1)
      deque.add_rear(2)
      deque.clear
      expect(deque.is_empty?).to be true
      expect(deque.to_array).to eq([])
    end
  end

  context '#to_array' do
    it 'returns an array representation of the deque' do
      deque.add_front(1)
      deque.add_rear(2)
      expect(deque.to_array).to eq([1, 2])
    end

    it 'returns an empty array for an empty deque' do
      expect(deque.to_array).to eq([])
    end
  end
end
