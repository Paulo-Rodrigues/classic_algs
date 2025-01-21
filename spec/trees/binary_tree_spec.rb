describe BinaryTree do
  let(:tree) { BinaryTree.new }

  context '#insert' do
    it 'insere um nó na árvore' do
      tree.insert(10)
      expect(tree.root.value).to eq(10)
    end

    it 'insere múltiplos nós na posição correta' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      expect(tree.root.left.value).to eq(5)
      expect(tree.root.right.value).to eq(15)
    end
  end

  context '#find' do
    before do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
    end

    it 'encontra um valor existente' do
      expect(tree.find(10)).to be_truthy
      expect(tree.find(5)).to be_truthy
      expect(tree.find(15)).to be_truthy
    end

    it 'retorna nil para valores inexistentes' do
      expect(tree.find(20)).to be_nil
    end
  end

  context '#in_order' do
    it 'retorna os valores em ordem crescente' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      tree.insert(1)
      tree.insert(7)
      expect(tree.in_order).to eq([1, 5, 7, 10, 15])
    end
  end

  context '#pre_order' do
    it 'retorna os valores em ordem de pre-order' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      tree.insert(1)
      tree.insert(7)
      expect(tree.pre_order).to eq([10, 5, 1, 7, 15])
    end
  end

  context '#post_order' do
    it 'retorna os valores em ordem de post-order' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      tree.insert(1)
      tree.insert(7)
      expect(tree.post_order).to eq([1, 7, 5, 15, 10])
    end
  end

  context '#height' do
    it 'calcula a altura da árvore' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      tree.insert(1)
      expect(tree.height).to eq(3)
    end
  end

  context '#delete' do
    before do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      tree.insert(1)
      tree.insert(7)
    end

    it 'remove uma folha' do
      tree.delete(1)
      expect(tree.in_order).to eq([5, 7, 10, 15])
    end

    it 'remove um nó com um único filho' do
      tree.delete(5)
      expect(tree.in_order).to eq([1, 7, 10, 15])
    end

    it 'remove um nó com dois filhos' do
      tree.delete(10)
      expect(tree.in_order).to eq([1, 5, 7, 15])
    end
  end

  context '#min' do
    it 'retorna o menor valor na árvore' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      expect(tree.min).to eq(5)
    end
  end

  context '#max' do
    it 'retorna o maior valor na árvore' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      expect(tree.max).to eq(15)
    end
  end

  context '#size' do
    it 'retorna 0 para uma árvore vazia' do
      expect(tree.size).to eq(0)
    end

    it 'retorna o número total de nós' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      expect(tree.size).to eq(3)
    end
  end

  context '#contains?' do
    it 'retorna true se o valor estiver na árvore' do
      tree.insert(10)
      expect(tree.contains?(10)).to be true
    end

    it 'retorna false se o valor não estiver na árvore' do
      tree.insert(10)
      expect(tree.contains?(20)).to be false
    end
  end

  context '#path_to' do
    it 'retorna o caminho até o valor' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      expect(tree.path_to(15)).to eq([10, 15])
    end
  end

  context '#valid_bst?' do
    it 'retorna true para uma árvore válida' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      expect(tree.valid_bst?).to be true
    end

    it 'retorna false para uma árvore inválida' do
      tree.root = Node.new(10)
      tree.root.left = Node.new(15) # Quebra a regra de BST
      expect(tree.valid_bst?).to be false
    end
  end

  context '#level_order' do
    it 'retorna os valores na ordem dos níveis' do
      tree.insert(10)
      tree.insert(5)
      tree.insert(15)
      expect(tree.level_order).to eq([10, 5, 15])
    end
  end
end
