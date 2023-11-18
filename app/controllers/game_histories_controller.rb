class GameHistoriesController < ApplicationController
    def show
      @game_history = GameHistory.find(params[:id])
      session[:game_id] = @game_history.id
    end

    def redirect_to_game
      game_number = params[:game_number].to_i
      @game_history = GameHistory.find(session[:game_id])
      game_links = @game_history.auto_drop_deads.map.with_index { |auto_drop_dead, index| show_game_auto_drop_dead_path(auto_drop_dead) }
      
      if game_number >= 1 && game_number <= game_links.length
        redirect_to game_links[game_number - 1]
      else
        flash[:alert] = 'Game not found...'
        redirect_to game_history_path(@game_history)
      end
    end
  
  end
  