RSpec.describe Node do
  describe '#initialize' do
    it 'cria um nó com valor e próximo como nil' do
      node = Node.new(10)
      expect(node.value).to eq(10)
      expect(node.next_node).to be_nil
    end
  end
end

RSpec.describe SinglyLinkedList do
  let(:list) { SinglyLinkedList.new }

  describe '#initialize' do
    it 'cria uma lista vazia com head como nil' do
      expect(list.head).to be_nil
    end
  end

  describe '#add_first' do
    it 'adiciona um nó no início da lista' do
      list.add_first(10)
      expect(list.head.value).to eq(10)
      expect(list.head.next_node).to be_nil
    end

    it 'mantém os nós anteriores ao adicionar no início' do
      list.add_first(20)
      list.add_first(10)
      expect(list.head.value).to eq(10)
      expect(list.head.next_node.value).to eq(20)
    end
  end

  describe '#add_last' do
    it 'adiciona um nó no final da lista vazia' do
      list.add_last(10)
      expect(list.head.value).to eq(10)
      expect(list.head.next_node).to be_nil
    end

    it 'adiciona um nó no final da lista não vazia' do
      list.add_first(10)
      list.add_last(20)
      expect(list.head.value).to eq(10)
      expect(list.head.next_node.value).to eq(20)
    end

    it 'adiciona um nó no final da lista não vazia mais de 2 elementos' do
      list.add_first(10)
      list.add_last(20)
      list.add_last(30)
      expect(list.head.value).to eq(10)
      expect(list.head.next_node.value).to eq(20)
      expect(list.head.next_node.next_node.value).to eq(30)
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
      expect(list.head.next_node.value).to eq(30)
    end

    it 'remove o nó da cabeça da lista' do
      list.remove(10)
      expect(list.head.value).to eq(20)
    end

    it 'não altera a lista se o valor não estiver presente' do
      list.remove(40)
      expect(list.head.value).to eq(10)
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
