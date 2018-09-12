class Api::V1::GamesController < ApplicationController

  def show
    require "pry"; binding.pry
    render json: Game.find(params[:id]).plays
  end
end
