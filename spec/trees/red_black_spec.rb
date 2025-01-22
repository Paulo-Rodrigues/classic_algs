describe RedBlackTree do
  let(:red_black_tree) { RedBlackTree.new }

  context '#insert' do
    it 'inserts a value into an empty tree and colors it black' do
      red_black_tree.insert(10)
      expect(red_black_tree.find(10).color).to eq(:black) # A raiz deve ser preta
    end

    it 'inserts values and ensures no two consecutive red nodes' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)

      # Verificar se os nós não têm dois vermelhos consecutivos
      expect(red_black_tree.find(10).color).to eq(:black)
      expect(red_black_tree.find(5).color).to eq(:red)
      expect(red_black_tree.find(15).color).to eq(:red)
      expect(red_black_tree.find(5).color).not_to eq(red_black_tree.find(15).color)
    end

    it 'inserts values and maintains color properties after multiple insertions' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)
      red_black_tree.insert(7)

      # Verifique a cor dos nós após inserção
      expect(red_black_tree.find(10).color).to eq(:black)
      expect(red_black_tree.find(5).color).to eq(:red)
      expect(red_black_tree.find(15).color).to eq(:red)
      expect(red_black_tree.find(7).color).to eq(:black) # A rotação deve manter a cor preta na raiz
    end
  end

  context '#delete' do
    it 'deletes a value and ensures that the tree remains valid in terms of color' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)
      red_black_tree.delete(5)

      # Verificar se a cor do nó removido foi ajustada corretamente
      expect(red_black_tree.find(10).color).to eq(:black)
      expect(red_black_tree.find(15).color).to eq(:red)
    end

    it 'ensures the root is always black after deletion' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)
      red_black_tree.delete(5)
      red_black_tree.delete(15)

      # A raiz deve continuar preta
      expect(red_black_tree.find(10).color).to eq(:black)
    end
  end

  context '#rebalance' do
    it 'ensures correct color properties are maintained after rebalance' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)
      red_black_tree.insert(2) # Isso deve acionar uma rotação e reequilíbrio

      # Verifique as cores após a rotação
      expect(red_black_tree.find(10).color).to eq(:black)
      expect(red_black_tree.find(5).color).to eq(:red)
      expect(red_black_tree.find(15).color).to eq(:red)
      expect(red_black_tree.find(2).color).to eq(:black) # O nó raiz ainda deve ser preto
    end
  end

  context '#min' do
    it 'returns the minimum value in the tree with the correct color' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)

      min_node = red_black_tree.min
      expect(min_node.value).to eq(5)
      expect(min_node.color).to eq(:black) # O mínimo deve ser preto se for a raiz
    end
  end

  context '#max' do
    it 'returns the maximum value in the tree with the correct color' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)

      max_node = red_black_tree.max
      expect(max_node.value).to eq(15)
      expect(max_node.color).to eq(:red) # O máximo pode ser vermelho dependendo da rotação
    end
  end

  context '#successor' do
    it 'returns the successor of a node' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)
      red_black_tree.insert(7)

      successor = red_black_tree.successor(red_black_tree.find(5))
      expect(successor.value).to eq(7)
    end
  end

  context '#predecessor' do
    it 'returns the predecessor of a node' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)
      red_black_tree.insert(7)

      predecessor = red_black_tree.predecessor(red_black_tree.find(10))
      expect(predecessor.value).to eq(7)
    end
  end

  context '#color_properties' do
    it 'ensures root node is black' do
      red_black_tree.insert(10)
      expect(red_black_tree.find(10).color).to eq(:black)
    end

    it 'ensures leaf nodes are black' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)
      expect(red_black_tree.find(5).left.color).to eq(:black) # Folha à esquerda
      expect(red_black_tree.find(15).right.color).to eq(:black) # Folha à direita
    end

    it 'ensures there are no consecutive red nodes' do
      red_black_tree.insert(10)
      red_black_tree.insert(5)
      red_black_tree.insert(15)
      red_black_tree.insert(2)

      expect(red_black_tree.find(10).color).to eq(:black)
      expect(red_black_tree.find(5).color).to eq(:red)
      expect(red_black_tree.find(15).color).to eq(:red)
      expect(red_black_tree.find(5).color).not_to eq(red_black_tree.find(15).color)
    end
  end
end
