RSpec.describe Stack do
  let(:stack) { Stack.new }

  describe '#initialize' do
    it 'inicia com uma stack vazia' do
      expect(stack.is_empty?).to be true
      expect(stack.size).to eq(0)
    end
  end

  describe '#push' do
    it 'adiciona um elemento ao topo da pilha' do
      stack.push(1)
      expect(stack.peek).to eq(1)
      expect(stack.size).to eq(1)
    end

    it 'adiciona vários elementos ao topo da pilha' do
      stack.push(1)
      stack.push(2)
      stack.push(3)
      expect(stack.peek).to eq(3)
      expect(stack.size).to eq(3)
    end
  end

  describe '#pop' do
    context 'quando a pilha não está vazia' do
      before do
        stack.push(1)
        stack.push(2)
      end

      it 'remove e retorna o elemento do topo' do
        expect(stack.pop).to eq(2)
        expect(stack.size).to eq(1)
        expect(stack.peek).to eq(1)
      end

      it 'diminui o tamanho da pilha' do
        stack.pop
        expect(stack.size).to eq(1)
      end
    end

    context 'quando a pilha está vazia' do
      it 'lança um erro' do
        expect { stack.pop }.to raise_error('Stack is empty')
      end
    end
  end

  describe '#peek' do
    context 'quando a pilha não está vazia' do
      before do
        stack.push(1)
        stack.push(2)
      end

      it 'retorna o elemento do topo sem removê-lo' do
        expect(stack.peek).to eq(2)
        expect(stack.size).to eq(2)
      end
    end

    context 'quando a pilha está vazia' do
      it 'lança um erro' do
        expect { stack.peek }.to raise_error('Stack is empty')
      end
    end
  end

  describe '#is_empty?' do
    it 'retorna true para uma pilha vazia' do
      expect(stack.is_empty?).to be true
    end

    it 'retorna false para uma pilha com elementos' do
      stack.push(1)
      expect(stack.is_empty?).to be false
    end
  end

  describe '#size' do
    it 'retorna 0 para uma pilha vazia' do
      expect(stack.size).to eq(0)
    end

    it 'retorna o número correto de elementos na pilha' do
      stack.push(1)
      stack.push(2)
      expect(stack.size).to eq(2)
    end
  end
end
