describe LinkedListStack do
  let(:stack) { LinkedListStack.new }

  describe '#empty?' do
    it 'returns true for a newly created stack' do
      expect(stack.empty?).to be true
    end

    it 'returns false after pushing an element' do
      stack.push(10)
      expect(stack.empty?).to be false
    end

    it 'returns true after pushing and then popping all elements' do
      stack.push(10)
      stack.pop
      expect(stack.empty?).to be true
    end

    it 'returns false when items are still in stack' do
      3.times { |i| stack.push(i) }
      stack.pop
      expect(stack.empty?).to be false
    end
  end

  describe '#push' do
    it 'increases the size correctly' do
      expect { stack.push(1) }.to change { stack.size }.by(1)
      expect { stack.push(2) }.to change { stack.size }.by(1)
    end

    it 'maintains proper linking between nodes' do
      stack.push(10)
      stack.push(20)
      stack.push(30)

      expect(stack.send(:top).value).to eq(30)
      expect(stack.send(:top).next_node.value).to eq(20)
      expect(stack.send(:top).next_node.next_node.value).to eq(10)
      expect(stack.send(:top).next_node.next_node.next_node).to be_nil
    end

    it 'handles different data types' do
      items = [1, 'string', :symbol, 3.14, [1, 2], { a: 1 }, nil, true]
      items.each { |item| stack.push(item) }
      expect(stack.size).to eq(items.size)
    end

    it 'can handle large number of elements' do
      1000.times { |i| stack.push(i) }
      expect(stack.size).to eq(1000)
    end
  end

  describe '#pop' do
    it 'returns nil when stack is empty' do
      expect(stack.pop).to be_nil
      expect(stack.size).to eq(0)
    end

    it 'decreases the size correctly' do
      stack.push(1)
      stack.push(2)
      expect { stack.pop }.to change { stack.size }.by(-1)
      expect { stack.pop }.to change { stack.size }.by(-1)
    end

    it 'maintains LIFO order' do
      items = [1, 2, 3, 4]
      items.each { |item| stack.push(item) }
      items.reverse.each do |item|
        expect(stack.pop).to eq(item)
      end
    end

    it 'returns correct value after multiple pushes and pops' do
      stack.push(1)
      stack.push(2)
      expect(stack.pop).to eq(2)
      stack.push(3)
      expect(stack.pop).to eq(3)
      expect(stack.pop).to eq(1)
    end

    it 'can handle popping all elements and then pushing again' do
      3.times { |i| stack.push(i) }
      3.times { stack.pop }
      stack.push(10)
      expect(stack.pop).to eq(10)
    end
  end

  describe '#peek' do
    it 'returns nil for empty stack' do
      expect(stack.peek).to be_nil
    end

    it 'does not modify the stack' do
      stack.push(5)
      expect { stack.peek }.not_to(change { stack.size })
      expect(stack.peek).to eq(5)
    end

    it 'reflects the last pushed item' do
      items = [10, 20, 30]
      items.each do |item|
        stack.push(item)
        expect(stack.peek).to eq(item)
      end
    end

    it 'updates correctly after pop' do
      stack.push(1)
      stack.push(2)
      stack.pop
      expect(stack.peek).to eq(1)
    end
  end

  describe '#size' do
    it 'starts at 0' do
      expect(stack.size).to eq(0)
    end

    it 'reflects exact number of pushes minus pops' do
      operations = [
        [:push, 1],
        [:push, 2],
        [:pop],
        [:push, 3],
        [:push, 4],
        [:pop],
        [:pop]
      ]

      expected_size = 0
      operations.each do |op, *args|
        case op
        when :push
          expected_size += 1
          stack.send(op, *args)
        when :pop
          expected_size -= 1 unless stack.empty?
          stack.send(op)
        end
        expect(stack.size).to eq(expected_size)
      end
    end

    it 'never goes negative' do
      5.times { stack.pop }
      expect(stack.size).to eq(0)
    end
  end

  describe 'integration tests' do
    it 'handles alternating push/pop operations' do
      expect(stack.empty?).to be true
      stack.push(1)
      stack.push(2)
      expect(stack.pop).to eq(2)
      stack.push(3)
      expect(stack.pop).to eq(3)
      expect(stack.pop).to eq(1)
      expect(stack.empty?).to be true
      stack.push(4)
      expect(stack.peek).to eq(4)
      expect(stack.size).to eq(1)
    end

    it 'works correctly after being emptied' do
      3.times { |i| stack.push(i) }
      3.times { stack.pop }
      expect(stack.empty?).to be true
      stack.push(10)
      expect(stack.peek).to eq(10)
      expect(stack.size).to eq(1)
    end

    it 'maintains consistency with random operations' do
      items = []
      100.times do
        if rand < 0.5 || items.empty?
          item = rand(100)
          stack.push(item)
          items.push(item)
        else
          expect(stack.pop).to eq(items.pop)
        end
        expect(stack.size).to eq(items.size)
        expect(stack.empty?).to eq(items.empty?)
        expect(stack.peek).to eq(items.last)
      end
    end
  end

  describe 'edge cases' do
    it 'handles pushing nil values' do
      stack.push(nil)
      expect(stack.empty?).to be false
      expect(stack.size).to eq(1)
      expect(stack.peek).to be_nil
      expect(stack.pop).to be_nil
      expect(stack.empty?).to be true
    end

    it 'handles pushing the same value multiple times' do
      10.times { stack.push(5) }
      expect(stack.size).to eq(10)
      10.times { expect(stack.pop).to eq(5) }
      expect(stack.empty?).to be true
    end

    it 'handles very large numbers of elements' do
      limit = 10_000
      limit.times { |i| stack.push(i) }
      expect(stack.size).to eq(limit)
      (limit - 1).downto(0) do |i|
        expect(stack.pop).to eq(i)
      end
      expect(stack.empty?).to be true
    end
  end
end
