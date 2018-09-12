require 'rails_helper'

describe 'Word' do
  it 'find roots of word and check if it exists first' do
        word_data = { id: "foxes"}


        word = Word.new(word_data)

        expect(word.id).to eq('foxes')
    end
end
