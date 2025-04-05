RSpec.describe MyQueue do
  let(:queue) { MyQueue.new }

  describe '#initialize' do
    it 'inicia com uma fila vazia' do
      expect(queue.empty?).to be true
      expect(queue.size).to eq(0)
    end
  end

  describe '#enqueue' do
    it 'adiciona um elemento ao final da fila' do
      queue.enqueue(1)
      expect(queue.peek).to eq(1)
      expect(queue.size).to eq(1)
    end

    it 'adiciona vários elementos ao final da fila' do
      queue.enqueue(1)
      queue.enqueue(2)
      queue.enqueue(3)
      expect(queue.peek).to eq(1)
      expect(queue.size).to eq(3)
    end
  end

  describe '#dequeue' do
    context 'quando a fila não está vazia' do
      before do
        queue.enqueue(1)
        queue.enqueue(2)
      end

      it 'remove e retorna o elemento na frente da fila' do
        expect(queue.dequeue).to eq(1)
        expect(queue.size).to eq(1)
        expect(queue.peek).to eq(2)
      end

      it 'diminui o tamanho da fila' do
        queue.dequeue
        expect(queue.size).to eq(1)
      end
    end

    context 'quando a fila está vazia' do
      it 'lança um erro' do
        expect { queue.dequeue }.to raise_error('Queue is empty')
      end
    end
  end

  describe '#peek' do
    context 'quando a fila não está vazia' do
      before do
        queue.enqueue(1)
        queue.enqueue(2)
      end

      it 'retorna o elemento na frente sem removê-lo' do
        expect(queue.peek).to eq(1)
        expect(queue.size).to eq(2)
      end
    end

    context 'quando a fila está vazia' do
      it 'lança um erro' do
        expect { queue.peek }.to raise_error('Queue is empty')
      end
    end
  end

  describe '#is_empty?' do
    it 'retorna true para uma fila vazia' do
      expect(queue.empty?).to be true
    end

    it 'retorna false para uma fila com elementos' do
      queue.enqueue(1)
      expect(queue.empty?).to be false
    end
  end

  describe '#size' do
    it 'retorna 0 para uma fila vazia' do
      expect(queue.size).to eq(0)
    end

    it 'retorna o número correto de elementos na fila' do
      queue.enqueue(1)
      queue.enqueue(2)
      expect(queue.size).to eq(2)
    end
  end
end
