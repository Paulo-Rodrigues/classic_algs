RSpec.describe Node do
  describe '#initialize' do
    it 'cria um nó com valor, next e prev como nil' do
      node = Node.new(10)
      expect(node.value).to eq(10)
      expect(node.next).to be_nil
      expect(node.prev).to be_nil
    end
  end
end

RSpec.describe DoublyLinkedList do
  let(:list) { DoublyLinkedList.new }

  describe '#initialize' do
    it 'cria uma lista vazia com head e tail como nil' do
      expect(list.head).to be_nil
      expect(list.tail).to be_nil
    end
  end

  describe '#add_first' do
    it 'adiciona um nó no início da lista vazia' do
      list.add_first(10)
      expect(list.head.value).to eq(10)
      expect(list.tail.value).to eq(10)
      expect(list.head.next).to be_nil
      expect(list.head.prev).to be_nil
    end

    it 'adiciona um nó no início da lista não vazia' do
      list.add_first(20)
      list.add_first(10)
      expect(list.head.value).to eq(10)
      expect(list.head.next.value).to eq(20)
      expect(list.head.next.prev.value).to eq(10)
    end
  end

  describe '#add_last' do
    it 'adiciona um nó no final da lista vazia' do
      list.add_last(10)
      expect(list.head.value).to eq(10)
      expect(list.tail.value).to eq(10)
      expect(list.tail.next).to be_nil
      expect(list.tail.prev).to be_nil
    end

    it 'adiciona um nó no final da lista não vazia' do
      list.add_last(10)
      list.add_last(20)
      expect(list.tail.value).to eq(20)
      expect(list.tail.prev.value).to eq(10)
      expect(list.tail.prev.next.value).to eq(20)
    end
  end

  describe '#find' do
    before do
      list.add_first(10)
      list.add_last(20)
      list.add_last(30)
    end

    it 'retorna o nó com o valor correspondente' do
      node = list.find(20)
      expect(node.value).to eq(20)
    end

    it 'retorna nil se o valor não estiver na lista' do
      expect(list.find(40)).to be_nil
    end
  end

  describe '#remove' do
    before do
      list.add_first(10)
      list.add_last(20)
      list.add_last(30)
    end

    it 'remove o nó com o valor correspondente' do
      list.remove(20)
      expect(list.head.next.value).to eq(30)
      expect(list.tail.prev.value).to eq(10)
    end

    it 'remove o nó da cabeça da lista' do
      list.remove(10)
      expect(list.head.value).to eq(20)
      expect(list.head.prev).to be_nil
    end

    it 'remove o nó da cauda da lista' do
      list.remove(30)
      expect(list.tail.value).to eq(20)
      expect(list.tail.next).to be_nil
    end

    it 'não altera a lista se o valor não estiver presente' do
      list.remove(40)
      expect(list.head.value).to eq(10)
    end
  end

  describe '#display' do
    it 'exibe todos os valores na lista do início ao fim' do
      list.add_first(10)
      list.add_last(20)
      expect { list.display }.to output("10 <-> 20 <-> nil\n").to_stdout
    end

    it 'exibe apenas nil para uma lista vazia' do
      expect { list.display }.to output("nil\n").to_stdout
    end
  end

  describe '#display_reverse' do
    it 'exibe todos os valores na lista do fim ao início' do
      list.add_first(10)
      list.add_last(20)
      expect { list.display_reverse }.to output("20 <-> 10 <-> nil\n").to_stdout
    end

    it 'exibe apenas nil para uma lista vazia' do
      expect { list.display_reverse }.to output("nil\n").to_stdout
    end
  end

  describe '#size' do
    it 'retorna 0 para uma lista vazia' do
      expect(list.size).to eq(0)
    end

    it 'retorna o número de nós na lista' do
      list.add_first(10)
      list.add_last(20)
      expect(list.size).to eq(2)
    end
  end
end