class Word
  attr_reader :id, :root

  def initialize(word_data)
    @id = word_data[:id]
    @root = word_data[:lexicalEntries][0][:inflectionOf][0][:id]
  end
end
