class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    entry.is_a?(Hash) ? @entries.merge!(entry) : @entries.merge!(entry => nil)
  end

  def include?(keyword)
    @entries.key? keyword
  end

  def find(word)
    Hash[@entries.select { |key, value| key.match(/^#{ word }/) }]
  end

  def printable
    @entries.map { |key, value| "[#{ key }] \"#{ value }\"" }.to_a.sort.join("\n")
  end

  def keywords
    @entries.keys.sort
  end
end