describe Trie do
  let(:trie) { Trie.new }

  context '#insert' do
    it 'inserts a word into the trie' do
      trie.insert('cat')
      expect(trie.search('cat')).to be true
    end

    it 'inserts multiple words with common prefixes' do
      trie.insert('cat')
      trie.insert('car')
      trie.insert('bat')
      trie.insert('ball')

      expect(trie.search('cat')).to be true
      expect(trie.search('car')).to be true
      expect(trie.search('bat')).to be true
      expect(trie.search('ball')).to be true
    end
  end

  context '#search' do
    it 'returns true if the word exists in the trie' do
      trie.insert('apple')
      expect(trie.search('apple')).to be true
    end

    it 'returns false if the word does not exist in the trie' do
      trie.insert('apple')
      expect(trie.search('banana')).to be false
    end

    it 'returns false if only a prefix exists but not the complete word' do
      trie.insert('apple')
      expect(trie.search('app')).to be false
    end
  end

  context '#starts_with' do
    it 'returns true if there is any word in the trie that starts with the given prefix' do
      trie.insert('apple')
      trie.insert('ape')
      expect(trie.starts_with('ap')).to be true
    end

    it 'returns false if no word starts with the given prefix' do
      trie.insert('apple')
      trie.insert('ape')
      expect(trie.starts_with('bat')).to be false
    end
  end

  context '#remove' do
    it 'removes a word from the trie' do
      trie.insert('cat')
      trie.remove('cat')
      expect(trie.search('cat')).to be false
    end

    it 'does not remove other words when one word is deleted' do
      trie.insert('cat')
      trie.insert('bat')
      trie.remove('cat')
      expect(trie.search('bat')).to be true
    end

    it 'removes only the word, not the shared prefix' do
      trie.insert('cat')
      trie.insert('bat')
      trie.remove('cat')
      expect(trie.search('bat')).to be true
      expect(trie.starts_with('ba')).to be true
    end
  end

  context '#list_words' do
    it 'lists all the words in the trie' do
      trie.insert('cat')
      trie.insert('car')
      trie.insert('bat')
      words = trie.list_words
      expect(words).to include('cat', 'car', 'bat')
    end

    it 'returns an empty array if no words are inserted' do
      words = trie.list_words
      expect(words).to be_empty
    end
  end
end
