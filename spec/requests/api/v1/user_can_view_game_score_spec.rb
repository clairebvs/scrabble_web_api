require 'rails_helper'

describe 'GET request to “/api/v1/games/1”' do
  it 'returns a JSON response with game params and score' do
    user = create(:user)
    game = create(:game, id: 1)
    plays = create(:play, game: game)

    get "/api/v1/games/1"

    expect(response.status).to eq 200
    game_score = JSON.parse(response.body, symbolize_names: true)
    expect(game_score[0][:game_id]).to eq(game.id)
  end
end
