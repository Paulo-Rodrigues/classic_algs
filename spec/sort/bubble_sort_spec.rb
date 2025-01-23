describe BubbleSort do
  let(:sorter) { BubbleSort.new }

  context 'when sorting an array of integers' do
    it 'sorts an array in ascending order' do
      array = [5, 3, 8, 6, 2]
      expect(sorter.sort(array)).to eq([2, 3, 5, 6, 8])
    end

    it 'handles an already sorted array' do
      array = [1, 2, 3, 4, 5]
      expect(sorter.sort(array)).to eq([1, 2, 3, 4, 5])
    end

    it 'handles a reverse sorted array' do
      array = [9, 7, 5, 3, 1]
      expect(sorter.sort(array)).to eq([1, 3, 5, 7, 9])
    end

    it 'handles an array with duplicate elements' do
      array = [4, 2, 2, 8, 3, 3, 1]
      expect(sorter.sort(array)).to eq([1, 2, 2, 3, 3, 4, 8])
    end

    it 'handles an array with a single element' do
      array = [7]
      expect(sorter.sort(array)).to eq([7])
    end

    it 'handles an empty array' do
      array = []
      expect(sorter.sort(array)).to eq([])
    end
  end

  context 'when sorting arrays with different data types' do
    it 'sorts an array of floating-point numbers' do
      array = [3.2, 1.5, 4.8, 2.1]
      expect(sorter.sort(array)).to eq([1.5, 2.1, 3.2, 4.8])
    end

    it 'sorts an array with negative numbers' do
      array = [-3, -1, -4, -2]
      expect(sorter.sort(array)).to eq([-4, -3, -2, -1])
    end
  end

  context 'edge cases' do
    it 'does not modify the original array' do
      array = [5, 3, 8, 6, 2]
      sorter.sort(array)
      expect(array).to eq([5, 3, 8, 6, 2])
    end

    it 'raises an error for nil input' do
      expect { sorter.sort(nil) }.to raise_error(ArgumentError)
    end

    it 'raises an error for non-array input' do
      expect { sorter.sort('not an array') }.to raise_error(ArgumentError)
    end
  end

  context 'performance considerations' do
    it 'sorts a large array efficiently' do
      array = Array.new(1_000) { rand(1..1_000) }
      sorted = sorter.sort(array.dup)
      expect(sorted).to eq(array.sort)
    end
  end
end
