require 'rails_helper'

describe SearchPresenter do
  it 'exists' do
    word = 'water'
    search_presenter = SearchPresenter.new(word)
    expect(search_presenter).to be_a(SearchPresenter)
  end

  context 'instance methods' do
    context '#words' do
      it 'checks to see if a word is valid' do
        word = 'water'
        search_presenter = SearchPresenter.new(word)

        expect(search_presenter.words.first).to be_a(Word)
      end
    end
  end
end
