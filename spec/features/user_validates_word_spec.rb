require 'rails_helper'

describe 'a user' do
  it 'can search word (valid word)' do

    visit "/"

    fill_in :word, with: 'foxes'
    click_on "Validate Word"

    # expect(current_path).to eq("/search")
    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")

    expect(page).to have_css(".validate_word")
  end
  it 'can search word (unvalid word)' do

    visit "/"

    fill_in :word, with: 'foxez'
    click_on "Validate Word"

    # expect(current_path).to eq("/search")
    expect(page).to have_content("'foxez' is not a valid word.")

    expect(page).to have_css(".validate_word")
  end
end
