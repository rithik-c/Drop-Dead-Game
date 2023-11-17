class GameHistoriesController < ApplicationController
    def show
      @game_history = GameHistory.find(params[:id])
    end
  
  end
  