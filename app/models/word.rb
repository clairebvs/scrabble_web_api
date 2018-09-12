class Word
  attr_reader :id

  def initialize(word_data)
    @id = word_data[:id]
    @root = word_data[:lexicalEntries]
  end

end
