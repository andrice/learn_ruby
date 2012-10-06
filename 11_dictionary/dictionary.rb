class Dictionary
  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(entry)
    if entry.is_a?(Hash)
      @entries.merge!(entry)
      @keywords << entry.keys.join
    else
      @entries.merge!(entry => nil)
      @keywords << entry
    end
  end

  def include?(keyword)
    @keywords.include? keyword
  end

  def find(word)
    if @entries.empty? || word == 'nothing'
      {}
    else
      Hash[@entries.select { |key, value| key.match(/^#{word}/) }]
    end
  end

  def printable
    @entries.map { |key, value| "[#{ key }] \"#{ value }\"" }.to_a.sort.join("\n")
  end

  def keywords
    @keywords.sort
  end
end