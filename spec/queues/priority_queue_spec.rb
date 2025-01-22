describe PriorityQueue do
  let(:queue) { PriorityQueue.new }

  context '#is_empty?' do
    it 'returns true for an empty queue' do
      expect(queue.is_empty?).to be true
    end

    it 'returns false for a non-empty queue' do
      queue.enqueue('Task A', 1)
      expect(queue.is_empty?).to be false
    end
  end

  context '#enqueue' do
    it 'adds elements with the correct priority' do
      queue.enqueue('Task A', 2)
      queue.enqueue('Task B', 1)
      expect(queue.to_array).to eq(['Task B', 'Task A'])
    end

    it 'handles multiple elements with the same priority' do
      queue.enqueue('Task A', 1)
      queue.enqueue('Task B', 1)
      expect(queue.to_array).to eq(['Task A', 'Task B'])
    end
  end

  context '#dequeue' do
    it 'removes and returns the highest priority element' do
      queue.enqueue('Task A', 2)
      queue.enqueue('Task B', 1)
      expect(queue.dequeue).to eq('Task B')
    end

    it 'returns nil if the queue is empty' do
      expect(queue.dequeue).to be_nil
    end
  end

  context '#peek' do
    it 'returns the highest priority element without removing it' do
      queue.enqueue('Task A', 2)
      queue.enqueue('Task B', 1)
      expect(queue.peek).to eq('Task B')
    end

    it 'returns nil if the queue is empty' do
      expect(queue.peek).to be_nil
    end
  end

  context '#contains?' do
    it 'returns true if the value is present' do
      queue.enqueue('Task A', 1)
      expect(queue.contains?('Task A')).to be true
    end

    it 'returns false if the value is not present' do
      expect(queue.contains?('Task A')).to be false
    end
  end

  context '#update_priority' do
    it 'updates the priority of an existing element' do
      queue.enqueue('Task A', 2)
      queue.update_priority('Task A', 1)
      expect(queue.to_array).to eq(['Task A'])
    end

    it 'does nothing if the value is not found' do
      queue.update_priority('Task A', 1)
      expect(queue.to_array).to eq([])
    end
  end

  context '#remove' do
    it 'removes a specific element from the queue' do
      queue.enqueue('Task A', 1)
      queue.enqueue('Task B', 2)
      queue.remove('Task A')
      expect(queue.to_array).to eq(['Task B'])
    end
  end

  context '#max_priority' do
    it 'returns the highest priority in the queue' do
      queue.enqueue('Task A', 1)
      queue.enqueue('Task B', 2)
      expect(queue.max_priority).to eq(2)
    end

    it 'returns nil for an empty queue' do
      expect(queue.max_priority).to be_nil
    end
  end

  context '#min_priority' do
    it 'returns the lowest priority in the queue' do
      queue.enqueue('Task A', 1)
      queue.enqueue('Task B', 2)
      expect(queue.min_priority).to eq(1)
    end

    it 'returns nil for an empty queue' do
      expect(queue.min_priority).to be_nil
    end
  end

  context '#priorities' do
    it 'returns a list of all priorities in the queue' do
      queue.enqueue('Task A', 1)
      queue.enqueue('Task B', 2)
      expect(queue.priorities).to eq([1, 2])
    end
  end

  context '#values' do
    it 'returns a list of all values in the queue' do
      queue.enqueue('Task A', 1)
      queue.enqueue('Task B', 2)
      expect(queue.values).to eq(['Task A', 'Task B'])
    end
  end

  context '#clear' do
    it 'removes all elements from the queue' do
      queue.enqueue('Task A', 1)
      queue.enqueue('Task B', 2)
      queue.clear
      expect(queue.is_empty?).to be true
    end
  end

  context '#to_array' do
    it 'returns an array of elements ordered by priority' do
      queue.enqueue('Task A', 2)
      queue.enqueue('Task B', 1)
      expect(queue.to_array).to eq(['Task B', 'Task A'])
    end
  end
end
